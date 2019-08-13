---
layout: archive
lang: en
ref: kit1
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/engineer/kit1/
sidebar:
  title: ENGINEER Kit1
  nav: "kit1"
product_group: 2xl430-w250
---

# [Introduction](#introduction)

![](/assets/images/edu/engineer/kit1/enginner_main.png)

**ROBOTIS ENGINEER** is the next generation robot that adopts AI technology based on smart devices.  

- ROBOTIS ENGINEER Kit offers standardized curriculum for multi level robotics educational courses
- Joint structure allows diverse motions for versatile robots
- Supports 3D part designing and printing
- Compatible with R+ ENGINEER(Smart device app), R+ Task 3.0(PC software)
- Upgrade to Raspberry Pi and Camera


## [Part List](#part-list)

![](/assets/images/edu/engineer/kit1/parts_list.png)

### [CM-550 Controller](#cm-550-controller)

#### [Specifications](#specifications)

|         Item          |                                                                               Specifications                                                                                |
|:---------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|        Weight         |                                                                                  58.8 [g]                                                                                   |
|          MCU          |                                                                     ARM Cortex-M4 (168 [MHz], 32 [Bit])                                                                     |
|   Operating Voltage   | Battery : 6.5 ~ 15 [V], **Recommended 11.1 [V] (Li-PO 3cell)**<br />SMPS : 6.5 ~ 15 [V], **Recommended 12.0 [V]**<br />Micro USB : 4.75 ~ 5.25 [V], **Recommended 5.0 [V]** |
|  Current Consumption  |                              Standby : 50 [mA]<br />Port 1 ~ 2 I/O Max : 0.5 [A]<br />Port 3 ~ 5 I/O Max : 0.02 [A]<br />Total : 10 [A] (Fuse)                              |
| Operating Temperature |                                                                              -5 ~ 70 [&deg;C]                                                                               |
| Communication Module  |                                                                              BLE Slave Module                                                                               |
| Internal I/O Devices  |  Buttons : 2 (MODE, START)<br />Mic (Sound Detection) : 1<br />Buzzer : 1<br />Voltage Sensor : 1<br />Gyro Accelerometer : 1<br />Temperature Sensor : 1<br />RGB LED : 3  |
| External I/O Devices  |                    ROBOTIS 5 Pin Port : 5 (Servo Motor / IR Sensor / Temperature & Humidity Sensor : Use Port 1 or 2)<br />X series DYNAMIXEL Ports : 6                     |


#### [CM-550 Layout](#cm-550-layout)

![](/assets/images/edu/engineer/kit1/cm550_1.png)

![](/assets/images/edu/engineer/kit1/cm550_2_kr.png)

- `USB` Micro USB Port : The 5 pin micro USB cable can be used to connect to the USB port of the PC.
- `UART` Communication Port : BT-210, BT-410, LN-101, IR receiver or other communication modules can be connected.
- `BAT` Battery Socket : Provided Li-Po battery can be connected.
- `12VDC` DC Input : The DC barrel jack of provided SMPS can be connected.
- `POWER` Power Switch : Controls the power supply of the controller.
- Status LED : Displays voltage level and wireless device connection status with RGB LED.
- `MODE` MODE LED : This RGB LED displays the operating mode of CM-550. Please refer to the [Operating Mode] of CM-550.
- `START` START LED : Please refer to the [Operating Mode] of CM-550.
- `MODE` MODE Button : The operating mode can be changed with this button. Please refer to the [Operating Mode] of CM-550.
- `START` START Button : This button runs selected operating mode. Please refer to the [Operating Mode] of CM-550.
- `DXL` DYNAMIXEL X Series Port : DYNAMIXEL X series can be connected in any of these ports.
- `PORT` ROBOTIS 5 Pin Port : Sensors such as DMS, Touch sensor, IR sensor can be connected.  
  Servo motor, IR array sensor, Temperature & Humidity sensor can only be connected to Port 1 or 2.
- `MIC` Internal Microphone : The integrated microphone detects clapping sound.
- `FUSE` Fuse : 10A fuse protects electric damage.

**CAUTION** : The USB port on CM-550 is designed to be connected with the PC. Please do **NOT** connect other USB devices, or it may cause damage to the controller.
{: .notice--warning}

**[CM-550 eManual]{: .blank}**
{: .notice}

### [2XL430-W250 DYNAMIXEL](#2xl430-w250-dynamixel)

![](/assets/images/edu/engineer/kit1/2xl430_intro.png)

**2XL430-W250** is a ground breaking DYNAMIXEL that allows to control **2 axis(2 DOF)** with a single module. In order to control 2 axis at the same time, each axle is assigned with different ID while sharing an identical Baudrate. Since the Control Table for each axle is separated except the Baudrate, 2XL can be applied in various applications.  

The usage is identical to other DYNAMIXELs, but be aware that Firmware Recovery will reset both axis to factory settings.

| Item                   | Specifications                                                    |
|:-----------------------|:------------------------------------------------------------------|
| MCU                    | {{ site.data.dxl_x_info[page.product_group].mcu }}                |
| Position Sensor        | {{ site.data.dxl_x_info[page.product_group].encoder }}            |
| Motor                  | {{ site.data.dxl_x_info[page.product_group].motor }}              |
| Baud Rate              | {{ site.data.dxl_x_info[page.product_group].baudrate }}           |
| Control Algorithm      | {{ site.data.dxl_x_info[page.product_group].control }}            |
| Resolution             | {{ site.data.dxl_x_info[page.product_group].resolution }}         |
| Operating Modes        | {{ site.data.dxl_x_info[page.product_group].mode }}               |
| Weight                 | {{ site.data.dxl_x_info[page.product_group].weight }}             |
| Dimensions (W x H x D) | {{ site.data.dxl_x_info[page.product_group].dimensions }}         |
| Gear Ratio             | {{ site.data.dxl_x_info[page.product_group].gearratio }}          |
| Stall Torque           | {{ site.data.dxl_x_info[page.product_group].stalltorque }}        |
| No Load Speed          | {{ site.data.dxl_x_info[page.product_group].noloadspeed }}        |
| Operating Temperature  | {{ site.data.dxl_x_info[page.product_group].temperature }}        |
| Input Voltage          | {{ site.data.dxl_x_info[page.product_group].voltage }}            |
| Command Signal         | {{ site.data.dxl_x_info[page.product_group].command }}            |
| Protocol Type          | {{ site.data.dxl_x_info[page.product_group].protocoltype }}       |
| Physical Connection    | {{ site.data.dxl_x_info[page.product_group].physicalconnection }} |
| ID                     | {{ site.data.dxl_x_info[page.product_group].id }}                 |
| Feedback               | {{ site.data.dxl_x_info[page.product_group].feedback }}           |
| Part Material          | {{ site.data.dxl_x_info[page.product_group].material }}           |
| Standby Current        | {{ site.data.dxl_x_info[page.product_group].standbycurrent }}     |

**[2XL430-W250 eManual]{: .blank}**
{: .notice}

## [Cautions](#cautions)

### [Safety Precautions](#safety-precautions)

{% capture eng_kit1_danger1 %}  
![](/assets/images/icon_warning.png)  
1. Read this manual carefully before getting started.
2. Only use provided tools in the kit.
3. Keep the robot away from the face and body when the robot is operating.
4. Be careful for getting fingers or part of the body stuck in the robot joints.
5. Do not operate or store the robot under the direct sunlight.
6. Do not operate or store the robot near water or heat source.
7. Do not tamper or disassemble components.
8. Keep the robot and parts away from infants or younger children.
9. Do not impact or poke the robot with sharp objects.
{% endcapture %}
<div class="notice--danger">{{ eng_kit1_danger1 | markdownify }}</div>


### [Precautions on Use](#precautions-on-use)

{% capture eng_kit1_danger2 %}  
1. Use provided screwdriver(PH 1) in the kit for tightening screws.
2. Do not apply excessive force on screws and parts when assembling.
3. Operate the robot on the floor to avoid any damages from falling.
4. Accidental damages from falling is not covered by warranty.
5. DYNAMIXEL internal gears and robot joints are expendables. Excessive use or long term use may develop the backlash.
{% endcapture %}
<div class="notice--warning">{{ eng_kit1_danger2 | markdownify }}</div>

### [Precautions on Battery](#precautions-on-battery)

{% capture eng_kit1_danger3 %}  
![](/assets/images/icon_warning.png)  
1. The battery must be disconnected from the robot when not used or charged with the designated charger.
2. Do not disassemble or impact the battery or charger.
3. Do not heat the battery and avoid contact with fire and liquids.
4. Do not place battery in the microwave, laundry machine, refrigerator, or dryer.
5. Do not use damaged batteries (deformed, swollen, external damages).
6. Do not short the battery.
7. Do not reverse the polarity of the battery when charging.
8. Do not charge the battery when it is hot. Let the battery cools down to the room temperature before charging
9. Do not store the battery in hot or humid place.
10. Do not charge multiple batteries with the charger at the same time.
11. Do not connect the battery to the charger when the charger is not connected to the power source.
{% endcapture %}
<div class="notice--danger">{{ eng_kit1_danger3 | markdownify }}</div>

### [Assembly Precautions](#assembly-precautions)

#### [DYNAMIXEL Assembly](#dynamixel-assembly)

- In order to control 2 axis at the same time, each axle is assigned with different ID while sharing an identical Baudrate.  
- The ID and Status LED is located on the opposite side of the output horn.  
- ROBOTIS ENGINEER uses bolts to securely assemble the robot joints (Below image shows where bolts are required to attach the frame on DYNAMIXEL).

![](/assets/images/edu/engineer/kit1/2xl430_assembly_caution_1.png)

![](/assets/images/edu/engineer/kit1/2xl430_assembly_caution_2.png)

**CAUTION** : Please use the designated screw driver(PH 1) when assembling bolts.
{: .notice--warning}

##### [Check DYNAMIXEL ID](#check-dynamixel-id)

![](/assets/images/edu/engineer/kit1/2xl430_id.png)

##### [Check DYNAMIXEL Horn Position](#check-dynamixel-horn-position)

![](/assets/images/edu/engineer/kit1/2xl430_horn.png)  

{% capture warning_01 %}  
**CAUTION**  
- The marking on the housing should match to the horn marking when properly centered.  
- In order to align the horn to the center, use PH 1 screw driver to rotate the horn screw to clockwise. Be aware of rotating the screw to counter clockwise as it will release the screw.  
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

#### [Rivet Assembly](#rivet-assembly)

##### 6mm Rivet

![](/assets/images/edu/engineer/kit1/rivet_assembly_6mm_kr.png)  

**CAUTION** : When reusing rivets, the pin hole must be inserted first. Used rivet will not be separated into pin and pinhole.
{: .notice--warning}

##### 12mm Rivet

![](/assets/images/edu/engineer/kit1/rivet_assembly_12mm_kr.png)


#### [Cable Assemlby](#cable-assembly)

##### Connector

Both connectors are linked to supply power and communication to the module. Please use any connector for easier assembly.

![](/assets/images/edu/engineer/kit1/cable_assembly_1.png)

##### Wiring through Idler Cap

![](/assets/images/edu/engineer/kit1/cable_assembly_2.png)

**NOTE** :  
Through hole wiring method helps to increase the durability of cable and to simplify cable assembly.  
It is not a mandatory and it may require more time to replace the cable afterward.
{: .notice--info}


# [Quick Start](#quick-start)

## [App Installation](#app-installation)

{% capture app_install %}
![](/assets/images/edu/engineer/kit1/icon_engineer_48.png)  
**R+ ENGINEER : [Android App Download](https://play.google.com/store/apps/details?id=com.robotis.robotisEngineer)**  

![](/assets/images/edu/engineer/kit1/icon_task_48.png)  
**R+ Task 3.0 : [Android App Download](https://play.google.com/store/apps/details?id=com.robotis.task3)**  
**R+ Task 3.0 : [Windows Installer Download](http://www.robotis.com/service/download.php?no=1774)**  
{% endcapture %}
<div class="notice--success">{{ app_install | markdownify }}</div>

1. Open `Play Store` or `App Store` from the smart device.  
  ![](/assets/images/edu/engineer/kit1/app_installation_01_kr.png)

2. Search for **ROBOTIS** or **R+ ENGINEER** from the store.  
  ![](/assets/images/edu/engineer/kit1/app_installation_02_kr.png)

3. Select `R+ ENGINEER` from the list and press the `Install` button.  
  ![](/assets/images/edu/engineer/kit1/app_installation_03_kr.png)

4. Press the `Agree` button to proceed installation.  
  ![](/assets/images/edu/engineer/kit1/app_installation_04_kr.png)


## [Pairing Bluetooth](#pairing-bluetooth)

1. Turn on the CM-550 controller with power switch.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_1.png)

2. Press the `MODE` button until green light flashes.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_2.png)

    **NOTE** : The `MODE` button flashes in green when the controller is ready to run the task program.
    {: .notice--info}

3. Press the `START` button.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_3.png)

    **NOTE** : While the `MODE` button flashes in green, pressing `START` button will run the task program.
    {: .notice--info}

4. Launch the `ROBOTIS ENGINEER` app from the smart device and press the Bluetooth icon.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_4.png)

5. Find the Bluetooth address on the CM-550 controller.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_5.png)

6. Enter the last two characters of CM-550 BLE address in the left box and press `Search` icon.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_6.png)

7. Select the CM-550 BLE address from the search list.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_7.png)

## [Download Examples](#download-examples)
- CM-550 controller is initially programmed with Kit1 example.  
- The `Complete Example` includes `Dr.R`, `MAX-E1`, `SPI` examples.

| Example          |                                  Task Files                                   |                                 Motion Files                                  |
|:-----------------|:-----------------------------------------------------------------------------:|:-----------------------------------------------------------------------------:|
| Complete Example | [01_ENG1_TOTAL_EN.tsk3](http://www.robotis.com/service/download.php?no=1779 ) | [01_ENG1_TOTAL_EN.mtn3](http://www.robotis.com/service/download.php?no=1787)  |
| Dr.R             |  [02_ENG1_DR_R_EN.tsk3](http://www.robotis.com/service/download.php?no=1780)  |  [02_ENG1_DR_R_EN.mtn3](http://www.robotis.com/service/download.php?no=1788)  |
| MAX-E1           | [03_ENG1_MAX_E1_EN.tsk3](http://www.robotis.com/service/download.php?no=1781) | [03_ENG1_MAX_E1_EN.mtn3](http://www.robotis.com/service/download.php?no=1789) |
| SPI              |  [04_ENG1_SPI_EN.tsk3](http://www.robotis.com/service/download.php?no=1782)   |  [04_ENG1_SPI_EN.mtn3](http://www.robotis.com/service/download.php?no=1790)   |


{% capture opening_exam %}
[How to open tsk3 file in R+ Task 3.0](/docs/en/software/rplustask3/task_programming/#태스크-예제-열기)  
[How to download task program to CM-550 controller](#task-download-pc)  

[How to open mtn3 file in R+ Task 3.0](/docs/en/software/rplustask3/motion_programming/#모션-예제-열기)  
[How to download motion to CM-550 controller](#motion-download-pc)
{% endcapture %}
<div class="notice">{{opening_exam | markdownify}}</div>

### [Download from PC](#download-from-pc)

#### Connect with USB Cable
The CM-550 can be connected to the PC via Micro USB port to download task(.tsk3) and motion(.mtn3) files.

1. Connect USB cable to PC.
2. Connect the other side of Micro USB cable to CM-550 controller. The controller will be powered by USB and turned on automatically.
3. Luanch R+ Task 3.0 and press the `Connect` icon on the bottom left corner.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_01.png)

4. Select the serial port to use.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_03.png)  

5. Press the `Connect` icon.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_04.png)  

6. CM-550 will be connected to the PC with 3 beeps.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_05.png)  

#### Connect with Bluetooth
The BLE module in CM-550 can be also paired with BT-410 Dongle to connect the PC, but wireless connection will be slower than wired connection when downloading.

1. Turn on the CM-550.
2. Connect BT-410 Dongle to the USB port of the PC.
3. Bring the `MODE` button of CM-550 closer to the BT-410 Dongle to pair automatically.
4. Luanch R+ Task 3.0 and press the `Connect` icon on the bottom left corner.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_01.png)  

5. Make sure to check on `Use USB Dongle` option when using BT-410 Dongle.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_02.png)  

6. Select the serial port to use.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_03.png)  

7. Press the `Connect` icon.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_04.png)  

8. CM-550 will be connected to the PC with 3 beeps.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_05.png)  

{% capture pairing_01 %}
**NOTE** :
- Bring the `MODE` button of CM-550 closer to the BT-410 Dongle to pair automatically.
- Once BT-410 Dongle is paired successfully, the connection will be maintained within the range of Bluetooth signal.
- Once BT-410 Dongle is paired successfully, paired device will be automatically connected within the range of Bluetooth signal.
{% endcapture %}
<div class="notice--info">{{ pairing_01 | markdownify}}</div>

#### [Task Download (PC)](#task-download-pc)

Please follow the instruction below to download the task(.tsk3) file to CM-550 controller.  

1. Connect the controller to PC and select the assembled task example.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_06.png)  

2. Click the `Program Download` button in the menu.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_07.png)  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_08.png)  

#### [Motion Download (PC)](#motion-download-pc)

Please follow the instruction below to download the motion(.mtn3) file to CM-550 controller.  

1. Connect the controller to PC and select the assembled motion example.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_09.png)  

2. Select the motion example to download.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_10.png)  

3. Click the `Motion Download` tab in the menu.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_11.png)  

4. Select the motion group to download from the left column and click the `Download` button.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_12.png)

### [Download from Smart Device](#download-from-smart-device)

In order to upload an example to CM-550 controller with R+ Task 3.0 app, the smart device and CM-550 must be paired with Bluetooth.

1. Launch the R+ Task 3.0 app from the smart device and press the button in the red box.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_01.png)  

2. When `Connect Robot` window pops up, press the Bluetooth search button in the red box.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_02.png)  

3. Find the Bluetooth address on the CM-550 controller.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_02_1.png)

4. Enter the last two characters of CM-550 BLE address in the left box.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_03.png)  

5. Select the CM-550 BLE address from the search list.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_04.png)  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_05.png)  

#### [Task Download (Smart Device)](#task-download-smart-device)

The task file(.tsk3) can be uploaded to CM-550 controller wirelessly.

1. While CM-550 controller is connected to the R+ Task 3.0 app, go to **Task Examples** tab and select the example to upload.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_06.png)

2. Press `Download` button to start uploading the task to CM-550 controller.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_07.png)  

#### [Motion Download (Smart Device)](#motion-download-smart-device)

1. While CM-550 controller is connected to the R+ Task 3.0 app, go to **Motion Examples** tab and select the example to upload.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_08.png)  

2. Select the example file in the **Select the Example** window.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_09.png)  

3. Press the menu button on the top left corner of the screen.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_10.png)  

4. Select **Motion Download** tab.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_11.png)  

5. Press the `Motion Download` button in the red box, selected motion file will be uploaded to CM-550 controller.  
  ![](/assets/images/edu/engineer/kit1/remote_pairing_mobile_12.png)

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

## [Setting Up the Robot](#setting-up-the-robot)

### [Check DYNAMIXEL Assembly](#check-dynamixel-assembly)
This function checks DYNAMIXEL ID and status of the ROBOTIS ENGINEER Kit.

1.  Launch the robot example from the main screen, and select `MOTOR` from the option menu.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor.png)

2. Select the joint ID from the screen. Check if the selected joint flinches while LED is turned on.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_2.png)


### [DYNAMIXEL Offset](#dynamixel-offset)
This function is used to adjust the pose of robot by calibrating offset values of DYNAMIXEL used in the ROBOTIS ENGINEERING KIT. Configured offset value will be saved in each DYNAMIXELs.  
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

# [Tutorials](#tutorials)

## [[Machine Learning] Object Recognition](#machine-learning-object-recognition)
로보티즈 엔지니어는 머신러닝(Tensor Flow)기반의 사물학습 및 객체인식 기능을 사용할 수 있습니다.  
아래의 과정을 따라하며 머신러닝을 쉽게 시작해보세요.

{% capture info_01 %}
- 사물학습 및 객체인식을 사용하기 위해서는, 카메라가 장착된 스마트 기기가 있어야 합니다.
- 스마트 기기에 **[R+ ENGINEER 앱](#소프트웨어-다운로드)** 을 설치해야 합니다.
{% endcapture %}
<div class="notice--info">{{ info_01 | markdownify}}</div>

### [윈도우즈](#윈도우즈)

{% capture info_02 %}
**아나콘다** : 기계 학습, 대규모 데이터 처리를 위한 모듈과 파이썬이 포함된 프로그램입니다.  
텐서플로우를 이용한 머신러닝 이미지 학습을 하기 위해서는 PC에 `아나콘다3 4.2.0`가 설치되어 있어야 합니다.  
- [윈도우 64비트용 아나콘다3-4.2.0](https://repo.continuum.io/archive/Anaconda3-4.2.0-Windows-x86_64.exe)  
- [윈도우 32비트용 아나콘다3-4.2.0](https://repo.continuum.io/archive/Anaconda3-4.2.0-Windows-x86.exe)  
{% endcapture %}
<div class="notice">{{ info_02 | markdownify}}</div>

#### [pip 패키지 업그레이드](#pip-패키지-업그레이드)

1. `WIN` + `S` 키를 눌러 나타난 검색창에 **cmd** 를 검색한 다음 관리자 권한으로 명령 프롬프트를 실행합니다.  
`Ctrl` + `Shift` 를 누른 상태에서 `명령 프롬프트` 를 클릭해도 됩니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_01.png)

2. 명령 프롬프트가 실행되면 아래와 같은 화면이 나타납니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_02.png)

3. 명령 프롬프트에서 아래의 명령어를 입력해주세요.

    ``` posh
    python -m pip install --upgrade pip
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_03.png)

4. pip패키지가 성공적으로 업그레이드되면 아래와 같이 표시됩니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_04.png)

    pip 패키지가 업그레이드되지 않는다면, 아나콘다가 `C 드라이브` 에 정상적으로 설치되었는지 확인해주세요.
    {: .notice--warning}

#### [폴더생성](#폴더생성)

1. `D 드라이브`에 `!R+Smart` 폴더를 만들어 주세요.

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_01.png)

    - 폴더 위치는 `D 드라이브` 또는 `C 드라이브` 등 상관없습니다. 매뉴얼에서는 `D 드라이브` 기준으로 설명합니다.
    - 폴더 이름은 사용자가 임의로 변경할 수 있습니다. 매뉴얼에서는 `!R+Smart` 기준으로 설명합니다.
    {: .notice--info}

2. `!R+Smart` 폴더가 생성된 위치로 이동해야 합니다. 현재 드라이브가 `C 드라이브` 이므로, 아래의 명령어를 입력하여 `D 드라이브`로 이동합니다.

    ``` posh
    d:
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_02.png)


3. 아래의 명령어를 입력하여, `!R+Smart` 폴더로 이동합니다.

    ``` posh
    cd !R+Smart
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_03.png)

#### [아나콘다 가상실행 환경 만들기](#아나콘다-가상실행-환경-만들기)

1. 아래의 명령어를 입력해서 아나콘다 가상실행 환경을 만들어주세요.

    ``` posh
    conda create -n tensorflow python=3.5
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_01.png)

2. 진행여부를 묻습니다. `y` 입력후, `Enter Key`를 눌러 패키지 설치를 진행합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_02.png)

3. 성공적으로 설치되면 아래의 사진과 같이 나옵니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_03.png)

#### [텐서플로우 설치하기](텐서플로우-설치하기)

머신러닝을 구동시키기 위해 텐서플로우를 설치합니다.

1. 아래의 명령어를 입력하여, 미리 구축했던 아나콘다 가상실행 환경에 텐서플로우를 활성화시킵니다.

    ``` posh
    activate tensorflow
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_04.png)

2. 마지막으로 아래의 명령어를 입력해서 텐서플로우를 설치합니다.

    ``` posh
    pip install tensorflow
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_05.png)

#### [파일과 폴더 생성](#파일과-폴더-생성)

1. `retrain.py` 파일을 다운로드합니다.

    [retrain.py 다운로드](http://www.robotis.com/service/download.php?no=1778)
    {: .notice}

2. `!R+Smart` 폴더에 다운로드받은 `retrain.py` 파일을 복사한 다음, 객체 추가를 위한 `photos` 폴더를 만듭니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_retrain.png)

3. `photos` 폴더 안에 `001 dummy`, `002 banana` 그리고 `003 pineapple`과 같이 객체 이미지를 추가할 하위 폴더를 만들고 객체와 관련된 이미지를 각각의 폴더에 추가합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_image_01.png)

 {% capture notice_01 %}
  **참고** :
  - `001 dummy` 폴더는 지정해둔 객체 이외의 이미지에 반응하기 위해 만들어 주세요. 더미 폴더는 객체인식 오류를 줄여줄수가 있습니다.  
  - 여러 이미지를 반복해서 학습시키기 때문에, 이미지가 많을수록 학습효과가 높아집니다.
  - 카메라의 객체 인식률을 높이기 위해 100개 이상의 이미지를 사용하는 것을 추천합니다.
  - 폴더명을 `001`, `002` 와 같은 숫자로 작성하면, 추가한 아이템번호가 순서대로 정렬됩니다.
 {% endcapture %}
 <div class="notice--info">{{notice_01 | markdownify}}</div>

  **주의** : 폴더와 파일 이름은 반드시 영문으로 작성해주세요.
  {: .notice--warning}

#### [이미지 학습](#이미지-학습)

1. 아래의 명령어를 입력하여, `photos` 폴더에 추가한 객체 이미지들을 학습시킬 수 있습니다.

    ```posh
    python retrain.py --bottleneck_dir=./bottlenecks --model_dir=./inception  --output_graph=./Smart_OC.pb --output_labels=./Smart_OC.txt --image_dir ./photos --architecture mobilenet_1.0_224 --how_many_training_steps 1000
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_img_learning_01.png)

    학습 명령어에서 `how_many_training_steps` 옵션은 이미지 학습의 횟수를 나타냅니다. 횟수는 1000회 정도가 적당하며, 예시의 명령어는 1000회로 학습합니다.
    {: .notice--info}

    **주의** : 폴더와 파일의 이름은 반드시 영문이어야 합니다. 한글 이름을 사용할 경우 오류가 발생합니다.
    {: .notice--warning}

2. 학습이 완료되면 아래와 같이 ***Smart_OC.txt*** 와 ***Smart_OC.pb*** 파일이 `!R+Smart` 폴더에 생성됩니다.

   ![](/assets/images/edu/engineer/kit1/obj_classification_oc.png)

#### [프로젝트에 학습파일 적용하기](#프로젝트에-학습파일-적용하기)

1. ROBOTIS ENGINEER가 설치된 스마트 기기를 PC와 연결합니다.

2. 스마트 기기의 저장공간에서 `RoboPlus` > `ROBOTIS ENGINEER` > `CUSTOM` 폴더를 찾아 들어갑니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_01.png)  
    ![](/assets/images/edu/engineer/kit1/obj_classification_application_02.png)  
    ![](/assets/images/edu/engineer/kit1/obj_classification_application_03.png)

3. 프로젝트 폴더를 생성합니다. 여기에서는 `Project 1`을 프로젝트 폴더로 생성합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_04.png)

    **참고** : 이미 사용중인 프로젝트가 있다면, 프로젝트 폴더를 생성하는 3번 과정은 건너뛸 수 있습니다.
    {: .notice--info}

4. 데이터베이스를 사용하기 위해서 `Db` 폴더를 생성합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_05.png)

5. `!R+Smart` 에서 생성된 학습파일인 ***Smart_OC.txt*** 와 ***Smart_OC.pb*** 을 `Db` 폴더에 복사합니다.  

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_06.png)

6. 스마트 기기를 PC에서 분리한 다음 `ROBOTIS ENGINEER` 앱을 실행합니다.

    ![](/assets/images/edu/engineer/kit1/engineer_app_1.png)

7. `User` 탭으로 이동합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_01.png)

8. 3번 단계에서 생성한 `Project 1` 프로젝트 폴더의 `설정` 아이콘을 클릭합니다.   

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_02.png)

9. `비전` > `객체 분류` 를 선택합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_03.png)

10. 이미지 폴더가 추가되었는지 확인합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_04.png)

11. 객체를 놓고, 카메라를 통해 사물인식이 잘 되는지 확인합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_05.png)   

{% capture retrain %}
**참고** : 이미 생성된 학습파일인 ***Smart_OC.txt*** 와 ***Smart_OC.pb*** 에는 새로운 데이터를 추가할 수 없습니다.  
원하는 객체를 추가하려면 객체 이미지 폴더에 이미지를 추가한 다음, 새로운 학습파일을 만들어야 합니다.
- [파일과 폴더 생성 방법](#파일과-폴더-생성)
- [이미지 학습 방법](#이미지-학습)
{% endcapture %}
<div class="notice--info">{{ retrain | markdownify }}</div>


# [Study Materials](#study-materials)

{% capture edu_application %}
Additional course materials can be downloaded from below link.

- [**Request Additional Course Materials**](https://www.robotis.com/pdf_project/register.php)
{% endcapture %}
<div class="notice--info">{{ edu_application | markdownify }}</div>

![](/assets/images/edu/engineer/kit1/engineer_edu_metarials.png)

# [Download Softwares](#download-softwares)

- ROBOTIS ENGINEER supports [R+ Task 3.0].
- [R+ Task 3.0] is an integrated software of [R+ Task 2.0] and [R+ Motion 2.0].
- Write the task code to operate the robot.
- Create various motions to vitalize the robot.

<div class="notice--success">{{ app_install | markdownify }}</div>

# [References](#references)

## [BLE Signal Setting](#ble-signal-setting)

The Bluetooth communication could be unstable if the signal strength of BLE slave module in the CM-550 is weak or interfered.  
The BLE signal strength can be adjusted by R+ Manager 2.0 in this case.

Please refer to the method to adjust CM-550 BLE signal strength for various situations.

{% capture ble_setting %}  

|   My CM-550   | Other CM-550  | BLE Signal Strength |
|:-------------:|:-------------:|:-------------------:|
| Unstable Link |  Stable Link  |      Increase       |
| Unstable Link | Unstable Link |      Increase       |
|  Stable Link  | Unstable Link |      Decrease       |
|  Stable Link  |  Stable Link  |      No Change      |

- If communication is unstable when using one CM-550 controller in the room, the signal strength might be weak. **Increase the BLE signal strength**.
- If communication is unstable when using multiple CM-550 controllers in the room, BLE signals could interrupt each other. **Increase the BLE signal strength of the unstable CM-550 or decrease the BLE signal strength of other stable CM-550**.
- If all CM-550 in the room are stable, **Maintain the BLE signal strength**.
{% endcapture %}
<div class="notice">{{ ble_setting | markdownify }}</div>

**NOTE** : The BLE signal strength and noise may differ by environment and the number of devices nearby.
{: .notice}

1. Turn off the BT-410 master or BT-410 Dongle that is paired to CM-550 BLE.  
  (BLE signal strength cannot be configured while CM-550 BLE is connected to the paired device)

2. Connect the USB cable from PC to CM-550 (5V USB will automatically turn on the controller even if the power switch is off).

3. Wait until the `MODE` button of CM-550 flickers every second.

4. Run R+ Manager 2.0.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_01.png)

5. Click the `Check for Updates` button to install the latest updates.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_02.png)  

6. Go to `ALL PRODUCTS` tab or use shortcut key(`Ctrl` + `A`).

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_04.png)

7. Select `CM-550` from the product list.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_05.png)

8.  Click `Update & Test` button.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_06.png)

9. Click `Next` button.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_07.png)

10. Select the port where the controller is connected to.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_08.png)

11. Confirm the Baudrate (The default baudrate is fixed to 57600 bps).

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_09.png)

12. Once CM-550 controller is detected, click `Next`.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_10.png)

13. If the controller has the latest firmware, click `Next`, or else follow the update instruction on the screen to download the latest firmware.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_11.png)

14. Upon the successful connection, below control table will appear on the screen.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_12.png)

15. Scroll down until to find `BLE Signal Power` in the address `139`.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_13.png)

16. Select the `BLE Signal Power` on the right section of the control table and click `Save` button.  
  The bigger value will increase the signal strength.  

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_14.png)

    If the value of `BLE Signal Power` is marked on `UNKNOWN(0)`, please go back to step 1 and check if BT-410 Master or BT-410 Dongle module is turned off.
    {: .notice}

17. Confirm the changed `BLE Signal Power` value.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_15.png)

## [Self Checklist](#self-checklist)

1. Why the robot does not turn on?  
  > Please check the battery level and connection.  

2. How can I check the battery level?  
  > Please refer to [Battery Level Check](#battery-level-check) section.

3. I keep hearing the alarm from the robot.  
  > If the battery level is too low, battery warning alarm sounds. Please refer to [Charging Battery](#charging-battery) section.

4. The robot motion seems awkward.  
  > The robot may not assembled properly. Please check the robot assembly and [Check DYNAMIXEL Assembly](#check-dynamixel-assembly) section.

5. The robot turns on with the adapter, but not with the battery.  
  > Please check the Fuse on the bottom of CM-550 controller. Please refer to [Fuse Replacement](#fuse-replacement) section.

## [Charging Battery](#charging-battery)

{% include kr/edu/engineer/battery_charge.md %}

## [Battery Level Check](#battery-level-check)

{% include kr/edu/engineer/charge_level.md %}

## [Fuse Replacement](#fuse-replacement)

{% include kr/parts/controller/fuse_cm-550.md %}


[CM-550 eManual]: /docs/en/parts/controller/cm-550/
[2XL430-W250 eManual]: /docs/en/dxl/x/2xl430-w250/
[R+ Task 3.0]: /docs/en/software/rplustask3/
[R+ Task 2.0]: /docs/en/software/rplus2/task/
[R+ Motion 2.0]: /docs/en/software/rplus2/motion/
[Operating Mode]: /docs/en/parts/controller/cm-550/#operating-mode
