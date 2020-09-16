---
layout: archive
lang: en
ref: ros2_openmanipulator_x_ros_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros2_setup/
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 12
---

<div style="counter-reset: h1 11"></div>

# [[ROS 2] Setup](#ros-2-setup)

{% capture notice_01 %}
**NOTE** :  
- The test is done on `ROS 2 Dashing Diademata` installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions. - [Install ROS 2 Packages](/docs/en/platform/openmanipulator_x/ros2_setup/#install-ros-2-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**WARNING** : If you would like to control OpenMANIPULATOR-X on OpenCR (Embedded board) instead of using ROS, please set it up as described in [OpenCR Setup](/docs/en/platform/ros2_openmanipulator_x/opencr_setup/#opencr-setup).
{: .notice--warning}

## [Install Ubuntu on PC](#install-ubuntu-on-pc)

Download and install `Ubuntu 18.04` on your PC. Tutoral guide will be helpful for you to install Ubuntu Desktop.

- [Download Ubuntu](https://www.ubuntu.com/download/alternative-downloads)

- [Tutorial - Install Ubuntu Desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

## [Install ROS 2 on PC](#install-ros2-on-pc)

![](/assets/images/platform/openmanipulator_p/logo_ros.png)
 
As OpenMANIPULATOR-P operates on Robot Operating System(ROS), it requies to intall `ROS 2 Dashing Diademata`.
The following script will allow you to simplify the ROS 2 installation procedure. Run the following commands in a terminal window.
After installing ROS 2, please reboot PC.

``` bash
$ sudo apt update && sudo apt upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_dashing.sh
$ chmod 755 ./install_ros_dashing.sh
$ bash ./install_ros_dashing.sh
```

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_dashing.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/open_manipulator/ros2/install_ros_dashing.sh)
{: .notice--info}

If you prefer a manual installation，following link guides you how to install ROS 2 on your PC
- [Manual Installation of ROS 2 Dashing Diademata](https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/)

## [Install ROS 2 Packages](#install-ros-2-packages)

Install dependent packages for OpenMANIPULATOR-X. Run the following commands in a terminal window.


``` bash
$ sudo apt install ros-dashing-python* ros-dashing-rqt*
```

``` bash
$ cd ~/robotis_ws/src/  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/DynamixelSDK.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/dynamixel-workbench.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_dependencies.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/robotis_manipulator.git  
$ cd ~/robotis_ws && colcon build --symlink-install  
```

## [Communication Converter](#communication-converter)

### [U2D2](#u2d2)

#### Connection
Connect micro USB (connected to PC), DYNAMIXEL's(OpenMANIPULATOR-X), and 12V Power to U2D2 and U2D2 power hub board as shown below.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_u2d2_setup2.png" width="800">

**NOTE** : Please refer to [U2D2 e-Manual](/docs/en/parts/interface/u2d2/) and [U2D2 power hub board e-manual](/docs/en/parts/interface/u2d2_power_hub/) for detailed connection of U2D2 and U2D2 power hub board.
{: .notice--info}

#### USB Latency Timer Setting
In Linux(Ubuntu platform) environment, USB latency time is set to 16ms by default. Follow the steps below to set the communication latency time to the lowest value (1ms) between DYNAMIXEL's and PC connected via USB.

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

Connect micro USB (connected to PC), DYNAMIXEL(OpenMANIPULATOR-X), and 12V Power to OpenCR as shown below.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_setup2.png" width="800">

**NOTE** : Please refer to the detailed description of [OpenCR](/docs/en/parts/controller/opencr10/).
{: .notice--info}

#### Upload Source code

Please refer to the following pages to install the Arduino IDE and enable the OpenCR board in the Arduino IDE environment.

- [Arduino IDE for using OpenCR](/docs/en/platform/openmanipulator_x/opencr_setup/#arduino-ide-setup)

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
