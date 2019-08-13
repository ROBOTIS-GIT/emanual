---
layout: archive
lang: en
ref: rh_p12_rn_examples
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/rh_p12_rn/examples/
sidebar:
  title: RH-P12-RN
  nav: "rh_p12_rn"
product_group: rh_p12_rn
page_number: 2
---

<div style="counter-reset: h1 5"></div>

# [Examples](#examples)

## [Device Setup(RH-P12-RN)](#device-setuprh-p12-rn)

In order to run the example, RH-P12-RN should be set as belows.
* ID = 1
* Baudrate = 2 Mbps

To modify the control table values in Windows, [R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/) can be used.
In case of Linux, [DXL Monitor](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/sample_code/cpp_dxl_monitor/#cpp-dxl-monitor) in Dynamixel SDK example can be used to access control table.

## [Communication Port Setup](#communication-port-setup)
The Serial COM Port for Windows example is set as "**COM4**".  
Please change the Serial COM Port to COM4 in the Device Manager or modify the DEVICE_NAME in the example source code.  
In case of Linux example, the communication port is set as "**/dev/ttyUSB0**".  
If other communication port is used, the DEVICE_NAME in the example source code should be modified properly.

> RH-P12-RN_Example/rh-p12-rn.cpp

```cpp
...

#if defined(__linux__)
#define DEVICE_NAME             "/dev/ttyUSB0"
#elif defined(_WIN32) || defined(_WIN64)
#define DEVICE_NAME             "COM4"
#endif

...
```

## [Windows Example](#windows-example)

### Download
Download from [https://github.com/ROBOTIS-GIT/RH-P12-RN_Example](https://github.com/ROBOTIS-GIT/RH-P12-RN_Example) with GIT client software or directly download source code at [https://github.com/ROBOTIS-GIT/RH-P12-RN_Example/archive/master.zip](https://github.com/ROBOTIS-GIT/RH-P12-RN_Example/archive/master.zip) and decompress the zip file.

### Build and Run
Windows example is written on Visual Studio 2017.  
Install Visual Studio and open the solution with `RH-P12-RN_Example\win64\RH-P12-RN-Example.sln`. Then build solution and run.  

Below error message might appear due to the difference of Windows SDK version.

```
error MSB8036: The Windows SDK version 10.0.14393.0 was not found.  
Install the required version of Windows SDK or change the SDK version  
in the project property pages or by right-clicking the solution  
and selecting "Retarget solution".
```

In order to resolve the above error, open the property page from the project and select installed Windows SDK version, then rebuild the code.

![img](/assets/images/platform/rh_p12_rn/windows_sdk_ver_en.png)

Upon successful execution of the Windows example, the communication port and the baudrate of connected device are listed as shown in the below image.  
If execution fails, confirm the error message to configure the device or communication port properly.

![img](/assets/images/platform/rh_p12_rn/windows_example_execute.png)

If RH-P12-RN is configured as **Current-based Position Control Mode**, below image will be displayed.  

![img](/assets/images/platform/rh_p12_rn/windows_example_position_mode.png)

If RH-P12-RN is configured as **Current Control Mode**, below image will be displayed.  

![img](/assets/images/platform/rh_p12_rn/windows_example_current_mode.png)

* The Up/Down `Cursor` keys can be used to move the cursor in the menu.  
* `Space` key will check/uncheck options in the MODE / TORQUE / CONTROL menu.  
* Shortcut keys in the parenthesis can check/uncheck options.
* In order to change PARAMETERS value, `[` and `]` keys increase/decrease by 1 whereas `{` and `}` keys increase/decrease by 10.  

Each option is described as belows.

`++ MODE ++`
* (C) current control mode : Current Control Mode is used when checked
* (P) current based position control mode : Current-based Position Control Mode is used when checked

`++ TORQUE ++`
* (T) torque ON / OFF : Enable Torque when checked, Disable Torque when unchecked

`++ CONTROL ++`
* (O) Open : Open the gripper when checked, and check will be cleared automatically.
* (L) Close : Close the gripper when checked, and check will be cleared automatically.
* (A) Open & Close auto repeat : Repeat open and close motion when checked.
* (G) go to goal position : goal position in the PARAMETERS will be applied immediately when checked.

`++ PARAMETERS ++`
* goal current : Setting value will be written in the goal current address of the RH-P12-RN.
* goal velocity : Setting value will be written in the goal velocity address of the RH-P12-RN.
* goal acceleration : Setting value will be written in the goal acceleration address of the RH-P12-RN.
* goal position : Setting value will be written in the goal position address of the RH-P12-RN when **(G) go to goal position** is checked.


## [Linux Example](#linux-example)

### Preperation
Dynamixel SDK should be installed in advance. Please enter below commands to install Dynamixel SDK.

```
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK
$ cd DynamixelSDK/c++/build/linux64
$ sudo make install
```

Below command will register USER_ID to dialout group in order to gain access to /dev/ttyUSB0

```
$ sudo usermod -aG dialout USER_ID  
```

Restart or log out and log in to validate the change.

### Download
```
$ git clone https://github.com/ROBOTIS-GIT/RH-P12-RN_Example
```

### Build
```
$ cd RH-P12-RN_Example/linux64
$ make
```

### Run
```
$ ./rh-p12-rn_example
```

Upon successful execution of the Linux example, the communication port and the baudrate of connected device are listed as shown in the below image.  
If execution fails, confirm the error message to configure the device or communication port properly.  

![img](/assets/images/platform/rh_p12_rn/linux_example_execute.png)

If RH-P12-RN is configured as **Current-based Position Control Mode**, below image will be displayed.  

![img](/assets/images/platform/rh_p12_rn/linux_example_position_mode.png)

If RH-P12-RN is configured as **Current Control Mode**, below image will be displayed.  

![img](/assets/images/platform/rh_p12_rn/linux_example_current_mode.png)

Each option is identical to the [Windows Example]

## [ROS GUI Example](#ros-gui-example)

Create real-time scheduling priority (rtprio) for USER_GROUP (your user group)  
```
$ sudo bash –c ‘echo “@USER_GROUP – rtprio 99” > /etc/security/limits.d/robotis-rtprio.conf’
```

Below command will register USER_ID (your user ID) to dialout group in order to gain access to /dev/ttyUSB0

```
$ sudo usermod –aG dialout USER_ID
```

Restart or log out and log in to validate the change.

### Download
```
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs
$ git clone https://github.com/ROBOTIS-GIT/RH-P12-RN
```

### Build
```
$ cd ~/catkin_ws
$ catkin_make
```

### Run

Open the new terminal and run manager with below command.
```
$ roslaunch rh_p12_rn_manager rh_p12_rn_manager.launch
```

OPen the new terminal and run GUI example with below command.
```
$ rosrun rh_p12_rn_gui rh_p12_rn_gui
```

If RH-P12-RN is configured as **Current-based Position Control Mode**, below GUI window will be displayed.  

![img](/assets/images/platform/rh_p12_rn/ros_example_position_mode.png)

If RH-P12-RN is configured as **Current Control Mode**, below GUI window will be displayed.  

![img](/assets/images/platform/rh_p12_rn/ros_example_current_mode.png)

Each option is identical to the [Windows Example]

[Windows Example]: #windows-example
