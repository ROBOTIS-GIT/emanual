### 1. Overview
The followings are the packages to use [ROS] (Robot Operating System) for robots assembled with ROBOTIS products.

**[ ROBOTIS-Framework ]**  

1. [robotis_controller] : The main package to control the robot.
2. [robotis_device] : The package manages ROBOTIS device information
3. [robotis_framework_common] : Collection of headers commonly used in the ROBOTIS Framework.

**[ ROBOTIS-Framework-msgs ]**  

1. [robotis_controller_msgs] : ROS messages used in the robotis_controller.


### 2. Getting Started
#### 2.1 Download
Go to the catkin workspace folder and download the source from the Github.  
```
$ cd ~catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework.git
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs.git
```
Download additional packages.
```
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Math.git
```


#### 2.2 Build
Build each package with the build command. In order to avoid any possible package independency issues caused by concurrent compile, use -j1 option when building for the first time to make sure prerequisite packages are compiled first.
```
$ cd ~/catkin_ws
$ catkin_make -j1
```

#### 2.3 Usage
The package uses ROBOTIS Framework as a library should be created.

<br>

**robot manager package**

In order to apply ROBOTIS Framework on the Robot, a specific manager for the robot is necessary. Please refer to the below for the instruction of creating the link robot manager.  
> Reference : [Creating new robot manager]

<br>

**motion module package**

The robot is operated by obtaining and processing calculated target values of each joint for the next move from the motion module that is periodically called by the `robotis_controller`. Please refer to the below link for the instruction of creating the motion module.
> Reference : [Creating new motion module]

<br>

**sensor module package**

This package processes sensor values from the sensor module that is created and periodically called by the `robotis_controller`. Please refer to the below link for the instruction of creating the sensor module.
> Reference : [Creating new sensor module]


<br>[&lt;&lt; Back](ROBOTIS_Framework_Documents.md)

[ROS]:http://www.ros.org/
[robotis_controller]:robotis_controller.md
[robotis_device]:robotis_device.md
[robotis_framework_common]:robotis_frameowrk_common.md
[robotis_controller_msgs]:robotis_controller_msgs.md
[Creating new motion module]:Creating_new_motion_module.md
[Creating new sensor module]:Creating_new_sensor_module.md
[Creating new robot manager]:Creating_new_robot_manager.md
