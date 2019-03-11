---
layout: archive
lang: en
ref: openmanipulator
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/ros_examples/
sidebar:
  title: OpenManipulator RM-X52-TNM
  nav: "openmanipulator"
---

<div style="counter-reset: h1 8"></div>

# [[ROS] Examples](#ros-examples)

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

You can use rviz or image_view to verify driver. You can select data topic name related to Astra Pro from drop down menu at the top of the application.
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

You can use rviz or image_view to verify driver. You can select data topic name related to Intel® RealSense™ Depth Camera D435 from drop down menu at the top of the application.
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

### [AR Marker](#ar-marker)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- The `open_manipulator_perceptions` package requires [`ar_track_alvar`](http://wiki.ros.org/ar_track_alvar) package.
- Make sure to run the [Open Manipulator controller](/docs/en/platform/openmanipulator/ros_controller_package/#launch-controller) instructions before running the instructions below.
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

##### Rviz
When the camera recognizes the AR marker, the pose of the AR marker is shown on Rviz.
![](/assets/images/platform/openmanipulator/OpenManipulator_AR_Marker.png)

## [Master Slave](#master-slave)

**Coming Soon**


## [Mobile Manipulation](#mobile-manipulation)

  <iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/P82pZsqpBg0" frameborder="0" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/DLOq8yNcCoE" frameborder="0" allowfullscreen></iframe>

  **TIP**: You can get a more information about it in [Manipulation section of TurtleBot3](/docs/en/platform/turtlebot3/manipulation/#manipulation)
  {: .notice--success}

Install dependent packages

  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_msgs.git
  $ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
  $ sudo apt-get install ros-kinetic-smach*
  $ cd ~/catkin_ws && catkin_make
  ```

Load a TurtleBot3 Waffle or Waffle Pi with OpenManipulator on RViz.

  **TIP**: TB3_MODEL =  `waffle`, `waffle_pi`
  {: .notice--success}

  ``` bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_rviz.launch
  ```

![](/assets/images/platform/openmanipulator/TurtleBot3_with_Open_Manipulator.png)

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
