---
layout: archive
lang: en
ref: manipulator_h_getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/manipulator_h/getting_started/
sidebar:
  title: MANIPULATOR-H
  nav: "manipulator_h"
---

<div style="counter-reset: h1 1"></div>

# [Getting Started](#getting-started)

## [Prerequisite](#prerequisite)

- The ArmSDK is based on Window 7 OS and Visual Studio 2010.
- The ArmSDK trajectory is generated from the MotionPlay class’ instance and utilizes QueryPerformanceCounter. This requires the use of a thread, in which sharing said thread may reach to 100%.  
  It is highly recommended your PC is at least dual-core-based.
- The Numerical IK implements Damped Least Square Method to reach target by acquiring each joint’s angle. This allows joints to go from initial position to a point and then return to its initial pose.  
  This will allow you to perform tests to the Manipulator.
- Allow sufficient workspace prior to setup by clearing objects in the arm’s vicinity.
- Always ensure the Manipulator is properly fixed to the base plate prior to operations; otherwise arm movements can cause damage and physical injury.
- Supply power to the Manipulator after making sure all cables are properly connected. While powered on do not touch the cables as it may cause erroneous operations or/and damage.
- When handling the Manipulator do so carefully as not to have your fingers stuck in the frames.
- If the Manipulator operates erroneously quickly cut off power by turning the power supply off.
- While the Manipulator is in operation keep out of its workspace; ensure no objects enter the workspace during operations.

## [Preparation](#preparation)

### Power Supply
The Manipulator requires 24V for operations. Ensure the power supply is capable of supplying 24V and 15A or higher.

### 4P Cable
The 4P Cable connects the Manipulator and USB2Dynamixel.

![](/assets/images/platform/manipulator/manipulator_h_006.jpg)

### Power Cable
The power cable supplies power to the Manipulator.

![](/assets/images/platform/manipulator/manipulator_h_007.jpg)

For additional power or 4P cables contact ROBOTIS or obtain them with the specifications listed above. 

### USB2Dynamixel
The USB2Dynamixel sends ArmSDK commands to the Manipulator. Connect the USB2Dynamixel to the PC via USB hub.

![](/assets/images/platform/manipulator/manipulator_h_008.jpg)

## [Product Assembly](#product-assembly)

`Note` The content below is based on an **optional** base plate and differs from the actual base plate.
{: .notice}

![](/assets/images/platform/manipulator/manipulator_h_009.jpg)

- Rest and fix joint 1 of the Manipulator.

![](/assets/images/platform/manipulator/manipulator_h_010.jpg)

![](/assets/images/platform/manipulator/manipulator_h_011.png)

- The photo on the left is the external wiring for the arm. Label “1” shows a pair of 4P cables and power connector; these connect to joint 1 as shown on the right picture.

- Label “2” shows a 4P connector and 4 power connectors and these connect to the power expansion hub and the 4P cable connects to the extension.

![](/assets/images/platform/manipulator/manipulator_h_012.png)

![](/assets/images/platform/manipulator/manipulator_h_013.png)

![](/assets/images/platform/manipulator/manipulator_h_014.png)

![](/assets/images/platform/manipulator/manipulator_h_015.png)

- Once connections are complete fix the arm to the base plate as shown on the photo above. The joint fixed to the plate is joint 1.

![](/assets/images/platform/manipulator/manipulator_h_016.jpg)

- Connect USB2Dynamixel to the hub with 4P cable; connect another port of the 4P hub to the extension.

`Caution` Connect the USB2Dynamixel to the PC via USB hub. The USB hub acts as an isolator to protect the PC from any possible unexpected surges caused by arm action.
{: .notice--warning}

## [USB2Dynamixel Setting](#usb2dynamixel-setting)

![](/assets/images/platform/manipulator/manipulator_h_017.png)

|Communication|Description|
|:---:|:---:|
|TTL|AX, 3-pin MX; communicate with 3-pin Dynamixel|
|RS485|RX, 4-pin MX and Pro; communicate with 4-pin Dynamixel|
|RS232|CM-5, CM-510; communicate with these controllers. Communicate with other RS-232 devices|

`Note` The manipulator is based on RS-485 communications so make sure to set the dongle to 485.
{: .notice}

## [Manipulator Test](#manipulator-test)

- Test the arm with Dynamixel Wizard to check for any anomalies. DynamixelWizard is included in RoboPlus suite. RoboPlus can be downloaded from ROBOTIS home page’s Support -> Downloads(http://www.robotis.com/xe/download).  

`Caution` Do NOT download RoboPlus v2.0. Use RoboPlus v1.0 for Manipulator-H.
{: .notice--warning}

  ![](/assets/images/platform/manipulator/manipulator_h_018.jpg)

- Install and run RoboPlus; click on Dynamixel Wizard button to start Dynamixel Wizard.

  ![](/assets/images/platform/manipulator/manipulator_h_019.jpg)

### Operating the Manipulator

`Danger` Before starting Dynamixel Wizard ensure the arm is fixed to the base plate; then extend the arm. Otherwise; it may cause physical harm.
{: .notice--danger}

- USB2Dynamixel to the PC after wiring is complete. From the PC check the COM port number of USB2Dynamixel.

  ![](/assets/images/platform/manipulator/manipulator_h_020.jpg)

  ![](/assets/images/platform/manipulator/manipulator_h_021.jpg)

  ![](/assets/images/platform/manipulator/manipulator_h_022.jpg)

- Select the Port Settings tab and click on the Advanced button-> change the latency time from 16 (default) to 1.
- After changing the COM port settings supply the 24V to the arm (of course, this means wiring is complete).

`Caution` Always ensure before powering on. While power is on do not change wires; otherwise it may cause undesired operations.
{: .notice-warning}

  ![](/assets/images/platform/manipulator/manipulator_h_023.jpg)

  ![](/assets/images/platform/manipulator/manipulator_h_024.jpg)

- The picture on the left is the COM port number of USB2Dynamixel (which should be connected to the arm). Click on the   to continue

  ![](/assets/images/platform/manipulator/manipulator_h_025.jpg)

- Once connected make sure that 1000000bps box is checked and “DXL 2.0” is selected. Then click on Search. The arm’s default baud rate is 1 Mbps.

  ![](/assets/images/platform/manipulator/manipulator_h_026.jpg)

  ![](/assets/images/platform/manipulator/manipulator_h_027.jpg)

- Once search is complete the arm’s components (Dynamixel PROs) are listed on the left. Click on an individual Dynamixel PRO to display the contents of its Control Table.

  ![](/assets/images/platform/manipulator/manipulator_h_028.jpg)

  ![](/assets/images/platform/manipulator/manipulator_h_029.jpg)

- Dynamixel Pro will only move (operate) when Torque Mode is on. So always make sure the Torque Mode is on prior to sending moving commands.  
  Torque Enable is located on address number 562. A value of 1 means on and 0 means off.

  ![](/assets/images/platform/manipulator/manipulator_h_030.jpg)

  ![](/assets/images/platform/manipulator/manipulator_h_031.jpg)

  ![](/assets/images/platform/manipulator/manipulator_h_032.jpg)

  ![](/assets/images/platform/manipulator/manipulator_h_033.jpg)

- Turn ‘Torque Enable’ on to all joints. The pose of the arm will become rigid (check by applying a small force). Afterwards click on joint 6.

  ![](/assets/images/platform/manipulator/manipulator_h_034.jpg)

- Now verify the arm moves properly by changing Goal Position. Move the end effector (joint 6) +90 degrees.  
  To move joint 6 to +90 degrees set Goal Position of the Dynamixel PRO model H42-20-S300-R to 75938 or L42-10-S300-R to 1024.
- Once Goal Position has been set visually verify that joint 6 has rotated 90 degrees.
- To actually get Dynamixel PRO to move to its respective Goal Position, click on the Apply button after setting the value. If there is no movement, make sure Torque Enable is turned on (set to 1).
- Set Goal Position back to 0 to set position to its original position.

  ![](/assets/images/platform/manipulator/manipulator_h_035.jpg)

- Click on ID. Set the Goal Position to 1000 (500 for L42 model).
- To actually get Dynamixel PRO to move to its respective Goal Position, click on the Apply button after setting the value. If there is no movement, make sure Torque Enable is turned on (set to 1).
- Set Goal Position back to 0 to set position to its original position..
- Do the same procedure for joint 2 through 6.

### Goal Position Values with Respect to Rotation

- Goal Position value determines the rotational position of Dynamixel PRO.

|Model Name|Relationship between angle(deg) and position value|
|:---:|:---:|
|H54-200-S500-R<br />H54-100-S500-R|-180 ~ 180 (deg) → -251000 ~ 251000<br />![](/assets/images/platform/manipulator/manipulator_h_036.jpg)<br />![](/assets/images/platform/manipulator/manipulator_h_037.gif)|
|H42-20-S300-R|-180 ~ 180 (deg) → -151875 ~ 151875<br />![](/assets/images/platform/manipulator/manipulator_h_038.jpg)<br />![](/assets/images/platform/manipulator/manipulator_h_039.gif)|
|L54-50-S500-R|-180 ~ 180 (deg) → -125700 ~ 125700<br />![](/assets/images/platform/manipulator/manipulator_h_040.jpg)<br />![](/assets/images/platform/manipulator/manipulator_h_041.gif)|
|L54-30-S500-R|-180 ~ 180 (deg) → -144180 ~ 144180<br />![](/assets/images/platform/manipulator/manipulator_h_042.jpg)<br />![](/assets/images/platform/manipulator/manipulator_h_043.gif)|
|L42-20-S300-R|-180 ~ 180 (deg) → -2048 ~ 2048<br />![](/assets/images/platform/manipulator/manipulator_h_044.jpg)<br />![](/assets/images/platform/manipulator/manipulator_h_045.gif)|

## [Manipulator SDK](#manipulator-sdk)

- Preparation Before using Robotis Manipulator SDK.  
  The following are pre-requisites for the ArmSDK.  
  Eigen Package([http://eigen.tuxfamily.org], version 3.0.6 or Later)

- Installation Package
  - Download and unzip Eigen Package.
  - Start Visual Studio go to “Project Properties -> VC++ Directories -> Include Directories” set Eigen’s source directory.

    ![](/assets/images/platform/manipulator/manipulator_h_046.jpg)

    ![](/assets/images/platform/manipulator/manipulator_h_047.jpg)

    ![](/assets/images/platform/manipulator/manipulator_h_048.jpg)

  - Repeat procedure (i)~(ii) to include the examples and include directories.
  - Once preparations are complete press the F7 key to compile and build.


[http://eigen.tuxfamily.org]: http://eigen.tuxfamily.org
