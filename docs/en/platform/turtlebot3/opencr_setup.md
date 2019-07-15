---
layout: archive
lang: en
ref: opencr_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/opencr_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 2"></div>

<!--[dummy Header 1]>
  <h1 id="setup"><a href="#setup">Setup</a></h1>
<![end dummy Header 1]-->

## [OpenCR Setup](#opencr-setup)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

**NOTE**: If you want to get more detail about OpenCR, Please contact an [OpenCR WiKi][opencr]
{: .notice--info}

### [OpenCR Firmware Upload for TB3](#opencr-firmware-upload-for-tb3)

{% capture notice_01 %}
**NOTE**: You can choose one of methods for uploading firmware. But we highly recommend to use **shell script**. If you need to modify TurtleBot3's firmware, you can use the second method.
- Method #1: [**Shell Script**](#shell-script), upload the pre-built binary file using the shell script.
- Method #2: [**Arduino IDE**](#arduino-ide), build the provided source code and upload the generated binary file using the Arduino IDE.
{% endcapture %}

<div class="notice--info">{{ notice_01 | markdownify }}</div>

#### [(Recommended) Shell Script](#recommended-shell-script)
  
This instruction was tested on `Ubuntu 16.04`, `Ubuntu Mate`, `Linux Mint` and `Raspbian`. You can use the following command after connecting OpenCR to remote PC (your desktop or laptop PC) or connect OpenCR to your TurtleBot PC (`Intel® Joule™`, `Raspberry Pi 3`) and execute the following command.

- TurtleBot3 Burger

  ``` bash
  $ export OPENCR_PORT=/dev/ttyACM0
  $ export OPENCR_MODEL=burger
  $ rm -rf ./opencr_update.tar.bz2
  $ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2 && tar -xvf opencr_update.tar.bz2 && cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
  ```

  ![](/assets/images/platform/turtlebot3/opencr/shell01.png)

When firmware upload is completed, `jump_to_fw` text string will be printed on the terminal.

- TurtleBot3 Waffle or Waffle Pi

  ``` bash
  $ export OPENCR_PORT=/dev/ttyACM0
  $ export OPENCR_MODEL=waffle
  $ rm -rf ./opencr_update.tar.bz2
  $ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2 && tar -xvf opencr_update.tar.bz2 && cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
  ```

  ![](/assets/images/platform/turtlebot3/opencr/shell02.png)

When firmware upload is completed, `jump_to_fw` text string will be printed on the terminal.

#### [(Alternative)Arduino IDE](#alternative-arduino-ide)

**WARNING**: The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do **NOT** apply this instruction to your TurtleBot3.
{: .notice--warning}

Before you following step, please setup Arduino IDE on your remote PC.

  - [Install Arduino IDE for OpenCR][install_arduino_ide_for_opencr]

The OpenCR firmware for TurtleBot3 performs the task of controlling the Dynamixel or acquiring and transmitting the data of the sensors. The firmware is located in OpenCR example which is downloaded by the board manager.

If you have TurtleBot3 Burger,

**[Remote PC]** Go to `File` → `Examples` → `turtlebot3` → `turtlebot3_burger` → `turtlebot3_core`.

If you have TurtleBot3 Waffle or Waffle Pi,

**[Remote PC]** Go to `File` → `Examples` → `turtlebot3` → `turtlebot3_waffle` → `turtlebot3_core`.

![](/assets/images/platform/turtlebot3/opencr/o1.png)

**[Remote PC]** Click `Upload` button to upload the firmware to OpenCR.

![](/assets/images/platform/turtlebot3/opencr/o2.png)

![](/assets/images/platform/turtlebot3/opencr/o3.png)

**NOTE**: If error occurs while uploading firmware, go to `Tools` → `Port` and check if correct port is selected. Press `Reset` button on the OpenCR and try to upload the firmware again.
{: .notice--info}
  
**[Remote PC]** When firmware upload is completed, `jump_to_fw` text string will be printed on the screen.

### [Basic Operation](#basic-operation)

![](/assets/images/platform/turtlebot3/opencr/opencr_models.png)

You can use `PUSH SW 1` and `PUSH SW 2` buttons to see whether your robot has been properly assembled. This process tests the left and right DYNAMIXELs and the OpenCR board.

1. After assembling TurtleBot3, connect the battery to OpenCR and turn on the power switch. You can see that the `Power LED` of OpenCR turns on.
2. Place the robot on the floor. For the test, safety radius of 1 meter (about 40 inches) is recommended.
3. Press and hold `PUSH SW 1` for a few seconds to command the robot to move 30 centimeters (about 12 inches) forward.
4. Press and hold `PUSH SW 2` for a few seconds to command the robot to rotate 180 degrees in place.

[opencr]: /docs/en/parts/controller/opencr10/
[install_arduino_ide_for_opencr]: /docs/en/parts/controller/opencr10/#arduino-ide
