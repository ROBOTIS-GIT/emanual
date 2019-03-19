---
layout: archive
lang: en
ref: openmanipulator_ros_applications
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/ros_applications/
sidebar:
  title: OpenManipulator X-Series
  nav: "openmanipulator"
---

<div style="counter-reset: h1 8"></div>

# [[ROS] Applications](#ros-applications)

## [Camera Application](#camera-application)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

### [Astra Pro](#astra-pro)

#### Overview
![](/assets/images/platform/openmanipulator/OpenManipulator_camera_Astra_pro.png)  

The [Astra Series](https://orbbec3d.com/product-astra/) was designed to further improve on the attributes that set Orbbec 3D cameras apart from existing 3D cameras on the market. Astra 3D cameras provide computer vision that enables dozens of functions such as face recognition, gesture recognition, human body tracking, three-dimensional measurement, environment perception, and three-dimensional map reconstruction.

#### Specifications

| Items                                 | Specifications               |
|:--------------------------------------|:-----------------------------|
| RGB Image Resolution and Frame Rate   | 1280 x 720, @30fps           |
| Depth Imgae Resolution and Frame Rate | 640 x 480, @30fps            |
| FOV (Field-of-View)                   | 60°H x 49.5°V x 73°D         |
| Range                                 | 0.6m - 8m                    |
| USB Port                              | USB 2.0                      |
| Dimensions                            | 165mm x 30mm x 40mm          |
| Operating Systems                     | Android/Linux/Windows 7/8/10 |
| SDK                                   | Astra SDK or OpenNI          |
| Microphones                           | 2 (Built - in)               |

#### User Guide

##### Installation
The following commands will install relevant Astra Pro library.
  ``` bash
  $ sudo apt-get install ros-kinetic-rgbd-launch ros-kinetic-libuvc-camera
  ```
  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/orbbec/ros_astra_camera.git
  $ git clone https://github.com/ROBOTIS-GIT/ros_astra_launch.git
  $ cd ~/catkin_ws && catkin_make
  $ roscd astra_camera && ./scripts/create_udev_rules
  ```
##### Execution  
Run the following command.
  ``` bash
  $ sudo chmod a+rw /dev/bus/usb/${USB}/${PORT}
  $ roslaunch ros_astra_launch astra_pro.launch
  ```

You can use RViz or image_view to verify driver. You can select data topic name related to Astra Pro from drop down menu at the top of the application.
  ``` bash
  $ rqt_image_view
  ```

#### Reference
- [ORBBEC Astra Pro](https://orbbec3d.com/product-astra-pro/)    
- [Astra Pro ROS package](https://github.com/orbbec/ros_astra_camera)

### [Realsense D435](#realsense-d435)

#### Overview
![](/assets/images/platform/openmanipulator/OpenManipulator_camera_Realsense_D435.png)  

The [Intel® RealSense™ Depth Camera D435](https://realsense.intel.com/depth-camera/#D415_D435) is a USB-powered depth camera and consists of a pair of depth sensors, RGB sensor, and infrared projector. It is ideal for makers and developers to add depth perception capability to their prototype development. The D435 is designed to best fit your prototype.

#### Specifications

| Items                                | Specifications                        |
|:-------------------------------------|:--------------------------------------|
| Use Environment                      | Indoor/Outdoor                        |
| RGB Sensor Resolution and Frame Rate | 1920 x 1080 at 30 fps                 |
| RGB Sensor FOV                       | 69.4°(H) x 42.5°(V) x 77°(D) (+/- 3°) |
| Depth Stream Output Resolution       | Up to 1280 x 720                      |
| Depth Stream Output Frame Rate       | Up to 90 fps                          |
| Depth Field of View (FOV)            | 85.2°(H) x 58°(V) x 94°(D) (+/- 3°)   |
| Minimum Depth Distance (Min-Z)       | 0.2m                                  |
| Maximum Range                        | Approx.10 meters                      |
| Dimension                            | 90 mm x 25 mm x 25 mm                 |
| Connectors                           | USB 3.0 Type - C                      |

#### User Guide

##### Installation
The following commands will install relevant Intel® RealSense™ Depth Camera D435 library.
  ``` bash
  $ sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u
  $ sudo apt-get install librealsense2-dev ros-kinetic-rgbd-launch
  ```
  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/intel-ros/realsense.git
  $ cd ~/catkin_ws && catkin_make
  ```
##### Execution  
Run the following command.
  ``` bash
  $ roslaunch realsense2_camera rs_camera.launch
  ```

You can use RViz or image_view to verify driver. You can select data topic name related to Intel® RealSense™ Depth Camera D435 from drop down menu at the top of the application.
  ``` bash
  $ rqt_image_view
  ```

#### Reference
- [Intel® RealSense™ Depth Camera D435](https://realsense.intel.com/depth-camera/#D415_D435)    
- [Realsense ROS package](https://github.com/intel-ros/realsense)

### [Raspberry Pi Camera V2](#raspberry-pi-camera-v2)

#### Overview
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/Pi-Camera-front.jpg)

Please refer the detailed description of [Raspberry Pi Camera V2](/docs/en/platform/turtlebot3/appendix_raspi_cam/#overview)


#### Specifications

Please refer the detailed Specification of [Raspberry Pi Camera V2](/docs/en/platform/turtlebot3/appendix_raspi_cam/#specifications)

#### User Guide

##### Installation

**Warning!**     
Raspberry pi must be installed before setting up the Raspberry Pi Camera V2.    
Please check this link out. [Raspberry Pi 3 Setup](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/)
{: .notice--warning}

**[Raspberry Pi]** Setting up the camera hardware

``` bash
$ sudo raspi-config
```

![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-1.png)

Select **3 Interfacing Options**    
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-2.png)

Select **P1 Camera**    
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-3.png)

Enable camera interface    
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-4.png)    
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-5.png)

After **reboot Raspberry Pi**, to test that the system is installed and working, try the following command:

``` bash
$ raspistill -v -o test.jpg
```
The display should show a five-second preview from the camera and then take a picture, saved to the file *test.jpg*

The following commands will install relevant Raspberry Pi Camera packages on your ROS system.

- If you use Ubuntu in Raspberry Pi, enter the following command     
``` bash
$ sudo apt-get install ros-kinetic-compressed-image-transport ros-kinetic-camera-info-manager
```

``` bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/UbiquityRobotics/raspicam_node.git
$ cd ~/catkin_ws && catkin_make
```
##### Execution  

**Warning!**     
Before you run `rqt_image_view` in Remote PC, check your Raspberry Pi and Remote PC whether they are connected. Please check this link out.    
[Raspberry Pi 3 Setup](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/#5-network-configuration)    
[Remote PC Setup](/docs/en/platform/turtlebot3/pc_setup/#network-configuration)
{: .notice--warning}

**[Remote PC]** Run the following command

``` bash
$ roscore
$ rqt_image_view
```

**[Raspberry Pi]** Run the following command.
``` bash
$ roslaunch raspicam_node camerav2_1280x960.launch
```


##### Reference

- [Raspberry Pi Camera](https://www.raspberrypi.org/documentation/hardware/camera/README.md)
- [Getting Started](https://projects.raspberrypi.org/en/projects/getting-started-with-picamera)
- [Pi Camera ROS package](https://github.com/UbiquityRobotics/raspicam_node)

### [AR Marker Package](#ar-marker-package)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- The `open_manipulator_perceptions` package requires [`ar_track_alvar`](http://wiki.ros.org/ar_track_alvar) package.
- Make sure to run the [OpenManipulator controller](/docs/en/platform/openmanipulator/ros_controller_package/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

#### Installation

{% capture notice_01 %}
**NOTE**:
- To use the **Raspberry Pi Camera V2**, install it on the **Remote PC**
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

  ``` bash
  $ sudo apt-get install ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs
  ```
  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_perceptions.git
  $ cd ~/catkin_ws && catkin_make
  ```

#### Execution
You have to change the parameters according to the type of camera. Run the following command.

##### Astra Pro
  ``` bash
  $ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=astra_pro
  ```
##### Realsense D435
  ``` bash
  $ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=realsense_d435
  ```
##### Raspberry Pi Camera V2
**[Raspberry Pi]**
  ``` bash
  $ roslaunch raspicam_node camerav2_1280x960.launch
  ```
**[Remote PC]**
  ``` bash
  $ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=raspicam
  ```

##### RViz
When the camera recognizes the AR marker, the pose of the AR marker is shown on RViz.
![](/assets/images/platform/openmanipulator/OpenManipulator_AR_Marker.png)

## [Master Slave](#master-slave)

In this example, if the user is holding the master OpenManipulator, the slave OpenManipulator moves like master robot. Recording mode allows you to save the trajectory as you move the master OpenManipulator and play it back to the slave OpenManipulator.

<iframe width="560" height="315" src="https://www.youtube.com/embed/kTS3Yx75mLo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Setup of the OpenManipulator
Since you need to control two OpenManipulators on one PC, use two U2D2s and two OpenManipulators to connect as shown below.

![](/assets/images/platform/openmanipulator/OpenManipulator_master_slave_connection.png)

![](/assets/images/platform/openmanipulator/OpenManipulator_master_slave.png)
#### Master OpenManipulator
Master OpenManipulator is a robot that is controlled by the user. This is easy to move because no torque is applied to dynamixel. Dynamixel of master OpenManipulator sets the ID as below and the baudrate as 1000000bps.

| Name    | Dynamixel ID |
|:--------|:-------------|
| Joint 1 | 1            |
| Joint 2 | 2            |
| Joint 3 | 3            |
| Joint 4 | 4            |
| Gripper | 5            |

#### Slave OpenManipulator
Slave OpenManipulator moves synchronously with Master OpenManipulator. Dynamixel of slave OpenManipulator sets the ID as below and the baudrate as 1000000bps. This is the same as the default OpenManipulator setting.

| Name    | Dynamixel ID |
|:--------|:-------------|
| Joint 1 | 11           |
| Joint 2 | 12           |
| Joint 3 | 13           |
| Joint 4 | 14           |
| Gripper | 15           |

### Install ROS package
Run the following command in a terminal window.

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_applications.git
$ cd ~/catkin_ws && catkin_make
```
If the catkin_make command has been completed without any errors, all the preparations are done.

### Execution
Please, open the terminal window, run roscore as entering following command.

``` bash
$ roscore
```

After run roscore, Run **the controller of slave OpenManipulator**. Open the other terminal window and enter the following command in the terminal.      
`dynamixel_usb_port` is a parameter to set use port to connected with Dynamixel of slave OpenManipulator. It should be set **/dev/ttyUSB@** and it is different from use port of master OpenManipulator.

``` bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch dynamixel_usb_port:=/dev/ttyUSB0
```

If the master OpenManipulator controller has been launched successfully, the terminal will show the following message.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator/control_period: 0.01
 * /open_manipulator/moveit_sample_duration: 0.05
 * /open_manipulator/planning_group_name: arm
 * /open_manipulator/using_moveit: False
 * /open_manipulator/using_platform: True
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator (open_manipulator_controller/open_manipulator_controller)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator-1]: started with pid [23452]
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[ INFO] [1544509070.096942788]: Succeeded to init /open_manipulator
```

And Open the other terminal window and enter the following command in the terminal. This command is to run **the controller of master OpenManipulator**.     
`usb_port` is a parameter to set use port to connected with Dynamixel of master OpenManipulator. It should be set **/dev/ttyUSB@** and it is different from use port of slave OpenManipulator.

``` bash
$ roslaunch open_manipulator_master_slave open_manipulator_master.launch usb_port:=/dev/ttyUSB1
```

If the slave OpenManipulator controller has been launched successfully, the terminal will show the following message.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator/open_manipulator_master/gripper_id: 5
 * /open_manipulator/open_manipulator_master/joint1_id: 1
 * /open_manipulator/open_manipulator_master/joint2_id: 2
 * /open_manipulator/open_manipulator_master/joint3_id: 3
 * /open_manipulator/open_manipulator_master/joint4_id: 4
 * /open_manipulator/open_manipulator_master/service_call_period: 0.01
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /open_manipulator/
    open_manipulator_master (open_manipulator_master_slave/open_manipulator_master)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator/open_manipulator_master-1]: started with pid [32026]
Joint Dynamixel ID : 1, Model Name : XM430-W350
Joint Dynamixel ID : 2, Model Name : XM430-W350
Joint Dynamixel ID : 3, Model Name : XM430-W350
Joint Dynamixel ID : 4, Model Name : XM430-W350
Gripper Dynamixel ID : 5, Model Name :XM430-W350
```

So, you can see the following message in the terminal window. You can check the current control mode and robot status(joint angle, tool position).

``` 
-----------------------------
Control Your OpenManipulator!
-----------------------------
Present Control Mode
Master - Slave Mode
-----------------------------
1 : Master - Slave Mode
2 : Start Recording Trajectory
3 : Stop Recording Trajectory
4 : Play Recorded Trajectory
-----------------------------
Present Joint Angle J1: -0.170 J2: 0.367 J3: -0.046 J4: 0.959
Present Tool Position: 0.000
-----------------------------
```
There are four control modes.
1. Master-Slave Mode: Master robot and slave robot move synchronously.
2. Start Recording Trajectory: Master robot and slave robot move synchronously and the controller records the moving trajectory.
3. Stop Recording Trajectory: Ends the recording.
4. Play Recorded Trajectory: The trajectory recorded in the 2nd mode is reproduced only by the slave robot.


[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR Manual]: /docs/en/parts/controller/opencr10/
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/

[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[open_manipulator_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_msgs_SetActuatorState/
[open_manipulator_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_msgs_SetDrawingTrajectory/

[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/
[open_manipulator_msgs/OpenManipulatorState]: /docs/en/popup/open_manipulator_msgs_OpenManipulatorState/
[std_msgs::String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
