---
layout: archive
lang: en
ref: ros2_openmanipulator_x_ros_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/ros2_openmanipulator_x/ros_setup/
sidebar:
  title: "[ROS2] OpenMANIPULATOR-X"
  nav: "ros2_openmanipulator_x"
---

<div style="counter-reset: h1 4"></div>

# [[ROS2] Setup](#ros-setup)

**NOTE** : The following instruction has been tested on `Ubuntu 18.04` and `ROS2 Dashing Diademata`.
{: .notice--info}

**WARNING** : If you would like to control OpenMANIPULATOR-X on OpenCR (Embedded board) instead of using ROS, please set it up as described in [OpenCR Setup](/docs/en/platform/ros2_openmanipulator_x/opencr_setup/#opencr-setup).
{: .notice--warning}


## [Install Ubuntu on PC](#install-ubuntu-on-pc)

Download and install `Ubuntu 18.04` on your PC.

- [Download link](https://www.ubuntu.com/download/alternative-downloads)

If you need more help with installing Ubuntu, check out the step-by-step guide from the link below.

- [Install ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

## [Install ROS on PC](#install-ros-on-pc)

Please follow the link below.

- [Manual Installation of ROS2 Dashing Diademata](https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/)

## [Install ROS Packages](#install-ros-packages)
Install dependent packages for OpenMANIPULATOR-X. Run the following commands in a terminal window.

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--info}

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/open_manipulator/ros2/install_ros_dashing.sh && chmod 755 ./install_ros_dashing.sh && bash ./install_ros_dashing.sh
```

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_dashing.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}

If you prefer manual installation, please follow the link below.

``` bash
$ cd ~/robotis_ws/src/
$ git clone https://github.com/bponsler/cmake_modules.git -b ros2-devel
$ git clone https://github.com/ros/joint_state_publisher.git -b ros2-devel
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git -b ros2
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git -b ros2
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git -b ros2
$ git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git -b ros2
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git -b ros2
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator.git -b ros2
$ cd ~/robotis_ws && colcon build --symlink-install
```

If the colcon build command has been completed without any errors, all the preparations for using OpenMANIPULATOR-X are done.

## [Communication Converter](#communication-converter)

### [U2D2](#u2d2)

#### Connection
Connect micro USB (connected to PC), DYNAMIXEL's(OpenMANIPULATOR-X), and 12V Power to U2D2 and U2D2 power hub board as shown below.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_u2d2_setup2.png" width="800">

**NOTE** : Please refer to [U2D2 e-manual](/docs/en/parts/interface/u2d2/) and [U2D2 power hub board e-manual](/docs/en/parts/interface/u2d2_power_hub/) for detailed connection of U2D2 and U2D2 power hub board.
{: .notice--info}

#### USE Latency Timer Setting
In linux(ubuntu) environment, USB latency time is set to 16ms by default. Follow the steps below to set the communication latency time to the lowest value (1ms) between DYNAMIXEL's and PC connected via USB.

Open a terminal window and run the following command to set usb latency time.

``` bash
$ ros2 run open_manipulator_x_controller create_udev_rules
```

**TIP**: This entered command set USB latency timer to **1 ms**. If you would like to see the setting, run the following command in a terminal.  
`cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer`
{: .notice--success}

### [OpenCR](#opencr)
This section explains how to set up OpenCR as a communication board between **ROS Packages** of PC and DYNAMIXEL's of OpenMANIPULATOR-X.  
If you want to operate OpenMANIPULATOR-X on embedded system (OpenCR) without ROS, please refer [OpenCR Setup](/docs/en/platform/ros2_openmanipulator_x/opencr-setup/#opencr-setup).

#### Connection

Connect micro USB (connected to PC), Dynamixel's(OpenMANIPULATOR-X), and 12V Power to OpenCR as shown below.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_setup2.png" width="800">

**NOTE** : Please refer the detailed description of [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

#### Upload Source code

Please refer to the following pages to install the Arduino IDE and enable the OpenCR board in the Arduino IDE environment.

- [Arduino IDE for using OpenCR](/docs/en/platform/ros2_openmanipulator_x/opencr_setup/#arduino-ide-setup)

After completing all the above settings, open the Arduino IDE and open `usb to dxl` example source code as shown below.
Go to `Examples` → `OpenCR` → `10.Etc` → `usb_to_dxl` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_utd_setup.png)

Upload the `usb to dxl` example source to OpenCR.

![](/assets/images/platform/openmanipulator_x/upload_use_to_dxl.png)

When the upload is completed, the following comments are displayed in the log window. 

![](/assets/images/parts/controller/opencr10/downloader_01.png)

If it is shown different comments than this, try uploading again. Refer to the [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/) for details.

**TIP**: If an error of `cmd_read_board_name fail: 0xF020` occurs constantly during upload, please refer to [OpenCR e-manual](http://emanual.robotis.com/docs/en/parts/controller/opencr10/#firmware-recovery-mode) to enter the firmware recovery mode and upload the source code again after entering mode.  
{: .notice--success}
