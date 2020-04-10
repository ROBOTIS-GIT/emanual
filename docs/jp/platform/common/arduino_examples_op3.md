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

*  [Install Arduino IDE and OpenCR]


## Download OP3 firmware
To update OpenCR's firmware, open the front cover of OP3 and connect USB to PC as shown below.


![](/assets/images/platform/op3/op3_opencr_01.png)

After connecting USB, select Tools-> Board-> OpenCR Board in Arduino IDE.

Change Tools-> Port to the port to which the board is connected.

In the Arduino IDE Examples, select the firmware for OP3.


![](/assets/images/platform/op3/op3_opencr_02.png)

Click on the icon in the Arduino IDE that displays the red circle in the following figure to build and download the firmware. When the download is completed, the firmware is automatically executed.

![](/assets/images/platform/op3/op3_opencr_03.png)

## Editing OP3 Firmware
The firmware that is provided as a basic example of OpenCR is read-only. If you want to edit it, you have to save it to a new folder and work on it.

First open the OP3 example.

![](/assets/images/platform/op3/op3_opencr_02.png)

Select File-> Save.


![](/assets/images/platform/op3/op3_opencr_04.png)
Since the example provided is Read-Only, select OK to save it as a new file.


![](/assets/images/platform/op3/op3_opencr_05.png)

Save it to a new folder and edit it. Once editing is complete, repeat the process of building and downloading the firmware.

![](/assets/images/platform/op3/op3_opencr_06.png)

[Install Arduino IDE and OpenCR]: /docs/en/platform/common/arduino_setup_linux/#arduino-setup-linux
