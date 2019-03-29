---
layout: archive
lang: en
ref: mtask20
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplus_mobile/mtask20/
sidebar:
  title: R+m.Task 2.0
  nav: "mtask20"
---

# [Introduction](#introduction)

R+m.Task 2.0 provides identical functions on Android / iOS devices as R+Task 2.0 does on PC.  
Downloading, editing, debugging tasks, and remote controller is supported.

## [System Requirements](#system-requirements)

Please keep the lastest firmware for the controller.  
The device must support bluetooth in order to use download feature.

### [Android](#android)
  - OS : Android 2.3
  - Hardware : 1.2 dual-core CPU, 1GB RAM, Bluetooth/IMU sensor
  - BT-410 Support (Android 4.4 or above)
  - BT-210, BT-110 Support

### [Apple](#apple)
  - OS : iOS 8.0
  - Hardware : iPhone4S, iPod 5G, iPad mini, iPad 2
  - BT-410 Support
  - BT-210, BT-110 **NOT supported**

## [Supported Products](#supported-products)

- [ROBOTIS DREAM]
- [ROBOTIS SMART]
- [ROBOTIS STEM]
- [ROBOTIS PREMIUM]
- [ROBOTIS GP]
- [ROBOTIS MINI]
- [ROBOTIS IoT]

## [Supported Controllers](#supported-controllers)

- [CM-150]
- [CM-200]
- [CM-510]
- [CM-530]
- [CM-700]
- [OpenCM9.04]
- [OpenCM7.0]

## [App Download](#app-download)

- [Android App Download](https://play.google.com/store/apps/details?id=com.robotis.task2)
- [iPhone App Download](https://itunes.apple.com/us/app/r-m-task2-robotis/id1031166481?mt=8)

## [App Installation](#app-installation)

{% include en/software/mobile_app/task/install.md %}

# [Menu Descriptions](#menu-descriptions)

## [Function Tabs](#function-tabs)

Workspaces are divided into Home, Programming, and Debugging.

![](/assets/images/sw/rplus_mobile/r+m_task2_1.png)

## [Start Screen](#start-screen)

At the start screen, user can select Editor or Remote Controller and set the Bluetooth Device.

![](/assets/images/sw/rplus_mobile/r+m_task2_2.png)

## [Home Tab](#home-tab)

Below is the initial screen when user selects Editor in the start screen.

1. File Menu
2. Preferences and Software Information
3. Menu Tab
4. Example Select Menu
5. Remote Controller

![](/assets/images/sw/rplus_mobile/r+m_task2_3.png)

![](/assets/images/sw/rplus_mobile/r+m_task2_4.png)

## [Programming Tab](#programming-tab)

In the Programming Tab, user can edit the task source code.

1. Source Code Area
2. Programming Tools
3. Menu
4. Device and Download

![](/assets/images/sw/rplus_mobile/r+m_task2_5.png)

![](/assets/images/sw/rplus_mobile/r+m_task2_6.png)

## [Debugging Tab](#debugging-tab)

Debugging Tab helps to debug the written code.  
(Auto connect feature has been applied for easier use)

1. Program Output Window
2. Debugging Tools
3. Virtual Remote Controller
4. Device and Terminal Control

![](/assets/images/sw/rplus_mobile/r+m_task2_7.png)

![](/assets/images/sw/rplus_mobile/r+m_task2_8.png)


# [Practice](#practice)

## [Open Example](#open-example)
1. Move to `Home` tab. (Home tab is the default location when program starts)  
2. Select the `Examples` button.  
3. Select the Product, Level, and Example Name.   
4. Confirm the selection.

  ![](/assets/images/sw/rplus_mobile/r+m_task2_61.png)

## [Create New File](#create-new-file)

1. Move to `Home` tab. (Home tab is the default location when program starts)
2. Select the `New Task` button.  

    ![](/assets/images/sw/rplus_mobile/r+m_task2_9.png)

3. Select Firmware Version(Protocol Version) and the Controller.  
4. Confirm the selection to create the new task.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_10.png)

## [Instructions](#instructions)
1. Move to `Programming` tab. (When creating a new task, Programming tab will be selected by default)
2. Select `Instructions` button.
3. Select `Loop` category.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_11.png)

4. Select `ENDLESS LOOP` and drag the instruction.
5. Drop the selected instruction where it should be inserted.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_12.png)

## [Edit Parameters](#edit-parameters)
1. Select `Instructions` button.
2. Select `Execute` category.
3. Select `LOAD` instruction.
4. Drag and drop the instruction where it should be inserted.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_13.png)

5. Double tap on the left side block of the inserted instruction.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_14.png)

6. Select `Controller Device` in the Category 1.
7. Select `Accessory Device` in the Category 2.
8. Select `Port 1` and select `Geared Motor`.
9. Confirm the selection to finish editing.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_15.png)

10. Double tap on the right side block of the instruction.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_16.png)

11. Select `Controller Constant` in the Category 1.
12. Select `Motor Value` in the Category 2.
13. Select `CCW` for rotational direction and enter `500` for the Power.
14. Confirm the selection to finish editing.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_17.png)

15. Make sure that the instruction is properly edited.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_18.png)

## [Task Download](#task-download)

1. Select `Device` button.
2. Select the Bluetooth device of the robot (If Bluetooth device has not been connected before, search the device by using `Filter` button on the right)
3. Confirm the selection and close the Device window.
4. Select `Download` button to start downloading.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_19.png)

5. When download is completed the controller executes Task (Some controllers are shut off after the download).

    ![](/assets/images/sw/rplus_mobile/r+m_task2_20.png)

## [Program Output Monitor](#program-output-monitor)

1. Move to `Debugging` tab.
2. Select `Device` button.
3. Select the Bluetooth device of the robot (If Bluetooth device has not been connected before, search the device by using `Filter` button on the right)
4. Confirm the selection and close the Device window.
5. Select `Start Terminal` button.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_21.png)

6. When robot is connected, `Program Output Monitor` and `Virtual Remote Controller` are enabled.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_22.png)

7. If `Print Screen with Line` instruction is used in the source code as shown below,

    ![](/assets/images/sw/rplus_mobile/r+m_task2_23.png)

8. New line feed will be applied in the `Program Output Monitor`.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_24.png)

## [Remote Controller](#remote-controller)

1. Move to `Home` tab. (Home tab is the default location when program starts)  
2. Select `Device` button.
3. Select the Bluetooth device of the robot (If Bluetooth device has not been connected before, search the device by using `Filter` button on the right)
4. Confirm the selection and close the Device window.
5. Tap the `Remote Controller` button.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_25.png)

6. `Buttons` mode is the default setting for the Remote Controller.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_26.png)

7. Select `Joystick` to use virtual joystick instead of directional buttons.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_27.png)

8. Select `Sensor` to use tilt sensor as a directional control.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_28.png)

# [Programming(Edit)](#programmingedit)

## [Insert/Edit Instruction](#insertedit-instruction)

1. Select `Instructions` button (or double tap the location where the instruction will be inserted).

2. Drag and drop the instruction.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_29.png)

3. The inserted instruction can be changed to other instructions by double tapping the instruction block.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_30.png)

## [Select Multiple Lines](#select-multiple-lines)

1. Drag the line number to select multiple lines.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_31.png)

2. Dragging on the selected lines will deselect them.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_32.png)

3. Tapping on the source code will cancel the line selection.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_33.png)

## [Insert/Delete Line](#insertdelete-line)

1. Select the line to insert a new line or delete the line.
2. Select `Insert(+)` button to insert a new line before the selected line.
3. Select `Delete(-)` button to delete the selected line.

  ![](/assets/images/sw/rplus_mobile/r+m_task2_34.png)

## [Enable/Disable Line](#enabledisable-line)

1. Select the line to enable or disable.
2. By tapping the `Enable/Disable` button, selected lines will be commented or uncommented.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_35.png)

3. Disabled(Commented) lines will be displayed in gray font.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_36.png)

## [Copy/Cut/Paste](#copycutpaste)

1. Select lines to copy or cut.
2. Tap on the `Additional Menu`.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_38.png)

3. Select `Copy` or `Cut` to save selected lines in the clipboard.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_37.png)

4. Select the line where saved lines to be pasted.
5. Tap on the `Additional Menu`.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_39.png)

6. Select `Paste` to insert saved lines in the clipboard.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_40.png)

7. The code will be look like the below image.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_41.png)

## [Undo/Redo](#undoredo)

1. While editing the code, `Undo` button will undo the recent change.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_42.png)

2. `Redo` button will repeat the change made by `Undo`.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_43.png)

# [Programming(Instructions)](#programminginstructions)

R+m.Task 2.0 uses identical instructions from R+Task 2.0.  
Please refer to [Programming(Instructions)] section of the R+Task 2.0 manual.

[Programming(Instructions)]: /docs/en/software/rplus2/task/#programminginstructions

# [Programming(Parameters)](#programmingparameters)

R+m.Task 2.0 uses identical parameters from R+Task 2.0.  
Please refer to [Programming(Parameters)] section of the R+Task 2.0 manual.

[Programming(Parameters)]: /docs/en/software/rplus2/task/#programmingparameters

# [Useful Tips](#useful-tips)

## [Search Variables/Functions](#search-variablesfunctions)

User can easily search and rename Variables or Functions used in the source code.

1. Select `Variables` or `Functions` button (There should be at least one variable or function to use this feature).
2. Select items to search in the `Variable List` or the `Function List`.
3. Tap the `Search` button in the below.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_44.png)

4. Select an item in the `Reference Results` to search.
5. Close the search result by tapping the `Find Reference` button.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_45.png)

6. Use `Rename` button to change the name of variable or function used in the source code.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_46.png)

## [Search Keyword](#search-keyword)

User can also find a specific object in the source code.

1. Select `Find` button.
2. Enter the term to search.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_47.png)

3. The result will be listed.
4. Select an item to move to the code line.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_48.png)

## [Grammar Check/Compile](#grammar-checkcompile)

In order to download the task code into the controller, syntax check and compile have to be done.  
When try downloading or tapping `Error` button will perform the procedure automatically.

**Syntax Check** : This process check whether the instructions are valid and compatible to the selected controller. User must correct any errors listed in the result to proceed downloading.

**Compile** : After checking the syntax, this process will convert the source code into the machine language. During this process, number of variables and callbacks, and memory usage will be checked.

![](/assets/images/sw/rplus_mobile/r+m_task2_49.png)

## [Copy Task to Android Devices](#copy-task-to-android-devices)

Task files written in the PC can be copied into Android devices.

1. Use USB cable to connect Android device to PC (Proper Android drivers have to be preinstalled on PC).
2. Go to file explorer and open the Android Device.
3. Open the `RoboPlus` folder. (If `RoboPlus` folder does not exist, create the folder manually.)
4. Copy the task file(\*.tsk) into the `RoboPlus` folder.
5. Launch the R+ m.Task 2.0 and select `Open Task` button.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_52.png)

6. Select the copied file and confirm the selection to open the file.

##  [Copy Task to iOS Devices](#copy-task-to-ios-devices)

Task files written in the PC can be copied into iOS devices.

1. Use USB cable to connect iOS device to PC (Proper drivers have to be preinstalled on PC).
2. Launch iTunes on PC.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_54_kr.gif)

3. Select the connected device from the iTunes.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_55.png)

4. Select `File Sharing` category on the left column.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_56.png)

5. Wait for a while until Applications are listed, then select `R+ mTask2` from the list

    ![](/assets/images/sw/rplus_mobile/r+m_task2_57.png)

6. Drag and dropo the task file(\*.tsk) on the document area on the right.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_58.png)

7. Launch the R+ m.Task 2.0 and select `Open Task` button.
8. Select the copied file and confirm the selection to open the file.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_60.png)

# [FAQ](#faq)

## Supported Products?

- [ROBOTIS DREAM]
- [ROBOTIS SMART]
- [ROBOTIS STEM]
- [ROBOTIS PREMIUM]
- [ROBOTIS GP]
- [ROBOTIS MINI]
- [ROBOTIS IoT]
- Robots created by the user using [CM-150], [CM-200], [CM-510], [CM-530], [CM-700], [OpenCM9.04]

## Can TSK files that were used in the previous Task 1.0 also be used on Task 2.0?

- Yes. If the TSK file is loaded with Task 2.0 and saved, it will be converted to the TSKX file so it will no longer be compatible with Task 1.0.

## The controller will not shut down after downloading a task.

- In R+ Task 2.0, downloaded task will be executed automatically. (For controllers : CM-150, OpenCM9.04, OpenCM7.0…)

## Can I use Bluetooth module in R+ Task 2.0?

- Each controller could support different Bluetooth module, so please check the compatibility.
  - [BT-110], [BT-210], [BT-410]

## The controller does not connect well.

- Restart the controller by turning it off and then on, and try again. If the problem continues, please update the controller’s firmware to the latest version.
  - [R+ Manager 1.0 Firmware Update]
  - [R+ Manager 2.0 Firmware Update]

## I do not want to see the help animation any more.

- Go to `Home Tab` > `Preferences` and uncheck the `Tutorial Animation` under the Miscellaneous.

[CM-150]: /docs/en/parts/controller/cm-150/
[CM-200]: /docs/en/parts/controller/cm-200/
[CM-510]: /docs/en/parts/controller/cm-510/
[CM-530]: /docs/en/parts/controller/cm-530/
[CM-700]: /docs/en/parts/controller/cm-700/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[OpenCM7.0]: /docs/en/parts/controller/opencm7/
[ROBOTIS DREAM]: /docs/en/edu/dream/dream1-1/
[ROBOTIS SMART]: /docs/en/edu/smart/smart1-1/
[ROBOTIS STEM]: /docs/en/edu/bioloid/stem/
[ROBOTIS PREMIUM]: /docs/en/edu/bioloid/premium/
[ROBOTIS GP]: /docs/en/edu/bioloid/gp/
[ROBOTIS MINI]: /docs/en/edu/mini/
[ROBOTIS IoT]: /docs/en/edu/iot/iot-1/
[BT-110]: /docs/en/parts/communication/bt-110/
[BT-210]: /docs/en/parts/communication/bt-210/
[BT-410]: /docs/en/parts/communication/bt-410/
[R+ Manager 1.0 Firmware Update]: /docs/en/software/rplus1/manager/#firmware-update
[R+ Manager 2.0 Firmware Update]: /docs/en/software/rplus2/manager/#firmware-update
