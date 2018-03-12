---
layout: archive
lang: en
ref: rplus2_manager
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplus2/manager/
sidebar:
  title: R+ Manager 2.0
  nav: "rplusmanager2"
---

# [Introduction](#introduction)

## [RoboPlus Manager 2.0](#roboplus-manager-20)
The RoboPlus Manager 2.0 manages the Controller and Dynamixel devices that comprise the robot.
By connecting the product, the user can update the product to the latest version and test the Control Table.
The functions that were previously provided in RoboPlus Manager 1.0 and Wizard 1.0 have been combined in RoboPlus Manager 2.0.

![](/assets/images/sw/rplus2/manager/roboplus_manager2_01.jpg)
 
## [Precautions](#precautions)
Supported products are limited starting from V2.0.0. For products that are not included in the list of supported products, please use RoboPlus Manager 1.0 and Wizard 1.0.
 
List of Supported Products
- Robotis Dream
- Robotis MINI
- Dynamixel 2.0 Series (MX-28, MX-64, MX-106, XL-320, XM Series, XH Series, Pro Series)

![](/assets/images/sw/rplus2/manager/roboplus_manager2_02.jpg)

## [Definition of Firmware](#definition-of-firmware)

Firmware is basic software that is installed on a device to operate the hardware. Firmware contains communication protocols with PC, smartphone, and other devices so it is recommended to keep the firmware to the latest version.  
All devices (Controller, Dynamixel etc) have firmware installed when first purchased, but new versions can be released if there are additional functions / bug fixes.
 
### Role of Controller Firmware
- Operates the control program written using RoboPlus Task
- Interprets the motion data written using RoboPlus Motion
- Performs packet communication function with PC, smartphone, and Dynamixel
 
### Role of Dynamixel Firmware
- Performs packet communication function with Controller when operating control program or motion on the Controller
- Performs packet communication function with PC, smartphone, and Dynamixel

### Importance of Firmware Update

- A new firmware can be released if there are additional functions or modifications to previous functions.
- A new firmware can be released to improve compatibility if supporting a new S/W is necessary.
- A new firmware can be released if there is a bug fix.
- If the product does not function properly or communication is unstable, updating to the latest firmware may fix the problem.

# [Menu Description](#menu-description)

## [Editing Tab for Each Stage](#editing-tab-for-each-stage)
The workspace is divided into Home Tab, Managing Tab, and Terminal Tab. (The Self-Checklist / Calibration functions in the Managing Tab and the Terminal Tab are not available as of yet in V2.0.0.)

![](/assets/images/sw/rplus2/manager/roboplus_manager2_03.jpg)
 
## [Home Tab](#home-tab)
This is the first screen right after starting the program, which provides functions such as Product Selection menu and Firmware Update history function, etc

![](/assets/images/sw/rplus2/manager/roboplus_manager2_04.jpg)

## [Management Tab](#management-tab)
This tab provides Firmware Update / Test / Recovery functions for the previously selected product. Depending on the selected product, the functions that can be used are filtered and showed.
 
![](/assets/images/sw/rplus2/manager/roboplus_manager2_05.jpg)
 
The figure below is a screen of testing the Control Table. It shows all searched products according to their communication speed and device model, and you can test by modifying the values in the Control Table.

![](/assets/images/sw/rplus2/manager/roboplus_manager2_06.jpg)
 
## [Terminal Tab](#terminal-tab)

This feature is currently being prepared and will be supported in upcoming updates.
{: .notice--warning}

# [Basic Features](#basic-features)

## <a name="firmware-update"></a>[Firmware Update](#firmware-update)

1. In the Home Tab,select the product that you wish to update or test. (ROBOTIS MINI was selected in the example below)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_07.jpg)

2. Select the “Update & Test” menu.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_08.jpg)
 
3. Connect the product with the PC as guided on screen and then turn on the product.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_09.jpg)

4. Select the connection port and click the “Next” button. (Bluetooth serial port was used in the example below)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_10.jpg)
 
5. Select the communication speed to search and click the “Next” button. (When using Bluetooth serial port, only 57,600bps can be used)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_11.jpg)

6. Check if the device to be managed has been properly searched and click the “Next” button. (If the product is not searched properly, then click the “Try Again” button.)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_12.jpg)

7. If the content to be updated is detected, then the “Update Now” button below will be activated. Check the update content and click the “Update Now” button.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_13.jpg)
 
8. Wait until the update has been properly completed and click the “Next” button.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_14.jpg)

9. If the update has been completed, then the “Control Table test” function will be executed. (Some controllers will turn off after the update is complete, and the window will be closed.)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_15.jpg)

## [Firmware Recovery](#firmware-recovery)

1. In the Home Tab, select the product that you wish to recover. (ROBOTIS MINI was selected in the example below)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_21.jpg)
 
2. Select the “Firmware Recovery” menu.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_22.jpg)
 
3. Check the notification message and click the “Next” button.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_23.jpg)
 
4. Select the product you wish to recover and click the “Next” button. (OpenCM9.04 was selected in the example below)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_24.jpg)

5. Follow the instructions that appear in order. Be sure to the check the yellow warning message below.

6. After all preparations are finished click the “Next” button.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_25.jpg)
 
7. Select the connection port and click the “Next” button. (Bluetooth serial port was used in the example below)
 
8. Once the device is connected, bootloader is detected for firmware installation. Click the “Next” button when it is activated.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_26.jpg)
 
9. Check the information of the firmware to the installed and click the “Next” button.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_27.jpg)
 
10. When the recovery is complete, click the “Finish” button.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_28.jpg)

## [Dynamixel Control Table](#dynamixel-control-table)

1. To begin we will assume the Control Table window is open. (Please refer to the [Firmware Update](#firmware-update) section for the connection process.)

2. The Control Table window categorizes the control tables according to their communication speed and device model. Select the communication speed and device model that you wish to test. (XL-320 was selected in the example below.)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_16.jpg)

3. From the menu on the right, clicking the “Factory Reset” button will restore all settings of the product to their factory default configuration.  
    (The ID and Baud Rate value will not be changed.)  
    From the menu on the right, clicking the “Rebooting” button will restart the corresponding Dynamixel.  
    From the menu on the right, click the “Turn On/Off Torque” button will turn the corresponding Dynamixel’s torque on or off.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_17.jpg)
 
4. From the menu on the right, click the “Turn On Torque” button to turn the Dynamixel’s torque on.

5. In the Control Table list, search and select the “Goal Position” item.

6. Use the Goal Position control on the lower right corner to move the motor. 

    `Warning` Take caution since the motor can suddenly move in the process of changing the value.
    {: .notice--warning}

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_18.jpg)

7. You can check if the current communication between the PC and the product is normal through the “Communication Status” LED on the lower left corner. (Green : Normal, Yellow : Time-Out, Red : Data Loss)
8. You can check the Dynamixel’s response status through the “Response Error” message on the lower left corner.
9. You can check the hardware’s error status through the “Hardware Alarm” message on the lower left corner.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_19.jpg)
 
10. Some Dynamixels provide the function to view the Profile Type status.  
    In a given Operating Mode, the Profile Type is decided by the Profile Acceleration value and the Profile Velocity value. Please refer to the corresponding Dynamixel’s E-Manual for details. (Supported products : XM Series and XH Series)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_20.jpg)

`Note` For further information about the Control Table, please refer to each Dynamixel.
{: .notice}

## [Controller Control Table](#controller-control-table)

1. Select the controller to connect in the `Home` tab. (OpenCM7.0 is selected in the example)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_48.png)
 
2. Click `Update & Test` icon.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_49.png)
 
3. Connect the controller to PC according to the described image.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_50.png)
 
4. Select COM port to establish connection between PC and controller.(USB port is selected in the example)  
    Click `Next` button.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_51.png)
 
5. Select Baud Rate to establish connection between PC and controller. Click `Next` button.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_52.png)
 
6. Confirm detected device with selected port and baudrate then click `Next` button. If the device is not detected, click `Retry` button and try again.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_53.png)
 
7. If there is any available firmware updates for the device, update menu will be available. Click `Update Now` button to update the device.  
    If connected device already has the latest firmware, you will see below screen.  
    Click `Next` button to proceed.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_54.png)
 
8. When the connection is established between PC and controller, below screen will be appeared. Control Table window arranges device with Baudrate and Device. If you have connected multiple devices, select baudrate and device of the controller to test.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_55.png)
 
9. On the right column of the window, `Factory Reset` button will reset all configuration except ID and Baudrate.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_56.png)
 
10. On the left bottom corner of the window, TX and RX communication status is visualized with colred bar (Green : normal, Yellow : timeout, Red : data loss)  
    Return Error will notify response status of the device and H/W Alert will notify error status of the hardware.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_57.png)
 
11. Select an item with RW access property and change its value to test controller. For below example, select Green LED and change its value from the right table will control green LED on the controller.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_58.png)
 
12. Various peripheral devices can be attached and tested. Click the extention triangle button to display sensor selection pop up window.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_59.png)
 
13. Changing peripheral device will also change the address for the device. In the below example, selecting Ultrasonic sensor for port 3 will update its address to 244.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_60.png)

`Note` For more details on peripheral devices, please refer to R+ Task 2.0.
{: .notice}


# [Advanced Features](#advanced-features)

## [Preparation for XM/XH Series](#preparation-for-xmxh-series)

There are two preparations that need to be done for using the XM Series in R+Task2.0 or R+Motion2.0.  
(Preparing the H/W / Configuring the Dynamixel Channel)
 
### Preparing the H/W

1. Apart from the OpenCM9.04 and XM Series, the “OpenCM 485 EXP board” is needed as in the figure below.
2. Connect the three components below with cables.

![](/assets/images/sw/rplus2/manager/roboplus_manager2_29.jpg)

### Configuring Dynamixel Channel

1. Open R+ Manager 2.0 and select the Dynamixel2.0 product, then click on the Update & Test menu.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_30.jpg)
 
2. Connect the OpenCM9.04 to the PC by usingLN-101 or BT-210(or BT-110), then turn on the OpenCM 485EXP.
3. Follow the instructions below to search the product forOpenCM9.04 (Initially the Dynamixel Channel value of the OpenCM9.04 is set to Default so the XM/XH Series does not appear in the search result).

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_31.jpg)
 
4. After the process of updating the product, the Control Table will open.
5. From the Control Table list, set the Dynamixel Channel value to EXP Board (Expansion Board)and click Save.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_32.jpg)
 
6. When the configuration is finished, close the Control Table window and restart the OpenCM 485 EXP.  
    (As it is restarted the, the mini TTL bus of the OpenCM9.04 is deactivated, and then Dynamixel bus of the OpenCM 485 EXP is activated.)
7. Open the Update & Test menu again and check that the XM/XH Series is properly detected in the search result.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_33.jpg)
 
8. When the configuration is finished, you can now use the XM/XH Series in R+ Task 2.0 and R+ Motion 2.0.  
    (Supported from versions R+ Task 2.0 v2.1.0, R+ Motion 2.0 v2.4.0 or later)

## [Changing Control Value](#changing-control-value)

Use the left mouse-button to drag and change the value(used when changing the value in large amounts.)

![](/assets/images/sw/rplus2/manager/rplusmanager2_35_kr.jpg)
 
Use the mouse wheel to change the value (used when changing the value in small amounts.)

![](/assets/images/sw/rplus2/manager/rplusmanager2_36_kr.jpg)

Use the arrow keys in the keyboard to change the value (used when changing the value minutely.)

![](/assets/images/sw/rplus2/manager/rplusmanager2_37_kr.jpg)
 
Inputting the value directly. You can also use basic arithmetic operations (addition, subtraction) to set the value.

![](/assets/images/sw/rplus2/manager/rplusmanager2_38_kr.jpg)

## [Firmware Information](#firmware-information)

This is the function to check the Firmware version, release date, and update note.

1. In the Home Tab, select the product for which you wish to check the Firmware version.
2. Click on the “Firmware Information” button on the upper right corner.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_39.jpg)
 
3. You can check the Firmware version, release date, and update note of the selected product.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_40.jpg)

## [Firmware Management(Bluetooth)](#firmware-managementbluetooth)

By using the BT-210 or BT-110 you can manage the Firmware wirelessly (The BT-410 does not provide a wireless Firmware management function)

Add a Bluetooth serial port by following the instructions below (Example below shown for Windows10).
 
1. Connect the BT-210(or BT-110) to the Controller and turn on the Controller.
2. Click on the Windows start button, and select the Settings menu.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_41.jpg)
 
3. Click on the Devices menu.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_42.jpg)
 
4. Select the Bluetooth category on the left, and turn on the Bluetooth option on the right.
5. Select the searched Bluetooth module, and chick the Pair button.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_43.jpg)
 
6. In the device password field, enter 0000 and click on the Next button.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_44.jpg)
 
7. When the pairing is complete, select the paired device and click on “More Bluetooth options” found below.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_45.jpg)
 
8. Click on the COM Port tab and check the port number of the transmission port. (In the example below it was COM7)

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_46.jpg)
 
9. In R+ Manager 2.0, select the installed Bluetooth port number and you can now manage the Firmware wirelessly.

    ![](/assets/images/sw/rplus2/manager/roboplus_manager2_47.jpg)
