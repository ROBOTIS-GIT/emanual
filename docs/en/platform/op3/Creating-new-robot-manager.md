**Description**: This tutorial explains how to create a manager node to apply ROBOTIS Framework to a new robot.

**[ Table of Contents ]**

> 1. [**Overview**](#1-overview)
>2. [**Writing the Robot Manager Node**](#2-writing-the-robot-manager-node)  
>    2.1. [The Code](#21-the-code)  
>    2.2. [The Code Explained](#22-the-code-explained)  
>3. [**Building the Robot Manager Node**](#3-building-the-robot-manager-node)  
>    3.1. [`package.xml`](#31-packagexml)  
>    3.2. [`CMakeLists.txt`](#32-cmakeliststxt)  
>    3.3. [Build](#33-build)  
>4. [**Config Files**](#4-config-files)  
>    4.1. [Robot Information file (`.robot`)](#41-robot-information-file-robot)  
>    4.2. [Joint initialize file (`.yaml`)](#42-joint-initialize-file-yaml)  
>    4.3. [Offset file (`.yaml`)](#43-offset-file-yaml)  
>5. [**Launch**](#5-launch)  
>    5.1. [`.launch` file](#51-launch-file)  
>    5.2. [Run](#52-run)

### 1. Overview
The Robot Manager is a package to apply ROBOTIS Framework to a new robot. In this tutorial, you will be instructed to create a manager node with the `robotis_controller` package from the ROBOTIS Framework. In addition, configuration files that contain hardware information of the robot and setting values are necessary in order to use ROBOTIS Framework. Various types of these configuration files will be introduced and their compositions will also be explained.

### 2. Create the Robot Manager Node
Go to the directory where Robot Manager package will be created, then create a manager package:
```
$ cd ~/catkin_ws/src/ROBOTIS-THORMANG-MPC
$ catkin_create_pkg thormang3_manager std_msgs roscpp
```

#### 2.1. The Code
Create below cpp file in the `thormang3_manager` package.

:link: [_`thormang3_manager/src/thormang3_manager.cpp`_](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/thormang3_manager/src/thormang3_manager.cpp)
```cpp
#include "robotis_controller/robotis_controller.h"

/* Sensor Module Header */
#include "thormang3_feet_ft_module/feet_force_torque_sensor_module.h"

/* Motion Module Header */
#include "thormang3_base_module/base_module.h"
#include "thormang3_action_module/action_module.h"
#include "thormang3_head_control_module/head_control_module.h"
#include "thormang3_manipulation_module/manipulation_module.h"
#include "thormang3_walking_module/walking_module.h"


using namespace thormang3;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "THORMANG3_Manager");
    ros::NodeHandle nh;

    ROS_INFO("manager->init");
    robotis_framework::RobotisController *controller = robotis_framework::RobotisController::getInstance();

    /* Load ROS Parameter */
    std::string offset_file = nh.param<std::string>("offset_file_path", "");
    std::string robot_file  = nh.param<std::string>("robot_file_path", "");

    std::string init_file   = nh.param<std::string>("init_file_path", "");

    /* gazebo simulation */
    controller->gazebo_mode_ = nh.param<bool>("gazebo", false);
    if(controller->gazebo_mode_ == true)
    {
        ROS_WARN("SET TO GAZEBO MODE!");
        std::string robot_name = nh.param<std::string>("gazebo_robot_name", "");
        if(robot_name != "")
            controller->gazebo_robot_name_ = robot_name;
    }

    if(robot_file == "")
    {
        ROS_ERROR("NO robot file path in the ROS parameters.");
        return -1;
    }

    if(controller->initialize(robot_file, init_file) == false)
    {
        ROS_ERROR("ROBOTIS Controller Initialize Fail!");
        return -1;
    }

    if(offset_file != "")
        controller->loadOffset(offset_file);

    sleep(1);

    /* Add Sensor Module */
    controller->addSensorModule((robotis_framework::SensorModule*)FeetForceTorqueSensor::getInstance());

    /* Add Motion Module */
    controller->addMotionModule((robotis_framework::MotionModule*)BaseModule::getInstance());
    controller->addMotionModule((robotis_framework::MotionModule*)ActionModule::getInstance());
    controller->addMotionModule((robotis_framework::MotionModule*)ManipulationModule::getInstance());
    controller->addMotionModule((robotis_framework::MotionModule*)HeadControlModule::getInstance());
    controller->addMotionModule((robotis_framework::MotionModule*)WalkingMotionModule::getInstance());

    controller->startTimer();

    while(ros::ok())
    {
      usleep(1000*1000);
    }

    return 0;
}
```

#### 2.2. The Code Analysis
Let's look into the code.  
```cpp
#include "robotis_controller/robotis_controller.h"

/* Sensor Module Header */
#include "thormang3_feet_ft_module/feet_force_torque_sensor_module.h"

/* Motion Module Header */
#include "thormang3_base_module/base_module.h"
#include "thormang3_action_module/action_module.h"
#include "thormang3_head_control_module/head_control_module.h"
#include "thormang3_manipulation_module/manipulation_module.h"
#include "thormang3_walking_module/walking_module.h"
...
```
Include headers of sensor modules and motion modules that will be used in the Robot Manager.

Load ROS Parameters from configuration files.
```cpp
...
    /* Load ROS Parameter */
    std::string offset_file = nh.param<std::string>("offset_file_path", "");
    std::string robot_file  = nh.param<std::string>("robot_file_path", "");
    std::string init_file   = nh.param<std::string>("init_file_path", "");...
```

If "gazebo" is set to true in the ROS Parameters, set the controller to gazebo mode.
```cpp
...
    /* gazebo simulation */
    controller->gazebo_mode_ = nh.param<bool>("gazebo", false);
    if(controller->gazebo_mode_ == true)
    {
        ROS_WARN("SET TO GAZEBO MODE!");
        std::string robot_name = nh.param<std::string>("gazebo_robot_name", "");
        if(robot_name != "")
            controller->gazebo_robot_name_ = robot_name;
    }
...
```

If the essential robot information file is missing from the ROS Parameters, the program will be terminated.
RobotisController is initialized with the information from the ROS Parameters.
```cpp
...
    if(robot_file == "")
    {
        ROS_ERROR("NO robot file path in the ROS parameters.");
        return -1;
    }

    if(controller->initialize(robot_file, init_file) == false)
    {
        ROS_ERROR("ROBOTIS Controller Initialize Fail!");
        return -1;
    }

    if(offset_file != "")
        controller->loadOffset(offset_file);
...
```

Add sensor modules and motion modules to RobotisController.
```cpp
...
    /* Add Sensor Module */
    controller->addSensorModule((robotis_framework::SensorModule*)FeetForceTorqueSensor::getInstance());

    /* Add Motion Module */
    controller->addMotionModule((robotis_framework::MotionModule*)BaseModule::getInstance());
    controller->addMotionModule((robotis_framework::MotionModule*)ActionModule::getInstance());
    controller->addMotionModule((robotis_framework::MotionModule*)ManipulationModule::getInstance());
    controller->addMotionModule((robotis_framework::MotionModule*)HeadControlModule::getInstance());
    controller->addMotionModule((robotis_framework::MotionModule*)WalkingMotionModule::getInstance());
...
```

Start the Timer of RobotisController to call Process() function periodically while program is running.
```cpp
...
    controller->startTimer();

    while(ros::ok())
    {
      usleep(1000*1000);
    }
...
```


### 3. Building the Robot Manager Node
If a package is created with the `catkin_create_pkg` command, `package.xml` and `CMakeLists.txt` files are automatically generated.

#### 3.1. `package.xml`
Below is the contents of automatically generated `package.xml` file with removed comments.

```xml
<?xml version="1.0"?>
<package>
  <name>thormang3_manager</name>
  <version>0.1.0</version>
  <description>The thormang3_manager package</description>

  <maintainer email="zerom@robotis.com">ROBOTIS</maintainer>
  <license>GPLv2</license>

  <buildtool_depend>catkin</buildtool_depend>

  <build_depend>roscpp</build_depend>
  <build_depend>dynamixel_sdk</build_depend>
  <build_depend>robotis_framework_common</build_depend>
  <build_depend>robotis_device</build_depend>
  <build_depend>robotis_controller</build_depend>
  <build_depend>robotis_controller_msgs</build_depend>

  <build_depend>cmake_modules</build_depend>
  <build_depend>thormang3_feet_ft_module</build_depend>  
  <build_depend>thormang3_head_control_module</build_depend>
  <build_depend>thormang3_manipulation_module</build_depend>
  <build_depend>thormang3_walking_module</build_depend>
  <build_depend>thormang3_base_module</build_depend>
  <build_depend>thormang3_action_module</build_depend>

  <run_depend>roscpp</run_depend>
  <run_depend>robotis_controller</run_depend>

</package>
```
For more details about the `package.xml` file, please refer to [`catkin/package.xml`](http://wiki.ros.org/catkin/package.xml).

#### 3.2. `CMakeLists.txt`
Below is the contents of automatically generated `CMakeLists.txt` file with removed comments and examples.
```CMake
cmake_minimum_required(VERSION 2.8.3)
project(thormang3_manager)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  dynamixel_sdk
  robotis_framework_common
  robotis_device
  robotis_controller
  robotis_controller_msgs
  robotis_math

  cmake_modules
  ati_ft_sensor
  thormang3_kinematics_dynamics

  thormang3_feet_ft_module

  thormang3_head_control_module
  thormang3_manipulation_module
  thormang3_walking_module
  thormang3_base_module
)

find_package(Eigen REQUIRED)

catkin_package(
)

include_directories(
  include
  ${Eigen_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS}
)

add_executable(thormang3_manager src/thormang3_manager.cpp)

target_link_libraries(thormang3_manager
  ${catkin_LIBRARIES}
)
```
For more details about the `CMakeLists.txt` file, please refer to [`catkin_make/CMakeLists.txt`](http://wiki.ros.org/catkin/CMakeLists.txt).

#### 3.3. Build
Now, run the catkin_make within the catkin_workspace
```
$ cd ~/catkin_ws
$ catkin_make
```

### 4. Config Files
#### 4.1. Robot Information file (`.robot`)
The `.robot` file is consisted of 2 sections and it contains information of the robot.

##### 4.1.1. control info
This section includes control cycle information.
* control_cycle : Control cycle in milliseconds

##### 4.1.2. port info
This section includes port information that is connected with the robot.  
Each line consists of three field data as shown below and they describe properties of a related port.
* PORT NAME : File name of the port
* BAUDRATE : Default baudrate for the port
* DEFAULT JOINT : The default joint to obtain information such as Control table and Protocol Version when each port performs SyncWrite/BulkRead.

##### 4.1.3. device info
This section includes hardware device information of the robot.  
Each line consists of seven field data as shown below and they describe properties of a related device.
* TYPE : Type of the device (dynamixel, sensor)
* PORT NAME : File name of the port connected to the device
* ID : Allocated ID to the device
* MODEL : Model name of the device
* PROTOCOL : Protocol version to control the device
* DEV NAME : Name of the device to be used for control
* BULK READ ITEMS : The item list to be read in bulk from the device (',' is a field delimiter)

##### 4.1.4. `.robot` file example
```
[ control info ]
control_cycle = 8   # milliseconds

[ port info ]
# PORT NAME  | BAUDRATE | DEFAULT JOINT
/dev/ttyUSB0 | 2000000  | r_arm_sh_p1
/dev/ttyUSB1 | 2000000  | l_arm_sh_p1
/dev/ttyUSB2 | 2000000  | r_leg_hip_y
/dev/ttyUSB3 | 2000000  | l_leg_hip_y

[ device info ]
# TYPE    | PORT NAME    | ID  | MODEL          | PROTOCOL | DEV NAME     | BULK READ ITEMS
dynamixel | /dev/ttyUSB0 | 1   | H54-100-S500-R | 2.0      | r_arm_sh_p1  | present_position, present_voltage
dynamixel | /dev/ttyUSB1 | 2   | H54-100-S500-R | 2.0      | l_arm_sh_p1  | present_position, present_voltage
dynamixel | /dev/ttyUSB0 | 3   | H54-100-S500-R | 2.0      | r_arm_sh_r   | present_position, present_voltage
dynamixel | /dev/ttyUSB1 | 4   | H54-100-S500-R | 2.0      | l_arm_sh_r   | present_position, present_voltage
...
```

#### 4.2. Joint initialize file (`.yaml`)

##### 4.2.1. Format
```
JOINT_NAME1 :   
   CTRL_TABLE_ITEM_NAME1 : VALUE  

JOINT_NAME2 :
   CTRL_TABLE_ITEM_NAME1 : VALUE
   CTRL_TABLE_ITEM_NAME2 : VALUE
```

##### 4.2.2. Joint initialize file example
```
r_arm_sh_p1 :   # H54-100-S500-R
   return_delay_time     :  10    # item name : value
   operating_mode        :  3
   shutdown              :  58
   homing_offset         :  0
   torque_limit          :  310
   max_position_limit    :  250950
   min_position_limit    : -250950
   goal_torque           : 310
   goal_velocity         : 0
   goal_acceleration     : 0
   position_p_gain       : 32
   velocity_p_gain       : 180
   velocity_i_gain       : 452

l_arm_sh_p1 :   # H54-100-S500-R
   return_delay_time     :  10    
   operating_mode        :  3     
   shutdown              :  58    
   homing_offset         :  0     
   torque_limit          :  310
   max_position_limit    :  250950
   min_position_limit    : -250950
   goal_torque           : 310
   goal_velocity         : 0
   goal_acceleration     : 0
   position_p_gain       : 32
   velocity_p_gain       : 180
   velocity_i_gain       : 452

r_arm_sh_r  :   # H54-100-S500-R
   return_delay_time     :  10    
   operating_mode        :  3     
   shutdown              :  58    
   homing_offset         :  0     
   torque_limit          :  310
   max_position_limit    :  250950
   min_position_limit    : -250950
   goal_torque           : 310
   goal_velocity         : 0
   goal_acceleration     : 0
   position_p_gain       : 32
   velocity_p_gain       : 180
   velocity_i_gain       : 452

...
```

#### 4.3. Offset file (`.yaml`)
```
offset:
  head_p: 0
  head_y: 0
  l_arm_grip: 0
  l_arm_el_y: 0
  l_arm_sh_p1: 0
  l_arm_sh_p2: 0
  l_arm_sh_r: 0
  l_arm_wr_p: 0
  l_arm_wr_r: 0
  l_arm_wr_y: 0
  l_leg_an_p: 0
  l_leg_an_r: 0
  l_leg_hip_p: 0
  l_leg_hip_r: 0
  l_leg_hip_y: 0
  l_leg_kn_p: 0
  r_arm_grip: 0
  r_arm_el_y: 0
  r_arm_sh_p1: 0
  r_arm_sh_p2: 0
  r_arm_sh_r: 0
  r_arm_wr_p: 0
  r_arm_wr_r: 0
  r_arm_wr_y: 0
  r_leg_an_p: 0
  r_leg_an_r: 0
  r_leg_hip_p: 0
  r_leg_hip_r: 0
  r_leg_hip_y: 0
  r_leg_kn_p: 0
  torso_y: 0
init_pose_for_offset_tuner:
  head_p: 0
  head_y: 0
  l_arm_el_y: 0
  l_arm_grip: 0
  l_arm_sh_p1: 0
  l_arm_sh_p2: 0
  l_arm_sh_r: 1.570796326794897
  l_arm_wr_p: 0
  l_arm_wr_r: 0
  l_arm_wr_y: 0
  l_leg_an_p: 0
  l_leg_an_r: 0
  l_leg_hip_p: 0
  l_leg_hip_r: 0
  l_leg_hip_y: 0
  l_leg_kn_p: 0
  r_arm_el_y: 0
  r_arm_grip: 0
  r_arm_sh_p1: 0
  r_arm_sh_p2: 0
  r_arm_sh_r: -1.570796326794897
  r_arm_wr_p: 0
  r_arm_wr_r: 0
  r_arm_wr_y: 0
  r_leg_an_p: 0
  r_leg_an_r: 0
  r_leg_hip_p: 0
  r_leg_hip_r: 0
  r_leg_hip_y: 0
  r_leg_kn_p: 0
  torso_y: 0
```

### 5. Launch
Create the `.launch` file to pass the configuration file paths as parameters when running the Robot Manager.

#### 5.1. `.launch` file  
```xml
<?xml version="1.0" ?>

<launch>    
    <arg name="use_imu" default="true"/>
    <arg name="use_lidar" default="true" />  

    <param name="gazebo"                   value="false"    type="bool"/>
    <param name="gazebo_robot_name"        value="thormang3"/>

    <param name="offset_file_path"         value="$(find thormang3_manager)/config/offset.yaml"/>
    <param name="robot_file_path"          value="$(find thormang3_manager)/config/THORMANG3.robot"/>
    <param name="init_file_path"           value="$(find thormang3_manager)/config/dxl_init.yaml"/>

    <param name="ft_data_path"             value="$(find thormang3_manager)/config/ft_data.yaml"/>
    <param name="ft_calibration_data_path" value="$(find thormang3_manager)/config/ft_calibration_data.yaml"/>

    <!-- imu sensor package -->
    <include file="$(find imu_3dm_gx4)/launch/imu.launch" if="$(arg use_imu)"/>

    <!-- lidar -->    
    <include file="$(find thormang3_description)/launch/thor_laserscan.launch" if="$(arg use_lidar)"/>

    <!-- THORMANG3 Manager -->
    <node name="thormang3_manager" pkg="thormang3_manager" type="thormang3_manager" output="screen"/>

    <!-- Robot Model & TF -->
    <include file="$(find thormang3_description)/launch/thormang3_mpc.launch"/>
</launch>
```

#### 5.2. Run
Execute the `.launch` file with the `roslaunch` command.
```
$ roslaunch thormang3_manager thormang3_manager.launch
```

[&lt;&lt; Back]

[&lt;&lt; Back]:[ROBOTIS-Framework-Documents.md]
