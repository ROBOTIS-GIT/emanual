---
layout: archive
lang: en
ref: openmanipulator_p_ros_perceptions
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_p/ros_perceptions/
sidebar:
  title: "OpenMANIPULATOR-P"
  nav: "openmanipulator_p"
product_group: openmanipulator_p
page_number: 9
---

<div style="counter-reset: h1 8"></div>

# [[ROS] Perceptions](#ros-perceptions)

## [Camera](#camera)
{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

The OpenMAIPULATOR-X can work with some cameras to recognize a front object. Use the following packages with introduced cameras: [Astro Pro](#astra-pro), [Realsense D435](#realsense-d435), [Raspberry Pi Camera V2](#raspberry-pi-camera-v2).

### [Install Camera Package](#install-camera-package)

#### [Astra Pro](#astra-pro)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_camera_Astra_pro.png)  

The [Astra Series](https://orbbec3d.com/product-astra/) was designed to further improve on the attributes that set Orbbec 3D cameras apart from existing 3D cameras on the market. Astra 3D cameras provide computer vision that enables dozens of functions such as face recognition, gesture recognition, human body tracking, three-dimensional measurement, environment perception, and three-dimensional map reconstruction.

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

> Specification

##### [Install Astra Camera Library](#install-astra-camera-library)
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
##### [Run Astra Launch File](#run-astra-launch-file)  
Run the following command.
  ``` bash
  $ sudo chmod a+rw /dev/bus/usb/${USB}/${PORT}
  $ roslaunch ros_astra_launch astra_pro.launch
  ```

You can use RViz or image_view to verify driver. You can select data topic name related to Astra Pro from drop down menu at the top of the application.
  ``` bash
  $ rqt_image_view
  ```

##### Reference
- [ORBBEC Astra Pro](https://orbbec3d.com/product-astra-pro/)    
- [Astra Pro ROS package](https://github.com/orbbec/ros_astra_camera)

#### [Realsense D435](#realsense-d435)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_camera_Realsense_D435.png)  

The [Intel® RealSense™ Depth Camera D435](https://realsense.intel.com/depth-camera/#D415_D435) is a USB-powered depth camera and consists of a pair of depth sensors, RGB sensor, and infrared projector. It is ideal for makers and developers to add depth perception capability to their prototype development. The D435 is designed to best fit your prototype.

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

> Specification

##### [Install Realsense D43 Library](#install-realsense-d43-library)
The following commands will install relevant Intel® RealSense™ Depth Camera D435 library.
  ``` bash
  $ sudo apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE
  $ sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u
  $ sudo apt-get install librealsense2-dev librealsense2-utils ros-kinetic-rgbd-launch
  ```
  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/intel-ros/realsense.git
  $ cd ~/catkin_ws && catkin_make
  ```
##### [Run Realsense D43 Launch File](#run-realsense-d43-launch-file)
Run the following command.
  ``` bash
  $ roslaunch realsense2_camera rs_camera.launch
  ```

You can use RViz or image_view to verify driver. You can select data topic name related to Intel® RealSense™ Depth Camera D435 from drop down menu at the top of the application.
  ``` bash
  $ rqt_image_view
  ```

##### Reference
- [Intel® RealSense™ Depth Camera D435](https://realsense.intel.com/depth-camera/#D415_D435)    
- [Realsense ROS package](https://github.com/intel-ros/realsense)

#### [Raspberry Pi Camera V2](#raspberry-pi-camera-v2)

![](/assets/images/platform/turtlebot3/appendix_raspi_cam/Pi-Camera-front.jpg)

- See more details about [Raspberry Pi Camera V2](/docs/en/platform/turtlebot3/appendix_raspi_cam/#overview)

- See more details about [Camera Sepecification](/docs/en/platform/turtlebot3/appendix_raspi_cam/#specifications)

##### [Setup Raspberry Pi Camera](#setup-raspberry-pi-camera)

**Warning!**: Raspberry pi must be installed before setting up the Raspberry Pi Camera V2. See [Raspberry Pi 3 Setup](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/) in order to install it.
{: .notice--warning}

1. **[Raspberry Pi]** Setting up the camera hardware.

    ``` bash
    $ sudo raspi-config
    ```

    ![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-1.png)

2. Select **3 Interfacing Options**.

    ![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-2.png)

3. Select **P1 Camera**.
    
    ![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-3.png)

4. Enable camera interface.

    ![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-4.png)    
    
    ![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-5.png)

5. After **reboot Raspberry Pi**, to test that the system is installed and working, try the following command:

    ``` bash
    $ raspistill -v -o test.jpg
    ```

    The display should show a five-second preview from the camera and then take a picture, saved to the file **test.jpg**

    The following commands will install relevant Raspberry Pi Camera packages on your ROS system.

    ``` bash
    $ sudo apt-get install ros-kinetic-compressed-image-transport ros-kinetic-camera-info-manager ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs ros-kinetic-image-proc
    ```

6. Clone the relevant packages from Git, and build. 
  
    ``` bash
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/UbiquityRobotics/raspicam_node.git
    $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_perceptions.git
    $ cd ~/catkin_ws && catkin_make
    ```
    
##### [Run Raspberry Pi Camera Launch File](#run-raspberry-pi-camera-launch-file)

1. **[Remote PC]** Run the following command.

    ```bash
    $ roscore
    $ rqt_image_view
    ```

    **Warning!**: Before running `rqt_image_view` in Remote PC, be sure Raspberry Pi and Remote PC are connected under the same IP address. If not, refer to [Raspberry Pi 3 Setup](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/#5-network-configuration) and [Remote PC Setup](/docs/en/platform/turtlebot3/pc_setup/#network-configuration) and connect the board and PC under the same IP address. Otherwise, `rqt_image_view` screen will not show any images from the camera. 
    {: .notice--warning}
      
2. **[Raspberry Pi]** Run the following command.

    ```bash
    $ roslaunch roslaunch open_manipulator_camera raspicam.launch
    ```

##### Reference

- [Raspberry Pi Camera](https://www.raspberrypi.org/documentation/hardware/camera/README.md)
- [Getting Started](https://projects.raspberrypi.org/en/projects/getting-started-with-picamera)
- [Pi Camera ROS package](https://github.com/UbiquityRobotics/raspicam_node)

### [Install AR Marker Package](#install-ar-marker-package)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- The `open_manipulator_perceptions` package requires [`ar_track_alvar`](http://wiki.ros.org/ar_track_alvar) package.
- Make sure to run the [Openmanipulator controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before use of the instruction
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>


1. If you use the `ar_track_alvar` package to recognize the ar marker, print out the ar marker [here](http://wiki.ros.org/ar_track_alvar).

2. Install AR Marker Packages on Remote PC.
``` bash
$ sudo apt-get install ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs ros-kinetic-image-proc
```

3. Clone the relevant package from Git, and build. 
``` bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_perceptions.git
$ cd ~/catkin_ws && catkin_make
```

#### [Run AR Marker with a Camera in Use](run-ar-marker-with-a-camera-in-use)

In order to use AR Marker properly with your camera, be sure to add the camera model to the launch command when using AR Marker.  

See the following section and use the provided command to enable AR Marker feature with your camera.

##### [AR Marker With Astra Pro](#ar-marker-with-astra-pro)

1. Install [Astra Pro ROS package](#astra-pro).

2. Run AR Marker with the camera model in use, astra_pro.
``` bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=astra_pro
```

##### [AR Marker With Realsense D435](#ar-marker-with-realsense-d435)

1. Install [Realsense D435 ROS package](#realsense-d435).

2. Run AR Marker with the camera model in use, realsense_d435.
``` bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=realsense_d435
```

##### [AR Marker With Raspberry Pi Camera V2](#ar-marker-with-raspberry-pi-camera-v2)

1. Install [Raspberry Pi Camera V2 ROS package](#raspberry-pi-camera-v2).

2. **[Raspberry Pi]** Run a Raspberry Pi camera. 
``` bash
$ roslaunch open_manipulator_camera raspicam.launch
```

3. **[Remote PC]** Run AR Marker with the camera model in use, raspicam
``` bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=raspicam
```

#### [AR Marker displayed on RViz](#ar-marker-displayed-on-rviz) 
When the camera recognizes the object with the AR marker, the pose of the AR marker will be displayed on a RViz screen.  

![](/assets/images/platform/openmanipulator_x/OpenManipulator_AR_Marker.png)

### [Control OpenMANIPULATOR-P with Camera](#control-openmanipulator-p-with-camera)

```bash
$ roslaunch open_manipulator_p_controller open_manipulator_p_controller.launch with_gripper:=true
$ roslaunch open_manipulator_p_ar_markers ar_pose.launch camera_model:=realsense_d435
```

### [Simulation](#simulation)
Simulate OpenMANIPULATOR-P using Gazebo simulator with the following commands.

```bash
$ roslaunch open_manipulator_p_gazebo open_manipulator_p_gazebo.launch with_gripper:=true
$ roslaunch open_manipulator_p_controller open_manipulator_p_controller.launch with_gripper:=true use_platform:=false 
$ roslaunch open_manipulator_p_ar_markers ar_pose.launch camera_model:=realsense_d435 use_platform:=false
```
