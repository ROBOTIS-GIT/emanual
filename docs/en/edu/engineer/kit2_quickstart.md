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

<!-- 
{% capture app_install %}
![](/assets/images/edu/engineer/kit1/icon_engineer_48.png)  
**R+ ENGINEER : [Android App Download](https://play.google.com/store/apps/details?id=com.robotis.robotisEngineer)**  

![](/assets/images/edu/engineer/kit1/icon_task_48.png)  
**R+ Task 3.0 : [Android App Download](https://play.google.com/store/apps/details?id=com.robotis.task3)**  
**R+ Task 3.0 : [Windows Installer Download](http://www.robotis.com/service/download.php?no=1774)**  
{% endcapture %}
<div class="notice--success">{{ app_install | markdownify }}</div> 
-->

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

![](/assets/images/edu/engineer/kit1/engineer_app_1.png)

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

#### [조종 화면](#조종-화면)

![](/assets/images/edu/engineer/kit2/max2_controller_kr.png)

`Menu button`: Control/ Streaming/ Facial Detection/ Robot Inspection Mode
`Control button`: Control and change the speed of motions of MAX-E2
`Mode button`: NORMAL/ FIGHT/ SPECIAL modes
`Motion buttons`: Each relevant motions are set up to each control modes
`Function button`: All Torque set up/ Led board color change/ Robot stand-up/ etc.


{% capture max_notice %}
**NOTE**: 
- Pressing TORQ ON/ OFF for an amount of time will reset and reboot all DYNAMIXEL
- For more detail how to use **Streaming** feature, see [Setting Video Streaming on ROBOTIS ENGINEER App](/docs/en/edu/engineer/kit2_reference/#setting-video-streaming-on-robotis-engineer-app).
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
> Motor Inspection

![](/assets/images/edu/engineer/kit2/kit2_offset_layout.png)
> Adjusting OFFSET  

**NOTE** : See [Setting Up the Robot](#setting-up-the-robot) to change configuration data of motors and its offset.     
{: .notice--info}

### [Commando](#commando)

`ROBOTIS ENGINEER` 앱을 실행하고, 화면에서 Commando를 선택하세요.

#### [데모 화면 소개](#데모-화면-소개)

![](/assets/images/edu/engineer/kit2/commando_demo.png)

`메뉴 버튼` : 데모 / 조종 / 스트리밍 / 로봇 점검 모드 등을 선택해 변경할 수 있습니다.  
`모드 버튼` : 전/후/좌/우 이동 및 속도 설정 버튼으로 로봇을 조종할 수 있습니다  
- `LINE MODE`를 선택하면 Raspberry Pi Camera를 사용해 설정된 색의 라인을 인식하고 이동합니다. `COLOR SELECTION`에서 인식할 라인 색을 선택합니다
- `MARKER MODE`를 선택하면 Raspberry Pi Camera를 사용해 마커를 순서대로 인식한 후 `START 마커`를 사용해 인식한 마커의 순서에 따라 명령대로 이동합니다. Marker Mode 에서 `DEBUGGING MODE`는 동작 사이에 지연 시간이 발생해 동작을 구분할 수 있습니다. `RUN MODE`는 지연시간 없이 동작과 동작을 연결해서 이동합니다. 

{% capture commando_notice %}
**참고**: 
- 스트리밍 사용방법은 [앱에서 영상 스트리밍 기능 설정하기](/docs/kr/edu/engineer/kit2_reference/#앱에서-영상-스트리밍-기능-설정하기) 참조하세요.
- 마커는 카메라에서 30 CM 이상 떨어진 거리에서 인식시켜야 인식이 잘됩니다.
{% endcapture %}
<div class="notice">{{ commando_notice | markdownify }}</div>

#### 옵션메뉴

|                        아이콘                         | 메뉴 설명                                                                                                                                                                                              |
|:-----------------------------------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png) | **REMOTE : 조종 모드** <br> Commando 로봇을 조종하는 모드이며 로봇의 이동 및 방향 전환, 카메라 등을 제어하는 명령을 사용할 수 있습니다.<br>WHEEL SPEED를 조정하면 로봇의 이동속도를 변경할 수 있습니다 |

### [Scorpi](#scorpi)

`ROBOTIS ENGINEER` 앱을 실행하고, 화면에서 Scorpi를 선택하세요.

#### [Scorpi 데모 화면 소개](#scorpi-데모-화면-소개)  

![](/assets/images/edu/engineer/kit2/scorpi_demo.png)

`메뉴 버튼` : 조종 / 제스처 / 데모 / 로봇 점검 모드 등을 선택할 수 있습니다.  
`모드 버튼` :
  - `NORMAL MODE`를 선택하면 Scorpi 로봇이 일어나 동작하고, 절대거리센서 [DMS-80](/docs/kr/edu/engineer/kit2_introduction/#절대-거리-센서)가 물체를 감지하면 꼬리로 공격합니다.
  - `GUARD MODE`를 선택하면 Scorpi 로봇이 제자리에서 경계 자세를 취하며, 절대거리센서 [DMS-80](/docs/kr/edu/engineer/kit2_introduction/#절대-거리-센서)에 물체가 감지되면 꼬리를 움직여 공격합니다.

#### [Scorpi 메뉴 기능 소개](#scorpi-메뉴-기능-소개)

|                         아이콘                         | 메뉴 설명                                                                                                                                                             |
|:------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png)  | **REMOTE : 조종 모드** <br>Scorpi 로봇을 조종하는 모드이며 로봇의 이동 및 방향 전환, 속도 변경과 로봇의 꼬리 및 집게를 사용하는 다양한 모션들을 동작시킬 수 있습니다. |
| ![](/assets/images/edu/engineer/kit2/icon_gesture.png) | **GESTURE : 제스처 모드** <br>스마트기기의 기울기, 흔들림 센서 등을 사용해 기기를 기울이거나 특정 동작을 통해 Scorpi 로봇의 이동 및 공격 등의 명령을 수행합니다.      |

![](/assets/images/edu/engineer/kit2/scorpi_control.png)  
  > 조종 모드 화면

![](/assets/images/edu/engineer/kit2/scorpi_gesture.png)  
  > 제스쳐 모드 화면  



<!-- 

### [Dr.R](#drr)

#### Emotion  
Selecting Dr.R example from R+ Engineer app will display robot face on the screen. Touch robot or trigger events to change the emotion of the robot with facial expressions, motions and speeches.

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_1.png)

#### Select Mode

Press the `Mode` button to display supported modes and options.

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_3.png)

##### Mode Menu

|                         Icon                          | Mode Description                                                                                                                                                                                                    |
|:-----------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  ![](/assets/images/edu/engineer/kit1/icon_demo.png)  | **DEMO : Emotion Recognition**<br>This default demo mode expresses Dr.R’s emotion on the smart device screen.<br>Touch the robot or smart device will affect to Dr.R’s emotion and behavior.                        |
|  ![](/assets/images/edu/engineer/kit1/icon_face.png)  | **FACE : Face Recognition**<br>The robot detects and tracks the face with the camera of the smart device.<br>AR technology will overlay an image on the detected face.                                              |
| ![](/assets/images/edu/engineer/kit1/icon_object.png) | **OBJECT : Object Recognition**<br>The robot recognizes machine learned objects with the smart device camera.<br>Dr.R can distinguish 12 different objects including banana, pen, car key, wallet, paper money etc. |
| ![](/assets/images/edu/engineer/kit1/icon_voice.png)  | **VOICE : Voice Recognition**<br>The robot recognizes registered voice commands.<br>Commands such as mode change, option menu execution, and termination are registered.                                            |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)  | **CLAP : Clap Detection**<br>The robot detects clapping sound with the controller microphone.<br>Dr.R will clap as many as perceived claps.                                                                         |

##### Option Menu

|                         Icon                          | Option Description                                                                                          |
|:-----------------------------------------------------:|:------------------------------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_motor.png)  | **MOTOR : DYNAMIXEL Inspection**<br>This feature inspects each joint of the robot.                          |
| ![](/assets/images/edu/engineer/kit1/icon_offset.png) | **OFFSET : Motion Offset**<br>This feature calibrates the offset position of each joint for proper motions. |

**NOTE** : The Option Menu is available in all examples. Please refer to [Setting Up the Robot](#setting-up-the-robot) for more details.
{: .notice--info}

### [MAX-E1](#max-e1)

#### Remote Controller Screen

![](/assets/images/edu/engineer/kit1/max_controller.png)

`Control Modes` : Select Normal / Fight / Soccer mode for MAX-E1.  
`Control Buttons` : Control robot’s motion speed and moving directions.  
`Motion Buttons` : Registered motions of MAX-E1 can be played.  
`Torque Button` : DYNAMIXEL Torque On/Off switch.  
`Menu Button` : Open additional menu for MAX-E1.  

#### Mode Menu

|                          Icon                          | Mode Description                                                                             |
|:------------------------------------------------------:|:---------------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png)  | **REMOTE** : Use smart device as a remote controller.                                        |
| ![](/assets/images/edu/engineer/kit1/icon_gesture.png) | **GESTURE** : Use registered gestures in the smart device to control the robot.              |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)   | **CLAP** : The robot detects clapping sound and MAX-E1 will clap as many as perceived claps. |

### [SPI](#spi)

#### Remote Controller Screen

![](/assets/images/edu/engineer/kit1/spi_controller.png)

`Control Buttons` : Control robot’s motion speed and moving directions.  
`Motion Buttons` : Registered motions of SPI can be played.  
`Torque Button` : DYNAMIXEL Torque On/Off switch.  
`Menu Button` : Open additional menu for SPI.  

#### Mode Menu

|                         Icon                          | Mode Description                                                                          |
|:-----------------------------------------------------:|:------------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png) | **REMOTE** : Use smart device as a remote controller.                                     |
| ![](/assets/images/edu/engineer/kit1/icon_music.png)  | **MUSIC** : SPI and smart device play music together.                                     |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)  | **CLAP** : The robot detects clapping sound and SPI will clap as many as perceived claps. |

 -->

## [Setting Up the Robot](#setting-up-the-robot)

### [Check DYNAMIXEL Assembly](#check-dynamixel-assembly)
This function checks DYNAMIXEL ID and status of the ROBOTIS ENGINEER Kit.

1.  Launch the robot example from the main screen, and select `MOTOR` from the option menu.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor.png)

2. Select the joint ID from the screen. Check if the selected joint flinches while LED is turned on.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_2.png)
 

### [DYNAMIXEL Offset](#dynamixel-offset)
This function is used to adjust the pose of robot by calibrating offset values of DYNAMIXEL used in the ROBOTIS ENGINEERING KIT. Configured offset value will be saved in each DYNAMIXEL's.  
Please perform offset adjustment with a thorough understanding as it may cause unstable motions or hardware damages when improperly configured.

1. Launch the robot example from the main screen, and select `OFFSET` from the option menu.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset.png)

2.  Select the joint ID to adjust offset from the screen and adjust menu will appear.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_2.png)

    - `+ / -` : Increase / Decrease the offset value.  
    - `Torque On / Off` : Toggle the torque of the selected joint.  
    - `OK / CANCEL` : Save / Cancel the changes in offset value.

3. Select `OK` to save the offset value. The confirmation message will appear.  
  Select `OK` once again to save the offset value to robot.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_3.png)

4. Below buttons will reset or reload offset values of each joint.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_4.png)

    - `Reset Offset` : When selected, the confirmation window will appear. Select [OK] to reset the offset value of all joint.  
    - `Initial Pose` : This button will reload the saved offset value. Incorrectly configured offset may be recovered with this button.

# [Study Materials](#study-materials)

{% capture edu_application %}
Additional course materials can be downloaded from below link.

- [**Request Additional Course Materials**](http://en.robotis.com/pdf_project/register.php)
{% endcapture %}
<div class="notice--info">{{ edu_application | markdownify }}</div>

![](/assets/images/edu/engineer/kit1/engineer_edu_metarials.png)

# [Download Softwares](#download-softwares)

- ROBOTIS ENGINEER supports [R+ Task 3.0].
- [R+ Task 3.0] is an integrated software of [R+ Task 2.0] and [R+ Motion 2.0].
- Write the task code to operate the robot.
- Create various motions to vitalize the robot.

<div class="notice--success">{{ app_install | markdownify }}</div>

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
