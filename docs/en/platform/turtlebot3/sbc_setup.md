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

### [Raspberry Pi 3](#raspberry-pi-3)

{% capture info_01 %}
**NOTE**: There are three ways to install Linux and ROS to Raspberry Pi 3. 
- First method: If you prefer Ubuntu MATE, please take the first method `Install Linux (Ubuntu MATE)` below. This method should install the ROS and dependency packages after installing the Linux images. This instruction takes about 1 hours to install ROS and related packages for TurtleBot3.
- Second method: We provide the Linux distro image based on Raspbian. They are pre-installed with ROS and ROS-packages related TurtleBot3. It is available immediately without additional installation. If you want to use it, please take the second method `Install Linux (Raspbian)` below. 
- Third method: If you want to use the `webOS Robotics Platform`, please refer to the `Install Linux (webOS Robotics Platform)` below. When using webOS Robotics Platform, there is no need to compile packages natively on the TurtleBot 3. Instead, they are cross-compiled using OpenEmbedded on a higher performing PC running Ubuntu 18.04 and an image file created from them.
{% endcapture %}
<div class="notice--info">{{ info_01 | markdownify }}</div>

{% capture info_02 %}
**NOTE**: Raspberry Pi 3 B+ is available in TurtleBot3 Burger and Waffle Pi. If you use Raspberry Pi 3 B+, please refer to the following.
- For Ubuntu MATE, it does not support the Raspberry Pi B+. So the first method described above can not be used. Instead, we recommend using a second method `Install Linux based on Raspbian` below.
{% endcapture %}
<div class="notice--info">{{ info_02 | markdownify }}</div>

  - [1. Install Linux (Ubuntu MATE)][install_linux_ubuntu_mate]

  - [2. Install Linux (Raspbian)][install_linux_based_on_raspbian]

  - [3. Install Linux (webOS Robotics Platform)](https://github.com/ros/meta-ros/wiki/OpenEmbedded-Build-Instructions)

### [Intel Joule 570x](#intel-joule-570x)

  - [Install Linux (Ubuntu)][install_ubuntu]

[install_linux_ubuntu_mate]: /docs/en/platform/turtlebot3/raspberry_pi_3_setup/#install-linux-ubuntu-mate
[install_linux_based_on_raspbian]: /docs/en/platform/turtlebot3/raspberry_pi_3_setup/#install-linux-based-on-raspbian
[install_ubuntu]: /docs/en/platform/turtlebot3/joule_setup/#install-linux-ubuntu
