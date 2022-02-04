---
layout: archive
lang: en
ref: compatible_devices
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/compatible_devices/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 33
---

<div style="counter-reset: h1 13"></div>
<div style="counter-reset: h2 1"></div>

<!--[dummy Header 1]>
  <h1 id="setup"><a href="#setup">Setup</a></h1>
<![end dummy Header 1]-->

## [Compatible Devices](#compatible-devices)

- If you want to use other products instead of Computer and Sensors included in the basic configuration, please refer to the this page.

### [Computer](#computer)

- TurtleBot3's main computer is `Raspberry Pi 3` (TurtleBot3 Burger and Waffle Pi) and `Intel Joule 570x` (TurtleBot3 Waffle). These SBCs (Single Board Computer) are enough to use the basic features of TurtleBot3, but users need to increase CPU performance, use GPU, or add RAM size for other purposes. This section describes how to replace the SBC.

- There are various types of SBC as shown in the following figure. The specification of each SBC is different. But if you can install Linux and ROS on the SBC you want to use, you can use that SBC as the main computer for TurtleBot3. In addition to SBC, [Intel NUC][intel_nuc], mini PC and small notebooks are available.

![](/assets/images/platform/turtlebot3/setup/sbcs.png)

- The TurtleBot3 development team has tested several SBCs. Here is a list of SBCs we tested:
  - [Raspberry Pi 3][raspberry_pi_3]
  - [Intel Joule 570x][intel_joule_570x]
  - [DragonBoard 410c][dragonboard_410c]
  - [NVIDIA Jetson TX2][nvidia_Jetson_tx2]
  - [UP Board][up_board]
  - [UP Core][up_core]
  - [LattePanda][lattepanda]
  - [ODROID-XU4][odroid_xu4]

#### Hardware assembly

- Most of the SBCs can be assembled without problems using `PCB support`, which is built in TurtleBot3. For reference, you can purchase additional parts such as PCB support ([link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3284&GC=GD070003)), download [files](http://www.robotis.com/service/download.php?no=676) shared with Onshape, and print them using a 3D printer.

![](/assets/images/platform/turtlebot3/setup/pcb_support.png)

- You can fix SBC on the waffle-plate of TurtleBot3 using the PCB support in the fixing hole of the SBC to be used as shown in the following figure.

![](/assets/images/platform/turtlebot3/setup/pcb_support_and_sbc.png)

#### Power supply

- Hardware assembly of the SBC is simple. But the power supply is not simple. You need to modify the existing power cable or make a new power cable to match the `power cable` of the computer you are going to use.

- As a basic part of TurtleBot3, the following `power cable` is provided. The left figure is for Raspberry Pi and the right figure is for Intel Joule 570x. The power cable must be made to match the power specifications of the computer you are using. [OpenCR][open_cr] has both a 5V (4A) power and a 12V (1A) power, which are commonly used in SBCs.

![](/assets/images/platform/turtlebot3/setup/power_cable.png)

- The power source for the SBC is the three connectors on the left in the [OpenCR][open_cr] pinmap below.

![](/assets/images/parts/controller/opencr10/opencr_pinout.png)


### [Sensors](#sensors)

- `TurtleBot3 Burger` uses enhanced [360° LiDAR][lds], [9-Axis Inertial Measurement Unit][imu] and [precise encoder][dynamixel] for your research and development. `TurtleBot3 Waffle` is equipped with an identical 360° LiDAR as well but additionally proposes a powerful [Intel® RealSense™][realsense] with the recognition SDK. `TurtleBot3 Waffle Pi` uses high utilized [Raspberry Pi Camera][raspi_cam]. This will be the best hardware solution for making a mobile robot.

- If you use an additional sensor, you can use it after attaching the sensor to the robot. The ROS provides a development environment in which drivers and libraries of the aforementioned sensors can be used. Not all sensors are supported by ROS package, but more and more sensor related packages are increasing. 

![](/assets/images/platform/turtlebot3/setup/sensors.png)

- If you are looking for a new sensor, check out [Sensors page][sensors] of ROS Wiki to find the sensor and related ROS packages you want.

- If you are using an analog sensor connected to the embedded board, you can use it with OpenCR. If you need to use an analog sensor other than USB or Ethernet communication, refer to [Additional Sensors][additional_sensors] page. 


[raspberry_pi_3]: https://www.raspberrypi.org/products/
[intel_joule_570x]: https://ark.intel.com/products/96414/Intel-Joule-570x-Developer-Kit
[dragonboard_410c]: https://developer.qualcomm.com/hardware/dragonboard-410c
[nvidia_Jetson_tx2]: https://developer.nvidia.com/embedded/buy/jetson-tx2-devkit
[up_board]: http://www.up-board.org/up/
[up_core]: http://www.up-board.org/upcore/
[lattepanda]: https://www.lattepanda.com/
[odroid_xu4]: http://www.hardkernel.com/
[intel_nuc]: https://www.intel.com/content/www/us/en/products/boards-kits/nuc.html

[open_cr]: /docs/en/parts/controller/opencr10/
[lds]: /docs/en/platform/turtlebot3/appendix_lds_01/
[imu]: /docs/en/platform/turtlebot3/appendix_opencr1_0/#specifications
[dynamixel]: /docs/en/platform/turtlebot3/appendix_dynamixel/
[realsense]: /docs/en/platform/turtlebot3/appendix_realsense/
[raspi_cam]: /docs/en/platform/turtlebot3/appendix_raspi_cam/
[sensors]: http://wiki.ros.org/Sensors
[additional_sensors]: /docs/en/platform/turtlebot3/additional_sensors/
