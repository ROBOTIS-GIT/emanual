---
layout: archive
lang: en
ref: openmanipulator_opencr_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/opencr_setup/
sidebar:
  title: OpenManipulator X-Series
  nav: "openmanipulator"
---

<div style="counter-reset: h1 9"></div>

# [[OpenCR] Setup](#opencr-setup)

OpenManipulator is compatible with **OpenCR**. We offer API to easily control manipulator.
This API supports Dynamixel, Dynamixel X including protocol 1.0 and 2.0. Furthermore, this code can be used for Friends of OpenManipulator.
User can make thier code in **Arduino IDE** and simulate or control using **Processing** GUI.

<iframe width="560" height="315" src="https://www.youtube.com/embed/fT1Wv6qHknI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**NOTE**: OpenManipulator controller with OpenCR does not use ROS
The way OpenManipulator is controlled by OpenCR (embedded system) and ROS is completely different. In the method using ROS, the controller runs in PC, but in OpenCR control, the controller runs in OpenCR without ROS.
{: .notice--info}

## [Connection](#connection)

Connect micro USB (connected to PC), Dynamixel(OpenManipulator), and 12V Power to OpenCR as shown below.

<img src="/assets/images/platform/openmanipulator/OpenManipulator_opencr_setup.png" width="500">

<img src="/assets/images/platform/openmanipulator/OpenManipulator_opencr_setup2.png" width="800">

**NOTE** : Please refer the detailed description of [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice}

## [Arduino IDE Setup](#arduino-ide-setup)

**NOTE**: Please refer to [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide) for detailed setting method.
{: .notice--info}

### [Install on Linux](#install-on-linux)

#### [Install Arduino IDE(Linux)](#install-arduino-idelinux)
Download the latest version of Arduino IDE from the official arduino homepage, and install it. Currently, the OpenCR will be on service in the version 1.6.4 or later.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

Then, extract the downloaded file to the desired folder and execute the installation file from the terminal. In this case, the example shown below makes the folder tools in the user’s top folder (~/). This folder will act as the Arduino IDE folder.

```bash
$ cd ~/tools/arduino-1.6.4
$ ./install.sh
```

Set the file path of installed Arduino IDE as an absolute path named PATH in the bashrc file. Here recommends to use gedit editor. (Use another editor, if necessary.) Finally, source it to apply the changes.

```bash
$ gedit ~/.bashrc
$ export PATH=$PATH:$HOME/tools/arduino-1.6.4
$ source ~/.bashrc
```

#### [Run Arduino IDE(Linux)](#run-arduino-idelinux)
To run the Arduino IDE on Linux platform, type into the terminal as follows.

```bash
$ arduino
```

![](/assets/images/platform/turtlebot3/preparation/ide0.png)

#### [Porting to Arduino IDE(Linux)](#porting-to-arduino-idelinux)

##### Preferences
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

![](/assets/images/platform/turtlebot3/preparation/ide1.png)

##### Install the OpenCR package via Boards Manager
Click Tools → Board → Boards Manager.

![](/assets/images/platform/turtlebot3/preparation/ide2.png)

Type OpenCR into the textbox to find the OpenCR by ROBOTIS package. After it finds out, click Install.

![](/assets/images/platform/turtlebot3/preparation/ide3.png)

After the installation, “INSTALLED” will be appeared.

![](/assets/images/platform/turtlebot3/preparation/ide4.png)

See if OpenCR Board is now on the list of Tools → Board. Click this to import the OpenCR Board source.

![](/assets/images/platform/turtlebot3/preparation/ide5.png)

##### Port setting
This step shows the port setting for the program uploads. The OpenCR should be connected to the PC and the OpenCR via the USB ports.

Select Tools → Port → /dev/ttyACM0.

**WARNING** : The last digit value `0` in the string `/dev/ttyACM0` might be different depend on the USB connection environment.
{: .notice--warning}

![](/assets/images/platform/turtlebot3/preparation/ide6.png)

**NOTE**: Please refer to [Arduino IDE for using OpenCR(linux)](/docs/en/parts/controller/opencr10/#install-on-linux) for detailed setting method.
{: .notice--info}

### [Install on Mac](#install-on-mac)

#### [Install Arduino IDE(Mac)](#install-arduino-idemac)

Download the latest version of Arduino IDE from the official arduino homepage, and install it. Currently, the OpenCR will be on service in the version 1.6.4 or later.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

#### [Run Arduino IDE(Mac)](#run-arduino-idemac)

To run the Arduino IDE on Mac platform, click the Arduino IDE icon as follows.

![](/assets/images/parts/controller/opencr10/arduino_mac_01.png)

![](/assets/images/parts/controller/opencr10/arduino_mac_02.png)

#### [Porting to Arduino IDE(Mac)](#porting-to-arduino-idemac)

##### Preferences
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

![](/assets/images/parts/controller/opencr10/arduino_mac_03.png)

##### Install the OpenCR package via Boards Manager
Click Tools → Board → Boards Manager.

![](/assets/images/parts/controller/opencr10/arduino_mac_04.png)

Type OpenCR into the textbox to find the OpenCR by ROBOTIS package. Install of the OpenCR package.  
After the installation, “INSTALLED” will be appeared.

See if OpenCR Board is now on the list of Tools → Board. Click this to import the OpenCR Board source.

![](/assets/images/parts/controller/opencr10/arduino_mac_05.png)

##### Port setting
This step shows the port setting for the program uploads. The OpenCR should be connected to the PC and the OpenCR via the USB ports.  
Select Tools → Port → /dev/cu.usbmodem1411

**CAUTION** : The value of `/dev/cu.usbmodem1411` may be different depending on the environment connected to the PC.
{: .notice--warning}

![](/assets/images/parts/controller/opencr10/arduino_mac_06.png)

#### [Writing Bootloader(Mac)](#writing-bootloadermac)
The STM32F7xx, which is used for the main MCU on the OpenCR board, supports DFU(Device Firmware Upgrade). This enables the built-in bootloader of the MCU by itself to boot the DFU protocol by using USB, primarily for the bootloader initialization, the recovery mode, and the bootloader update. The biggest advantage to let the users be able to use bootloader with USB but no other JTAG equipment. Write the firmware by using the DFU mode which is embedded in MCU without writing / debugging equipment, such as STLink.

##### Programmer Setting

Select Tools → DFU-UTIL

![](/assets/images/parts/controller/opencr10/arduino_mac_07.png)

##### Run DFU Mode
Press the `Reset Button` while the `Boot Button` is being pushed. This activates the DFU mode.

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

**NOTE**: Please refer to [Arduino IDE for using OpenCR(mac)](/docs/en/parts/controller/opencr10/#install-on-mac) for detailed setting method.
{: .notice--info}

### [Install on Windows](#install-on-windows)

#### [Install Arduino IDE(Windows)](#install-arduino-idewindows)

Download the latest version of Arduino IDE from the official arduino homepage, and install it. Currently, the OpenCR will be on service in the version 1.6.4 or later.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

The Arduino IDE for Windows is available as an installation version and a compressed version, so you can install it using your preferred method.

#### [Porting to Arduino IDE(Windows)](#porting-to-arduino-idewindows)

##### Preferences
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

##### Install the OpenCR package via Boards Manager
1. Click Tools → Board → Boards Manager.
2. Type OpenCR into the textbox to find the OpenCR by ROBOTIS package. After it finds out, click Install.
3. After the installation, “INSTALLED” will be appeared.
4. See if OpenCR Board is now on the list of Tools → Board. Click this to import the OpenCR Board source.

##### Port setting
This step shows the port setting for the program uploads. The OpenCR should be connected to the PC and the OpenCR via the USB ports.  
Select Tools → Port → COM1.

**CAUTION** : The value of `COM1` may be different depending on the environment connected to the PC.
{: .notice--warning}

**NOTE**: Please refer to [Arduino IDE for using OpenCR(windows)](/docs/en/parts/controller/opencr10/#install-on-windows) for detailed setting method.
{: .notice--info}



[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR Manual]: /docs/en/parts/controller/opencr10/
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/

[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[open_manipulator_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_msgs_SetActuatorState/
[open_manipulator_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_msgs_SetDrawingTrajectory/

[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/
[open_manipulator_msgs/OpenManipulatorState]: /docs/en/popup/open_manipulator_msgs_OpenManipulatorState/
[std_msgs::String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
