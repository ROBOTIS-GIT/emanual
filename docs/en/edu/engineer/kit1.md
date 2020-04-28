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
---

# [Introduction](#introduction)

![](/assets/images/edu/engineer/kit1/enginner_main.png)

**ROBOTIS ENGINEER** is the next generation robot that adopts AI technology based on smart devices.  

- ROBOTIS ENGINEER Kit offers standardized curriculum for multi level robotics educational courses
- Joint structure allows diverse motions for versatile robots
- Supports 3D part designing and printing
- Compatible with R+ ENGINEER(Smart device app), R+ Task 3.0(PC software)
- Upgrade to Raspberry Pi and Camera

## [Parts List](#parts-list)

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
| External I/O Devices  |                                   ROBOTIS 5 Pin Port : 5 (SM-10 / IR Array / TMS-10 : Use Port 1 or 2)<br />X series DYNAMIXEL Ports : 6                                    |


#### [CM-550 Layout](#cm-550-layout)

![](/assets/images/edu/engineer/kit1/cm550_1.png)

![](/assets/images/edu/engineer/kit1/cm550_2.png)

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
- `DXL` DYNAMIXEL-X Series Port : DYNAMIXEL-X series can be connected in any of these ports.
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

The usage is identical to other DYNAMIXEL's, but be aware that Firmware Recovery will reset both axis to factory settings.

| Item                   | Specifications                                            |
|:-----------------------|:----------------------------------------------------------|
| MCU                    | {{ site.data.dxl_x_info.2xl430-w250.mcu }}                |
| Position Sensor        | {{ site.data.dxl_x_info.2xl430-w250.encoder }}            |
| Motor                  | {{ site.data.dxl_x_info.2xl430-w250.motor }}              |
| Baud Rate              | {{ site.data.dxl_x_info.2xl430-w250.baudrate }}           |
| Control Algorithm      | {{ site.data.dxl_x_info.2xl430-w250.control }}            |
| Resolution             | {{ site.data.dxl_x_info.2xl430-w250.resolution }}         |
| Operating Modes        | {{ site.data.dxl_x_info.2xl430-w250.mode_en }}            |
| Weight                 | {{ site.data.dxl_x_info.2xl430-w250.weight }}             |
| Dimensions (W x H x D) | {{ site.data.dxl_x_info.2xl430-w250.dimensions }}         |
| Gear Ratio             | {{ site.data.dxl_x_info.2xl430-w250.gearratio }}          |
| Stall Torque           | {{ site.data.dxl_x_info.2xl430-w250.stalltorque }}        |
| No Load Speed          | {{ site.data.dxl_x_info.2xl430-w250.noloadspeed }}        |
| Operating Temperature  | {{ site.data.dxl_x_info.2xl430-w250.temperature }}        |
| Input Voltage          | {{ site.data.dxl_x_info.2xl430-w250.voltage_en }}         |
| Command Signal         | {{ site.data.dxl_x_info.2xl430-w250.command }}            |
| Protocol Type          | {{ site.data.dxl_x_info.2xl430-w250.protocoltype }}       |
| Physical Connection    | {{ site.data.dxl_x_info.2xl430-w250.physicalconnection }} |
| ID                     | {{ site.data.dxl_x_info.2xl430-w250.id }}                 |
| Feedback               | {{ site.data.dxl_x_info.2xl430-w250.feedback }}           |
| Part Material          | {{ site.data.dxl_x_info.2xl430-w250.material }}           |
| Standby Current        | {{ site.data.dxl_x_info.2xl430-w250.standbycurrent }}     |

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

![](/assets/images/edu/engineer/kit1/rivet_assembly_6mm.png)  

**CAUTION** : When reusing rivets, the pin hole must be inserted first. Used rivet will not be separated into pin and pinhole.
{: .notice--warning}

##### 12mm Rivet

![](/assets/images/edu/engineer/kit1/rivet_assembly_12mm.png)


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
**R+ ENGINEER for [Android App Download](https://play.google.com/store/apps/details?id=com.robotis.robotisEngineer)**  

![](/assets/images/edu/engineer/kit1/icon_task_48.png)  
**R+ Task 3.0 (Mobile App): [Android App Download](https://play.google.com/store/apps/details?id=com.robotis.task3)**  
**R+ Task 3.0 : [Windows Installer Download](https://www.robotis.com/service/download.php?no=1774)**  
**NOTE**: [ENGINEER App Installation](/docs/en/popup/engineer/engineer_app_installation){: .popup}
{% endcapture %}
<div class="notice--success">{{ app_install | markdownify }}</div>

**WARNING**: Do not choose installation directory with non-English characters, when installing R+ Task 3.0. It may cause a problem to open python code. 

**WARNING**: Install R+ Task 3.0 in a folder with Enlglish characters, otherwise The python codes may not properly work.
{: .notice--warning}

## [Download Examples](#download-examples)
- CM-550 controller is initially programmed with Kit1 example.  
- The `Complete Example` includes `Dr.R`, `MAX-E1`, `SPI` examples.

|     Example      |                                  Task Files                                   |                                 Motion Files                                  |
|:----------------:|:-----------------------------------------------------------------------------:|:-----------------------------------------------------------------------------:|
| Complete Example | [01_ENG1_TOTAL_EN.tsk3](http://www.robotis.com/service/download.php?no=1779)  | [01_ENG1_TOTAL_EN.mtn3](http://www.robotis.com/service/download.php?no=1787)  |
|       Dr.R       |  [02_ENG1_DR_R_EN.tsk3](http://www.robotis.com/service/download.php?no=1780)  |  [02_ENG1_DR_R_EN.mtn3](http://www.robotis.com/service/download.php?no=1788)  |
|      MAX-E1      | [03_ENG1_MAX_E1_EN.tsk3](http://www.robotis.com/service/download.php?no=1781) | [03_ENG1_MAX_E1_EN.mtn3](http://www.robotis.com/service/download.php?no=1789) |
|       SPI        |  [04_ENG1_SPI_EN.tsk3](http://www.robotis.com/service/download.php?no=1782)   |  [04_ENG1_SPI_EN.mtn3](http://www.robotis.com/service/download.php?no=1790)   |

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

5. Find the BLE MAC address of the CM-550 controller.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_5.png)

6. Enter the last two characters of BLE MAC address in the left box and press `Search` icon.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_6.png)

7. Select the BLE MAC address from the search list.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_7.png)

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

# [Tutorials](#tutorials)

## [[Machine Learning] Object Detection](#machine-learning-object-detection)
Get started to learn a machine learning with **ROBOTIS ENGINNER** and Tensor Flow developed by Google Brain.  
Tensor Flow is a machine learning application to ease the process of acquiring data and training models.  
Once you finish this instruction, you will understand how to utilize the object detection which is one of the part of a machine learning.
Explore following simple steps and train your robot to recognize your custom objects.  

{% capture info_01 %}
- Use a smart device with a camera to utilize the object detection. 
- Install **[R+ ENGINEER](#)** in the smart device. 
{% endcapture %}
<div class="notice--info">{{ info_01 | markdownify}}</div>

### [Windows](#windows)

{% capture info_02 %}
**Anaconda** is the easiest way to perform a machine learning and a large-scale data processing on Linux, Windows, and Mac OS X. To utilize an object detection with **ROBOTIS ENGINEER**, install Anaconda3 4.2.0 for Windows (64/32 bit) on your PC to build your own image classifier using Tensor Flow.
- [Download Anaconda3-4.2.0 for Windows 64 bit](https://repo.continuum.io/archive/Anaconda3-4.2.0-Windows-x86_64.exe)  
- [Download Anaconda3-4.2.0 for Windows 32 bit](https://repo.continuum.io/archive/Anaconda3-4.2.0-Windows-x86.exe)  
{% endcapture %}
<div class="notice">{{ info_02 | markdownify}}</div>

#### [Upgrade pip Packages](#upgrade-pip-packages)

1. Open a Command Prompt as an administrator.
  - Press `WIN` + `S` on your keyboard to open a Windows search box. 
  - Type **CMD** into the Windows search box and click the resulting “Command Prompt” as an administrator. 

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_01.png)

2. Command Prompt will be popped if you get access to CMD in the administrator mode.   

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_02.png)

3. Copy the following command and paste it into Command Prompt.

    ``` posh
    python -m pip install --upgrade pip
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_03.png)

4. As shown in the picture below, new pip package will be installed.

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_04.png)

    If there are issues with pip upgrade, check download path if it was proper location. As software is installed on `C Drive` by default, move a folder of Anaconda3 installed into `C Drive` then upgrade pip package. 
    {: .notice--warning}

#### [Create Folder](#create-folder)

1. Create Folder named `!R+Smart`

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_01.png)

    - You can create the folder in any location on your PC, but make sure a path in Command Prompt must coincide with the location of its folder properly.
    - You can change a folder name, but make sure the name in Command Prompt must coincide with the actual folder name. 
    - In this instruction, the folder name is `!R+Smart`, and the path is `C Drive`. 
    {: .notice--info}

2. Change your path in Command Prompt into `D Drive` where `!R+Smart` folder exists as your current location in Command Prompt is `C Drive`.

    ``` posh
    d:
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_02.png)


3. Copy the following command and paste it in Commad Prompt to move into `!R+Smart` from `D drive`.

    ``` posh
    cd !R+Smart
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_03.png)

#### [Create Virtual Environment](#create-virtual-environment)

1. Copy the following command and paste it in Command Prompt to create a virtual environment for your project.

    ``` posh
    conda create -n tensorflow python=3.5
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_01.png)

2. It will ask you if you want to proceed to the next step. Press `y`, and then press `Enter` key to install the Python version and new packages.

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_02.png)

3. As shown in the picture, you can see all the packages are successfully installed.  

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_03.png)

#### [Install Tensor Flow](instal-tensor-flow)

Tensor Flow installation can be done in two simple steps.  

1. Copy the following command and paste it in Command Prompt to activate newly created virtual environment of Tensor Flow.

    ``` posh
    activate tensorflow
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_04.png)

2. Lastly, Copy the following command and paste it in Command Prompt to install Tensor Flow.

    ``` posh
    pip install tensorflow==1.13.1
    ```
    
    **WARNING:** Be sure to install tensorflow 1.13.1. Otherwise, it may cause unexpected errors.  
    {: .notice--warning}

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_05.png)

#### [Create a file and a folder](#create-a-file-and-a-folder)

1. Go on the associated link to download a `retrain.py` file.

    [Download retrain.py](http://www.robotis.com/service/download.php?no=1778)
    {: .notice}

2. Move the downloaded file `retrain.py` in `!R+Smart` folder. Create a `photos` folder in `!R+Smart` to add images for an object detection.  

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_retrain.png)

3. Create subfolders named `001 dummy`, `002 banana` and `003 pineapple` or something like that, which contains images matching a detected object characteristic for an object detection.  

    ![](/assets/images/edu/engineer/kit1/obj_classification_image_01.png)

 {% capture notice_01 %}
 **NOTE** :  
  - To reduce errors of recognizing objects, `001 dummy` folder will be useful to scan unspecified objects.
  - Train your **ROBOTIS ENGINEER** with sufficient images. The more it is, the better performance it is. (Collecting 100 images will be enough for recognizing objectes)
  -  To organize folders in order, specify them with a number `001`, `002`, `etc..`
 {% endcapture %}
 <div class="notice--info">{{notice_01 | markdownify}}</div>

#### [Train models](#train-models)

1. Copy the following command and paste it in Command Prompt to train models of objects.

    ```posh
    python retrain.py --bottleneck_dir=./bottlenecks --model_dir=./inception  --output_graph=./Smart_OC.pb --output_labels=./Smart_OC.txt --image_dir ./photos --architecture mobilenet_1.0_224 --how_many_training_steps 1000
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_img_learning_01.png)

    In the command line, the option `how_many_training_steps` is the count of steps of training models. The enough steps for training models are 1000 times.  
    {: .notice--info}

2. After completion of training,  `Smart_OC.txt` and  `Smart_OC.pb` files will be created in the `!R+Smart` folder.

   ![](/assets/images/edu/engineer/kit1/obj_classification_oc.png)

#### [Apply training file to your prject](#apply-training-file-to-your-project)

1. Connect your smart device in which `R+ ENGINEER` app installed to your PC. 

2. Enter  `RoboPlus` > `ROBOTIS ENGINEER` > `CUSTOM` of your device folder. 

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_01.png)  
    ![](/assets/images/edu/engineer/kit1/obj_classification_application_02.png)  
    ![](/assets/images/edu/engineer/kit1/obj_classification_application_03.png)

3. Create a folder named `Project 1` in the `CUSTOM` folder. 

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_04.png)

    **NOTE** : If there is your own project, you can skip 3rd step of this instruction. 
    {: .notice--info}

4. Create a `Db` folder to store training files.  

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_05.png)

5. Copy `Smart_OC.txt` and `Smart_OC.pb` files from `!R+Smart` and then paste them into the `Db` folder.   

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_06.png)

6. Disconnect the smart device from the PC, and then launch the `ROBOTIS ENGINEER` app on your smart device. 

    ![](/assets/images/edu/engineer/kit1/engineer_app_1.png)

7. Click `User` tab.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_01.png)

8. Click a configuration icon of a folder `Project 1`.    

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_02.png)

9. Select `Object Classifier` at `Vision` section.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_03.png)

10. To test object detection, select your custom object in the list.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_04.png)

11. Detect objects in real time.  

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_05.png)   

{% capture retrain %}
**NOTE** : It is not possible to add new object datas to `Smart_OC.txt` and `Smart_OC.pb`, which have been already configured. To add new data into them, please add a new object image to the subfolders created in `!R+Smart` .
- [Create a file and a folder](#create-a-file-and-a-folder)
- [Train models](#train-models)
{% endcapture %}
<div class="notice--info">{{ retrain | markdownify }}</div>


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

{% include en/edu/engineer/battery_charge.md %}

## [Battery Level Check](#battery-level-check)

{% include en/edu/engineer/charge_level.md %}

## [Fuse Replacement](#fuse-replacement)

{% include en/parts/controller/fuse_cm-550.md %}


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
[ENGINEER App Installation]: /docs/en/popup/engineer/engineer_app_installation
