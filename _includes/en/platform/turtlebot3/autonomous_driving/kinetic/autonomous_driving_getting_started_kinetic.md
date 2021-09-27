<!-- ## Getting Started -->

{% capture notice_01 %}
**NOTE**: This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{% endcapture %}

<div class="notice">{{ notice_01 | markdownify }}</div>

The contents in e-Manual are subject to be updated without a prior notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

The following instruction describes how to build the autonomous driving TurtleBot3 on ROS by using AutoRace packages.

### [What you need for Autonomous Driving](#what-you-need-for-autonomous-driving)

`TurtleBot3 Burger`

- It is the basic model to use AutoRace packages for the autonomous driving on ROS.
- Provided source codes, AutoRace Packages, are made based on TurtleBot3 Burger.

`Remote PC`

- It communicates with an single board computer (SBC) on Turtlebot3.
- Laptop, desktop, or other devices with ROS 1.

`Raspberry Pi camera module with a camera mount`

- You can use a different module if ROS supports it.
- Source codes provided to calibrate the camera are created based on ([Fisheye Lens](https://www.waveshare.com/rpi-camera-g.htm)) module.

`AutoRace tracks and objects`

- Download 3D CAD files for AutoRace tracks, Traffic signs, traffic lights and other objects at [ROBOTIS_GIT/autorace](https://github.com/ROBOTIS-GIT/autorace_track).
- Download a refree system at [ROBOTIS-GIT/autorace_referee](https://github.com/ROBOTIS-GIT/autorace_referee)

### [Install Autorace Packages](#install-autorace-packages)

The following instructions describes how to install packages and to calibrate camera.

1. Install AutoRace package on both `Remote PC` and `SBC`.
```bash
$ cd ~/catkin_ws/src/
$ git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_autorace_2020.git
$ cd ~/catkin_ws && catkin_make
```

2. Install additional dependent packages on `Remote PC`.
```bash
$ sudo apt-get install ros-kinetic-image-transport ros-kinetic-cv-bridge ros-kinetic-vision-opencv python-opencv libopencv-dev ros-kinetic-image-proc
```

3. You need to [Calibrate a Camera on SBC](#calibrate-a-camera-on-sbc).
