
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

### 1. Overview
"Sensor Module" processes obtained values from the sensor module.
If the Sensor Module is created and added to the robotis_controller of the [`robotis_controller`] pacakge, [`robotis_controller`] periodically calls process() function from the Sensor Module and saves calculated value to the `sensor_result_` of the [`robotis_controller`]. Once the robotis_controller completes calculation for all registered Sensor Modules, it transfers the result to the Motion Module.

The following is the example of creating a simple Sensor Module.  

### 2. Writing the Sensor Module
Go to the directory to create the `sensor_module_tutorial` package and create the package:
```
$ cd ~/catkin_ws/src/ROBOTIS-THORMANG-MPC
$ catkin_create_pkg sensor_module_tutorial std_msgs roscpp
```
#### 2.1. The Code
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

#### 2.2. The Code Explanation
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

### 3. Building your package
If the package is created with the catkin_create_pkg command, package.xml and CMakeLists.txt will be automatically generated.  

#### 3.1. `package.xml`
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

#### 3.2. `CMakeLists.txt`
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

#### 3.3. Build
Run `catkin_make` within the catkin workspace:
```
$ cd ~/catkin_ws
$ catkin_make
```

### 4. Add Created Sensor Module to `robotis_controller`
Please refer to the below link for creating a new Robot Manager and adding Sensor Module to the new Robot Manager.
> Reference : [Creating new robot manager]

<br>[&lt;&lt; Back](ROBOTIS_Framework_Documents.md)

[`robotis_controller`]:robotis_controller.md
[_`sensor_module_tutorial/include/sensor_module_tutorial/sensor_module_tutorial.h`_]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/sensor_module_tutorial/include/sensor_module_tutorial/sensor_module_tutorial.h   
[_`sensor_module_tutorial/src/sensor_module_tutorial/sensor_module_tutorial.cpp`_]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/sensor_module_tutorial/src/sensor_module_tutorial/sensor_module_tutorial.cpp
[`sensor_module_tutorial/package.xml`]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/sensor_module_tutorial/package.xml
[`catkin/package.xml`]:http://wiki.ros.org/catkin/package.xml
[`catkin/package.xml`]:http://wiki.ros.org/catkin/package.xml
[`sensor_module_tutorial/CMakeLists.txt`]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/sensor_module_tutorial/CMakeLists.txt
[`catkin_make/CMakeLists.txt`]:http://wiki.ros.org/catkin/CMakeLists.txt
[Creating new robot manager]:Creating_new_robot_manager.md
