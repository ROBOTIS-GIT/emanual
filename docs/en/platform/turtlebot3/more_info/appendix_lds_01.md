---
layout: archive
lang: en
ref: appendix_lds_01
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/appendix_lds_01/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 29
---

<div style="counter-reset: h1 13"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h3 2"></div>

<!--[dummy Header 1]>
  <h1 id="appendixes"><a href="#appendixes">Appendixes</a></h1>
<![end dummy Header 1]-->

### [LDS-01](#appendix-lds01)

#### [Overview](#overview)

![](/assets/images/platform/turtlebot3/appendix_lds/lds.png)

- 360 Laser Distance Sensor LDS-01 is a 2D laser scanner capable of sensing 360 degrees that collects a set of data around the robot to use for SLAM (Simultaneous Localization and Mapping) and Navigation.
- The LDS-01 is used for TurtleBot3 Burger, Waffle and Waffle Pi models.
- It supports USB interface([USB2LDS]) and is easy to install on a PC.
- It supports UART interface for embedded baord.

#### [Introduction Video](#introduction-video)

[Video #01] How to use the LDS-01

- Contents
  1. Specification
  1. ROS
  1. Windows, Linux, macOS
  1. Embedded Board
  1. SLAM and Navigation
  1. Self-Parking
  1. 3D Sensing
  1. for Makers

<iframe width="640" height="360" src="https://www.youtube.com/embed/wmZQoTdtioY" frameborder="0" allowfullscreen></iframe>

[Video #02] Laser Distance Sensor (LDS) Example.

<iframe width="640" height="360" src="https://www.youtube.com/embed/9oic8aT3wIc" frameborder="0" allowfullscreen></iframe>

[Video #03] ROS Hector SLAM demo using only a 360 Laser Distance Sensor LDS-01 made by HLDS (Hitachi-LG Data Storage).

<iframe width="640" height="360" src="https://www.youtube.com/embed/s7CflpA6TOo" frameborder="0" allowfullscreen></iframe>

[Video #04] ROS Gmapping and Cartographer SLAM demo using TurtleBot3 and 360 Laser Distance Sensor LDS-01.

<iframe width="640" height="360" src="https://www.youtube.com/embed/lkW4-dG2BCY" frameborder="0" allowfullscreen></iframe>

#### [Specifications](#specifications)

##### [General Specifications](#general-specifications)

| Items                    | Specifications                                                     |
|:-------------------------|:-------------------------------------------------------------------|
| Operating supply voltage | 5V DC ±5%                                                          |
| Light source             | Semiconductor Laser Diode(λ=785nm)                                 |
| LASER safety             | IEC60825-1 Class 1                                                 |
| Current consumption      | 400mA or less (Rush current 1A)                                    |
| Detection distance       | 120mm ~ 3,500mm                                                    |
| Interface                | 3.3V USART (230,400 bps) 42bytes per 6 degrees, Full Duplex option |
| Ambient Light Resistance | 10,000 lux or less                                                 |
| Sampling Rate            | 1.8kHz                                                             |
| Dimensions               | 69.5(W) X 95.5(D) X 39.5(H)mm                                      |
| Mass                     | Under 125g                                                         |

##### [Measurement Performance Specifications](#measurement-performance-specifications)

| Items                               | Specifications |
|:------------------------------------|:---------------|
| Distance Range                      | 120 ~ 3,500mm  |
| Distance Accuracy (120mm ~ 499mm)   | ±15mm          |
| Distance Accuracy(500mm ~ 3,500mm)  | ±5.0%          |
| Distance Precision(120mm ~ 499mm)   | ±10mm          |
| Distance Precision(500mm ~ 3,500mm) | ±3.5%          |
| Scan Rate                           | 300±10 rpm     |
| Angular Range                       | 360°           |
| Angular Resolution                  | 1°             |

#### [Detail Specification Document](#detail-specification-document)

The following link contains information about basic performance, measurement performance, mechanism layout, optical path, data information, pin description and commands.

Here is the detail specification document : [PDF](/assets/docs/LDS_Basic_Specification.pdf)

**NOTE**: The 360 Laser Distance Sensor LDS-01 for TurtleBot3 uses molex 51021-0800 and 53048-0810 instead of the basic housing and connector.
{: .notice--info}

- [Connector for LDS] [Molex 51021-0800](http://www.molex.com/pdm_docs/sd/510210800_sd.pdf)
- [Connector for USB2LDS] [Molex 53048-0810](http://www.molex.com/pdm_docs/sd/530480810_sd.pdf)

#### [LDS for TurtleBot3](#lds-for-turtlebot3)

The LDS-01 is used for TurtleBot3 Burger, Waffle and Waffle Pi models.

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_models.png)


#### [User Guide (for ROS)](#user-guide-for-ros)

We are offering [ROS package for LSD](http://wiki.ros.org/hls_lfcd_lds_driver). The hls_lfcd_lds_driver package provides a driver for **HLS(Hitachi-LG Sensor) LFCD LDS(Laser Distance Sensor)**.

**NOTE**: Due to firmware update (after buy it on Oct. 2017), the sensor is running directly when power in on.
{: .notice--info}

#### Installation

``` bash
$ sudo apt-get install ros-kinetic-hls-lfcd-lds-driver
```

#### Set Permission for LDS-01

``` bash
$ sudo chmod a+rw /dev/ttyUSB0
```

#### Run hlds_laser_publisher Node

``` bash
$ roslaunch hls_lfcd_lds_driver hlds_laser.launch
```

#### Run hlds_laser_publisher Node with RViz

``` bash
$ roslaunch hls_lfcd_lds_driver view_hlds_laser.launch
```

#### [User Guide (for Driver)](#user-guide-for-driver)

- In addition to ROS, the LDS-01 supports Windows, Linux, and MacOS development environments for general purposes.
- The software requirement is:
  - GCC (for Linux and macOS), MinGW (for Windows)
  - Boost library (Lib for boost system, tested on v1.66.0)

##### Download

- Download the LDS-01's driver

``` bash
$ git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
```

- Or you can download directly on web browser at github repository below:
  - [https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver](https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver)

- Install dependent software and libraries for each development environment
  - GCC (for Linux and macOS), [MinGW](https://sourceforge.net/projects/mingw/files/) (for Windows)
  - [Boost library](http://www.boost.org/users/download/)

##### Build

- The makefile used here is set for Linux. Windows and macOS should be changed according to their development environment.

``` bash
$ cd hls_lfcd_lds_driver/applications/lds_driver/
$ make
```

##### Run

- You can see the raw data in the terminal when you run the driver of LDS-01. Please check the source code for details.

``` bash
$ ./lds_driver
r[359]=0.438000,r[358]=0.385000,r[357]=0.379000,...
```

#### [User Guide (for GUI)](#user-guide-for-gui)

- We provide a basic GUI tool for visually checking the data of the LDS-01.
- It supports Linux, Windows, and macOS.
- The software requirement is:
  - Qt Creator and Libs (tested on Qt Creator v4.5.0 and Qt Libs v5.10.0)
  - GCC (for Linux and macOS), MinGW (for Windows), This can be installed together while installing Qt.
  - Boost library (Lib for boost system, tested on v1.66.0)

##### Download

- Download the LDS-01's driver and GUI source code.

``` bash
$ git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
```

- Or you can download directly on web browser at github repository below:
  - [https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver](https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver)

- Install dependent software and libraries for each development environment
  - [Qt - Open Source Version](https://www.qt.io/download)
  - GCC (for Linux and macOS), [MinGW](https://sourceforge.net/projects/mingw/files/) (for Windows)
  - [Boost library](http://www.boost.org/users/download/)

##### Build

- Run the Qt Creator
- Open file (`Ctrl`-`O`) the `lds_polar_graph.pro` file (hls_lfcd_lds_driver/applications/lds_polar_graph/lds_polar_graph.pro)
- Change the [input your portname](https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver/blob/cf866c6b80060ab9270a664d665d287afcca2c10/applications/lds_polar_graph/lds_polar_graph.cpp#L47) of source code
- Build all (`Ctrl`-`Shift`-`B`)

##### Run

- Run the application (`Ctrl`-`R`)

![](/assets/images/platform/turtlebot3/appendix_lds/lds_gui.png)

#### [User Guide (for Embedded Board)](#user-guide-for-embedded-board)

- We provide a way to connect to an embedded board.
- The data of the LDS-01 can be used on the embedded board like OpenCR and Arduino. Please refer to below instructions.

##### Preparations
- The LDS-01 in TurtleBot3 package comes with the interface board, but you can also connect the sensor to the power and UART pins of embedded boards.

![](/assets/images/platform/turtlebot3/appendix_lds/lds_lines.png)

**WARNNING** : The wiring colours of LDS-01 could differ from the picture by manaufacturers. 
{: .notice--warning}

- OpenCR develops and downloads firmware through the Arduino IDE. Therefore, you must install the Arduino IDE in advance and install the OpenCR board package. Install through the following link document.

  - [Install Arduino IDE and OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/#arduino-ide)

##### Download firmware and run

1. After connecting USB to PC, select `Tools` -> `Board` -> `OpenCR Board` in Arduino IDE.
1. Change `Tools`-> `Port` to the port to which the board is connected.
1. In the Arduino IDE Examples, select the firmware for LDS (`File` -> `Examples` -> `OpenCR` -> `Etc` -> `LDS` -> `drawLDS`).
1. Click `Upload` icon in the Arduino IDE that displays the red circle to build and download the firmware. When the download is completed, the firmware is automatically executed.

<iframe width="640" height="360" src="https://www.youtube.com/embed/7wKyW6yLNSg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

#### [Certifications](#certifications)
Please inquire us for information regarding unlisted certifications.

##### [FCC](#fcc)
{% include en/dxl/fcc_class_b.md %}

[USB2LDS]: /docs/en/platform/turtlebot3/appendix_lds_01/#user-guide-for-embedded-board
