---
layout: archive
lang: en
ref: kit2
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/engineer/kit2_quickstart/
sidebar:
  title: ENGINEER Kit2
  nav: "kit2"
product_group: kit2
page_number: 2
---

<div style="counter-reset: h1 1"></div>

# [Quick Start](#quick-start)

## [App Installation](#app-installation)

The ENGINEER KIT2 shares R+Task 3.0 and ENGIEER app with the ENGINEER KIT 1. If these app and software are not installed on your PC or a smart device, see [App Installation](/docs/en/edu/engineer/kit1/#app-installation) and install the app and software.

## [Download Examples](#download-examples)
Download Kit2 Examples (.py and .mth) into the CM-550 controller. 
- CM-550 controller is initially programmed with Kit2 example (`MAX-E2`, `Commando`, `Scorpi`).  
- `AutoBot` and `Strider` are the additional examples which are not included in the controller with a factory status.
- In order to download examples into the controller using PC, see [Download from PC](#download-from-pc).
- In order to download examples into the controller using a smart device, see [Download from Smart Device](#download-from-smart-device).

| Examples                       | Python (.py)                                                                   | Motion (.mtn)                                                                   |
|:-------------------------------|:-------------------------------------------------------------------------------|:--------------------------------------------------------------------------------|
| MAX-E2                         | [01_ENG2_Max_E2_PY.py](https://www.robotis.com/service/download.php?no=1915)   | [01_ENG2_Max_E2_MO.mtn3](https://www.robotis.com/service/download.php?no=1916)  |
| Commando                       | [02_ENG2_Commando_PY.py](https://www.robotis.com/service/download.php?no=1917) | Only Python File is used                                                        |
| Scorpi                         | [03_ENG2_Scorpi_PY.py](https://www.robotis.com/service/download.php?no=1919)   | [03_ENG2_Scorpi_MO.mtn3](https://www.robotis.com/service/download.php?no=1918)  |
| AutoBot  (Additional Eaxmples) | [04_ENG2_Autobot_PY.py](https://www.robotis.com/service/download.php?no=1920)  | [04_ENG2_Autobot_MO.mtn3](https://www.robotis.com/service/download.php?no=1921) |
| Strider  (Additional Eaxmples) | [05_ENG2_Strider_PY.py](https://www.robotis.com/service/download.php?no=1922)  | Only Python File is used                                                        |

### [Download from PC](#download-from-pc)

1. [How to Connect CM-550 Controller to PC]{: .popup}
2. [How to Download Task Example via PC]{: .popup}
3. [How to Download Motion Example via PC]{: .popup}
4. [How to Download Python Example Source Code]{: .popup}

### [Download from Smart Device](#download-from-smart-device)

**NOTE** : Connect CM-550 with your smart device via bluetooth. See [Pairing Bluetooth](#pairing-bluetooth).
{: .notice}

1. [How to Connect CM-550 Controller to Mobile]{: .popup}
2. [How to Download Task Example via Mobile]{: .popup}
3. [How to Download Motion Example via Mobile]{: .popup}

## [Run Examples](#run-examples)

Launch the `R+ ENGINEER` app and select the assembled robot example to operate the robot.

![](/assets/images/edu/engineer/kit2/engineer2_app_execution.png)

**CAUTION** : Selecting wrong example may result in malfunction of the robot.
{: .notice--warning}

Select the menu button on the top right corner of the app for app configuration.

![](/assets/images/edu/engineer/kit1/engineer_app_configuration.png)

`Connect to Robot` : Select Bluetooth device to connect.  
`Reset Example` : Modified contents (including code / images) of selected examples will be deleted.  
`Range of Gesture Error Setting` : Set the sensitivity level of the gesture command.  
`Display Example Image on Gallery` : Some smart devices may not support this feature.  
`Scanning Media` : Update files and folders that are not recognized from the PC. Reconnect PC after the scan.  
`Version Information` : Display the current app version.  

### [Pairing Bluetooth](#pairing-bluetooth)

In order to control the robot remotely, connect your smart device via bluetooth to CM-550 controller. See [Pairing Bluetooth](/docs/en/edu/engineer/kit1/#pairing-bluetooth) of ENGINEER Kit 1.

![](/assets/images/edu/engineer/kit2/kit2_streaming_bluetooth.png)

### [MAX-E2](#max-e2)

Run `ROBOTIS ENGINEER` Kit2 App and select **MAX-E2**.

#### [Remote Controller Screen](#Remote-controller-screen)

![](/assets/images/edu/engineer/kit2/max2_controller.png)

`Menu button`: Control/ Streaming/ Facial Detection/ Robot Inspection Mode.  
`Control Buttons`: Control and change the speed of motions of MAX-E2.  
`Mode button`: NORMAL/ FIGHT/ SPECIAL modes.  
`Motion buttons`: Each relevant motions are set up to each control modes.  
`Function button`: All Torque set up/ Led board color change/ Robot stand-up/ etc.  

{% capture max_notice %}
**NOTE**: 
- Pressing TORQ ON/ OFF for an amount of time will reset and reboot all DYNAMIXEL
- For more details how to use **Streaming** feature, see [Setting Video Streaming on ROBOTIS ENGINEER App](/docs/en/edu/engineer/kit2_reference/#setting-video-streaming-on-robotis-engineer-app).
{% endcapture %}
<div class="notice">{{ max_notice | markdownify }}</div>

#### [MAX-E2 Mode Menu](#max-e2-mode-menu)

|                           Icon                           | Description                                                                                                                      |
|:--------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------|
|  ![](/assets/images/edu/engineer/kit2/icon_remote.png)   | **REMOTE**<br> Control and change MAX-E2 to various modes as FIGHT/ SOCCER/ etc.                                                 |
| ![](/assets/images/edu/engineer/kit2/icon_streaming.png) | **STREAMING**<br>Control the robot by watching videos taken from Raspberry Pi camera on your smart device and selecting buttons. |
|   ![](/assets/images/edu/engineer/kit1/icon_face.png)    | **FACE**<br>Certain motions as greetings is available by face detection using Raspberry PI camera.                               |

#### [MAX-E2 Options](#max-e2-options)

|                         Icon                          | Description                                                                  |
|:-----------------------------------------------------:|:-----------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_motor.png)  | **MOTOR**<br> Check the motor operation of the robot.                        |
| ![](/assets/images/edu/engineer/kit1/icon_offset.png) | **OFFSET**<br> Alter the DYNAMIXEL's position value, posture of robots, etc. |

![](/assets/images/edu/engineer/kit2/kit2_motor_inspection_layout.png)
> MOTOR Inspection

![](/assets/images/edu/engineer/kit2/kit2_offset_layout.png)
> OFFSET Adjustment  

**NOTE** : See [Setting Up the Robot](/docs/en/edu/engineer/kit2_reference/#setting-up-the-robot) to change configuration data of motors and its offset.     
{: .notice--info}

### [Commando](#commando)

Run `ROBOTIS ENGINEER` Kit2 App and select **Commando**.

#### [Commando Demo Screen](#commando-demo-screen) 

![](/assets/images/edu/engineer/kit2/commando_demo.png)

`Menu Button` : Selecting Demo/ Control/ Streaming/ Robot inspection modes.  
`Mode Button` : See the description below.
- `LINE MODE` identifies the colors of the lines by Raspberry Pi Camera and moves accordingly. Line colors can be choosen from `COLOR SELECTION`.
- `MARKER MODE` uses Raspberry Pi Camera to identify markers in order then by `START MARKER` the robot moves accordingly. `DEBUGGING MODE` identifies motions by loading time and `RUN MODE` connects motions without loading time.

{% capture commando_notice %}
**NOTE**: 
- For more details how to use **Streaming** feature, see [Setting Video Streaming on ROBOTIS ENGINEER App](/docs/en/edu/engineer/kit2_reference/#setting-video-streaming-on-robotis-engineer-app).
- Marker should be 30 cm away from the camera to be identified.
{% endcapture %}
<div class="notice">{{ commando_notice | markdownify }}</div>

#### [Commando Mode Menu](#commando-mode-menu)

![](/assets/images/edu/engineer/kit1/icon_remote.png)

**REMOTE**: Controlling and ordering motions, directions, cameras, etc. Selecting **WHEEL SPEED** is to change the speed of the robot on the REMOTE mode.

![](/assets/images/edu/engineer/kit2/commando_control.png)
> Commando REMOTE Mode Screen

### [Scorpi](#scorpi)

Run `ROBOTIS ENGINEER` Kit2 App and select **Scorpi**.

#### [Scorpi Demo Screen](#scorpi-demo-screen)  

![](/assets/images/edu/engineer/kit2/scorpi_demo.png)

`Menu Button` : Control/ Gesture/ Deme/ Robot inspection mode.  
`Mode Button` : See the description below.
  - `NORMAL MODE` Scorpi Robot stands up and moves, and when [DMS-80](/docs/en/edu/engineer/kit2_introduction/#dms-80) detects objects, it attacks with it's tail.  
  - `GUARD MODE` Scorpi robot is on guard pose, and when [DMS-80](/docs/en/edu/engineer/kit2_introduction/#dms-80) detects objects, it attacks with it's tail.

#### [Scorpi Mode Menu](#scorpi-mode-menu)

|                         아이콘                         | 메뉴 설명                                                                                                                                                                                                              |
|:------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png)  | **REMOTE** <br>Control Scorpi's moves, directions, speed, and various motions with the tail and the claws.                                                                                                             |
| ![](/assets/images/edu/engineer/kit2/icon_gesture.png) | **GESTURE** <br>After running the gesture mode, hold the screen of the smart device upwards. In this state, tilt the device to move the robot. If you shake the device strongly, the robot attacks by moving its tail. |

![](/assets/images/edu/engineer/kit2/scorpi_control.png)  
  > Scorpi REMOTE Mode Screen

![](/assets/images/edu/engineer/kit2/scorpi_gesture.png)  
  > GESTURE Mode Screen  

<!-- 
## [Setting Up the Robot](#setting-up-the-robot)

### [Check DYNAMIXEL Assembly](#check-dynamixel-assembly)
This function checks DYNAMIXEL ID and status of the ROBOTIS ENGINEER Kit2.  
- To check DYNAMIXEL assembly status, see the ENGINEER kit1's [DYNAMIXEL Assembly](/docs/en/edu/engineer/kit1/#quick-start) instruction.

### [DYNAMIXEL Offset](#dynamixel-offset)
This function is used to adjust the pose of the robot by calibrating offset values of the DYNAMIXEL used in the ROBOTIS ENGINEER KIT.  
Configured offset value will be saved on each DYNAMIXEL.  
Please perform an offset adjustment with a thorough understanding as it may be the cause of unstable motions or hardware damages when improperly configured.  
- To configure its value, see the ENGINEER kit1's [DYNAMIXEL Offset](/docs/en/edu/engineer/kit1/#dynamixel-offset) manual.
-   -->

[CM-550 eManual]: /docs/en/parts/controller/cm-550/
[2XL430-W250 eManual]: /docs/en/dxl/x/2xl430-w250/
[R+ Task 3.0]: /docs/en/software/rplustask3/
[R+ Task 2.0]: /docs/en/software/rplus2/task/
[R+ Motion 2.0]: /docs/en/software/rplus2/motion/
[Operating Mode]: /docs/en/parts/controller/cm-550/#operating-mode
[How to Connect CM-550 Controller to PC]: /docs/en/popup/engineer/connect_controller_pc
[How to Download Task Example via PC]: /docs/en/popup/engineer/task_download_pc
[How to Download Motion Example via PC]: /docs/en/popup/engineer/motion_download_pc
[How to Connect CM-550 Controller to Mobile]: /docs/en/popup/engineer/connect_controller_mobile
[How to Download Task Example via Mobile]: /docs/en/popup/engineer/task_download_mobile
[How to Download Motion Example via Mobile]: /docs/en/popup/engineer/motion_download_mobile
[How to download Python Example Source Code]: /docs/en/popup/engineer/python_download_pc
