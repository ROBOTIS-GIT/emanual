
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

### 1. Overview
"Motion Module" calculates target position(or target velocity or target current) of each joint. If the Motion Module is created and added to the `RobotisController` of the [`robotis_controller`] pacakge, `RobotisController` periodically calls process() function from the Motion Module and saves calculated value to the `result_` of the Motion Module. Once the `RobotisController` completes calculation for all registered Motion Modules, it obtains `result_` from the Motion Module for each joint and transfers the value to each joint.  

The following is the example of creating a simple Motion Module.  

### 2. Writing the Motion Module
Go to the directory to create the `motion_module_tutorial` package and create the package:
```
$ cd ~/catkin_ws/src/ROBOTIS-THORMANG-MPC
$ catkin_create_pkg motion_module_tutorial std_msgs roscpp
```

#### 2.1. The Code
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

##### 2.2. The Code Explanation
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

### 3. Building your package
If the package is created with the `catkin_create_pkg` command, `package.xml` and `CMakeLists.txt` will be automatically generated.  

#### 3.1. `package.xml`
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

#### 3.2. `CMakeLists.txt`
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

#### 3.3. Build
Run `catkin_make` within the catkin workspace:
```
$ cd ~/catkin_ws
$ catkin_make
```

### 4. Add Created Motion Module to `robotis_controller`
Please refer to the below link for creating a new Robot Manager and adding Motion Module to the new Robot Manager.
> Reference : [Creating new robot manager]


<br>[&lt;&lt; Back](ROBOTIS_Framework_Documents.md)


[`robotis_frameowrk_common`]:robotis_framework_common.md
[`robotis_controller`]:robotis_controller.md

[_`motion_module_tutorial/include/motion_module_tutorial/motion_module_tutorial.h`_]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/motion_module_tutorial/include/motion_module_tutorial/motion_module_tutorial.h

[_`motion_module_tutorial/src/motion_module_tutorial/motion_module_tutorial.cpp`_]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/motion_module_tutorial/src/motion_module_tutorial/motion_module_tutorial.cpp  

[_`motion_module_tutorial/package.xml`_]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/motion_module_tutorial/package.xml
[`catkin/package.xml`]:http://wiki.ros.org/catkin/package.xml

[_`motion_module_tutorial/CMakeLists.txt`_]:https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/motion_module_tutorial/CMakeLists.txt
[`catkin_make/CMakeLists.txt`]:http://wiki.ros.org/catkin/CMakeLists.txt


[Creating new robot manager]:Creating_new_robot_manager.md
