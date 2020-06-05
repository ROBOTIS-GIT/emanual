---
layout: archive
lang: en
ref: sbc_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/sbc_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 8
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 1"></div>

<!--[dummy Header 1]>
  <h1 id="pc-setup"><a href="#pc-setup">PC Setup</a></h1>
<![end dummy Header 1]-->

## [SBC Setup](#sbc-setup)

**WARNING**: Setup work requires Power and Time. So battery is not suitable. We recommend using SMPS (AC adapter) during this work.
{: .notice--warning}

**NOTE**: We are offering three models of TurtleBot3. TurtleBot3 Burger and Waffle Pi use Raspberry Pi 3 B and B+, and TurtleBot3 Waffle uses Intel Joule 570x. Choose from the following pages according to the SBC used in your model.
{: .notice--info}

**NOTE**: If you would like to use Windows on your Turtlebot3, you'll need to separately acquire a Windows 10 Enterprise compatible Single Board Computer, and adapt it to the turtlebot power supply.
{: .notice--info}

### [Raspberry Pi 3](#raspberry-pi-3)

{% capture info_01 %}
**NOTE**: Use either of 3 ways to install Linux and ROS on Raspberry Pi 3
1. For Ubuntu Mate installation, read `Install Linux (Ubuntu MATE)` guide. Be sure to install ROS and dependency packages after installing the Linux images on SBC of TurtleBot. The instruction takes about 1 hour to install ROS and related packages for TurtleBot3.
2. For Linux distro image installation based on Raspbian, read `Install Linux (Raspbian)` guide. You do not have to do additional installations as the distro image contains ROS and ROS packages related to TurtleBot3.  
3. For webOS Robotics Platform, read `webOS Robotics Platform` guide. You do not need to compile packages on TurtleBot3. They will be cross-compiled using OpenEmbedded on a higher performance PC, Ubuntu 18.04 based and an image file created from them.
{% endcapture %}
<div class="notice--info">{{ info_01 | markdownify }}</div>

{% capture info_02 %}
**NOTE**: Raspberry Pi 3 B+ is available in TurtleBot3 Burger and Waffle Pi. If you use Raspberry Pi 3 B+, please refer to the following.
{% endcapture %}
<div class="notice--info">{{ info_02 | markdownify }}</div>

  1. [Install Linux (Ubuntu MATE)][install_linux_ubuntu_mate]

  2. [Install Linux (Raspbian)][install_linux_based_on_raspbian]

  3. [Install Linux (webOS Robotics Platform)](https://github.com/ros/meta-ros/wiki/OpenEmbedded-Build-Instructions)

### [Intel Joule 570x](#intel-joule-570x)

  - [Install Linux (Ubuntu)][install_ubuntu]

[install_linux_ubuntu_mate]: /docs/en/platform/turtlebot3/raspberry_pi_3_setup/#install-linux-ubuntu-mate
[install_linux_based_on_raspbian]: /docs/en/platform/turtlebot3/raspberry_pi_3_setup/#install-linux-based-on-raspbian
[install_ubuntu]: /docs/en/platform/turtlebot3/joule_setup/#install-linux-ubuntu

### [[Windows] Windows 10 SBC](#windows-windows-10-sbc)

**NOTE**: ROS on Windows was brought up using [Up2](https://up-board.org/upsquared/specifications/) and an `Intel Nuc`.
{: .notice--warning}

1. You can download a trial of Windows 10 IoT Enterprise Long Term Service (LTSC) from the following link:
   - [Download Windwos 10 IoT Enterprise LTSC(Trial)][windows_download_link]

   [windows_download_link]: https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise

2. Please refer to the [ROS Wiki instructions](https://wiki.ros.org/Installation/Windows) for installing ROS on Windows.
3. Please install the [CP2102 Driver from SI Labs](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers) in order to communicate with the Lidar.

Before starting to work with turtlebot3 with a Windows 10 Single Board Computer, you'll need to identify which COM port the lidar and OpenCR board are mounted on. To do this, visit the Windows Device Manager - which you can access by right clicking on the Start Menu icon, and selecting `Device Manager` and locate the COM port associated with the Lidar and OpenCR board.

Then modify the following files:

`turtlebot3_bringup/launch/turtlebot3_core-win.launch`
``` xml
<node pkg="rosserial_python" type="serial_node.py" name="turtlebot3_core" output="screen">
    <param name="port" value="COMx"/>
```

`turtlebot3_bringup/launch/turtlebot3_lidar-win.launch`
``` xml
 <node pkg="hls_lfcd_lds_driver" type="hlds_laser_publisher" name="turtlebot3_lds" output="screen">
    <param name="port" value="COMy"/>
```





