---
layout: archive
lang: en
ref: turtlebot3_appendix_opencr1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/appendix_opencr1_0/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 16"></div>

# [Appendix #OpenCR1.0](#appendix-opencr10)

![](/assets/images/platform/turtlebot3/appendix_opencr/opencr.png)

## [Overview](#overview)

`OpenCR1.0` is a main controller board of the TurtleBot3. OpenCR1.0; Open-source Control module for ROS, is developed for ROS embedded systems to provide completely open-source hardware and software. Everything about the board; Schematics, PCB Gerber, BOM and the firmware source code for the TurtleBot3 are free to distribute under open-source licenses for users and the ROS community.

The STM32F7 series is a main chip inside the OpenCR1.0 board which is based on a very powerful ARM Cortex-M7 with floating point unit. The development environment for OpenCR1.0 is wide open from Arduino IDE and Scratch for young students to traditional firmware development for the expert.

OpenCR1.0 provides digital and analog input/output pins that can interface with extension board or various sensors. Also, OpenCR1.0 features various communication interfaces: USB for connecting to PC, UART, SPI, I2C, CAN for other embedded devices.

OpenCR1.0 can provide a best solution when using with a SBC. It supports 12V, 5V, 3.3V power outputs for SBCs and sensors. It also supports hot swap power inputs between battery and SMPS.

OpenCR1.0 will be the best solution for implementing your embedded control design.


<iframe width="640" height="360" src="https://www.youtube.com/embed/-_kBfIS6wJs" frameborder="0" allowfullscreen></iframe>

## [Specification](#specification)

| Items                    | Specifications                                                                                     |
|--------------------------|----------------------------------------------------------------------------------------------------|
| Microcontroller          | STM32F746ZGT6 / 32-bit ARM Cortex®-M7 with  FPU (216MHz, 462DMIPS)                                 |
| Sensors                  | Gyroscope 3Axis, Accelerometer 3Axis, Magnetometer 3Axis (MPU9250)                                 |
| Programmer               | ARM Cortex 10pin JTAG/SWD connector<br />USB Device Firmware Upgrade (DFU)<br />Serial             |
| Extension pins           | 32 pins (L 14, R 18) *Arduino connectivity<br />Sensor module x 4 pins<br />Extension connector x 18 pins|
| Communication circuits   | USB (Micro-B USB connector/USB 2.0/Host/Peripheral/OTG)<br />TTL ([B3B-EH-A] / Dynamixel)<br />RS485 ([B4B-EH-A] / Dynamixel)<br />UART x 2 ([20010WS-04])<br />CAN ([20010WS-04])|
| LEDs and buttons         | LD2 (red/green) : USB communication<br />User LED x 4 : LD3 (red), LD4 (green), LD5 (blue)<br />User button  x 2|
| Powers                   | External input source<br />5 V (USB VBUS), 7-24 V (Battery or SMPS)<br />Default battery : LI-PO 11.1V 1,800mAh 19.98Wh<br />Default SMPS: 12V 5A<br />External output source<br />12V@1A([SMW250-02]), 5V@4A([5267-02A]), 3.3V@800mA([20010WS-02])<br />External battery Port for RTC (Real Time Clock) ([Molex 53047-0210])<br />Power LED: LD1 (red, 3.3 V power on)<br />Reset button x 1 (for power reset of board)<br />Power on/off switch x 1|
| Dimensions               | 105(W) X 75(D) mm                                                                                  |
| Mass                     | 60g                                                                                                |

`Note` Hot swap power switch between "shore power"(12V, 5A SMPS) and "mobile power"(battery) from OpenCR1.0 board enables UPS(Uninterrupted Power Supply) feature.
{: .notice}

## [User Guide](#user-guide)

### [Run serial_node package](#run-serialnode-package)

```bash
$ rosrun rosserial_python serial_node.py __name:=turtlebot3_core _port:=/dev/ttyACM0 _baud:=115200
```

### [Testing](#testing)

```bash
$ rostopic echo /imu

header:
  seq: 179
  stamp:
    secs: 1486448047
    nsecs: 147523921
  frame_id: imu_link
orientation:
  x: 0.0165222994983
  y: -0.0212152898312
  z: 0.276503056288
  w: 0.960632443428
orientation_covariance: [0.0024999999441206455, 0.0, 0.0, 0.0, 0.0024999999441206455, 0.0, 0.0, 0.0, 0.0024999999441206455]
angular_velocity:
  x: 2.0
  y: 1.0
  z: -1.0
angular_velocity_covariance: [0.019999999552965164, 0.0, 0.0, 0.0, 0.019999999552965164, 0.0, 0.0, 0.0, 0.019999999552965164]
linear_acceleration:
  x: 528.0
  y: 295.0
  z: 16648.0
linear_acceleration_covariance: [0.03999999910593033, 0.0, 0.0, 0.0, 0.03999999910593033, 0.0, 0.0, 0.0, 0.03999999910593033]
---
```

## [Open Source Software](#open-source-software)

You can modify the downloaded source code and share it with your friends.

- OpenCR1.0 Software: [https://github.com/ROBOTIS-GIT/OpenCR](https://github.com/ROBOTIS-GIT/OpenCR)

## [Open Source Hardware](#open-source-hardware)

If you want to manufacture your own OpenCR1.0, you can download necessary files such as PCB Gerber, BOM. When the board is ready firmware source code can be burned into the MCU.

- OpenCR1.0 Hardware: [https://github.com/ROBOTIS-GIT/OpenCR-Hardware](https://github.com/ROBOTIS-GIT/OpenCR-Hardware)

## [e-Manual](#e-manual)

- [OpenCR1.0 e-Manual]

[B3B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[B4B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[20010WS-04]: http://www.alldatasheet.com/datasheet-pdf/pdf/147797/YEONHO/20010WS-04000.html
[20010WS-04]: http://www.alldatasheet.com/datasheet-pdf/pdf/147797/YEONHO/20010WS-04000.html
[SMW250-02]: http://www.alldatasheet.com/datasheet-pdf/pdf/148144/YEONHO/SMW250-02P.html
[5267-02A]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0022035025_PCB_HEADERS.xml&channel=Products&Lang=en-US
[20010WS-02]: http://www.alldatasheet.com/datasheet-pdf/pdf/147795/YEONHO/20010WS-02000.html
[Molex 53047-0210]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0530470210_PCB_HEADERS.xml
[OpenCR1.0 e-Manual]: /docs/en/parts/controller/opencr10/
