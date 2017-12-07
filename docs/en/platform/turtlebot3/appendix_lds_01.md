---
layout: archive
lang: en
ref: turtlebot3_appendix_lds_01
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/appendix_lds_01/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 18">
</div>

# [Appendix #LDS-01](#appendix-lds01)

![](/assets/images/platform/turtlebot3/appendix_lds/lds.png)

## [Overview](#overview)

360 Laser Distance Sensor LDS-01 is used for both TurtleBot3 Burger and TurtleBot3 Waffle. The LDS-01(LASER Distance Sensor) is a sensor which collects a set of distance data and send them to the host for the Simultaneous Localization and Mapping (SLAM) technique.

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/9oic8aT3wIc" frameborder="0" allowfullscreen></iframe>
</figure>

## [Specifications](#specifications)

### [General Specifications](#general-specifications)

| Items                    | Specifications                                                     |
|--------------------------|--------------------------------------------------------------------|
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

### [Measurement Performance Specifications](#measurement-performance-specifications)

| Items                              | Specifications|
|------------------------------------|---------------|
| Distance Range                     | 120 ~ 3,500mm |
| Distance Accuracy (120mm ~ 499mm)  | ±15mm         |
| Distance Accuracy(500mm ~ 3,500mm) | ±5.0%         |
| Distance Precision(120mm ~ 499mm)  | ±10mm         |
| Distance Precision(500mm ~ 3,500mm)| ±3.5%         |
| Scan Rate                          | 300±10 rpm    |
| Angular Range                      | 360°          |
| Angular Resolution                 | 1°            |

## [Detail Specification Document](#detail-specification-document)

The following link contains information about basic performance, measurement performance, mechanism layout, optical path, data information, pin description and commands.

Here is the detail specification document : [pdf](/assets/docs/LDS_Basic_Specification.pdf)

**Note :** The 360 Laser Distance Sensor LDS-01 for TurtleBot3 uses molex 51021-0800 and 53048-0810 instead of the basic housing and connector.
{: .notice--info}

- [for LDS] Molex 51021-0800 (http://www.molex.com/pdm_docs/sd/510210800_sd.pdf)
- [for USB2LDS] Molex 53048-0810  (http://www.molex.com/pdm_docs/sd/530480810_sd.pdf)



## [LDS for TurtleBot3](#lds-for-turtlebot3)

The 360 Laser Distance Sensor LDS-01 is used for both TurtleBot3 Burger and TurtleBot3 Waffle.

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_models.png)

## [Introduction Video](#introduction-video)

ROS Hector SLAM demo using only a 360 Laser Distance Sensor LDS-01 made by HLDS (Hitachi-LG Data Storage).

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/s7CflpA6TOo" frameborder="0" allowfullscreen></iframe>
</figure>

ROS Gmapping and Cartographer SLAM demo using TurtleBot3 and 360 Laser Distance Sensor LDS-01.

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/lkW4-dG2BCY" frameborder="0" allowfullscreen></iframe>
</figure>

## [User Guide](#user-guide)

We are offering [ROS package for LSD](http://wiki.ros.org/hls_lfcd_lds_driver). The hls_lfcd_lds_driver package provides a driver for "HLS(Hitachi-LG Sensor) LFCD LDS(Laser Distance Sensor)".

**Note :** Due to firmware update (after buy it on Oct. 2017), the sensor is running directly when power in on.
{: .notice--info}

### [Installation](#installation)

``` bash
  sudo apt-get install ros-kinetic-hls-lfcd-lds-driver
```

### [Set Permission for HLS-LFCD LDS](#set-permission-for-hlslfcd-lds)

``` bash
  sudo chmod a+rw /dev/ttyUSB0
```

### [Run hlds_laser_publisher Node](#run-hldslaserpublisher-node)

``` bash
  roslaunch hls_lfcd_lds_driver hlds_laser.launch
```

### [Run hlds_laser_publisher Node with RViz](#run-hldslaserpublisher-node-with-rviz)

``` bash
  roslaunch hls_lfcd_lds_driver view_hlds_laser.launch
```
