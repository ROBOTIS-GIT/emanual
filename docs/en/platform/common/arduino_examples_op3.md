---
layout: archive
lang: en
ref: common_arduino_examples_op3
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/common/arduino_examples_op3/
sidebar:
  title: Common
  nav: "common"
---


# [OPENCR OP3](#opencr-op3)

## Overview
OpenCR is used for power and sensor control in OP3, a humanoid robot. If the OpenCR firmware for OP3 has been changed, follow the procedure below to update it.

## Preparations
OpenCR develops and downloads firmware through the Arduino IDE. Therefore, you must install the Arduino IDE in advance and install the OpenCR board package. Install through the following link document.

*  [Install Arduino IDE and OpenCR](https://github.com/ROBOTIS-GIT/OpenCR/wiki/Arduino_Setup_Linux)


## Download OP3 firmware
To update OpenCR's firmware, open the front cover of OP3 and connect USB to PC as shown below.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/op3_01.png?raw=true)


After connecting USB, select Tools-> Board-> OpenCR Board in Arduino IDE.

![](http://turtlebot3.robotis.com/en/latest/_images/ide5.png)

Change Tools-> Port to the port to which the board is connected.

![](https://camo.githubusercontent.com/718a761491631c1b84dbcfd3c7d34bcedff8e94c/687474703a2f2f747572746c65626f74332e72656164746865646f63732e696f2f656e2f6c61746573742f5f696d616765732f696465362e706e67)

In the Arduino IDE Examples, select the firmware for OP3.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/op3_02.png?raw=true)

Click on the icon in the Arduino IDE that displays the red circle in the following figure to build and download the firmware. When the download is completed, the firmware is automatically executed.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/op3_03.png?raw=true)


## Editing OP3 Firmware
The firmware that is provided as a basic example of OpenCR is read-only. If you want to edit it, you have to save it to a new folder and work on it.

First open the OP3 example.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/op3_02.png?raw=true)


Select File-> Save.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/op3_05.PNG?raw=true)

Since the example provided is Read-Only, select OK to save it as a new file.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/op3_06.PNG?raw=true)

Save it to a new folder and edit it. Once editing is complete, repeat the process of building and downloading the firmware.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/op3_09.png?raw=true)
