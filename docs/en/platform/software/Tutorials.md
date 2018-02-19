---
layout: archive
lang: en
ref: software_tutorials
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/software/tutorials/
sidebar:
  title: ROBOTIS-FRAMEWORK
  nav: "robotis-framework"
---

<div style="counter-reset: h1 1"></div>

# [Tutorials](#tutorials)

## [Creating new motion module](#creating-new-motion_module)

Instructions for applying ROBOTIS Framework to the new robot.

**Description**: This is the tutorial for creating a new motion module inherited from the `MotionModule` class of [`robotis_frameowrk_common`] package.

**[ Table of Contents ]**  

>1. [**Overview**](#1-overview)
>2. [**Writing the Motion Module**](#2-writing-the-motion-module)  
>    2.1. [The Code](#21-the-code)  
>    2.2. [The Code Explained](#22-the-code-explained)  
>3. [**Building your package**](#3-building-your-package)  
>    3.1. [`package.xml`](#31-packagexml)  
>    3.2. [`CMakeLists.txt`](#32-cmakeliststxt)  
>    3.3. [Build](#33-build)  
>4. [**Add Created Motion Module to `robotis_controller`**](#4-add-created-motion-module-to-robotiscontroller)  

### Overview
"Motion Module" calculates target position(or target velocity or target current) of each joint. If the Motion Module is created and added to the `RobotisController` of the [`robotis_controller`] pacakge, `RobotisController` periodically calls process() function from the Motion Module and saves calculated value to the `result_` of the Motion Module. Once the `RobotisController` completes calculation for all registered Motion Modules, it obtains `result_` from the Motion Module for each joint and transfers the value to each joint.  

The following is the example of creating a simple Motion Module.  

### Writing the Motion Module
Go to the directory to create the `motion_module_tutorial` package and create the package:
```
$ cd ~/catkin_ws/src/ROBOTIS-THORMANG-MPC
$ catkin_create_pkg motion_module_tutorial std_msgs roscpp
```

#### The Code
Write below header and cpp files in the `motion_module_tutorial` package.

:link: [_`motion_module_tutorial/include/motion_module_tutorial/motion_module_tutorial.h`_]

```cpp
#ifndef MOTION_MODULE_TUTORIAL_MOTION_MODULE_TUTORIAL_H_
#define MOTION_MODULE_TUTORIAL_MOTION_MODULE_TUTORIAL_H_

#include <ros/ros.h>
#include <ros/callback_queue.h>
#include <std_msgs/Int16.h>
#include <boost/thread.hpp>

#include "robotis_framework_common/motion_module.h"

namespace thormang3
{

class MotionModuleTutorial
  : public robotis_framework::MotionModule,
    public robotis_framework::Singleton<MotionModuleTutorial>
{
private:
  int           control_cycle_msec_;
  boost::thread queue_thread_;

  /* sample subscriber & publisher*/
  ros::Subscriber sub1_;
  ros::Publisher pub1_;

  void queueThread();

public:
  MotionModuleTutorial();
  virtual ~MotionModuleTutorial();

  /* ROS Topic Callback Functions*/
  void topicCallback(const std_msgs::Int16::ConstPtr &msg);

  void initialize(const int control_cycle_msec, robotis_framework::Robot *robot);
  void process(std::map<std::string, robotis_framework::Dynamixel *> dxls, std::map<std::string, double> sensors);

  void stop();
  bool isRunning();
};

}

#endif /* MOTION_MODULE_TUTORIAL_MOTION_MODULE_TUTORIAL_H_*/
```


:link: [_`motion_module_tutorial/src/motion_module_tutorial/motion_module_tutorial.cpp`_]
```cpp
#include <stdio.h>
#include "motion_module_tutorial/motion_module_tutorial.h"

using namespace thormang3;

MotionModuleTutorial::MotionModuleTutorial()
  : control_cycle_msec_(8)
{
  enable_       = false;
  module_name_  = "test_motion_module"; // set unique module name
  control_mode_ = robotis_framework::PositionControl;

  result_["r_sho_pitch"] = new robotis_framework::DynamixelState();
  result_["r_sho_roll"] = new robotis_framework::DynamixelState();
  result_["r_el"] = new robotis_framework::DynamixelState();
}

MotionModuleTutorial::~MotionModuleTutorial()
{
  queue_thread_.join();
}

void MotionModuleTutorial::initialize(const int control_cycle_msec, robotis_framework::Robot *robot)
{
  control_cycle_msec_ = control_cycle_msec;
  queue_thread_ = boost::thread(boost::bind(&MotionModuleTutorial::queueThread, this));
}

void MotionModuleTutorial::queueThread()
{
  ros::NodeHandle ros_node;
  ros::CallbackQueue callback_queue;

  ros_node.setCallbackQueue(&callback_queue);

  /* subscriber */
  sub1_ = ros_node.subscribe("/tutorial_topic", 10, &MotionModuleTutorial::topicCallback, this);

  /* publisher */
  pub1_ = ros_node.advertise<std_msgs::Int16>("/tutorial_publish", 1, true);

  while (ros_node.ok())
  {
    callback_queue.callAvailable();
    usleep(1000);
  }
}

void MotionModuleTutorial::topicCallback(const std_msgs::Int16::ConstPtr &msg)
{
  std_msgs::Int16 msg_int16;
  msg_int16.data = msg->data;
  pub1_.publish(msg_int16);
}

void MotionModuleTutorial::process(std::map<std::string, robotis_framework::Dynamixel *> dxls,
                                   std::map<std::string, double> sensors)
{
  if (enable_ == false)
    return;

  for (std::map<std::string, robotis_framework::DynamixelState *>::iterator state_iter = result_.begin(); state_iter != result_.end();
      state_iter++)
  {
    int32_t p_pos = dxls[state_iter->first]->dxl_state_->present_position_;
    int32_t g_pos = dxls[state_iter->first]->dxl_state_->goal_position_;
  }

  // ...

  result_["r_sho_pitch"]->goal_position_ = 0;
  result_["r_sho_roll"]->goal_position_ = 0;
  result_["r_el"]->goal_position_ = 0;
}

void MotionModuleTutorial::stop()
{
  return;
}

bool MotionModuleTutorial::isRunning()
{
  return false;
}
```

##### The Code Explanation
Let's look into the code section by section.
Motion Module is based on the Singleton Pattern.
```cpp
...
class MotionModuleTutorial
  : public robotis_framework::MotionModule,
    public robotis_framework::Singleton<MotionModuleTutorial>
{
...
```
As each Instance of Motion Module Class does the same work, Singleton Pattern is used to reduce the number of Instances.

The constructor initializes the unique name and the control mode of Motion Module, as well as the repository for the result of process() function.
```cpp
...
MotionModuleTutorial::MotionModuleTutorial()
  : control_cycle_msec_(8)
{
  enable_       = false;
  module_name_  = "test_motion_module"; // set unique module name
  control_mode_ = robotis_framework::PositionControl;

  result_["r_sho_pitch"] = new robotis_framework::DynamixelState();
  result_["r_sho_roll"] = new robotis_framework::DynamixelState();
  result_["r_el"] = new robotis_framework::DynamixelState();
}
...
```

Next, boost::thread is used for the Motion Module to subscribe control topics independant from the main thread.
```cpp
...
#include <boost/thread.hpp>
...
    boost::thread   queue_thread_;
...
    void queueThread();
...
```
```cpp
...
void MotionModuleTutorial::initialize(const int control_cycle_msec, robotis_framework::Robot *robot)
{
  control_cycle_msec_ = control_cycle_msec;
  queue_thread_ = boost::thread(boost::bind(&MotionModuleTutorial::queueThread, this));
}
...
```
initialize() function is called only once when the Robot Manager registers Motion Module to the RobotisController.

The example of subscriber and publisher looks like below.
```cpp
...
  /* sample subscriber & publisher */
  ros::Subscriber sub1_;
  ros::Publisher pub1_;
...
```
```cpp
...
void MotionModuleTutorial::queueThread()
{
  ros::NodeHandle ros_node;
  ros::CallbackQueue callback_queue;

  ros_node.setCallbackQueue(&callback_queue);

  /* subscriber*/
  sub1_ = ros_node.subscribe("/tutorial_topic", 10, &MotionModuleTutorial::topicCallback, this);

  /* publisher*/
  pub1_ = ros_node.advertise<std_msgs::Int16>("/tutorial_publish", 1, true);

  while (ros_node.ok())
  {
    callback_queue.callAvailable();
    usleep(1000);
  }
}

void MotionModuleTutorial::topicCallback(const std_msgs::Int16::ConstPtr &msg)
{
  std_msgs::Int16 msg_int16;
  msg_int16.data = msg->data;
  pub1_.publish(msg_int16);
}
...
```

When updating configuration of Motion Module for each joint, previously configured Motion Module could be running. Therefore, the function that checks the status of Motion Module is required along with the function that stops the Motion Module.
```cpp
...
void MotionModuleTutorial::stop()
{
  return;
}

bool MotionModuleTutorial::isRunning()
{
  return false;
}
...
```

Finally, below is the process() function that is periodically called by the RobotisController.
```cpp
...
void MotionModuleTutorial::process(std::map<std::string, robotis_framework::Dynamixel *> dxls,
                                   std::map<std::string, double> sensors)
{
  if (enable_ == false)
    return;

  for (std::map<std::string, robotis_framework::DynamixelState *>::iterator state_iter = result_.begin(); state_iter != result_.end();
      state_iter++)
  {
    int32_t p_pos = dxls[state_iter->first]->dxl_state_->present_position_;
    int32_t g_pos = dxls[state_iter->first]->dxl_state_->goal_position_;
  }

  // ...

  result_["r_sho_pitch"]->goal_position_ = 0;
  result_["r_sho_roll"]->goal_position_ = 0;
  result_["r_el"]->goal_position_ = 0;
}
...
```
After obtaining current and target values from the argument dxls, calculated values are saved to the result.

### Building your package
If the package is created with the `catkin_create_pkg` command, `package.xml` and `CMakeLists.txt` will be automatically generated.  

#### `package.xml`
The following is the cleaned up code of the `package.xml` file:

:link: [_`motion_module_tutorial/package.xml`_]  
```xml
<?xml version="1.0"?>
<package>
  <name>motion_module_tutorial</name>
  <version>0.1.0</version>
  <description>The motion_module_tutorial package</description>

  <maintainer email="you@yourdomain.com">Your Name</maintainer>
  <license>BSD</license>

  <buildtool_depend>catkin</buildtool_depend>

  <build_depend>roscpp</build_depend>
  <build_depend>robotis_device</build_depend>
  <build_depend>robotis_framework_common</build_depend>

  <run_depend>roscpp</run_depend>

</package>
```
Please refer to the [`catkin/package.xml`] for more details about the `package.xml` file.

#### `CMakeLists.txt`
The following is the cleaned up code of the `CMakeLists.txt` file:  

:link: [_`motion_module_tutorial/CMakeLists.txt`_]
```CMake
cmake_minimum_required(VERSION 2.8.3)
project(motion_module_tutorial)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  dynamixel_sdk
  robotis_device
  robotis_framework_common
)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES motion_module_tutorial
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_library(motion_module_tutorial
  src/${PROJECT_NAME}/motion_module_tutorial.cpp
)
```
Please refer to the [`catkin_make/CMakeLists.txt`] for more details about the `CMakeLists.txt` file.

#### Build
Run `catkin_make` within the catkin workspace:
```
$ cd ~/catkin_ws
$ catkin_make
```

### Add Created Motion Module to `robotis_controller`
Please refer to the below link for creating a new Robot Manager and addi101012ng Motion Module to the new Robot Manager.
> Reference : [Creating new robot manager]

## [Creating new sensor module](#creating-new-sensor-module)

**Description**: This is the tutorial for creating a new sensor module inherited from the `SensorModule` class of [`robotis_frameowrk_common`](robotis_framework_common) package.

**[ Table of Contents ]**  

>1. [**Overview**](#1-overview)
>2. [**Writing the Sensor Module**](#2-writing-the-sensor-module)  
>    2.1. [The Code](#21-the-code)  
>    2.2. [The Code Explained](#22-the-code-explained)  
>3. [**Building your package**](#3-building-your-package)  
>    3.1. [`package.xml`](#31-packagexml)  
>    3.2. [`CMakeLists.txt`](#32-cmakeliststxt)  
>    3.3. [Build](#33-build)  
>4. [**Add Created Sensor Module to `robotis_controller`**](#4-add-created-sensor-module-to-robotiscontroller)  

### Overview
"Sensor Module" processes obtained values from the sensor module.
If the Sensor Module is created and added to the robotis_controller of the [`robotis_controller`] pacakge, [`robotis_controller`] periodically calls process() function from the Sensor Module and saves calculated value to the `sensor_result_` of the [`robotis_controller`]. Once the robotis_controller completes calculation for all registered Sensor Modules, it transfers the result to the Motion Module.

The following is the example of creating a simple Sensor Module.  

### Writing the Sensor Module
Go to the directory to create the `sensor_module_tutorial` package and create the package:
```
$ cd ~/catkin_ws/src/ROBOTIS-THORMANG-MPC
$ catkin_create_pkg sensor_module_tutorial std_msgs roscpp
```
#### The Code
Write below header and cpp files in the `sensor_module_tutorial` package.

:link: [_`sensor_module_tutorial/include/sensor_module_tutorial/sensor_module_tutorial.h`_]

```cpp
#ifndef SENSOR_MODULE_TUTORIAL_SENSOR_MODULE_TUTORIAL_H_
#define SENSOR_MODULE_TUTORIAL_SENSOR_MODULE_TUTORIAL_H_

#include <ros/ros.h>
#include <ros/callback_queue.h>
#include <std_msgs/Int16.h>
#include <boost/thread.hpp>

#include "robotis_framework_common/sensor_module.h"

namespace ROBOTIS
{

class SensorModuleTutorial
  : public robotis_framework::SensorModule,
    public robotis_framework::Singleton<SensorModuleTutorial>
{
private:
  int           control_cycle_msec_;
  boost::thread queue_thread_;

  /* sample subscriber & publisher*/
  ros::Subscriber sub1_;
  ros::Publisher  pub1_;

  void queueThread();

public:
  SensorModuleTutorial();
  virtual ~SensorModuleTutorial();

  /* ROS Topic Callback Functions*/
  void topicCallback(const std_msgs::Int16::ConstPtr &msg);

  void initialize(const int control_cycle_msec, robotis_framework::Robot *robot);
  void process(std::map<std::string, robotis_framework::Dynamixel *> dxls,
               std::map<std::string, robotis_framework::Sensor *> sensors);
};

}

#endif /*SENSOR_MODULE_TUTORIAL_SENSOR_MODULE_TUTORIAL_H_*/
```


:link: [_`sensor_module_tutorial/src/sensor_module_tutorial/sensor_module_tutorial.cpp`_]
```cpp
#include <stdio.h>
#include "sensor_module_tutorial/sensor_module_tutorial.h"

using namespace ROBOTIS;

SensorModuleTutorial::SensorModuleTutorial()
  : control_cycle_msec_(8)
{
  module_name_ = "test_sensor_module"; // set unique module name

  result_["test_sensor"] = 0.0;
}

SensorModuleTutorial::~SensorModuleTutorial()
{
  queue_thread_.join();
}

void SensorModuleTutorial::initialize(const int control_cycle_msec, robotis_framework::Robot *robot)
{
  control_cycle_msec_ = control_cycle_msec;
  queue_thread_ = boost::thread(boost::bind(&SensorModuleTutorial::queueThread, this));
}

void SensorModuleTutorial::queueThread()
{
  ros::NodeHandle ros_node;
  ros::CallbackQueue callback_queue;

  ros_node.setCallbackQueue(&callback_queue);

  /* subscriber */
  sub1_ = ros_node.subscribe("/tutorial_topic", 10, &SensorModuleTutorial::topicCallback, this);

  /* publisher */
  pub1_ = ros_node.advertise<std_msgs::Int16>("/tutorial_publish", 1, true);

  while (ros_node.ok())
  {
    callback_queue.callAvailable();
    usleep(1000);
  }
}

void SensorModuleTutorial::topicCallback(const std_msgs::Int16::ConstPtr &msg)
{
  std_msgs::Int16 msg_int16;
  msg_int16.data = msg->data;
  pub1_.publish(msg_int16);
}

void SensorModuleTutorial::process(std::map<std::string, robotis_framework::Dynamixel *> dxls,
    std::map<std::string, robotis_framework::Sensor *> sensors)
{
  uint16_t ext_port_data_1 = dxls["r_leg_an_p"]->dxl_state_->bulk_read_table_["external_port_data_1"];
  uint16_t ext_port_data_2 = dxls["r_leg_an_p"]->dxl_state_->bulk_read_table_["external_port_data_2"];

  // ...

  result_["test_sensor"] = 0.0;
}
```

#### The Code Explanation
Let's look into the code section by section. Sensor Module is based on the Singleton Pattern.
```cpp
...
class SensorModuleTutorial
  : public robotis_framework::SensorModule,
    public robotis_framework::Singleton<SensorModuleTutorial>
{
...
```
As each Instance of Sensor Module Class does the same work, Singleton Pattern is used to reduce the number of Instances.

The constructor initializes the unique name and the control mode of Sensor Module, as well as the repository for the result of process() function.
```cpp
...
SensorModuleTutorial::SensorModuleTutorial()
  : control_cycle_msec_(8)
{
  module_name_ = "test_sensor_module"; // set unique module name

  result_["test_sensor"] = 0.0;
}
...
```

Next, boost::thread is used for the Sensor Module to subscribe control topics independant from the main thread.
```cpp
...
#include <boost/thread.hpp>
...
  boost::thread   queue_thread_;
...
  void queueThread();
...
```

```cpp
...
void SensorModuleTutorial::initialize(const int control_cycle_msec, robotis_framework::Robot *robot)
{
  control_cycle_msec_ = control_cycle_msec;
  queue_thread_ = boost::thread(boost::bind(&SensorModuleTutorial::queueThread, this));
}
...
```
initialize() function is called only once when the Robot Manager registers Sensor Module to the RobotisController.

The example of subscriber and publisher looks like below.
```cpp
...
  /* sample subscriber & publisher */
  ros::Subscriber sub1_;
  ros::Publisher  pub1_;
...
```

```cpp
...
void SensorModuleTutorial::queueThread()
{
  ros::NodeHandle ros_node;
  ros::CallbackQueue callback_queue;

  ros_node.setCallbackQueue(&callback_queue);

  /* subscriber*/
  sub1_ = ros_node.subscribe("/tutorial_topic", 10, &SensorModuleTutorial::topicCallback, this);

  /* publisher*/
  pub1_ = ros_node.advertise<std_msgs::Int16>("/tutorial_publish", 1, true);

  while (ros_node.ok())
  {
    callback_queue.callAvailable();
    usleep(1000);
  }
}

void SensorModuleTutorial::topicCallback(const std_msgs::Int16::ConstPtr &msg)
{
  std_msgs::Int16 msg_int16;
  msg_int16.data = msg->data;
  pub1_.publish(msg_int16);
}
...
```

Finally, below is the process() function that is periodically called by the RobotisController.
```cpp
...
void SensorModuleTutorial::process(std::map<std::string, robotis_framework::Dynamixel *> dxls,
    std::map<std::string, robotis_framework::Sensor *> sensors)
{
  uint16_t ext_port_data_1 = dxls["r_leg_an_p"]->dxl_state_->bulk_read_table_["external_port_data_1"];
  uint16_t ext_port_data_2 = dxls["r_leg_an_p"]->dxl_state_->bulk_read_table_["external_port_data_2"];

  // ...

  result_["test_sensor"] = 0.0;
}
...
```
After Bulk Reading current and target values from the argument `dxls`, calculated values are saved to the result.

### Building your package
If the package is created with the catkin_create_pkg command, package.xml and CMakeLists.txt will be automatically generated.  

#### `package.xml`
The following is the cleaned up code of the `package.xml` file:  
:link: [`sensor_module_tutorial/package.xml`]
```xml
<?xml version="1.0"?>
<package>
  <name>sensor_module_tutorial</name>
  <version>0.1.0</version>
  <description>The sensor_module_tutorial package</description>

  <maintainer email="you@yourdomain.com">Your Name</maintainer>
  <license>BSD</license>

  <buildtool_depend>catkin</buildtool_depend>

  <build_depend>roscpp</build_depend>
  <build_depend>robotis_device</build_depend>
  <build_depend>robotis_framework_common</build_depend>

  <run_depend>roscpp</run_depend>

</package>
```
Please refer to the [`catkin/package.xml`] for more details about the `package.xml` file.

#### `CMakeLists.txt`
The following is the cleaned up code of the `CMakeLists.txt` file:  
:link: [`sensor_module_tutorial/CMakeLists.txt`]
```CMake
cmake_minimum_required(VERSION 2.8.3)
project(sensor_module_tutorial)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  dynamixel_sdk
  robotis_device
  robotis_framework_common
)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES sensor_module_tutorial
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_library(sensor_module_tutorial
  src/${PROJECT_NAME}/sensor_module_tutorial.cpp
)
```
Please refer to the [`catkin_make/CMakeLists.txt`] for more details about the `CMakeLists.txt` file.

#### Build
Run `catkin_make` within the catkin workspace:
```
$ cd ~/catkin_ws
$ catkin_make
```

### Add Created Sensor Module to `robotis_controller`
Please refer to the below link for creating a new Robot Manager and adding Sensor Module to the new Robot Manager.
> Reference : [Creating new robot manager]

## [Creating new robot manager](#creating-new-robot-manager)

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

### Overview
The Robot Manager is a package to apply ROBOTIS Framework to a new robot. In this tutorial, you will be instructed to create a manager node with the `robotis_controller` package from the ROBOTIS Framework. In addition, configuration files that contain hardware information of the robot and setting values are necessary in order to use ROBOTIS Framework. Various types of these configuration files will be introduced and their compositions will also be explained.

### Create the Robot Manager Node
Go to the directory where Robot Manager package will be created, then create a manager package:
```
$ cd ~/catkin_ws/src/ROBOTIS-THORMANG-MPC
$ catkin_create_pkg thormang3_manager std_msgs roscpp
```

#### The Code
Create below cpp file in the `thormang3_manager` package.

:link: [_`thormang3_manager/src/thormang3_manager.cpp`_]
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

    /* Load ROS Parameter*/
    std::string offset_file = nh.param<std::string>("offset_file_path", "");
    std::string robot_file  = nh.param<std::string>("robot_file_path", "");

    std::string init_file   = nh.param<std::string>("init_file_path", "");

    /* gazebo simulation*/
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

    /* Add Sensor Module*/
    controller->addSensorModule((robotis_framework::SensorModule*)FeetForceTorqueSensor::getInstance());

    /* Add Motion Module*/
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

#### The Code Analysis
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


### Building the Robot Manager Node
If a package is created with the `catkin_create_pkg` command, `package.xml` and `CMakeLists.txt` files are automatically generated.

#### `package.xml`
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
For more details about the `package.xml` file, please refer to [`catkin/package.xml`].

#### `CMakeLists.txt`
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
For more details about the `CMakeLists.txt` file, please refer to [`catkin_make/CMakeLists.txt`].

#### Build
Now, run the catkin_make within the catkin_workspace
```
$ cd ~/catkin_ws
$ catkin_make
```

### Config Files
#### Robot Information file (`.robot`)
The `.robot` file is consisted of 2 sections and it contains information of the robot.

##### control info
This section includes control cycle information.
* control_cycle : Control cycle in milliseconds

##### port info
This section includes port information that is connected with the robot.  
Each line consists of three field data as shown below and they describe properties of a related port.
* PORT NAME : File name of the port
* BAUDRATE : Default baudrate for the port
* DEFAULT JOINT : The default joint to obtain information such as Control table and Protocol Version when each port performs SyncWrite/BulkRead.

##### device info
This section includes hardware device information of the robot.  
Each line consists of seven field data as shown below and they describe properties of a related device.
* TYPE : Type of the device (dynamixel, sensor)
* PORT NAME : File name of the port connected to the device
* ID : Allocated ID to the device
* MODEL : Model name of the device
* PROTOCOL : Protocol version to control the device
* DEV NAME : Name of the device to be used for control
* BULK READ ITEMS : The item list to be read in bulk from the device (',' is a field delimiter)

##### `.robot` file example
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

#### Joint initialize file (`.yaml`)

##### Format
```
JOINT_NAME1 :   
   CTRL_TABLE_ITEM_NAME1 : VALUE  

JOINT_NAME2 :
   CTRL_TABLE_ITEM_NAME1 : VALUE
   CTRL_TABLE_ITEM_NAME2 : VALUE
```

##### Joint initialize file example
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

#### Offset file (`.yaml`)
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

### Launch
Create the `.launch` file to pass the configuration file paths as parameters when running the Robot Manager.

#### `.launch` file  
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

#### Run
Execute the `.launch` file with the `roslaunch` command.
```
$ roslaunch thormang3_manager thormang3_manager.launch
```



[`robotis_frameowrk_common`]: /docs/en/platform/software/robotis_framework_packages/#robotis_framework_common/
[`robotis_controller`]: /docs/en/platform/software/robotis_framework_packages/#robotis_controller/

[_`motion_module_tutorial/include/motion_module_tutorial/motion_module_tutorial.h`_]: https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/motion_module_tutorial/include/motion_module_tutorial/motion_module_tutorial.h

[_`motion_module_tutorial/src/motion_module_tutorial/motion_module_tutorial.cpp`_]: https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/motion_module_tutorial/src/motion_module_tutorial/motion_module_tutorial.cpp  

[_`motion_module_tutorial/package.xml`_]: https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/motion_module_tutorial/package.xml
[`catkin/package.xml`]:http://wiki.ros.org/catkin/package.xml

[_`motion_module_tutorial/CMakeLists.txt`_]: https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/motion_module_tutorial/CMakeLists.txt
[`catkin_make/CMakeLists.txt`]: http://wiki.ros.org/catkin/CMakeLists.txt


[`robotis_controller`]: /docs/en/platform/software/robotis_framework_packages/#robotis_controller/
[_`sensor_module_tutorial/include/sensor_module_tutorial/sensor_module_tutorial.h`_]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/sensor_module_tutorial/include/sensor_module_tutorial/sensor_module_tutorial.h   
[_`sensor_module_tutorial/src/sensor_module_tutorial/sensor_module_tutorial.cpp`_]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/sensor_module_tutorial/src/sensor_module_tutorial/sensor_module_tutorial.cpp
[`sensor_module_tutorial/package.xml`]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/sensor_module_tutorial/package.xml
[`catkin/package.xml`]:http://wiki.ros.org/catkin/package.xml
[`catkin/package.xml`]:http://wiki.ros.org/catkin/package.xml
[`sensor_module_tutorial/CMakeLists.txt`]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/sensor_module_tutorial/CMakeLists.txt
[`catkin_make/CMakeLists.txt`]:http://wiki.ros.org/catkin/CMakeLists.txt

[_`thormang3_manager/src/thormang3_manager.cpp`_]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/thormang3_manager/src/thormang3_manager.cpp
[`catkin/package.xml`]:http://wiki.ros.org/catkin/package.xml
[`catkin_make/CMakeLists.txt`]:http://wiki.ros.org/catkin/CMakeLists.txt


[Creating new robot manager]: #creating-new-robot-manager
