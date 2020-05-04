---
layout: archive
lang: en
ref: openmanipulator_x_ros_perceptions
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_perceptions/
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
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

##### [AR Marker With Astra Pro](#with-astra-pro)

1. Install [Astra Pro ROS package](#astra-pro).

2. Run AR Marker with the camera model in use, astra_pro.
``` bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=astra_pro
```

##### [AR Marker With Realsense D435](with-realsense-d435)

1. Install [Realsense D435 ROS package](#realsense-d435).

2. Run AR Marker with the camera model in use, realsense_d435.
``` bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=realsense_d435
```

##### [AR Marker With Raspberry Pi Camera V2](with-raspberry-pi-camera-v2)

1. Install [Raspberry Pi Camera V2 ROS package](#raspberry-pi-camera-v2).

2. **[Raspberry Pi]** Run a Raspberry Pi camera. 
``` bash
$ roslaunch open_manipulator_camera raspicam.launch
```

3. **[Remote PC]** Run AR Marker with the camera model in use, raspicam
``` bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=raspicam
```

#### AR Marker displayed on RViz 
When the camera recognizes the object with the AR marker, the pose of the AR marker will be displated on a RViz screen.  

![](/assets/images/platform/openmanipulator_x/OpenManipulator_AR_Marker.png)

### [Pick and Place Example](#pick-and-place-example)
In this example, OpenMANIPULATOR-X uses Raspberry Pi Camera V2 to pick and place blocks. Print the camera frame to the OpenMANIPULATOR-X using a 3D printer to mount the camera. Attach a 3cm x 3cm ar marker to the cube block. When you run the example package, you pick the ar marker's id 1, 2, and 3 in order and stack them on one side.

<iframe width="560" height="315" src="https://www.youtube.com/embed/jIO2lhit1g8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### Camera Frame

##### Raspberry Pi Camera V2

Download the .stl file in the path below and output it to the 3D printer.
- [OnShape](https://cad.onshape.com/documents/317f41cd6ef3f111631e9f97/w/be4693711e5767f7686bfed7/e/3490ca5c51c70a615d19ad93)
- [Thingiverse](https://www.thingiverse.com/thing:3069574)

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_picam.png" width="600">  
<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_picam_2.png" width="600">

##### Realsense D435

Download the .stl file in the path below and output it to the 3D printer.
- [OnShape](https://cad.onshape.com/documents/317f41cd6ef3f111631e9f97/w/be4693711e5767f7686bfed7/e/7dbdd6d59254066690fefc5a)
- [Thingiverse](https://www.thingiverse.com/thing:3069574)

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_d435.png" width="600">  
<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_d435_2.png" width="600">

#### Install ROS package

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- Make sure to run the [OpenMANIPULATOR controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before use of the instruction
- Proceed from [Install Camera Package](/docs/en/platform/openmanipulator_x/ros_applications/#install-camera-package) and [Install AR Marker Package](/docs/en/platform/openmanipulator_x/ros_applications/#install-ar-marker-package).
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

{% capture notice_01 %}
**NOTE**:
- To use the **Raspberry Pi Camera V2**, install it on the **Remote PC**
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_applications.git
  $ cd ~/catkin_ws && catkin_make
  ```
If the catkin_make command has been completed without any errors, all the preparations are done.


#### Execution Example
Please, open the terminal window, run roscore as entering following command.

``` bash
$ roscore
```

After run roscore, Run **the controller of OpenMANIPULATOR**. Open the other terminal window and enter the following command in the terminal.      

``` bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch
```
{% capture warning_01 %}

**WARNING**  
Please check each joint position before running OpenMANIPULATOR-X. It might stop operation because of joint postion out of range.  
The picture on the below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque isn't enabled.    
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

If the OpenMANIPULATOR controller has been launched successfully, the terminal will show the following message.

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

And Open the other terminal window and enter the following command in the terminal. This command is to execute a package that recognizes the ar marker. Enter the type of camera you are using and the size of the ar marker. In this example, we use a Raspberry Pi Camera V2 and 3cm ar marker.

``` bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=raspicam user_marker_size:=3.0
```

{% capture notice_01 %}
**NOTE**: To use the **Raspberry Pi Camera V2**, Run the camera node in Raspberry Pi.  
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

And Open the other terminal window and enter the following command in the terminal.
``` bash
$ roslaunch open_manipulator_pick_and_place open_manipulator_pick_and_place.launch
```
So, you can see the following message in the terminal window. You can check the robot status.

```
-----------------------------
Pick and Place demonstration!
-----------------------------
1 : Home pose
2 : Pick and Place demo. start
3 : Pick and Place demo. Stop
-----------------------------
-----------------------------
Present Joint Angle J1: 0.000 J2: 0.000 J3: 0.000 J4: 0.000
Present Tool Position: 0.000
Present Kinematics Position X: 0.000 Y: 0.000 Z: 0.000
-----------------------------
```
There are three commands. Please enter that number in the terminal.
 
1. Home pose: Move to the home pose.
2. Pick and Place demo. Start: Start the Pick and Place demonstration.
3. Pick and Place demo. Stop: Stop the Pick and Place demonstration.

### [Simulation](#simulation)
Simulate OpenMANIPULATOR-X using Gazebo simulator with the following commands.

```bash
$ roslaunch open_manipulator_gazebo open_manipulator_gazebo.launch
$ roslaunch open_manipulator_controller open_manipulator_controller.launch use_platform:=false
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=realsense_d435 use_platform:=false
$ roslaunch open_manipulator_pick_and_place open_manipulator_pick_and_place.launch
```
