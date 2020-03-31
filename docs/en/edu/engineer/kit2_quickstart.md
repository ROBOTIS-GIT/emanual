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
---

# [Quick Start](#quick-start)

## [App Installation](#app-installation)

To install apps, see [App Installation](/docs/en/edu/engineer/kit1/#app-installation)

## [Download Examples](#download-examples)
- CM-550 controller is initially programmed with Kit1 example.  
- The `Complete Example` includes `Dr.R`, `MAX-E1`, `SPI` examples.

|     Example      |                                  Task Files                                   |                                 Motion Files                                  |
|:----------------:|:-----------------------------------------------------------------------------:|:-----------------------------------------------------------------------------:|
| Complete Example | [01_ENG1_TOTAL_EN.tsk3](http://www.robotis.com/service/download.php?no=1779)  | [01_ENG1_TOTAL_EN.mtn3](http://www.robotis.com/service/download.php?no=1787)  |
|       Dr.R       |  [02_ENG1_DR_R_EN.tsk3](http://www.robotis.com/service/download.php?no=1780)  |  [02_ENG1_DR_R_EN.mtn3](http://www.robotis.com/service/download.php?no=1788)  |
|      MAX-E1      | [03_ENG1_MAX_E1_EN.tsk3](http://www.robotis.com/service/download.php?no=1781) | [03_ENG1_MAX_E1_EN.mtn3](http://www.robotis.com/service/download.php?no=1789) |
|       SPI        |  [04_ENG1_SPI_EN.tsk3](http://www.robotis.com/service/download.php?no=1782)   |  [04_ENG1_SPI_EN.mtn3](http://www.robotis.com/service/download.php?no=1790)   |


| 추가 예제  |                                 태스크 파일                                  |                                 모션 파일                                 |
|:-----------|:----------------------------------------------------------------------------:|:-------------------------------------------------------------------------:|
| 종합 예제  | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1779 ) | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1787) |
| 추가 예제1 | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1780)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1788) |
| 추가 예제2 | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1781)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1789) |
| 추가 예제3 | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1782)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1790) |

### [Download from PC](#download-from-pc)

1. [How to Connect CM-550 Controller to PC]{: .popup}
2. [How to Download Task Example via PC]{: .popup}
3. [How to Download Motion Example via PC]{: .popup}

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
`Reset Example` : Reset selected examples.  
`Range of Gesture Error Setting` : Configure the error margin of the gesture.  
`Display Example Image on Gallery` : Show example images in the smart device gallery.  
`Scanning Media` : Refresh the smart device files/folders when not detected from PC.  
`Version Information` : Display the current app version.  

## [Pairing Bluetooth](#pairing-bluetooth)

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

#### Mode Menu

|                           Icon                           | Description                                                                                                                      |
|:--------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------|
|  ![](/assets/images/edu/engineer/kit2/icon_remote.png)   | **REMOTE**<br> Control and change MAX-E2 to various modes as FIGHT/ SOCCER/ etc.                                                 |
| ![](/assets/images/edu/engineer/kit2/icon_streaming.png) | **STREAMING**<br>Control the robot by watching videos taken from Raspberry Pi camera on your smart device and selecting buttons. |
|   ![](/assets/images/edu/engineer/kit1/icon_face.png)    | **FACE**<br>Certain motions as greetings is available by face detection using Raspberry PI camera.                               |

#### Options

|                         Icon                          | Description                                                                  |
|:-----------------------------------------------------:|:-----------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_motor.png)  | **MOTOR**<br> Check the motor operation of the robot.                        |
| ![](/assets/images/edu/engineer/kit1/icon_offset.png) | **OFFSET**<br> Alter the DYNAMIXEL's position value, posture of robots, etc. |

![](/assets/images/edu/engineer/kit2/kit2_motor_inspection_layout.png)
> MOTOR Inspection

![](/assets/images/edu/engineer/kit2/kit2_offset_layout.png)
> Adjusting OFFSET  

**NOTE** : See [Setting Up the Robot](#setting-up-the-robot) to change configuration data of motors and its offset.     
{: .notice--info}

### [Commando](#commando)

Run `ROBOTIS ENGINEER` Kit2 App and select **Commando**.

#### [Demo Screen](#demo-screen) 

![](/assets/images/edu/engineer/kit2/commando_demo.png)

`Menu Button` : Selecting Demo/ Control/ Streaming/ Robot inspection modes.  
`Mode Button` :
- `LINE MODE` identifies the colors of the lines by Raspberry Pi Camera and moves accordingly. Line colors can be choosen from `COLOR SELECTION`.
- `MARKER MODE` uses Raspberry Pi Camera to identify markers in order then by `START MARKER` the robot moves accordingly. `DEBUGGING MODE` identifies motions by loading time and [RUN MODE]
connects motions without loading time.

{% capture commando_notice %}
**NOTE**: 
- For more details how to use **Streaming** feature, see [Setting Video Streaming on ROBOTIS ENGINEER App](/docs/en/edu/engineer/kit2_reference/#setting-video-streaming-on-robotis-engineer-app).
- Marker should be 30 cm away from the camera to be identified.
{% endcapture %}
<div class="notice">{{ commando_notice | markdownify }}</div>

#### [Mode Menu](#mode-menu)

![](/assets/images/edu/engineer/kit1/icon_remote.png)

**REMOTE**: Controlling and ordering motions, directions, cameras, etc. Selecting **WHEEL SPEED** is to change the speed of the robot.

![](/assets/images/edu/engineer/kit2/commando_control.png)
> Commando REMOTE Mode Screen

### [Scorpi](#scorpi)

Run `ROBOTIS ENGINEER` Kit2 App and select **Scorpi**.

#### [Demo Screen](#demo-screen)  

![](/assets/images/edu/engineer/kit2/scorpi_demo.png)

`Menu Button` : Control/ Gesture/ Deme/ Robot inspection mode.  
`Mode Button` :
  - `NORMAL MODE` Scorpi Robot stands up and moves, and when [DMS-80](/docs/en/edu/engineer/kit2_introduction/#dms-80) detects objects, it attacks with it's tail.  
  - `GUARD MODE`Scorpi robot is on guard pose, and when [DMS-80](/docs/en/edu/engineer/kit2_introduction/#dms-80) detects objects, it attacks with it's tail.

#### [Mode Menu](#mode-menu)

|                         아이콘                         | 메뉴 설명                                                                                                                                                                                                              |
|:------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png)  | **REMOTE** <br>Control Scorpi's moves, directions, speed, and various motions with the tail and the claws.                                                                                                             |
| ![](/assets/images/edu/engineer/kit2/icon_gesture.png) | **GESTURE** <br>After running the gesture mode, hold the screen of the smart device upwards. In this state, tilt the device to move the robot. If you shake the device strongly, the robot attacks by moving its tail. |

![](/assets/images/edu/engineer/kit2/scorpi_control.png)  
  > Scorpi REMOTE Mode Screen

![](/assets/images/edu/engineer/kit2/scorpi_gesture.png)  
  > GESTURE Mode Screen  

## [Setting Up the Robot](#setting-up-the-robot)

### [Check DYNAMIXEL Assembly](#check-dynamixel-assembly)
This function checks DYNAMIXEL ID and status of the ROBOTIS ENGINEER Kit2.  

The way of checking DYNAMIXEL assembly is the same as ENGINEER KIT 1's. Refer to ENGINEER kit1's [DYNAMIXEL Assembly](/docs/en/edu/engineer/kit2_quickstart/#quick-start) manual.

### [DYNAMIXEL Offset](#dynamixel-offset)
This function is used to adjust the pose of the robot by calibrating offset values of the DYNAMIXEL used in the ROBOTIS ENGINEER KIT.  
Configured offset value will be saved on each DYNAMIXEL.  
Please perform an offset adjustment with a thorough understanding as it may be the cause of unstable motions or hardware damages when improperly configured.  

The way of configurating its value is the same as ENGINEER KIT 1's. Refer to ENGINEER kit1's [DYNAMIXEL Offset](/docs/en/edu/engineer/kit2_quickstart/#dynamixel-offset) manual. 

# [Study Materials](#study-materials)

{% capture edu_application %}
Additional course materials can be downloaded from below link.

- [**Request Additional Course Materials**](http://en.robotis.com/pdf_project/register.php)
{% endcapture %}
<div class="notice--info">{{ edu_application | markdownify }}</div>

![](/assets/images/edu/engineer/kit1/engineer_edu_metarials.png)

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
