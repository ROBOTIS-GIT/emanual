---
layout: archive
lang: en
ref: mini
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/mini/
sidebar:
  title: ROBOTIS MINI
  nav: "mini"
---

# [Introduction](#introduction)

![](/assets/images/edu/mini/mini_product.jpg)

- Awarded the “Good Design”
- Compatible with the 6mm grid OLLO `ROBOTIS DREAM` frames
- Applies the small DYNAMIXEL XL-320 for various motion functions
- Offers the ROBOTIS-MINI exclusive App (Touch, Gesture, Voice Recognition, Messenger)
- Supports various functions for the user’s convenience (battery percentage, offset setting, etc)
- Supports R+ Task and R+ Motion
- Capable to expand with additional devices such as Color Sensor, LED Module, etc

## [Precaution](#precaution)

Please be aware of your own safety as you assemble. ROBOTIS CO., LTD is not responsible for the result of any accidents caused by the user’s negligence.

### [Safety Precautions](#safety-precautions)
- Read through manual carefully before assembly.
- Do not use any other tools other than those provided in this kit. (no knives, cutters, drills, etc)
- Keep a safe distance from the robot during its activation.
- Be careful not to get fingers stuck between the robot joints.
- Do not store or operate the robot under direct sunlight.
- This project is not water proof. Do not use near water.
- Do not use near heat or fire.
- Do not disassemble or modify the parts.
- Keep all parts out of reach of small children.
- Do not drop or use sharp objects with the parts.
- Do not connect or let the li-ion battery come in contact with hair pins, clips, or any metal objects.
- Do not bend, twist, or modify the metal part of the li-ion battery.
- Do not place the li-ion battery in the microwave or solder any parts.
- Do not soak or place the li-ion battery in or near water.

### [Assembly Precautions](#assembly-precautions)
- Use only the designated screw driver in the kit(Size : M2)
- Do not use excessive force on nuts, bolts, or robotics parts.
- Avoid activating the robot on desks/tables to avoid from falling.
- Damages caused from falling are not covered under warranty.
- The gears in DYNAMIXEL XL-320 are subject to wear. Prolonged use, improper modification, excessive force, and damages will increase the gear backlash.

### [Precautions During Use](#precautions-during-use)

#### Charging the Li-ion battery
- Insert the li-ion battery in the charger case with the USB connector.
- The battery is shipped as uncharged. Please fully charge the battery before the first time use.

![](/assets/images/edu/mini/mini_001.jpg)

#### Frame Assembly for DYNAMIXEL XL-320

There are two different marks on the horn. Top marked and the bottom marked Before assembly, make sure the marks are in their proper position.

![](/assets/images/edu/mini/mini_002_en.jpg)

#### How to use the Rivet Tool

The Rivet is a simple tool to assemble plates.  
The `Rivet` is made up of a pair of `pin` and `pinhole`.  

![](/assets/images/edu/mini/darwin_mini_2_en.jpg)

In order to remove the rivet pick the pin head with the tool and pull it up.

![](/assets/images/edu/mini/darwin_mini_3_en.jpg)

In order to reuse the removed rivet, pinhole should fit into the hole first then pin should be inserted.

![](/assets/images/edu/mini/darwin_mini_4_en.jpg)

Try using provided tool when re-inserting the removed rivet.  
Hold the rivet with the tool and insert the pinhole into the plate hole.

![](/assets/images/edu/mini/darwin_mini_5.jpg)

#### Checking the li-ion battery voltage

The controller checks the battery voltage when the power is turned on.

|   Status    |           Movement            |
|:-----------:|:-----------------------------:|
|    Good     | All LEDs blink in RED 1 time  |
| Low Battery | All LEDs blink in RED 5 times |

**NOTE** : The controller acquires voltage from a specific DYNAMIXEL(ID 3) so ID 3 should be connected properly.
{: .notice}

{% capture mini_warning_01 %}
**WARNING** : Please immediately turn off the power and contact ROBOTIS when you encounter any of the following symptoms.
- When you see smoke from the product.
- When the LED on DYNAMIXEL XL-320 does not blink during the [`Actuator Test`](/docs/en/edu/mini/).
- When the robot has been exposed to water or any debris has gone into the parts.
- When you feel odd smell from the product.
- When the robot is damaged.
{% endcapture %}

<div class="notice--warning">{{ mini_warning_01 | markdownify }}</div>

# [Getting Started](#getting-started)

## [Part List](#part-list)

- [OpenCM9.04]
- [XL-320]

![](/assets/images/edu/mini/mini_partlist_en.jpg)

## [Preparation](#preparation)

### [ROBOTIS MINI App](#robotis-mini-app)

ROBOTIS MINI App for smart device supports various operations. Please refer to [Operating MINI](#operating-mini) section for installing and operating the app.

### [Connect to MINI](#connect-to-mini)

Bluetooth device must be installed in your computer to connect to ROBOTIS MINI. If you do not have it installed, you must purchase a Bluetooth dongle. If you already have a Bluetooth device, use the method below to register ROBOTIS MINI’s Bluetooth (BT-210) to your computer(The instruction below is based on Windows 7/8/8.1).
{: .notice}

#### For Windows 7 / 8 / 8.1

For Windows 8/8.1, to open the `Control Panel` click on the right side of the charm bar then click `Setting`.
{: .notice}

1. Connect the Bluetooth (BT-210) to your robot and turn the power on.
2. Select ‘Control Panel’  > ‘Hardware and Sound’  > ‘Add a device’ on your computer

    ![](/assets/images/edu/mini/mini_003.jpg)

3. Select ‘ROBOTIS BT-210’ from your list and click ‘Next.’

    ![](/assets/images/edu/mini/mini_004.png)

4. When there is more than one device, check the ‘Properties’ of the device by clicking on the right side of your mouse. Make sure the Unique Identifier number of your Bluetooth under the ‘Bluetooth’ tab is the same number you wish to use.

    ![](/assets/images/edu/mini/mini_005.png)

5. Select ‘Enter the device's pairing code’ from the Connection Option.

    ![](/assets/images/edu/mini/mini_006.png)

6. Input ‘0000’ then click ‘Next.’

    ![](/assets/images/edu/mini/mini_007.png)

7. Device has been successfully added.

    ![](/assets/images/edu/mini/mini_008.png)

### [Check Connection](#check-connection)

1. Select ‘Control Panel’ > ‘Hardware and Sound’ > ‘View devices and printers’ on your computer.

    ![](/assets/images/edu/mini/mini_009.png)

2. Select ‘Properties’ by right clicking on the BT-210 that you just added.

    ![](/assets/images/edu/mini/mini_010.jpg)

3. Check the COM port under the ‘Hardware’ tab.

    ![](/assets/images/edu/mini/mini_011.jpg)

#### For Windows 10

1. Open Windows Setting menu and select `Devices`

    ![](/assets/images/edu/mini/mini_bt_win10_01.png)

2. Select the `Bluetooth & other devices` tab on the left column and click `Add Bluetooth or other device` button on the right column.

    ![](/assets/images/edu/mini/mini_bt_win10_02.png)

3. In the popped up window, select `Bluetooth`.

    ![](/assets/images/edu/mini/mini_bt_win10_03.png)

4. Search for the Bluetooth module. The last two characters in the device name should be matching to the last two characters of the Bluetooth module ID.

    ![](/assets/images/edu/mini/mini_bt_win10_04.png)

5. Enter the default PIN `0000` and click the Connect button.

    ![](/assets/images/edu/mini/mini_bt_win10_05.png)

6. If BT-210 Bluetooth module is successfully paired, below message will appear.

    ![](/assets/images/edu/mini/mini_bt_win10_06.png)

# [Operating MINI](#operating-mini)

## [App Install](#app-install)

{% include en/software/mobile_app/mini/app_install.md %}

## [Operation](#operation)

{% include en/software/mobile_app/mini/operation.md %}

## [App Setting](#app-setting)

{% include en/software/mobile_app/mini/app_setting.md %}

## [Programming](#programming)

### RoboPlus Task

A Task is a set of motions to perform a certain actions. RoboPlus refers to the source code that specifies tasks to be executed by the robot as  Task Code'. The robot moves according to your task codes. RoboPlus Task is a software to make writing these task codes easier.
{: .notice}

#### RoboPlus Task Download and Usage
RoboPlus(R+) Task can be downloaded from the ROBOTIS website under Support à Download. Please refer to the RoboPlus Task for detailed on how to use the program.

- Click [here](/docs/en/software/rplus1/task/getting_started/) to learn more about RoboPlus Task.
- Click [here](http://en.robotis.com/BlueAD/board.php?bbs_id=downloads&mode=view&bbs_no=1152561&page=1&key=&keyword=&sort=&scate=) to download RoboPlus.

#### Task programming example
Below is a program example for ROBOTIS MINI. This program is a master and slave program where the left arm makes the same motions as the right arm.

![](/assets/images/edu/mini/mini_012.gif)

The example file can be downloaded at [Download Section](#download)

#### Download Task Code
The composed task code must be downloaded to the DARWIN-MINI. Downloading will save the task code to the controller.
- The PC must be connected to the controller. Please refer to the section above on connecting the ROBOTIS MINI with the PC via Bluetooth.
- Check the port ROBOTIS MINI is connected on.

  ![](/assets/images/edu/mini/mini_013.png)

  If you don’t know the port, select ‘Auto Search’.
  If RoboPlus can’t find the controller, the following message will show up on the screen. In this case, follow the instructions on the screen.

  ![](/assets/images/edu/mini/mini_014.png)


- Select the Download icon (shortcut key F6).

  ![](/assets/images/edu/mini/mini_015.png)

  If there is an error in the program, make sure to find and to fix the error.
  (Please refer to the rule check error message at the end of your program.)

- Download in progress.

  If downloading fails, please try again from the beginning.

  ![](/assets/images/edu/mini/mini_016.png)

- Turning the ROBOTIS MINI controller OFF then ON will automatically run the task code downloaded on the controller. Check whether the robot operates in the way it was downloaded in.

### RoboPlus Motion

Motion data is a set of motor position and speed data, which is required to make the robot move in a certain way. The robot requires the motion file to move, so the correct file must be downloaded to the robot to perform the correct action. RoboPlus MOTION is used to program various motions.
{: .notice}

![](/assets/images/edu/mini/mini_017.gif)

The Task Code composed in RoboPlus Task is a program. Motion file, on the other hand, is a data. Task codes decide how the robot moves, and making the moves to be carried out requires motion data.
Roboplus Motion is the program that helps to easily make the robot motion data.

#### How to download and use RoboPlus Motion
The RoboPlus Motion program can be downloaded from the ROBOTIS homepage.
Further instructions on how to use it can be found on the e-Manual.

- Click [here](/docs/en/software/rplus1/motion/) to learn more about RoboPlus Motion.
- Click [here](http://en.robotis.com/BlueAD/board.php?bbs_id=downloads&mode=view&bbs_no=1152561&page=1&key=&keyword=&sort=&scate=) to download RoboPlus.

#### DARWIN-MINI basic motion file
The basic ROBOTIS MINI motion file can be also downloaded on the e-Manual page.

The example file can be downloaded at [Download Section](#download)

Try editing the sample file referring to the RoboPlus Motion instructions on e-Manual.

#### Download Motion File
Download the edited motion file to the robot to use it in the ROBOTIS MINI App or task code.
Like the task code, the motion data needs to be downloaded to the controller once.

- The PC must be connected the controller. Please refer to the section above on connecting the DARWIN-MINI with the PC via Bluetooth.
- Click ‘connect’ on the bottom left.

  ![](/assets/images/edu/mini/mini_018.png)

- Select the port to connect on, and click connect.

  ![](/assets/images/edu/mini/mini_019.png)

  If you don’t know the port, select ‘Auto Search’.

- If connection is successful, the port number and connection speed will be displayed on the bottom left.

  ![](/assets/images/edu/mini/mini_020.png)

- Move to the motion download tab on the top to download the motion data, select the motion group to download, and click the download button.

  ![](/assets/images/edu/mini/mini_021.png)

- Download progress will be shown, and the ‘Download Success’ message will be shown on the bottom log window.

  ![](/assets/images/edu/mini/mini_022.png)

- Now, check with the ROBOTIS MINI App or task code to see if the edited motion performs the way it should.

# [Customize](#customize)

## Adding Peripheral Devices  
  The controller OpenCM9.04-C Type used in ROBOTIS MINI has four ports to connect 5P devices.

  - Accessories

  ![](/assets/images/edu/mini/mini_023.jpg)

  ※ Please refer to our online shop to purchase the sensors above. [GO TO ROBOTIS SHOP](http://www.robotis-shop-en.com/index.php)

  ![](/assets/images/edu/mini/mini_024.jpg)

  Port number for each port is written in white.

{% capture mini_warning_02 %}
**CAUTION** :  
LED Module : Use ports `2` and `3`(LED will not light up when using ports `3` and `4`)  
IR Sensor :  Use ports `1` and `4`  
Color Sensor : Use ports `2` and `3`  
{% endcapture %}

  <div class="notice--warning">{{ mini_warning_02 | markdownify }}</div>

  Images of ROBOTIS-MINI with different devices assembled.

  ![](/assets/images/edu/mini/mini_025.jpg)

## Customize Appearance  
  The stickers come with your package but if you want to re-reprint them, please refer to the link below. You can also draw your own design. Sticker file can be downloaded at [Download Section](#download)

  ![](/assets/images/edu/mini/mini_026.jpg)

# <a name="download"></a>[Download](#download)

- [Download][mini_download_01] Example Task Code and Motion File
- [Download][mini_download_02] Sticker Design
- [Download][mini_download_03] STL File for 3D Printer
- [Download][mini_download_04] STP Design File
- [Download][mini_download_05] Assembly Guide

[mini_download_01]: http://support.robotis.com/en/baggage_files/darwinmini/darwin_mini_exemple_en.zip
[mini_download_02]: http://support.robotis.com/en/baggage_files/darwinmini/darwin-mini_sticker.pdf
[mini_download_03]: http://www.robotis.com/download/darwinmini/darwin_mini_3dprinter.zip
[mini_download_04]: http://support.robotis.com/en/baggage_files/darwinmini/darwin_mini_stp.zip
[mini_download_05]: https://www.robotis.com/service/download.php?no=2053

# [References](#references)

## [Firmware Update](#firmware-update)

Please follow the procedure below to recover or update the ROBOTIS MINI’s controller (OpenCM9.04C) firmware.

1. Separate the ROBOTIS MINI’s chest with the body to disassemble the controller.

    ![](/assets/images/sw/mobile/mini_firmware_01.jpg)

2. With the power off, push the user button (marked red below).

    ![](/assets/images/sw/mobile/mini_firmware_02.jpg)

3. Keep holding the user button, then connect the OpenCM9.04C with the PC with the mini USB cable (marked red below).

    ![](/assets/images/sw/mobile/mini_firmware_03.jpg)

4. When a green light shows up on the LED marked below, let go of the user button.

    ![](/assets/images/sw/mobile/mini_firmware_04.jpg)

5. Run RoboPlus. If the version is low, an automatic update will be run through the internet. If the automatic update doesn’t run, please download the latest version from the ROBOTIS website’s Download site.

   ![](/assets/images/sw/mobile/mini_firmware_05.jpg)

6. Run R+ Manager (ver. 1.0.32.0 or higher).

   ![](/assets/images/sw/mobile/mini_firmware_06.jpg)

7. Click the button on the top right to update RoboPlus to the latest version.

    ![](/assets/images/sw/mobile/mini_firmware_07.jpg)

8. If any updates were made, close R+ Manager and open the program again.

9. Click the controller firmware management button on the top.

    ![](/assets/images/sw/mobile/mini_firmware_08.jpg)

10. Click [Next].

    ![](/assets/images/sw/mobile/mini_firmware_09.jpg)

11. Select the port the OpenCM9.04C is connected on and click search.

    ![](/assets/images/sw/mobile/mini_firmware_10.jpg)

12. When the controller is found, click [Next].

    ![](/assets/images/sw/mobile/mini_firmware_11.jpg)

13. Click [Next].

    ![](/assets/images/sw/mobile/mini_firmware_12.jpg)

14. Click [Next].

    ![](/assets/images/sw/mobile/mini_firmware_13.jpg)

15. Click [Finish].

    ![](/assets/images/sw/mobile/mini_firmware_14.jpg)

## [ID Map](#id-map)

![](/assets/images/edu/mini/mini_027.jpg)


[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[XL-320]: /docs/en/dxl/x/xl320/
