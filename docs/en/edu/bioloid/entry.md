---
layout: archive
lang: en
ref: bioloid-entry
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/bioloid/entry/
sidebar:
  title: BIOLOID Entry
  nav: "bioloid-entry"
---

# [Introduction](#introduction)

Robots of 4 DOF can be built with Beginner Kit.  This kit is recommended for people who meet robots for the first time.

- Learning the principle of robot building
  - You can build up 14 example robots with Bioloid Beginner Kit and learn the principle of robot building.
  - From a simple barrier bar of 1 DOF to an automobile or walking droid of 4 DOF, it is possible to build the robot and edit the example programs. It will help increasing your understanding for robot programming.
  - Purchasing 4 more AX-12+ for Bioloid Beginner Kit, you can build intermediate-level robots of 8 DOF.
  - Also, purchasing 14 additional AX-12+ for Bioloid Beginner Kit and frame set for Comprehensive Kit, you can build intermediate-level robots and advanced-level robots of 18 DOF.
  - You can also create your one and only robot by designing, assembling and programming it by yourself.

# [Getting Started](#getting-started)

## [Part List](#part-list)

![](/assets/images/edu/bioloid/entry_partlist.png)

- [CM-5]
- [AX-12]
- [AX-S1]

## [Preparation](#preparation)

As shown in BIOLOID learning material, CM-5 is supposed to support existing BIOLOID software (Behavior Control Program, Motion Editor etc). Therefore, if you want to use RoboPlus software in CM-5, you need to change the firmware into other firmware which supports Roboplus. However, if you change the firmware, you would no longer be able to use the existing Bioloid software.

The new-upgraded RoboPlus is an integrated programming software which can control Robotis products.
Therefore, CM-5 based robots can be controlled by programming with RoboPlus.
The usage is as below.

1. Download the [latest version of RoboPlus].
2. Execute RoboPlus after installation.
3. Select RoboPlus Manager.
4. Connect CM-5 with the PC using serial cable.
5. Execute Firmware Wizard by pressing `Control Restoration` icon on RoboPlus Manager.

  ![Firmware-Recovery-1][img_001]

  ![Firmware-Recovery-2][img_002]

6. Select the port connected to the controller.
  Users must set manually the port connected to the controller. Finish other programs and continue the process since the controller cannot be recognized in case the port is in use.  Select the port connected to the controller and press "Find" button.

  ![Firmware-Recovery-3][img_003]

7. Turn the power of the controller off and on.
  To find the controller, the controller to be restored must be turned off and on.

  ![Firmware-Recovery-4][img_004]

8. Check the controller information.
  When the controller is found, the information of current controller and the firmware to download are appeared.  Check the model name whether the controller is connected by the user or not.  (The version of controller information is for Boot Loader, not for firmware.)

  ![Firmware-Recovery-5][img_005]

9. Start the firmware installation again.
  Press "Next" button to start firmware restoration. Please be careful not to interrupt the connection or turn the power off until it is completed.

  ![Firmware-Recovery-6][img_006]

10. Check the controller firmware re-installation result.

  ![Firmware-Recovery-7][img_007]

Executing above procedure, CM-5 can be programmed with RoboPlus. Try to make the best robot with upgraded RoboPlus.

## [Operating](#operating)
Before executing the program, the appropriate task codes and motions must be downloaded into the robot.

1. Turn on the power.
  If it is not charged, `POWER` LED does not blink. Please refer to Charging.

  ![Operating-1][img_008]

2. Make the LED on Play blink by pressing MODE button.

  ![Operating-2][img_009]

3. Press START button to execute the program.
  The LED is not blinking while the program is being executed.

  ![Operating-3][img_010]

{% include en/parts/controller/charging_cm5.md %}

# [Tutorial](#tutorial)

## [Screen Output](#screen-output)

## [Button & LED](#button-led)

## [Attacking Duck](#attacking-duck)

## [Obstacle Detecting Car](#obstacle-detecting-car)

## [Walking Droid 1](#walking-droid-1)

## [Walking Droid 2](#walking-droid-2)

## [Walking Droid 3](#walking-droid-3)

## [Converting .bpg to .tsk](#converting-bpg-to-tsk)

# [Examples](#Examples)

The following robots have less than 4 joints and the robots can be built with Beginner kit or Comprehensive Kit. Please refer to the assembly manual for Bioloid Beginner Kit and Comprehensive kit about how to assemble.
{: .notice}

## [Download Task Code](#download-task-code)

If you want to use RoboPlus program for [CM-5] (the controller used for Bioloid Beginner/Comprehensive Kits), you must update the firmware. Please refer to [Firmware Update] of RoboPlus Manager on how to update firmware.

### Preparation

1. Call the task code(*.tsk) from RoboPlus Task.
  - You can open it by double-clicking the task code file.
  - You can open it using Open File function of RoboPlus Task.
  - You can open it by dragging & dropping on RoboPlus Task.
2. Connect the PC and the Controller with [USB2Dynamixel].
3. Turn on the power of the controller.

![CM-5_to_PC-01](/assets/images/parts/controller/cm-5/cm_5_connect_pc_01.png)

### Download

1. Connect the controller before downloading the task code.
  To download the task code, the controller must be connected to the PC(Please refer to controller information for information on how to connect the controller to the PC).

2. Select the correct COM port (if you know) or else use the "Automatic Search" function  to easily find out the appropriate port. .

  ![CM-5_to_PC-02](/assets/images/parts/controller/cm-5/cm_5_connect_pc_02.png)

  If RoboPlus Task is unable to find a controller, the following error message will be shown.
  - Check if the controller is connected to the PC. (See controller information on how to connect the controller.)
  - Check if the controller is turned on.
  - Check if the correct communication port was chosen.

3. Select the download menu.

  ![CM-5_to_PC-03](/assets/images/parts/controller/cm-5/cm_5_connect_pc_03.png)

  If the program has an error, you must find the error and correct it. (See "rule check error messages")

4. Download the program.

  ![CM-5_to_PC-04](/assets/images/parts/controller/cm-5/cm_5_connect_pc_04.png)

  If the downloading fails, it will automatically try again from the beginning.

5. Execute the task code and your robot will move.
  Turn on the controller and execute the downloaded task code(Please refer to each controller information to learn how to execute the task code).

## Download Motion File

# [References](#references)

## [Replacing Fuse(CM-5)](#replacing-fuse-cm-5)

## [Dynamixel Management](#dynamixel-management)

## [Zigbee Wireless Control](#zigbee-wireless-control)

## [Control Multiple Robots](#control-multiple-robots)

[CM-5]: /docs/en/parts/controller/cm_5/
[AX-12]: /docs/en/dxl/ax/ax-12a/
[AX-S1]: /docs/en/parts/sensor/ax-s1/
[latest version of RoboPlus]: http://en.robotis.com/BlueAD/board.php?bbs_id=downloads&mode=view&bbs_no=1152561&page=1&key=&keyword=&sort=&scate=
[Firmware Update]: ???
[USB2Dynamixel]: ???
[img_001]: /assets/images/edu/bioloid/bioloid_entry_001.png
[img_002]: /assets/images/edu/bioloid/bioloid_entry_002.png
[img_003]: /assets/images/edu/bioloid/bioloid_entry_003.png
[img_004]: /assets/images/edu/bioloid/bioloid_entry_004.png
[img_005]: /assets/images/edu/bioloid/bioloid_entry_005.png
[img_006]: /assets/images/edu/bioloid/bioloid_entry_006.png
[img_007]: /assets/images/edu/bioloid/bioloid_entry_007.png
[img_008]: /assets/images/edu/bioloid/bioloid_entry_008.png
[img_009]: /assets/images/edu/bioloid/bioloid_entry_009.png
[img_010]: /assets/images/edu/bioloid/bioloid_entry_010.png
