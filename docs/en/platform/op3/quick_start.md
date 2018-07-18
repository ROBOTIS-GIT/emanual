---
layout: archive
lang: en
ref: op3_quick_start
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/quick_start/
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
---

<div style="counter-reset: h1 1"></div>

# [Quick Start](#quick-start)

## [Power On](#power-on)

The following procedure takes you through the set up process.

![](/assets/images/platform/op3/op3_010.png)

**WARNING** : Manually configuring ROBOTIS OP3’s ready pose other than the above pose may cause mechanical damages when posing for initial stance.
{: .notice--warning}

![](/assets/images/platform/op3/op3_011.png)

Connect the AC plug of the power adapter into a power outlet and plug the DC connector into ROBOTIS OP3’s DC jack.
The DC jack is located on the back panel of ROBOTIS OP3.

![](/assets/images/platform/op3/op3_012.png)

You can select either the DC power supply or battery pack to power ROBOTIS OP3.  
If you want to use the battery pack, please follow the below procedure.
1. Ensure the battery pack is fully charged.
2. Open the battery compartment door (unscrew the thumbscrew) and insert the battery pack.
3. Connect the battery cable to the battery power jack.
4. Close and secure the compartment door (screw the thumbscrew) afterwards.
5. Disconnect DC power supply.

**NOTE** : To prevent unexpected shutdown, ensure that ROBOTIS OP3 is connected with at least one active power source.
{: .notice}

![](/assets/images/platform/op3/op3_013.png)

Pushing the power switch to the right will power up the ROBOTIS OP3 (to the right : power on, to the left : power off)

Once Power is on, the following procedure will be sequentially executed.

![](/assets/images/platform/op3/op3_014.png)

## [Execute Demo Program](#execute-demo-program)

### [Running Demonstration Programs](#running-demonstration-programs)

ROBOTIS OP3 is loaded with the following pre-configured operation modes :
1. Demonstration-Ready Mode
2. Autonomous Soccer Mode
3. Vision Processing Mode
4. Interactive Motion Mode

Demonstration-Ready mode is set as a default mode when ROBOTIS OP3 is turned on.

Press `MODE` button to navigate the mode.  
ROBOTIS OP3 will verbally announce the selected mode when pressing the button.  
The indicating LED will also change its color to the corresponding operation mode.  

Press `START` button to run the selected mode.  
After pressing `START` ROBOTIS OP3 will stand up and begin operations.

![](/assets/images/platform/op3/op3_015.png)

{% capture op3_warning_01 %}
**RESET Button**
The `RESET` button only resets actuators and the OpenCR sub-controller, not the entire system. Please keep in mind that the demo program is still running in the main controller when `RESET` button is pressed.  
Pressing `RESET` button will disable torque on all actuator. It is highly recommended to set ROBOTIS OP3 for kneeling pose before pressing `RESET` button or hold ROBOTIS OP3 using its carrying handle.
{% endcapture %}

<div class="notice--warning">{{ op3_warning_01 | markdownify }}</div>

### [Demonstration Ready Mode](#demonstration-ready-mode)

The Demonstration-Ready mode is a default mode when ROBOTIS OP3 is turned on. LED 1 (red), LED 2 (green) and LED 3 (blue) will be lit.  
The chest LED will switch the color from red to green while ROBOTIS OP3 verbally announces "Demonstration-ready mode".  
Now ROBOTIS OP3 is ready for action!  
ROBOTIS OP3 stays in kneeling pose and does not move while in this mode.  
This is the most recommended mode to change the power source.

![](/assets/images/platform/op3/op3_016.png)

### [Autonomous Mode](#autonomous-mode)

ROBOTIS OP3 follows and kicks a red ball (user can change the color of ball) and plays soccer by itself.  
If ROBOTIS OP3 falls down (either on its back or belly) it will stand up and resume ball tracking, then pursuit.

- Start Autonomous Soccer Mode
  1. Press `MODE` button until LED1(red) is lit.  
    ROBOTIS OP3 will verbally announce “Autonomous soccer mode”.

      ![](/assets/images/platform/op3/op3_017.png)

  2. Press `START` button to begin.  
    ROBOTIS OP3 will stand up and walk around to find the ball.ROBOTIS-OP3 will verbally announce “Start soccer demonstration”

  3. When ROBOTIS OP3 sees a ball with the matching color, it will walk toward the ball.  
    If ROBOTIS OP3 gets close enough to the ball, ROBOTIS OP3 will kick the ball with one of its feet.  
    If ROBOTIS OP3 falls down during pursuit or kick, it will stand up and resume.

- Stop Autonomous Soccer Mode
  - Press `MODE` button until LED 3(blue) is lit. ROBOTIS OP3 will verbally announce “Interactive motion mode”.

### [Interactive Motion Mode](#interactive-motion-mode)

ROBOTIS OP3 performs pre-programmed motions sequentially while talking.

- Start Interactive Motion Mode
  1. Press `MODE` button until LED 3(blue) is lit. ROBOTIS OP3 will verbally announce “Interactive motion mode”.

      ![](/assets/images/platform/op3/op3_019.png)

  2. Press `START` button to begin. ROBOTIS OP3 will stand up and announce “Start motion demonstration”.
  3. ROBOTIS OP3 will perform following actions sequentially.

    ![](/assets/images/platform/op3/op3_020.png)

- Stop Interactive Motion Mode
  - If `MODE` button is pressed for at least 2 seconds, ROBOTIS-OP3 will return to demonstration-ready mode.

### [Vision Processing Mode](#vision-processing-mode)

The new vision processing demo for ROBOTIS OP3 is “Face detection and tracking”. ROBOTIS OP3 is developed with ROS.  
Therefore various ROS packages such as face detecting package can be applied for vision processing mode to track recognized face in front of the robot.  
Please refer the below website link.  
Face detecting : [https://github.com/phil333/face_detection]

- Start Vision Processing Mode
  1. Press `MODE` button until LED 2(green) is lit. ROBOTIS OP3 will verbally announce “Vision processing mode”.

      ![](/assets/images/platform/op3/op3_018.png)

  2. Press `START` button to begin. ROBOTIS OP3 will verbally announce “Start vision processing demonstration” and stand up.
  3. The target face should be located approximately 90cm(36”) away from ROBOTIS OP3.  
    If ROBOTIS OP3 detects the target face, chest LED will be lit in white whereas the LED will be off if ROBOTIS OP3 doesn’t detect the face.  
    ROBOTIS OP3 will keep track on the first recognized target face.

- Stop Vision Processing Mode
  - If `MODE` button is pressed for at least 2 seconds, ROBOTIS-OP3 will return to Demonstration-Ready mode.

- ETC
  - Modifying parameters of the ‘face_detection’ package might improve recognition of the face. Please refer to the following website for more details.
  - face_detection package : [https://github.com/ROBOTIS-GIT/face_detection]
  - usb_cam package : [http://wiki.ros.org/usb_cam]

## [Camera Calibration](#camera-calibration)

If ambient light of ROBOTIS OP3 is either too dim or too bright, user can adjust camera setting for optimizing acquired image from the camera.  
The color of the ball for soccer demo can also be modified from the setting.  
Please refer to the wiki manual from below link.  
[ROBOTIS OP3 Camera Setting]

## [Power Off](#power-off)

Please perform below procedures in order to shutdown the computer inside ROBOTIS OP3.

1. Press PC power button which is located on the bottom side of the chest. ROBOTIS OP3 will verbally announce “bye-bye” and initiate shutdown process.

    ![](/assets/images/platform/op3/op3_021.png)

    When the internal computer of ROBOTIS OP3 is turned off, blue LED at the chest will be off.  
    After the blue LED is turned off, shutdown the main power with the switch in the back of the robot.

2. If ROBOTIS OP3 does not announce “bye-bye” then you may need to force shutdown by holding the power button until the blue LED at the chest turns off.

  ![](/assets/images/platform/op3/op3_022.png)

**NOTE** : If power supply is cut off before the blue LED is turned off, ROBOTIS OP3 may have problems in the next startup.
{: .notice}


## [Programming Guide](#programming-guide)

### [Connect to OP3](#connect-to-op3)

From your computer go to Wi-Fi Setting and set to obtain an IP address automatically using DHCP.  
Then connect to ROBOTIS OP3 wifi network(SSID : ROBOTIS-OP3-share). Password is 11111111.

#### Example : SSH Client (for Windows)
- Execute SSH client program (ex: PuTTY)
- Input ROBOTIS OP3’s IP address: `10.42.0.1`
- Select `SSH` as a connection type and open the connection.
- Input ROBOTIS OP3’s user name : `robotis`
- Input ROBOTIS OP3’s Password : `111111`

![](/assets/images/platform/op3/op3_023.png)

#### Example: SSH Client (for Linux)
- Open the terminal window.
- Input the following SSH command with ROBOTIS OP3’s user name and IP address : `$ ssh robotis@10.42.0.1`
- Input ROBOTIS OP3’s Password : `111111`

![](/assets/images/platform/op3/op3_024.png)

#### Example: VNC client (for Windows)
- Users who are familiar to graphical interface may use remote desktop softwares.
- Execute VNC client program (ex: Ultra VNC Viewer)
- Input the ROBOTIS OP3’s IP address : `10.42.0.1`
- Input the ROBOTIS OP3’s Password : `111111`

![](/assets/images/platform/op3/op3_025.png)

### [Development Environment](#development-environment)

The following is the list of tools for source code development.
- OS : Linux (64-bit)
- Compiler : GNU project C and C++ Compiler, Catkin
- Programming Language : C++


### [Source Code](#source-code)

You may find the source code directory at `/robotis` from ROBOTIS OP3's PC.

![](/assets/images/platform/op3/op3_026.png)

The pre-installed source code may be updated without prior notice. Please check for updates periodically.
You may obtain updated source code from the below GitHub links :
- [https://github.com/ROBOTIS-GIT/DynamixelSDK]
- [https://github.com/ROBOTIS-GIT/ROBOTIS-Framework]
- [https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs]
- [https://github.com/ROBOTIS-GIT/ROBOTIS-Math]
- [https://github.com/ROBOTIS-GIT/ROBOTIS-OP3]
- [https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Common]
- [https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Demo]
- [https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-msgs]
- [https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools]
- [https://github.com/ROBOTIS-GIT/ROBOTIS-Utility]

### [Framework](#framework)

The following flow diagram represent class breakdown and data pipelines.  
You may modify the framework at “/home/robotis/catkin_ws/src/ROBOTIS-Framework”.  
For more information, please refer to the WIKI.  
[ROBOTIS Framework WIKI]

![](/assets/images/platform/op3/op3_027.png)

### [Software Utilities](#software-utilities)

User who wishes to customize or diagnose ROBOTIS OP3 should establish a connection with the robot via SSH or Remote Desktop(VNC).
The tools are located in the following directory :
home/robotis/catkin_ws/src/ROBOTIS-OP3/ROBOTIS-OP3-Tools

In the directory you can find code for :

![](/assets/images/platform/op3/op3_028.png)

### [Recovery Software](#recovery-software)

The supplied USB thumb drive contains the software pre-installed to ROBOTIS OP3.  
You may obtain updated software from the link below.  
[ROBOTIS OP3 Recovery]  
Software may be updated without prior notice. Please check for updates periodically.

### [Useful Information](#useful-information)

You can download other ROBOTIS OP3-related items and more detailed information from the wiki manual.  
[ROBOTIS OP3 Tutorial]  

- For any inquiries send us an email.
  - International : `contactus2@robotis.com`
  - Korea : `korea@robotis.com`

- Third party terminal client
  - PuTTY : [http://www.chiark.greenend.org.uk/~sgtatham/putty/]
  - RealVNC : [http://www.realvnc.com/]

## [Miscellaneous](#miscellaneous)

### [System Block Diagram](#system-block-diagram)

The below diagram illustrates the overall system structure of ROBOTIS OP3.

![](/assets/images/platform/op3/op3_029.png)

1. Main Controller is powered by Intel i3 dual-core(Intel NUC i3)
2. Sub Controller is powered by STMicroelectronics Cortex-M7 32F746GT6 (clocked at 216MHz).
3. Camera
  - 1080p Full HD movie recording
  - Carl Zeiss® optics with 20-step autofocus
  - Built-in dual stereo mics with noise reduction
  - H.264 video encoding

### [ID Map](#id-map)

The following diagram illustrates the default ID number of actuators in ROBOTIS OP3.

![](/assets/images/platform/op3/op3_030.png)

### [Warranty](#warranty)

**ROBOTIS OP3 includes the following warranty:**  

A. 90 days warranty against manufacture defects (RMA required) *

B. Local Maintenance Service (by local partner) : 1 years **
  - Re-installation of S/W and firmware
  - Replacement for cable/gear/screw (RMA required – exempt from faulty return)
  - Replacement for faulty frame/cover/actuator (RMA required)

C. Core System Maintenance Service (by ROBOTIS) : 1 years
  - Replacement for faulty PC/sub-boards (RMA required)
  - Maintenance for actuator/sub-boards (RMA required)
  - Maintenance for PC (RMA required, additional fee applies)

D. Parts replacement for malfunctions during normal operation for 1 years.

{% capture op2_warning_01 %}
\* Please download RMA (Return Material Authorization)([http://en.robotis.com/index/service_04.php?tab=4])  
No return shipping will be accepted without a RMA number issued by ROBOTIS.

\*\* Customers who require extended warranty period may purchase another "1 year warranty"
from ROBOTIS before their standard warranty period is over.
{% endcapture %}

<div class="notice--warning">{{ op2_warning_01 | markdownify }}</div>

**Important Notice:**  

1. Product registration is required for all customers. [http://support.robotis.com]

2. Parts replacement can only be done through RMA(Return Material Authorization) application.

3. After the initial 90 days, shipping fee is not covered under warranty.

4. Warranty does NOT cover ordinary wear/tear, any accident or damage caused by followings.
  - Physical damage equivalent to dropping the robot from 20cm or higher
  - Disabling system safety function (DYNAMIXEL Overload Shutdown)
  - Dangerous movement (jump, roll, fi ght) or excessive operation without rest
  - Any liquid or unauthorized chemical material to the robot
  - Unauthorized power or electric shock applied to the robot
  - Improvising core system programming area.

5. Direct check-up service  
  Evaluation, maintenance and quality assurance of assembled robot can be provided by ROBOTIS only.  
  RMA is required and additional fee may apply. Service will not be rendered for seriously customized hardware.

## [Sub Controller(OpenCR)](#sub-controlleropencr)

### [Control Table](#contrl-table)
Control Table consists of data regarding the current status and operation of OpenCR. The user can control OpenCR by changing data of Control Table via Instruction packet.

#### EEPROM and RAM
Data in RAM area is reset to initial values whenever the power is turned on while data in EEPROM area is kept once values are set even if the power is turned off.

#### Address
Represents the location of data. To read from or write data to the control table the user should assign the correct address in the Instruction packet.

#### Access
OpenCR has two kinds of data: Read-only data, used mainly for sensing, and read-and-write data used for driving.

#### Initial Value
In case of data in the EEPROM Area, the initial values on the right side of the below Control Table are the factory default settings.  
In case of data in the RAM Area, the initial values on the right side of the following control table are the ones when the power is turned on.

#### Highest/Lowest Byte
In the Control table, some data share the same name, but they are attached with (L) or (H) at the end of each name to distinguish the address. This data requires 16-bit, but it is divided into 8bit each for the addresses (low) and (high). These two addresses should be written with one Instruction Packet simutaneously.

### [EEPROM Area](#eeprom-area)

|  Address  |        Name         |        Description         | Access | Init Value |
|:---------:|:-------------------:|:--------------------------:|:------:|:----------:|
| 0 (0X00)  |   Model Number(L)   |   model number low byte    |   R    |  0(0X00)   |
| 1 (0X01)  |   Model Number(H)   |   model number high byte   |   R    | 116 (0X74) |
| 2 (0X02)  | Version of Firmware |      firmware version      |   R    |     -      |
| 3 (0X03)  |         ID          |          OpenCR ID         |   RW   | 200 (0XC8) |
| 4 (0X04)  |      Baud Rate      |  Communication baud rate   |   RW   |  1 (0X01)  |
| 5 (0X05)  |  Return Delay Time  |     Return Delay Time      |   RW   |  0 (0X0)   |
| 16 (0X10) | Status Return Level |    Status Return Level     |   RW   |  0 (0X00)  |


### [RAM Area](#ram-area)

|  Address  |      Name       |          Description           | Access | Init Value |
|:---------:|:---------------:|:------------------------------:|:------:|:----------:|
| 24 (0X18) | Dynamixel Power |        Dynamixel On/Off        |   RW   |  0 (0X00)  |
| 25 (0X19) |       LED       |       LED Pannel On/Off        |   RW   |  0 (0X00)  |
| 26 (0X1A) |   LED_RGB(L)    |         LED 5 low byte         |   RW   |  0 (0X00)  |
| 27 (0X1B) |   LED_RGB(H)    |        LED 5 high byte         |   RW   |  0 (0X00)  |
| 28 (0X1C) |    Buzzer(L)    |         LED 6 low byte         |   RW   |  0 (0X00)  |
| 29 (0X1D) |    Buzzer(H)    |        LED 6 high byte         |   RW   |  0 (0X00)  |
| 30 (0X1E) |     Button      |         Button status          |   R    |     -      |
| 31 (0X1F) |     Voltage     |         Power Voltage          |   R    |     -      |
| 32 (0X20) |    Gyro_Z(L)    |   Gyroscope Z-axis low byte    |   R    |     -      |
| 33 (0X21) |    Gyro_Z(H)    |   Gyroscope Z-axis high byte   |   R    |     -      |
| 34 (0X22) |    Gyro_Y(L)    |   Gyroscope Y-axis low byte    |   R    |     -      |
| 35 (0X23) |    Gyro_Y(H)    |   Gyroscope Y-axis high byte   |   R    |     -      |
| 36 (0X24) |    Gyro_X(L)    |   Gyroscope X-axis low byte    |   R    |     -      |
| 37 (0X25) |    Gyro_X(H)    |   Gyroscope X-axis high byte   |   R    |     -      |
| 38 (0X26) |    ACC_X(L)     | Accelerometer X-axis low byte  |   R    |     -      |
| 39 (0X27) |    ACC_X(H)     | Accelerometer X-axis high byte |   R    |     -      |
| 40 (0X28) |    ACC_Y(L)     | Accelerometer Y-axis low byte  |   R    |     -      |
| 41 (0X29) |    ACC_Y(H)     | Accelerometer Y-axis high byte |   R    |     -      |
| 42 (0X2A) |    ACC_Z(L)     | Accelerometer Z-axis low byte  |   R    |     -      |
| 43 (0X2B) |    ACC_Z(H)     | Accelerometer Z-axis high byte |   R    |     -      |
| 44 (0X2C) |     Roll(L)     |       IMU Roll low byte        |   R    |     -      |
| 45 (0X2D) |     Roll(H)     |       IMU Roll high byte       |   R    |     -      |
| 46 (0X2E) |    Pitch(L)     |       IMU Pitch low byte       |   R    |     -      |
| 47 (0X2F) |    Pitch(H)     |      IMU Pitch high byte       |   R    |     -      |
| 48 (0X30) |     Yaw(L)      |        IMU Yaw low byte        |   R    |     -      |
| 49 (0x31) |     Yaw(H)      |       IMU Yaw high byte        |   R    |     -      |
| 50 (0X32) |   IMU_Control   |          IMU Control           |   RW   |    0x00    |

### [Address Function Help](#address-function-help)

#### Model Number
Represents the Model Number.

#### Firmware Version
Represents the firmware version.

#### ID
Is a unique number to identify Dynamixel.  
Values range from 0 (0x00) to 252 (0xFC), Value 254 (0xFE) is used as the Broadcast ID.  
If the Broadcast ID is used to transmit Instruction Packet, then it can command to all Dynamixels.  

**NOTE** : Do NOT assign an identical ID for DYNAMIXELs in the same network.
{: .notice}

#### Baud Rate
Represents the communication speed. 0 (0x00) to 7 (0x07) can be used for it.

| Data |  Set BPS  | Target BPS | Tolerance |
|:----:|:---------:|:----------:|:---------:|
|  0   | 9,600      | 9,600       |  0.000 %  |
|  1   | 57,600     | 57,600      |  0.000 %  |
|  2   | 115,200    | 115,200     |  0.000 %  |
|  3   | 1,000,000   | 1,000,000    |  0.000 %  |
|  4   | 2,000,000   | 2,000,000    |  0.000 %  |
|  5   | 3,000,000   | 3,000,000    |  0.000 %  |
|  6   | 4,000,000   | 4,000,000    |  0.000 %  |
|  7   | 4,500,000   | 4,500,000    |  0.000 %  |

**NOTE** : Maximum Baud Rate error of 3% is within the tolerance of UART communication.
{: .notice}

#### Return Delay Time

Return Delay Time will set a timer to hold a Status Packet transmission for a received Instruction Packet.  
This data has a multiplier of 2μsec, therefore set value will be multiplied by 2 microseconds.  
For example, if Return Delay Time is set to 10, a Status Packet will be transmitted after 20 microseconds after receiving an Instruction Packet.  
Available data values range from 0 (0x00) to 254 (0xFE).

#### Status Return Level
Status Return Level decides whether to return a Status Packet or not for an Instruction Packet.  
There are three options as below table.  
If an Instruction Packet has a Broadcast ID, Status Packet will not be returned regardless of Status Return Level.

| Value |               Return of Status Packet                |
|:-----:|:----------------------------------------------------:|
|   0   | No return against all commands (Except PING Command) |
|   1   |           Return only for the READ command           |
|   2   |               Return for all commands                |

**NOTE** : When Instruction packet is Broadcast ID, Status packet is not returned regardless of Status return level.
{: .notice}

#### Dynamixel Power

| Value |                          Meaning                          |
|:-----:|:---------------------------------------------------------:|
|   0   | Turn off the power of all Dynamixels connected to OpenCR. |
|   1   | Turn on the power of all Dynamixels connected to OpenCR.  |

#### LED Pannel

|  BIT  | 7 ~ 3 |  2   |  1   |  0   |
|:-----:|:-----:|:----:|:----:|:----:|
| Value |   X   | LED3 | LED2 | LED1 |

For each set bit, corresponding LED will be turned on.  
For each reset bit, corresponding LED will be turned off.

#### LED_RGB

|  BIT  | 15 | 14 ~ 10 | 9 ~ 5 | 4 ~ 0 |
|:-----:|:--:|:-------:|:-----:|:-----:|
| Value | X  |  LED_B  | LED_G | LED_R |

Chest LED is a tricolor LED and the color can be represented with RGB values.

#### Buzzer

|   Value   |       Description       |
|:---------:|:-----------------------:|
| 0 ~ 65535 | Frequency(Hz) of Buzzer |

If the Buzzer value is set to 0, the buzzer will be turned off.

#### BUTTON STATUS

|  BIT  | 7 ~ 4 |     3     |     2     |     1     |     0     |
|:-----:|:-----:|:---------:|:---------:|:---------:|:---------:|
| Value |   X   | BUTTON_S4 | BUTTON_S3 | BUTTON_S2 | BUTTON_S1 |

For each bit set to 1, the button is being pressed.  
For each bit set to 0, the button is released.

#### VOLTAGE
This value stands for the input voltage of the controller with a multiplier of 10.  
For example, when 10V is supplied to the controller, the Voltage value will be 100.

#### GYRO X/Y/Z
The following image represents the direction of Gyro axis of OpenCR.

![](/assets/images/platform/op3/opencr_gyro_axis.png)

Each arrow represents the orientation of gyroscope axis.  
The data range is -2000dps ~ +2000dps.  
The following graph shows relation between actual data value and angular velocity value.

![](/assets/images/platform/op3/opencr_angular_velocity_graph.png)

#### Acceleration X/Y/Z
The following picture represents the direction of accelerometer axis of OpenCR.

![](/assets/images/platform/op3/opencr_acc_axis.png)

Each arrow represents the orientation of accelerometer axis.  
The data range is -2g ~ +2g.  
The following graph shows relation between actual data value and acceleration value.

![](/assets/images/platform/op3/opencr_acc_graph.png)

#### IMU_Control

This data controls roll / pitch / yaw offset values for the IMU sensor.

|  BIT  | 7 ~ 4 |  3   |  2  |   1   |  0   |
|:-----:|:-----:|:----:|:---:|:-----:|:----:|
| Value |   X   | Gyro | Yaw | Pitch | Roll |

For each bit set to 1, corresponding roll, pitch, yaw, gyro values will be used for calculating offset values.  
The calculation will take for 2 seconds and then each bit will be reset to 0.

### [GPIO Pin Assignments](#gpio-pin-assignments)

![](/assets/images/platform/op3/opencr_gpio_pinout.png)

|      Pin      |               Assignments               |
|:-------------:|:---------------------------------------:|
|   PIN_LED_R   |               Red LED pin               |
|   PIN_LED_G   |              Green LED pin              |
|   PIN_LED_B   |              Blue LED pin               |
|   PIN_LED_1   |              LED output 1               |
|   PIN_LED_2   |              LED output 2               |
|   PIN_LED_3   |              LED output 3               |
| PIN_BUTTON_S1 |             Button Input S1             |
| PIN_BUTTON_S2 |             Button Input S2             |
| PIN_BUTTON_S3 |             Button Input S3             |
| PIN_BUTTON_S4 | Button Input S4 (Reset Dynamixel Power) |


[https://github.com/phil333/face_detection]: https://github.com/phil333/face_detection
[https://github.com/ROBOTIS-GIT/face_detection]: https://github.com/ROBOTIS-GIT/face_detection
[http://wiki.ros.org/usb_cam]: http://wiki.ros.org/usb_cam
[ROBOTIS Framework WIKI]: http://emanual.robotis.com/docs/en/software/robotis_framework_packages/
[ROBOTIS OP3 WIKI]: http://emanual.robotis.com/docs/en/platform/op3/introduction/
[ROBOTIS OP3 Recovery]: http://emanual.robotis.com/docs/en/platform/op3/recovery/#recovery-of-robotis-op3
[ROBOTIS OP3 Tutorial]: emanual.robotis.com/docs/en/platform/op3/tutorials
[ROBOTIS OP3 Camera Setting]: http://emanual.robotis.com/docs/en/platform/op3/tutorials/#camera-setting-parameters
[https://github.com/ROBOTIS-GIT/DynamixelSDK]: https://github.com/ROBOTIS-GIT/DynamixelSDK
[https://github.com/ROBOTIS-GIT/ROBOTIS-Framework]: https://github.com/ROBOTIS-GIT/ROBOTIS-Framework
[https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs]: https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs
[https://github.com/ROBOTIS-GIT/ROBOTIS-Math]: https://github.com/ROBOTIS-GIT/ROBOTIS-Math
[https://github.com/ROBOTIS-GIT/ROBOTIS-OP3]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3
[https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Common]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Common
[https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Demo]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Demo
[https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-msgs]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-msgs
[https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools
[https://github.com/ROBOTIS-GIT/ROBOTIS-Utility]: https://github.com/ROBOTIS-GIT/ROBOTIS-Utility

[http://www.chiark.greenend.org.uk/~sgtatham/putty/]: http://www.chiark.greenend.org.uk/~sgtatham/putty/
[http://www.realvnc.com/]: http://www.realvnc.com/
[http://en.robotis.com/index/service_04.php?tab=4]: http://en.robotis.com/index/service_04.php?tab=4
[http://support.robotis.com]: http://support.robotis.com
