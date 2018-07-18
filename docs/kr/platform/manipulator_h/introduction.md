---
layout: archive
lang: kr
ref: manipulator_intro
read_time: true
share: true
author_profile: false
permalink: /docs/kr/platform/manipulator_h/introduction/
sidebar:
  title: Manipulator-H
  nav: "manipulator_h"
---

# Manipulator-H

![](/assets/images/platform/manipulator/manipulator_product.gif)

# [Introduction](#introduction)

- This manual applies to the Dynamixel PRO-based Robotis Manipulator.
- All parameters in this manual are based on default values.
- The manipulator’s configuration is provided. The ArmSDK is based on Windows7 and Visual Studio 2010.
- It is strongly recommended with proficiency with Dynamixel PRO and C++.
- The units utilized in the ArmSDK are in radians (rad) and millimeters (mm).
- Modifying the wiring and components or performances not stated on this guide may result on adverse operations.
- This manual utilizes the term “arm,” “Manipulator,” and “robot” interchangeably to describe product. The guide also may refer to Dynamixel Pro actuators to simply “Dynamixel,” “servo,” “motor,” or “actuator.”

`Last Updated` : 5 November, 2014

## [Safety Information](#safety-information)

{% capture manipulator_danger_01 %}
`DANGER`

Information appearing in a DANGER concerns the protection of personnel from the immediate and imminent hazards that, if not avoided, will result in immediate, serious personal injury or loss of life in addition to equipment damage.
- Keep away from the robot while its moving..
- Do not touch with the robot with wet hands.
- Turn off power of the robot whenever robot is problematic.
{% endcapture %}

<div class="notice--danger">{{ manipulator_danger_01 | markdownify }}</div>


{% capture manipulator_warning_01 %} 
`WARNING`

Information appearing in a WARNING concerns the protection of personnel and equipment from potential hazards that can result in personal injury or loss of life in addition to equipment damage.
- Setup robot in an environment low on dust and humidity.
- The robot must always be attached to the based when powered on.
- The robot wiring must be checked prior to powering on.
- The robot connection to power supplly must be check prior to powering on.
- Do not change wiring on Robotis Manipulator while powered on.
{% endcapture %}

<div class="notice--warning">{{ manipulator_warning_01 | markdownify }}</div>
 
{% capture manipulator_caution_01 %}
`CAUTION`

Information appearing in a CAUTION concerns the protection of personnel and equipment, software, and data from hazards that can result in minor personal injury or equipment damage.
- Keep robot’s workspace clear of object.
- Ensure wiring is not tangled up on every joint.
- Make sure USB2Dynamixel and PC does not interfere with the robot’s moving
{% endcapture %}

<div class="notice--warning">{{ manipulator_caution_01 | markdownify }}</div>


## [Package Contents](#package-contents)

|Name|Quantity|
|:---:|:---:|
|Manipulator|1|
|USB2Dyanmixel|1|
|4P Cable(500mm)|2|
|Power Cable(1,200mm)|2|
|4P expansion hub|1|
|Power expansion hub|1|
|Gripper(optional)|1|
|Support(optional)|2|
|Base Plate(optional)|1|
|3x8 wrench bolt|20|
|3x12 wrench bolt|20|

## [Layout](#layout)

### Dimension of Manipulator-H

![](/assets/images/platform/manipulator/manipulator_h_001.jpg)
 
### Dimension of Manipulator-L

![](/assets/images/platform/manipulator/manipulator_h_002.jpg)
 
### Wiring

![](/assets/images/platform/manipulator/manipulator_h_003.jpg)

- The diagram above illustrates joints 1~6 connected in daisy-chain (serial) configuration with 4P Cable.
- Joint 1 (labeled as “1st”) connects to USB2Dynamixel via 4P Cable.
- USB2Dynamixel connects to PC via USB hub.
- Dynamixel Pro is powered from a a power supply via power expansion hub.
- Joints 5 and 6 (model: L42 - 10 - S300 – R) are not separately powered; instead power comes from the same 4P Cable.
- You may obtain more 4P or Power Cables via ROBOTIS or see section 2.2 Preparation - ii) Cable.
- Please refer to “2.1 Installation of Manipulator” for more info.

## [Specifications](#specifications)

|Item|Description|
|:---:|:---:|
|DOF|6 DOF|
|Payload|3kg|
|Operating voltage|24V|
|Resolution|Joint 1 : -&pi;(rad) ~ &pi;(rad) , -251000 ~ 251000 (pulse)<br />Joint 2 : -&pi;(rad) ~ &pi;(rad) , -251000 ~ 251000 (pulse)<br />Joint 3 : -&pi;(rad) ~ &pi;(rad) , -251000 ~ 251000 (pulse)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad) , -251000 ~ 251000 (pulse)<br />Joint 5 : -&pi;(rad) ~ &pi;(rad) , -151875 ~ 151875 (pulse)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad) , -151875 ~ 151875 (pulse)|
|Dynamixel Pro<br />Model Name|Joint 1, 2 : H54-200-S500-R<br />Joint 3, 4 : H54-100-S500-R<br />Joint 5, 6 : H42-20-S300-R|
|Operating Range|Joint 1 : -&pi;(rad) ~ &pi;(rad)<br />Joint 2 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 3 : -&pi;/2(rad) ~ 3&pi;/4(rad)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad)<br />Joint 5 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad)|
|Default ID|Joint 1 (ID:1), Joint 2 (ID:2), Joint 3 (ID:3),<br />Joint 4 (ID:4), Joint 5 (ID:5), Joint 6 (ID:6)|
|Motor type|Brushless DC Servo(H54 Series),<br />Coreless DC Motor(H42 Series)|
|Position sensor type|Absolute Encoder(for Homing),<br />Incremental Encoder(for Control)|
|Communications|RS485|

## [D-H Configuration](#d-h-configuration)

![](/assets/images/platform/manipulator/manipulator_h_004.jpg)

- DH Parameter

|Link|Link Length(mm)|Link Twist(rad)|Joint Offset(mm)|Joint Angle(rad)|DXL Angle(rad)|
|:---:|:---:|:---:|:---:|:---:|:---:|
|1|0|-&pi;/2|0|0|0|
|2|265.69|0|0|0|![](/assets/images/platform/manipulator/manipulator_h_eq_001.gif)|
|3|30|-&pi;/2|0|0|![](/assets/images/platform/manipulator/manipulator_h_eq_002.gif)|
|4|0|-&pi;/2|258|0|0|
|5|0|-&pi;/2|0|0|0|
|6|0|0|0|0|0|

## [Home Position](#home-position)

The diagram below shows the “home position” of the Dynamixel PROs from Robotis Manipulator.

![](/assets/images/platform/manipulator/manipulator_h_005.jpg)

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

**NOTE** : The content below is based on an **optional** base plate and differs from the actual base plate.
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

**주의** : Connect the USB2Dynamixel to the PC via USB hub. The USB hub acts as an isolator to protect the PC from any possible unexpected surges caused by arm action.
{: .notice--warning}

## [USB2Dynamixel Setting](#usb2dynamixel-setting)

![](/assets/images/platform/manipulator/manipulator_h_017.png)

|Communication|Description|
|:---:|:---:|
|TTL|AX, 3-pin MX; communicate with 3-pin Dynamixel|
|RS485|RX, 4-pin MX and Pro; communicate with 4-pin Dynamixel|
|RS232|CM-5, CM-510; communicate with these controllers. Communicate with other RS-232 devices|
 
**NOTE** : The manipulator is based on RS-485 communications so make sure to set the dongle to 485.
{: .notice}

## [Manipulator Test](#manipulator-test)

- Test the arm with Dynamixel Wizard to check for any anomalies. DynamixelWizard is included in RoboPlus suite. RoboPlus can be downloaded from ROBOTIS home page’s Support -> Downloads(http://www.robotis.com/xe/download).  

**주의** : Do NOT download RoboPlus v2.0. Use RoboPlus v1.0 for Manipulator-H.
{: .notice--warning}

  ![](/assets/images/platform/manipulator/manipulator_h_018.jpg)
 
- Install and run RoboPlus; click on Dynamixel Wizard button to start Dynamixel Wizard.
 
  ![](/assets/images/platform/manipulator/manipulator_h_019.jpg)
 
### Operating the Manipulator
 
**DANGER** : Before starting Dynamixel Wizard ensure the arm is fixed to the base plate; then extend the arm. Otherwise; it may cause physical harm.
{: .notice--danger}

- USB2Dynamixel to the PC after wiring is complete. From the PC check the COM port number of USB2Dynamixel.

  ![](/assets/images/platform/manipulator/manipulator_h_020.jpg)

  ![](/assets/images/platform/manipulator/manipulator_h_021.jpg)

  ![](/assets/images/platform/manipulator/manipulator_h_022.jpg)

- Select the Port Settings tab and click on the Advanced button-> change the latency time from 16 (default) to 1.
- After changing the COM port settings supply the 24V to the arm (of course, this means wiring is complete).

**주의** : Always ensure before powering on. While power is on do not change wires; otherwise it may cause undesired operations.
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
  Eigen Package(http://eigen.tuxfamily.org, version 3.0.6 or Later)
 
- Installation Package
  - Download and unzip Eigen Package.
  - Start Visual Studio go to “Project Properties -> VC++ Directories -> Include Directories” set Eigen’s source directory.

    ![](/assets/images/platform/manipulator/manipulator_h_046.jpg)
    
    ![](/assets/images/platform/manipulator/manipulator_h_047.jpg)
    
    ![](/assets/images/platform/manipulator/manipulator_h_048.jpg)

  - Repeat procedure (i)~(ii) to include the examples and include directories.
  - Once preparations are complete press the F7 key to compile and build.

# [Examples](#examples)

## [ArmMonitor](#armmonitor)

ArmMonitor allows viewing of a joint current position, target position, end effector’s pose, and joint parameters (Velocity, Acceleration, Position P, I, D Gain, Velocity P, I Gain). Change the values from the table below to see changes.
 
- Joint’s values table  
  Note that a press of \[, \{ key denote decrease by shown units and \}, \] denote increase by shown units.
 
![](/assets/images/platform/manipulator/manipulator_h_049.png)
 
### How to Use ArmMonitor

#### ArmMonitor01
- To start ArmMonitor01, create a new project; once created press the Ctrl + F5 keys to run.

![](/assets/images/platform/manipulator/manipulator_h_050.gif)
 
You will need to enter the COM port number and baud rate. Simply enter the values and “Succeed to open USB2Dynamixel” should appear onscreen followed by “Press any key to move first pose.” Use the keyboard to move the arm.         

![](/assets/images/platform/manipulator/manipulator_h_051.png)

The following table is a list of baud rate values and its corresponding speed; Robotis Manipulator default value is 3 (1Mbps).
 
The following table is a list of baud rate values and its corresponding speed; Robotis Manipulator default value is 3 (1Mbps).

|Baudrate Number|baudrate|
|:---:|:---:|
|0|2,400 bps|
|1|57,600 bps|
|2|115,200 bps|
|3|1,000,000 bps|
|4|2,000,000 bps|
|5|3,000,000 bps|
 
The photo below is the arm in its “arrival” pose.

![](/assets/images/platform/manipulator/manipulator_h_052.png)

![](/assets/images/platform/manipulator/manipulator_h_053.gif)

- Press the Ctrl + F5 keys simultaneously and the screen should appears like the picture above
- From ArmMonitor01 change the joint’s target position and joint parameter to move the arm.
- Use the directional keys to move cursor. Use the ‘[’ ‘{’ keys to lower values and ‘]’ ‘}’ to increase.
- From the picture (from the screen output) with the red area with “1” it shows the joints current pose (Present Value) and end effector’s pose.
- The red area with “2” shows the target pose (Goal Value) for all joints.
- The red area with “3” shows the parameters of all joints (Velocity, Acceleration, Position P Gain, I Gain, D Gain, Velocity P Gain, I Gain).
- **Values from joints 2 and 3, Calc&lt;rad&gt; and DYNAMIXEL&lt;rad&gt;, show on the red ares with “1” and “2” due to difference between point of origin and DH Configuration.**
-  Calc&lt;rad&gt; is the calculated angle from DH and DYNAMIXEL&lt;rad&gt; from the servo’s. The cursor and only control Goal Value Joint Parameter.

![](/assets/images/platform/manipulator/manipulator_h_054.gif)
 
The Goal Value of Arm의 Calc&lt;rad&gt; value (enclosed by the red frame) can be increased with the‘]’ key. The unit is (&pi;/180)rad.  
After adjusting the joint, check if the Manipulator follows.
 
#### ArmMonitor02
ArmMonitor02 allows direct control of the end effector. Control the end effector is done by  ComputeIK function where it moves each joint to its solution position (rad).
 
- EndEffector pose table

![](/assets/images/platform/manipulator/manipulator_h_055.png)
 
To setup and run ArmMonitor02 follow the same procedure as in ArmMonitor01.  
As in ArmMonitor01 you will be asked to enter COM port number and baud rate. You should also see “Succeed to open USB2Dynamixel” followed by “Press any key to move first pose.” The arm moves to its initial pose.

![](/assets/images/platform/manipulator/manipulator_h_056.png)
 
The photo below is the arm in its “arrival” pose.

![](/assets/images/platform/manipulator/manipulator_h_052.png)

![](/assets/images/platform/manipulator/manipulator_h_057.gif)

The different values of the end effector depicted from the red areas with “1” and “2” (from the screen output image above) is due to the difference of Dynamixel Pro’s Goal Position and Present Position values (gear backlash) and DH with the point of origin. **”1” shows the end effector’s pose via calculations from kinematics and “2” the actual pose**.
 
![](/assets/images/platform/manipulator/manipulator_h_058.gif)

Press the ] key to increase the end effector’s pose value by (&pi;/180)rad ; X increases by 2mm.
**Visually verify arm movement every time when changing position**.
 
#### Arm Monitor Source Description

##### cmd_process.cpp
- void DrawPage(void)

  ```cpp
  printf("//======================== Present Value of Arm =======================//\n");
  printf(" <Calc(rad)> | <DXL(unit)> | <DXL(rad)> | <EndEffector's Pose> \n");
  printf("Joint1 : | | | X(mm) : \n");
  printf("Joint2 : | | | Y(mm) : \n");
  printf("Joint3 : | | | Z(mm) : \n");
  printf("Joint4 : | | | Roll(rad) : \n");
  printf("Joint5 : | | | Pitch(rad) : \n");
  printf("Joint6 : | | | Yaw(rad) : \n");
  printf("//========================= Goal Value of Arm =========================//\n");
  printf(" <Calc(rad)> | <DXL(unit)> | <DXL(rad)> | \n");
  printf("Joint1 : | | | \n");
  printf("Joint2 : | | | \n");
  printf("Joint3 : | | | \n");
  printf("Joint4 : | | | \n");
  printf("Joint5 : | | | \n");
  printf("Joint6 : | | | \n");
  printf("//========================== Joint Parameter ==========================//\n");
  printf(" Velocity | Acceleration | Pos_P | Pos_I | Pos_D | Vel_P | Vel_I \n");
  printf("Joint1 : | | | | | | \n");
  printf("Joint2 : | | | | | | \n");
  printf("Joint3 : | | | | | | \n");
  printf("Joint4 : | | | | | | \n");
  printf("Joint5 : | | | | | | \n");
  printf("Joint6 : | | | | | | \n");
  printf("[Status] \n");
  GotoCursur(GOAL_JOINT1_ROW, CALC_ANGLE_RAD_COL);
  ```

  > the above is DrawPage code for ArmMonitor.
 
- voidGotoCursur(int row, int col)

  ```cpp
  COORD pos={col, row};
  SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), pos);
  ```

  > This allows the cursor to jump between rows and columns.


These 4 functions allows the directional keys to control cursor location.
- void MoveUpCursor()
- void MoveDownCursor()
- void MoveLeftCursor()
- void MoveRightCursor()

- void UpDownValue(int dir)

  ```cpp
  giOldRow = giRow;
  giOldCol = giCol;
  GotoCursur(STATUS_ROW, STATUS_COL);
  printf(" ");
  if(giRow <= GOAL_JOINT6_ROW)
  UpDownGoalValue(dir);
  else if((giRow > GOAL_JOINT6_ROW) && (giRow <= PARAMETER_JOINT6_ROW))
  UpDownJointParameter(dir);
  WriteValue();
  GotoCursur(giOldRow, giOldCol);
  giRow = giOldRow;
  giCol = giOldCol;
  ```

  > UpDownValue allows cursor to increase/decrease values.
 
- void initialize(void)  
  initialize() function described below.
  
  ```cpp
  gpArmComm = new Pro_Arm_Comm_Win()
  ```
  
  > gpArmComm is a class of Pro_Arm_Comm_Win. Pro_Arm_Comm_Win includes ID and baud num-related aspects.
  
  ```cpp
  gpArmComm->DXL_Set_Init_Param(Port, Baud)
  ```

  > Sets Port Number  Baudrate from pointer
 
- gpRobotisArm->AddJoint
  - double LinkLength
  - double LinkTwist
  - double JointOffset
  - double JointAngle
  - double MaxAngleInRad
  - double MinAngleInRad
  - int MaxAngleValue
  - int MinAngleValue
  - double MaxAngleLimitInRad
  - double MinAngleLimitInRad
  - unsigned int Dynamixel_ID

  > Input each joint’s DH joint parameters.

  ```cpp 
  gpArmComm->Arm_ID_Setup(gpRobotisArm->GetArmIDList())
  ```

  > From AddJoint rearrange ID List.
 
  ```cpp
  gpArmKinematics = new Kinematics(gpRobotisArm)
  ```

  > gpRobotisArm->AddJoint (RobotInfo Class) generates Kinematics Class.
 
  ```cpp
  gpArmKinematics->SetMaximumNumberOfIterationsForIK(60)
  ```

  > This function calculates the IK’s max number of iterations. In this case 60.
   
  ```cpp
  gpArmKinematics->SetConvergenceCondition(0.001, 5.0)
  ```

  > Sets convergence for IK. 1st value to determine solution; second value maximum allowed.
   

  ```cpp
  gvdGoalCalculationAngleRad.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Setup target pose value (rad).
   
  ```cpp
  gvdRealCalculationAngleRad.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Current pose value (rad).
   
  ```cpp
  gvdGoalDynamixelAngleRad.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Target joint’s position value (rad)
   
  ```cpp
  gvdRealDynamixelAngleRad.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Actual joint’s position value (rad).
   
  ```cpp
  gviGoalDynamixelAngleUnit.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Actual joint’s target position value (value).
   
  ```cpp
  gviRealDynamixelAngleUnit.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Actual joint’s position value.(value).
   
  ```cpp
  gviPositionPGain.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Position P Gain value.
   
  ```cpp
  gviPositionIGain.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Position I Gain value.
   
  ```cpp
  gviPositionDGain.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Position D Gain value.
   
  ```cpp
  gviVelocityPGain.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Velocity P Gain value.
   
  ```cpp
  gviVelocityIGain.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Velocity I Gain value.
   
  ```cpp
  gviDynamixelVelocity.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Velocity value.
   
  ```cpp
  gviDynamixelAcceleration.resize(gpRobotisArm->GetRobotInfo()->size())
  ```

  > Acceleration value
   
  ```cpp
  gvdGoalCalculationAngleRad = gpArmKinematics->GetCurrentAngle();
  gvdRealCalculationAngleRad = gpArmKinematics->GetCurrentAngle();
  ```

  > From gpArmKinematics (mCurrentAngle) current pose value initialize gvdGoal CalculationAngleInRad and gvdRealCalculationAngleInRad.
   
  ```cpp
  gvdAngleGapCalcandDynamixelRad.resize(gpRobotisArm->GetRobotInfo()->size());
  gvdAngleGapCalcandDynamixelRad<< 0.0, ML_PI_2 - 6.4831 * ML_PI/ 180.0, ML_PI_4 + 6.4831 * ML_PI/ 180.0, 0.0, 0.0, 0.0;
  ```

  > **This function has been introduced due to the differences between point of origin and actual joints’ point of origin from the DH Configuration**.
  Once the size of angle adjustment has been assigned per joint enter the difference between point of origin and the joint actual point of origin.
   
  ```cpp
  gvdGoalDynamixelAngleRad<<0.0, ML_PI/4.0, -ML_PI/4.0, 0.0, -ML_PI/4.0,0.0;
  ```

  > GoalDynamixelAngleRad is the initial pose default values.
   
  ```cpp
  gviPositionPGain.fill(DEFAULT_POSITION_P_GAIN);
  gviPositionIGain.fill(DEFAULT_POSITION_I_GAIN);
  gviPositionDGain.fill(DEFAULT_POSITION_D_GAIN);
  ```

  > Position P, I, D Gain functions. Default P gain value is 64; I and D Gain are 0. The .fill contains every joint’s PID values individually.
   
  ```cpp
  gpArmComm->Arm_Torque_On();
  ```

  > This function gets initialized before moving the arm to its initial pose.
   
  ```cpp
  gpArmComm->Arm_Set_Position_PID_Gain(DEFAULT_POSITION_P_GAIN,DEFAULT_POSITION_I_GAIN,DEFAULT_POSITION_D_GAIN);
  ```

  > Sets the manipulator joints’ PID gain values..
   
  ```cpp
  gpArmTrajectory = new TrajectoryGenerator(gpArmKinematics)
  gpArmTrajectory->Set_P2P(gvdRealDynamixelAngleRad-gvdAngleGapCalcandDynamixelRad,gvdGoalDynamixelAngleRad-gvdAngleGapCalcandDynamixelRad,5.0, 1.0);
  ```

  > The generated Kinematics, StartPose, EndPose, TotalTime, AccelTime get inputted into the trajectory. Trajectory is generated via P2P. The StartPose is the current pose and EndPose is ArmMonitor’s initial pose. TotalTime is 5.0sec where AccelTime is 1.0sec. **For more information on trajectory generation, please go to 4.2 How to Program and 6.3 MotionEngine’s Trajectory Generator**.
   
  ```cpp
  gpMotionPlayer = new MotionPlay(gpArmKinematics, gpArmTrajectory);
  ```

  > MotionPlay’s CurrentTime, ElapsedTime get initialized and setp up MotionProfile. These are required variables for kinematics and trajectory’s motion.
   
  ```cpp
  gpMotionPlayer->Set_Time_Period(5);
  ```

  > Motion’s time period in 5msec.
   
  ```cpp
  _tempMotionTimer.Start();
  gvdGoalCalculationAngleRad = gpMotionPlayer->NextStep(&ErrorStatus);
  gvdGoalDynamixelAngleRad = gvdGoalCalculationAngleRad + gvdAngleGapCalcandDynamixelRad;
  gviGoalDynamixelAngleUnit = gpRobotisArm->Rad2Value(gvdGoalDynamixelAngleRad);
  CommResult = gpArmComm->Arm_Set_JointPosition(gviGoalDynamixelAngleUnit);
  gvdGoalCalculationAngleRad = gpMotionPlayer->NextStep(&ErrorStatus);
  gvdGoalDynamixelAngleRad = gvdGoalCalculationAngleRad + gvdAngleGapCalcandDynamixelRad;
  _tempMotionTimer.Stop();
  _tempMotionTimer.Wait(Period ㅡ _tempMotionTimer.GetElapsedTime());
  ```

  > The functions above have set motion time periods where functions are performed via while loop during their duration.  
  First, the set Control Time Period gets matched.

  ```cpp
  _tempMotionTimer.Start();
  ...
  ...
  _tempMotionTimer.Stop();
  _tempMotionTimer.Wait(Period ㅡ _tempMotionTimer.GetElapsedTime());
  ```

  > Measure elapsed start and stop time then subtract its difference with elapsed calculated time in set Control Time Period(5msec in this case).  
  The target pose from the current step obtained from the algorithm below.

  ```cpp
  gvdGoalCalculationAngleRad = gpMotionPlayer->NextStep(&ErrorStatus);
  gvdGoalDynamixelAngleRad = gvdGoalCalculationAngleRad + gvdAngleGapCalcandDynamixelRad;
  gviGoalDynamixelAngleUnit = gpRobotisArm->Rad2Value(gvdGoalDynamixelAngleRad);
  CommResult = gpArmComm->Arm_Set_JointPosition(gviGoalDynamixelAngleUnit);
  gvdGoalCalculationAngleRad = gpMotionPlayer->NextStep(&ErrorStatus);
  gvdGoalDynamixelAngleRad = gvdGoalCalculationAngleRad + gvdAngleGapCalcandDynamixelRad;
  ```

  > First, NextStep gets the current step’s target angles, which are from the D-H Configuration. However, the actual Dynamixel PRO start point and the D-H Configuration’s differ.  
  This difference is taken into account and each joint Goal Position Value is set again with Rad2Value, the resulting Arm_Set_JointPosition moves the manipulator.  
  If successful, the manipulator’s communications Arm_Set_JointPosition returns a value of 1.
   
  ```cpp
  gvdRealDynamixelAngleRad = gpRobotisArm->Value2Rad(gviRealDynamixelAngleUnit);
  gvdRealCalculationAngleRad = gvdRealDynamixelAngleRad - gvdAngleGapCalcandDynamixelRad;
  ```

  > After motion is complete it print’s the joint’s actual pose(rad) and calculated pose(rad).
   
  ```cpp
  gpArmKinematics->Forward(gvdRealCalculationAngleRad, &gRealPose);
  gpArmKinematics->Forward(gvdGoalCalculationAngleRad, &gGoalPose);
  ```

  > Factor’s current angle and goal angle to Forward Kinematics. The end effectot’s actual and goal pose (gRealPose, gGoalPose) can be assigned.
   
  ```cpp
  gpArmComm->Arm_Set_JointAcceleration(DEFAULT_JOINT_ACCELERATION);
  gviDynamixelAcceleration.fill(DEFAULT_JOINT_ACCELERATION);
  ```

  > Sets every joint’s acceleration value individually. DEFAULT_JOINT_ACCELERATION has 4 values
   
  ```cpp
  gpArmComm->Arm_Set_JointVelocity(DEFAULT_JOINT_VELOCITY);
  gviDynamixelVelocity.fill(DEFAULT_JOINT_VELOCITY);
  ```

  > Sets every joint’s velocity value individually. DEFAULT_JOINT_VELOCITY 9000 values.
   
  ```cpp
  void UpDownGoalValue(int dir);
  void UpDownJointParameter(int dir);
  void UpDownValue(int dir);
  ```

  > UpdownGoalValue allows change in goal pose, UpDownJointParameter allows changes to  joint’s parameters (Velocity, Acceleration, Position P, I, D Gain,  Velocity P,  I Gain). UpDownValue combines both functions.

## [SimplePtoP](#simpleptop)

**WARNING** : Product may move fast with this example. When testing this example keep a safe distance while able to cut power off in case of undesired operation.
{: .notice--warning}

SimplePtoP is the end effector’s move point (from P1 to P2).
 
### How to Use SimplePtoP
To start SimplePtoP follow the same procedure for ArmMonitor. Then press the Ctrl + F5 keys to run.

![](/assets/images/platform/manipulator/manipulator_h_059.jpg)

You will be asked for COM port number and baud rate.  
If succeeded then you will see a ‘Succeed to open USB2Dynamixel’ followed by ‘Press any key to move first pose.' Press a key to move the arm to its initial pose.  
Then press a key to begin P2P Motion. The photo below is the arm in its initial pose.

![](/assets/images/platform/manipulator/manipulator_h_060.png)

![](/assets/images/platform/manipulator/manipulator_h_061.jpg)

SimplePtoP displays the joints’ pose(rad). In SimplePtoP prssing the 'p' or ‘P' will cause motion to pause. Press the ESC key to end.
 
### SimplePtoP Source Description

```cpp
vecd P1, P2;
P1.resize(RobotisArm.GetRobotInfo()->size());
P2.resize(RobotisArm.GetRobotInfo()->size());
```

> P1, P2 sets every joint’s position.
 
```cpp
P1.fill(0.0);
P1 -= gvdAngleGapCalcandDynamixelRad;
P2.fill(0.5);
P2 -= gvdAngleGapCalcandDynamixelRad;
```

> P1.fill, P2.fill input every joint’s position(rad) individually. Differences between DH Configuration’s point of origin and actual point of origin are taken into consideration so P1 and P2 are to be adjusted accordingly.
 
```cpp
ArmComm.Arm_Set_Position_PID_Gain(64, 0, 0);
```

> Joint’s Position P, I, and D gain values.respectively.
 
```cpp
ArmComm.Arm_Set_JointVelocity(0);
```

> Joint’s velocity value .0 denotes max velocity.
 
```cpp
ArmComm.Arm_Set_JointAcceleration(0);
```

> Joint’s acceleration value .0 denotes max velocity.
 
```cpp
ArmTrajectory.ClearMF();
```

> MotionProfile clears the set space..
 
```cpp
ArmTrajectory.Set_P2P(P1, P2, 10.0, 0.5);
```

> Sets P1, P2(Start, EndPose). In this case P1 is 0.0 rad and P2 is 0.5 rad. Trajectory is from P1 to P2
 
```cpp
ArmTrajectory.Set_P2P(P2, P1, 10.0, 0.5);
```

> Sets P1, P2(Start, EndPose). In this case P1 is 0.0 rad and P2 is 0.5 rad. Trajectory is from P2 to P1
 
```cpp
MotionPlayer.All_Info_Reload();
```

> MotionProfile calls Info(Robot, Kinematics, Trajectory).
 
```cpp
MoionPlayer.Initialize();
```

> MotionProfile, Step, are initialized.
 
```cpp
MotionPlayer.Set_Time_Period(DEFAULT_Ctrl_TIME_PERIOD);
```

> Sets time period. For value lesser than 0 then a default value (=8) gets inputted.

## [SimpleIK](#simpleik)

**WARNING** : Use of this example may pose safety risks. When testing the example keep a safe distance while able to cut power off in case of undesired operation.
{: .notice--warning}

- Allows operation of end effector’s pose via position(X, Y, Z) and orientation(Roll, Pitch, Yaw). The keys for SimpleIK are q, w, e, r, t, y and a, s ,d ,f, g, h.
 
- EndEffector Pose table

|Control EndEffector|Position -> +5mm<br />orientation -> +(3&pi;/180)rad|Position -> -5mm<br />orientation -> -(3&pi;/180)rad|
|:---:|:---:|
|Position X|q|a|
|Position Y|w|s|
|Position Z|e|d|
|Orientation Roll|r|f|
|Orientation Pitch|t|g|
|Orientation Yaw|y|h|
 
### How to Use SimpleIK
To start SimpleIK start a new project just like SimplePtoP. Then press the Ctrl + F5 ekys to begin.

![](/assets/images/platform/manipulator/manipulator_h_062.jpg)
 
In SimpleIK you will be asked for COM port and baud rate numbers. If succeeded you will see a 'Succeed to open USB2Dynamixel' followed by ‘Press any key to move first pose.' Press a key to begin.
The arm moves to its initial pose as shown below.

![](/assets/images/platform/manipulator/manipulator_h_052.png)

![](/assets/images/platform/manipulator/manipulator_h_063.jpg)
 
This windows pops up after the arms moves to its initial pose. The values printed are the joints’ angles(rad). Press the keys(ex : q, w....) to move the end effector.
 
![](/assets/images/platform/manipulator/manipulator_h_064.jpg)
 
SimpleIK q key control the 3rd value.  
Q controls the end effector position (X) by increasing delta(5mm)amounts.  
**Visually verify arm movement every time when changing position.**

![](/assets/images/platform/manipulator/manipulator_h_065.jpg)

Press the q and r keys 3 times each. The r key controls the end effector’s roll. The orientation (Roll, Pitch, Yaw) change by (3&pi;/180)rad per keystroke.  
**Visually verify arm movement every time when changing position.**

### SimpleIK Source Description

```cpp
if(temp == 'q')
{
  DesiredPose = CurrentPose;
  DesiredPose.x += delta;
  ArmKinematics.ComputeIK(DesiredPose, &angle_rad, angle_rad, &ErrorStatus);
  if(ErrorStatus == ARMSDK_NO_ERROR)
  {
    cout<<"Answer"<<endl;
    cout<<angle_rad<<endl<<endl;
    ArmComm.Arm_Set_JointPosition(RobotisArm.Rad2Value(angle_rad + gvdAngleGapCalcandDynamixelRad));
  }
  else if(ErrorStatus & ARMSDK_ACCEPTABLE_ERROR)
  {
    cout<< "No IK solution" <<endl;
    cout<< "But the calcuation result is acceptable" <<endl;
    char answer;
    while(true)
    {
      cout<< "Do you want make the Robot move? (Y/N)";
      cin >> answer;
      if((answer == 'y') || (answer == 'n') || (answer == 'Y') || (answer == 'N'))
        break;
      else
        cout<< "Invaild Answer"<<endl;
    }
    if((answer == 'y') || (answer == 'Y') )
      ArmComm.Arm_Set_JointPosition(RobotisArm.Rad2Value(angle_rad + gvdAngleGapCalcandDynamixelRad));
    else
      continue;
  }
  else
  {
    cout<< "No IK Solution" <<endl;
    continue;
  }
  ArmKinematics.Forward(angle_rad, &CurrentPose);
}
```

> The code shows that by pressing the q key the program runs. A press of q moves the end effector pose in the (X) coordinate by delta (5mm).  
> If there are no errors the end effector will move according to keystroke. All joints are in radians.
> Press the 'q‘ key to to goal pose by X position in delta incrememts.
         
Despite having errors and not being able to get the IK moving can be allowed. If 'Do you want make the Robot move? (Y/N)' appears onscreen press the y key to move the end
effector in the X coordinate by +5mm. Then the joints pose(rad) are displayed.
 
**WARNING** : Product may go to pose fast after pressing the Y key posing a safety risk. When testing the example keep a safe distance while able to cut power off in case of undesired operation.
{: .notice--warning}
 
When error is too large and IK is unrealizable 'No IK Solution‘ will be displayed the end effector will remain as is.
The sample code from above is broken down below.
 
```cpp
ArmKinematics.ComputeIK(DesiredPose, &angle_rad, angle_rad, &ErrorStatus);
```

All joints set to a desired pose by taking input from DesiredPose and angle_rad. Once DesiredPose values go to CurrentPose then the arm moves in X coordinate and DesirePose gets set again. angle_rad is CurrentPose’s consistent joints  angles. IK’s solution for desired pose joint angles and &angle_rad get set. &ErrorStatus is the error sent to Dynamixel.
 
```cpp
ArmComm.Arm_Set_JointPosition(RobotisArm.Rad2Value(angle_rad + gvdAngleGapCalcandDynamixelRad));
```

> The ComputeIK function sets an array for joint position in &angle_rad.
 
```cpp
ArmKinematics.Forward(angle_rad, &CurrentPose);
```
> Once moved to desired pose angle_rad(array) gets the end effector’s pose and runs forward kinematics; then CurrentPose sets the pose. This function returns the end effectors transform matric (4x4).
 
```cpp
else if(temp == 'r')
{
  DesiredPose = CurrentPose;
  matd DesiredRotation = Algebra::GetOrientationMatrix(delta_angle_rad, 0.0, 0.0) *
      Algebra::GetOrientationMatrix(CurrentPose.Roll, CurrentPose.Pitch, CurrentPose.Yaw);
  vecd DesiredRPY = Algebra::GetEulerRollPitchYaw(DesiredRotation);
  DesiredPose.Roll = DesiredRPY(0);
  DesiredPose.Pitch = DesiredRPY(1);
  DesiredPose.Yaw = DesiredRPY(2);
  ArmKinematics.ComputeIK(DesiredPose, &angle_rad, angle_rad, &ErrorStatus);
  if(ErrorStatus == ARMSDK_NO_ERROR)
  {
    cout<<"Answer"<<endl;
    cout<<angle_rad<<endl<<endl;
    ArmComm.Arm_Set_JointPosition(RobotisArm.Rad2Value(angle_rad + gvdAngleGapCalcandDynamixelRad));
  }
  else if(ErrorStatus & ARMSDK_ACCEPTABLE_ERROR)
  {
    cout<< "No IK solution" <<endl;
    cout<< "But the caluation result is acceptable" <<endl;
    char answer;
    while(true)
    {
      cout<< "Do you want make the Robot move? (Y/N)";
      cin >> answer;
      if((answer == 'y') || (answer == 'n') || (answer == 'Y') || (answer == 'N'))
        break;
      else
        cout<< "Invaild Answer" <<endl;
    }
    if((answer == 'y') || (answer == 'Y') )
      ArmComm.Arm_Set_JointPosition(RobotisArm.Rad2Value(angle_rad + gvdAngleGapCalcandDynamixelRad));
    else
      continue;
  }
  else
  {
    cout<< "No IK Solution"<<endl;
    continue;
  }
  ArmKinematics.Forward(angle_rad, &CurrentPose);
}
```

> The goal pose runs IK my moving the roll gets increased by delta(rad). The end effector moves to whatever the IK has solved and displays the joint poses(rad).
> Despite having errors and not being able to get the IK moving can be allowed. If 'Do you want make the Robot move? (Y/N)' appears onscreen press the y key to turn the end effector in the roll axis by delta_angle_rad. Then the joints pose(rad) are displayed.

A roll (roll-only) delta is ( delta_angle_rad = (3&pi;/180)rad)  
When error is too large and IK is unrealizable 'No IK Solution‘ will be displayed the end effector will remain as is.  
The sample code from above is broken down below. Press the r key to move the roll by delta_angle_rad.  
The desired rotation matrix can then be obtain with the following

![](/assets/images/platform/manipulator/manipulator_h_066.gif)

Where the code is shown below.
 
```cpp
matd DesiredRotation = Algebra::GetOrientationMatrix(delta_angle_rad, 0.0, 0.0)
  *Algebra::GetOrientationMatrix(CurrentPose.Roll, CurrentPose.Pitch, CurrentPose.Yaw);
```

> The CurrentPose’s Orientation roll increase by delta_angle_rad GoalPose(DesiredRotation).
 
```cpp
vecd DesiredRPY = Algebra::GetEulerRollPitchYaw(DesiredRotation);
```

> DesiredRotation’s roll, pitch, and yaw.

## [SimpleTorqueFK](#simpletorquefk)

Turns the Manipulator joints’ torque on/off. When torque goes off→on Forward Kinematics runs and putputs all joints pose(rad) and end effector’s position and orientation.
 
### How to Use SimpleTorqueOnOffandFK
To start SimpleTorqueOnOffandFK start a new project just like SimplePtoP. Then press the Ctrl+F5 keys to begin.SimpleTorqueOnOffandFK.

![](/assets/images/platform/manipulator/manipulator_h_067.jpg)
 
Input the COM port and baud rate numbers. If succeeded you will see a 'Succeed to open USB2Dynamixel;' then torque gets turned off.
Press the Enter key turn torque on and the arm’s joints pose(rad) and end effector’s pose(rad) will be displayed (joints 1 through 6).
 
![](/assets/images/platform/manipulator/manipulator_h_068.jpg)

![](/assets/images/platform/manipulator/manipulator_h_069.jpg)

Press Enter again to turn torque off and it will display 'Torque Off.'
 
Press the Enter key once again to turn torque on and the values be displayed again.
 
### SimpleTorqueOnOffandFK Source Description

```cpp
while(true)
{
  char temp = _getch();
  if(temp == 27)
  break;
  else if(temp == 13)
  {
    if(gbArmTorque)
    {
      ArmComm.Arm_Torque_Off();
      std::cout<<"Torque Off"<<std::endl;
      gbArmTorque = false;
    }
    else
    {
      ArmComm.Arm_Torque_On();
      cout<<"Torque On"<<endl;
      if(ArmComm.Arm_Get_JointPosition(&angle_unit) != COMM_RXSUCCESS)
      {
        printf("Communication Error Occurred\n");
      }
      cout<<"JointAngle is"<<endl;
      angle_rad = RobotisArm.Value2Rad(angle_unit);
      cout<< angle_rad - gvdAngleGapCalcandDynamixelRad <<endl<<endl;
      cout<<"Angle of Dynamixel is"<<endl;
      angle_rad = RobotisArm.Value2Rad(angle_unit);
      cout<< angle_rad <<endl<<endl;
      cout<<"EndEffector's Pose is"<<endl;
      Pose3D CurrentPose;
      ArmKinematics.Forward(angle_rad - gvdAngleGapCalcandDynamixelRad, &CurrentPose);
      cout<<"x = "<<CurrentPose.x <<endl;
      cout<<"y = "<<CurrentPose.y <<endl;
      cout<<"z = "<<CurrentPose.z <<endl;
      cout<<"roll = "<<CurrentPose.Roll <<endl;
      cout<<"pitch = "<<CurrentPose.Pitch <<endl;
      cout<<"yaw = "<<CurrentPose.Yaw <<endl<<endl;
      gbArmTorque = true;
    }
  }
  else
    continue;
}
```

> The program aborts without starting by pressing the Esc key.
          
While the program is running press the Enter key to toggle torque between on and off. **When torque gets turned on the joints and end effector pose get outputted onscreen**. This happens with every “on” state.
 
Press the Esc key then Enter key and the arm remains as is.
 
The sample code from above is broken down below. The joint angles and Dynamixel angles may not be the same so it must be taken into consideration. **Angle of Dynamixel is the output of the actual angle of Dynamixel**.

# [Manipulator SDK Programming](#manipulator-sdk-programming)

## [SDK Description](#sdk-description)

### RobotInfo
When building Manipulator at ARM SDK, you may use the Addjoint function after generating Instance of RobotInfo Class.  
AddJoint gets values from D-H Parameter and actuator’s max and min turn angle in rad and value as well as actuator ID number (min and max turn angles may not be the same as joint angle limits).
 
### Kinematics
Forward Kinematics(FK), Inverse Kinematics(IK) can be calculated once the instance for kinematics class is generated. Kinematics class get the instance from RobotInfo class.  
ComputeIK’s factor’s the pose from end effector and joint values, as well as, initial joint angle and error for IK. The result is joint angles when the returned error status is not 0 then the IK is not properly solved.

![](/assets/images/platform/manipulator/manipulator_h_070.png)

The Roll(&phi;), Pitch(&theta;) and Yaw(&psi;) are calculated as R<sub>x</sub>(&phi;), R<sub>y</sub>(&theta;), R<sub>z</sub>(&psi;) in the rotation transformation matrix. This is to be taken into consideration when entering the pose for ComputeIK.
 
### Trajectory Generating
The TrajectoryGenerator class generates an instance for the arm’s trajectory. The SDK’s  Point to Point, Linear, and Circular can generate a trajectory. For arm-only trajectory then only Set_PTP, Set_LIN, Set_Circular; for the gripper then Set_PTPwithHand, Set_LINwithHand, Set_CIRCwithHand.
 
### Velocity Profile
The SDK’s Velocity Profile does not take max velocity and max acceleration into consideration in the Trapezoidal Velocity Profile. The initial and final velocity are always set to 0. The following methods generate velocity profile in Joint Space and Cartesian Space, where both are independent of each other.
 
![](/assets/images/platform/manipulator/manipulator_h_071.png)
 
### Set_PTP
The Set_PTP function determines 2 poses for the manipulator (initial and final) by factoring in Trapezoidal Velocity Profile and receives velocity time and total time. Initial and final pose are in rad and joint angle in mm or rad (x, y, z, roll, pitch, yaw). When generating the trajectory it is recommended to factor in joint angles.
 
### Set_LIN
The Set_LIN function generates a 3-point coordinates for the robot’s straight trajectory. This factors in initial and final pose for Linear Euler Interpolation for orientation.
 
### Set_CIRC
The Set_CIRC function generates a 3-point coordinates for the robot’s circular trajectory. This factors in initial and final pose. It sets a point of origin in the area and proceeds to trajectory via MotionPlay and vector generation.
 
![](/assets/images/platform/manipulator/manipulator_h_072.png)

![](/assets/images/platform/manipulator/manipulator_h_073.png)

![](/assets/images/platform/manipulator/manipulator_h_074.png)

### Trajectory Following
When moving by the generated trajectory from TrajectorGenerator class’s instance just use NextStep function from MotionPlay. MotionPlay class accounts trajectoryGenerator class.  
The control period from MotionPlay default value is 8ms but can be changed with SetTimePeriod. If TimePeriod is 0 then 8ms default value is applied.
 
### Pro_Arm_Comm_Win
Pro_Arm_Comm_Win utilizes DYNAMIXEL 2.0 Protocol from the Windows version of DYNAMIXEL SDK. Pro_Arm_Comm_Win’s functions utilizes DYNAMIXEL Pro’s control (i.e. read/write Control Table values).  
This is useful when writing separate code.

## [SDK Flowchart](#sdk-flowchart)

![](/assets/images/platform/manipulator/manipulator_h_075.jpg)

# [Firmware Recovery](#firmware-recovery)

When Dynamixel detection fails ensure is properly wired. If problems persists **restore Dynamixel firmware** (shown below).
 
**WARNING** : After firmware restoration you will need to set ID and baud rate values again. Always make sure to set USB2Dynamixel switch to “485.”
{: .notice--warning}
 
1. Restoring firmware
  - From Dynamixel Wizard click on the  icon to begin.
  - Select the corresponding COM port number for USB2Dynamixel.

    ![](/assets/images/platform/manipulator/manipulator_h_076.jpg)
 
2. Firmware restore process steps explained.

    ![](/assets/images/platform/manipulator/manipulator_h_077.jpg)
 
3. Always connect one Dynamixel at a time.
 
    ![](/assets/images/platform/manipulator/manipulator_h_078.jpg)
 
4. Pick the COM port number
  - With an incorrect number Dynamixel cannot be automatically detected. Always make sure to get the port number right.
  - Click on Search.

    ![](/assets/images/platform/manipulator/manipulator_h_079.jpg)
 
5. Disconnect and connect Dynamixel
  - The Next button should become clickable

    ![](/assets/images/platform/manipulator/manipulator_h_080.jpg)
 
6. Upon successful detection the Next button is clickable

    ![](/assets/images/platform/manipulator/manipulator_h_081.jpg)

7. Pick the right model
  - Pick the right type from the list. If not it may result in problems

    ![](/assets/images/platform/manipulator/manipulator_h_082.jpg)
    
    ![](/assets/images/platform/manipulator/manipulator_h_083.jpg)
    
    ![](/assets/images/platform/manipulator/manipulator_h_084.jpg)
 
8. During restoration
  - While restoring, the LED will blink. Do not cut power off during this stage.

    ![](/assets/images/platform/manipulator/manipulator_h_085.jpg)
    
    ![](/assets/images/platform/manipulator/manipulator_h_086.jpg)

**All Control Table settings are set to default values.**

# [References](#references)

## [AMSDK Define](#armsdk-define)

### Pose3D

- Data Fields
  - double x, y, z
  - double Roll, Pitch, Yaw
- Description
  - Position(x,y,z) and Orientation(Roll, Pitch, Yaw) elements

### timeprofile

- Data Fields
  - double ta, tc, td, totaltime
  - double a0[3], a1[3], a2[3]
  - double distance, distance1
  - int Method
- Description
  - Trapezoidal Velocity Profile’s elements
  - distance1 only used in circular trajectory.

### MotionPose

- Data Fields
  - vecd StartPose, EndPose
  - Pose3D StartPose3D, ViaPose3D, EndPose3D
  - Position3D CenterPosition
  - int Method
- Description
  - Declaration of manipulator step’s StartPose, EndPose and trajectory method
  - ViaPose and CenterPosition for circular trajectory

## [ARMSDK Math](#armsdk-math)

### static matd GetOrientationMatrix(double Roll, double Pitch, double Yaw)

- Parameter
  - double Roll, double Pitch, double Yaw
- Returns
  - 3 x 3 Rotation Matrix
- Description
  - orientation(Roll, Pitch, Yaw) input
  - 3 x 3 orientation matrix output
 
### static matd GetTransformMatrix(double Roll, double Pitch, double Yaw, double x, double y, double z)

- Parameter
  - double Roll, double Pitch, double Yaw
  - double x, double y, double z
- Returns
  - 4 x 4 Transformation Matrix
- Description
  - orientation(Roll, Pitch, Yaw), Position(X, Y, Z) input
  - 4 x 4 transform Matrix output
 
### static vecd rot2omega(mat3d Rerr)

- Parameter
  - Rotation Matrix
- Returns
  - angular velocity array
- Description
  - rotation matrix gets input and outputs velocity array
 
### static vecd ConvertRad2Deg(vecd q)

- Parameter
  - radian Array
- Returns
  - Degree Array
- Description
  - (rad) gets input, change to (value) and return
 
### static vecd GetEulerRollPitchYaw(matd T)

- Parameter
  - 3 x 3 rotation Matrix or 4 x 4 Transformation Matrix
- Returns
  - 3 x 1 array (Roll, Pitch, Yaw)
- Description
  - vecd rpy(3);
  - rpy(0) = atan2( T(2,1), T(2,2));
  - rpy(1) = atan2(-T(2,0), sqrt(T(2,1)\*T(2,1) + T(2,2)\*T(2,2)) );
  - rpy(2) = atan2( T(1,0), T(0,0));

## [MotionEngine](#motionengine)

### Error.h

#### void ErrorCheck(int Error)
- Parameter
  - int Error
- Return
  - void
- Description
  - No error(ARMSDK_NO_ERROR 0x00)
  - IK solution does not exist(ARMSDK_NO_IK_SOLUTION 0x01)
  - No IK solution and allowable error(ARMSDK_ACCEPTABLE_ERROR 0x02)
  - Joints’ next and previous step large difference in angle(ARMSDK_TOO_MUCH_ANGLE_CHANGE 0x04)
  - Angle or not within JointData’s limit(ARMSDK_OUT_OF_JOINT_RANGE 0x08)
  The 5 types of ERROR
 
### JointData.h

#### void SetJointID(unsigned int ID)
- Parameter
  - unsigned int ID
- Return
  - void
- Description
  - Assign Joint ID
 
#### void SetJointAngle(double JointAngle);
- Parameter
  - double JointAngle
- Return
  - void
- Description
  - Set Joint Angle
 
#### void SetMinAngleInRad(double MinAngleInRad);
- Parameter
  - double MinAngleInRad
- Return
  - void
- Description
  - Set actuator min angle(rad)
  - Value utilized in 6.3 MotionEngine - iii) RobotInfo’s rad2value function
 
#### void SetMaxAngleInRad(double MaxAngleInRad);
- Parameter
  - double MaxAngleInRad
- Return
  - void
- Description
  - Set actuator max angle(rad)
  - Value utilized in 6.3 MotionEngine - iii) RobotInfo’s rad2value function
 
#### void SetMinAngleInValue(int Min_AngleValue);
- Parameter
  - int Min_AngleValue
- Return
  - void
- Description
  - Set actuator min value
  - utilized in 6.3 MotionEngine - iii) RobotInfo’s rad2value, value2rad functions
 
#### void SetMaxAngleInValue(int Max_AngleValue);
- Parameter
  - int Max_AngleValue
- Return
  - void
- Description
  - Set actuator max value
  - Utilized in 6.3 MotionEngine - iii) RobotInfo’s rad2value, value2rad functions
 
#### void SetMinAngleLimitInRad(double MinAngleLimitInRad);
- Parameter
  - double MinAngleLimitInRad
- Return
  - void
- Description
  - Set joint min angle(rad)
  - Also sets the value
 
#### void SetMaxAngleLimitInRad(double MaxAngleLimitInRad);
- Parameter
  - double MaxAngleLimitInRad
- Return
  - void
- Description
  - Set joint max angle(rad)
  - Also sets the value
 
#### unsigned int GetID(void);
- Parameter
  - void
- Return
  - unsigned int (ID)
- Description
  - Returns joint ID (number)
 
#### void SetJointDataDH(double LinkLength, double LinkTwist, double JointOffset, double JointAngle);
- Parameter
  - double LinkLength, double LinkTwist
  - double JointOffset, double JointAngle
- Return
  - void
- Description
  - Set Manipulator’s joint DH parameters in DH Configuration
 
#### double GetJointAngle(void);
- Parameter
  - void
- Return
  - double current Angle
- Description
  - Returns joint angle limit(rad)
 
#### double GetMinAngleInRad(void);
- Parameter
  - void
- Return
  - MinAngle(rad) of Actuator
- Description
  - SetMinAngleInRad returns actuator min angle(rad)
 
#### double GetMaxAngleInRad(void);
- Parameter
  - void
- Return
  - MaxAngle(rad) of Actuator
- Description
  - SetMaxAngleInRad returns actuator max angle(rad)
 
#### int GetMinAngleInValue(void);
- Parameter
  - void
- Return
  - MinAngle(value) of Actuator
- Description
  - SetMinAngleInValue returns actuator min angle(value)
 
#### int GetMaxAngleInValue(void);
- Parameter
  - void
- Return
  - MaxAngle(value) of Actuator
- Description
  - SetMaxAngleInValue returns actuator max angle(value)
 
#### double GetMinAngleLimitInRad(void);
- Parameter
  - void
- Return
  - MinAngle(rad) of Joint
- Description
  - SetMinAngleLimitInRad returns joint min angle(rad)
 
#### double GetMaxAngleLimitInRad(void);
- Parameter
  - void
- Return
  - MaxAngle(rad) of Joint
- Description
  - SetMaxAngleLimitInRad returns joint max angle(rad)
 
#### int GetMinAngleLimitInValue(void);
- Parameter
  - void
- Return
  - MinAngle(value) of Joint
- Description
  - SetMinAngleLimitInRad returns joint min angle(value)
 
#### int GetMaxAngleLimitInValue(void);
- Parameter
  - void
- Return
  - MaxAngle(value) of Joint
- Description
  - SetMaxAngleLimitInRad returns joint max angle(value)
 
#### matd GetTransformMatirx(void);
- Parameter
  - void
- Return
  - matd TransformMatrix of each Link
- Description
  - Returns transform matrix for each link
 
### RobotInfo.h
#### int AddJoint (double LinkLength, double LinkTwist, double JointOffset, double JointAngle, double MaxAngleInRad, double MinAngleInRad, int MaxAngleValue , int MinAngleValue, double MaxAngleLimitInRad, double MinAngleLimitInRad, unsigned int Dynamixel_ID);
- Parameter
  - LinkLength, LinkTwist, JointOffset, JointAngle – DH parameter
  - MaxAngleInRad - Maximum Angle of Actuator(not Joint Limit)
  - MinAngleInRad – Minimum Angle of Actuator(not Joint Limit)
  - MaxAngleInValue – AngleValue corresponding to the Maxangle
  - MinAngleInValue – AngleValie corresponding to the Minangle
  - MaxAngleLimitInRad – Maximum Joint Angle Limit of Actuator
  - MinAngleLimitInRad – Minimum Joint Angle Limit of Actuator
- Return
  - Error Value
- Description
  - Sets joint’s DH-Parameter and Joint-Parameter values
  - Error of 0 is no error and 1 when there is error.
  - Error happens when min value is greater than max value
 
#### JointData GetJointInfo(int joint_number);
- Parameter
  - int Joint_number
- Return
  - JointData
- Description
  - Returns JointData from AddJoint
 
#### std::vector<JointData>* GetRobotInfo(void);
- Parameter
  - JointData
- Return
  - address of robotInfo
- Description
  - Returns address values from RobotInfomation
 
#### void ClearRobotInfo(void);
- Parameter
  - void
- Return
  - void
- Description
  - Clears out RobotInfo
 
#### veci GetArmIDList(void);
- Parameter
  - void
- Return
  - ID List of Robot Actuators
- Description
  - Returns joint ID in aray form inAddJoint
 
#### veci Rad2Value(vecd q);
- Parameter
  - double array of Actuators Angle(Rad)
- Return
  - int array of Actuators Angle(Value)
- Description
  - Transforms joint’s rad to value.
 
#### vecd Value2Rad(veci q);
- Parameter
  - int array of Actuators Angle(Value)
- Return
  - double array of Actuators Angle(Rad)
- Description
  - Transforms joint’s value to rad.
 
### Kinematics.h

#### void RobotInfoReload(void);
- Parameter
  - void
- Return
  - void
- Description
  - Calls RobotInfo
 
#### matd Forward(vecd angle);
- Parameter
  - Angle of All Joints(rad)
- Return
  - 4x4 TransformMatrix form
- Description
  - RobotInfoReload calls joints angles runs FK and returns end effector’s transformation matrix
 
#### matd Forward(vecd angle, Pose3D *pose);
- Parameter
  - Angle of All Joints(rad)
- Return
  - 4x4 EndEffector's TransformMatrix form
- Description
  - RobotInfoReload calls joint angles runs FK and returns end effector’s transformation matrix. It also sets pose pointer (*pose)
 
#### void SetMaximumNumberOfIterationsForIK(unsigned int max_num);
- Parameter
  - unsigned int max_num for IK
- Return
  - void
- Description
  - Sets IK’s number of iterations for solution
 
#### void SetConvergenceCondition(double max_error, double max_acceptable_error);
- Parameter
  - double max_error, double max_acceptable_error
- Return
  - void
- Description
  - IK’s amount of telorable error.
  - The first input value is max convergence error. A lesser value than max can allow solution.
  - The second value is max allowable error; acceptable as long as is lower than value entered. When value exceeds then there is no solution..
 
#### matd Jacobian(void);
- Parameter
  - void
- Return
  - Matrix of Jacobian
- Description
  - Returns jacobian for IK solution
 
#### vecd CalcError(Pose3D _desired, matd _current);
- Parameter
  - Pose3D goalPose, TransformMatrix of EndEffector
- Return
  - Error between Goal and Currnet Pose
- Description
  - Compares end effector’s goal pose and current pose
 
#### void ComputeIK(Pose3D _desired , vecd *q_rad, vecd Initangle_rad, int *ErrorStatus);
- Parameter
  - Pose3D goalPose, vecd initangle, int ErrorStatus
- Return
  - void
- Description
  - get jacobian’s Damped Least Square Method for IK solution
  - _desired is end effector’s desired pose
  - \*q_rad sets joints pose after running IK
  - Initangle_rad is joint angles prior to running IK
  - ErrorStatus is pointer for error type
  - ErrorStatus.
    1. No error(ARMSDK_NO_ERROR 0x00)
    2. No solution from IK(ARMSDK_NO_IK_SOLUTION 0x01)
    3. no solution from IK, allowable error(ARMSDK_ACCEPTABLE_ERROR 0x02)
    4. joint angles exceed JointData’s set angles(ARMSDK_OUT_OFF_JOINT_RANGE 0x08)
 
### TrajectoryGenerator.h

#### void KinematicsInfoReload(void);
- Parameter
  - void
- Return
  - void
- Description
  - Calls Kinematics info
 
#### void Set_P2P(vecd StartPose, vecd EndPose, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - sets P2P trajectory fromStartPose, EndPose, TotalTime, AccelTime
 
#### void Set_P2P(Pose3D StartPose, Pose3D EndPose, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets P2P trajectory from StartPose, EndPose, TotalTime, AccelTime
 
#### void Set_LIN(vecd StartPose, vecd EndPose, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets linear trajectory from StartPose, EndPose, TotalTime, AccelTime
 
#### void Set_LIN(Pose3D StartPose, Pose3D EndPose, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets linear trajectory from StartPose, EndPose, TotalTime, AccelTime
 
#### void Set_CIRC(vecd StartPose, vecd ViaPose, vecd EndPose, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd ViaPose / vecd EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets circular trajectory from StartPose, ViaPose, EndPose, TotalTime, AccelTime.
 
#### void Set_CIRC(Pose3D StartPose, Pose3D ViaPose, Pose3D EndPose, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets circular trajectory fom StartPose, ViaPose, EndPose, TotalTime, AccelTime
 
#### void Set_P2PwithHand(vecd StartPose, vecd EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd EndPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets P2P trajectory from StartPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime
 
#### void Set_P2PwithHand(Pose3D StartPose, Pose3D EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D EndPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets P2P trajectory from StartPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime
 
#### void Set_LINwithHand(vecd StartPose, vecd EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd EndPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets linear trajectory from StartPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime.
 
#### void Set_LINwithHand(Pose3D StartPose, Pose3D EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D EndPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets linear trajectory from StartPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime
 
#### void Set_CIRCwithHand(vecd StartPose, vecd ViaPose, vecd EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd EndPose / vecd ViaPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets circular trajectory from StartPose, ViaPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime
 
#### void Set_CIRCwithHand(Pose3D StartPose, Pose3D ViaPose, Pose3D EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D ViaPose / Pose3D EndPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets circular trajectory from StartPose, ViaPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime
 
#### void ClearMF(void)
- Parameter
  - void
- Returns
  - void
- Description
  - Clears out motion profile
 
#### double GetMotionTotalTime(void)
- Parameter
  - void
- Returns
  - TotalTime in sec
- Description
  - Returns motion run time
 
### MotionPlay.h

#### void All_Info_Reload(void);
- Parameter
  - void
- Returns
  - void
- Description
  - Calls motion’s Info(RobotInfo, Kinematics, Trajectory)
 
#### void initialize(void)
- Parameter
  - void
- Returns
  - void
- Description
  - Initializes motion profile, done time, step, current time
 
#### void Set_Time_Period(int MilliSecond)
- Parameter
  - int MilliSecond
- Returns
  - void
- Description
  - Provides period time for motion
 
#### vecd NextStepAtTime(double CurrentTime, int *ErrorStatus)
- Parameter
  - double CurrentTime
  - int \*ErrorStatus
- Returns
  - Joint Angle of next Step
- Description
  - Returns next Goal Joint Angle array
  - ErrorStatus is pointer for error type
 
#### veci NextStepAtTimeforHand(double CurrentTime)
- Parameter
  - CurrentTime - current time in sec
- Returns
  - Angle Value array of Fingers for next step
- Description
  - Returns following Goal Joint Angle array for hand
  - Assumes hand is attached to arm
-  
#### vecd CalcIK(Pose3D desiredPose, int *ErrorStatus)
- Parameter
  - Pose3D desiredPose / int \*ErrorStatus
- Returns
  - Joint Angle of desiredPose
- Description
  - Returns desired pose of end effector via IK
  - ErrorStatus is pointer for error type
    1. no error(ARMSDK_NO_ERROR 0x00)
    2. No solution from IK(ARMSDK_NO_IK_SOLUTION 0x01)
    3. no solution from IK, allowable error(ARMSDK_ACCEPTABLE_ERROR 0x02)
    4. joint angles exceed JointData’s set angles(ARMSDK_OUT_OFF_JOINT_RANGE 0x08)
 
#### vecd NextStep(int* ErrorStatus)
- Parameter
  - ErrorStatus
- Returns
  - Angle rad array for next step
- Description
  - Returns next motion’s joint angles
  - ErrorStatus is pointer for error type
 
#### veci NextStepforHand(void)
- Parameter
  - void
- Returns
  - Angle Value array of Fingers for next step
- Description
  - Returns hand’s next motion position
 
#### vecd GetCurrentAngle(void);
- Parameter
  - void
- Returns
  - All Joint Angle(rad)
- Description
  - Returns robot’s current pos(rad) array

#### Pose3D GetCurrentEndPose(void);
- Parameter
  - void
- Returns
  - Pose3D of EndEffector
- Description
  - Returns end effector’s current pose
 
#### double Get_CurrentTime(void);
- Parameter
  - void
- Returns
  - double CurrentTime
- Description
  - Returns current time

## [RobotisLib](#robotislib)

### Pro_Arm_Comm_win.h

#### void DXL_Set_Init_Param(int portnum, int baudnum);
- Parameter
  - int portnum, int baudnum
- Returns
  - void
- Description
  - Sets Dynamixel comms from portnum and baudnum
 
#### int DXL_Open();
- Parameter
  - void
- Returns
  - void
- Description
  - Opens/access comms to DYNAMIXEL_Set_Init_Param
 
#### SerialPort* DXL_Get_Port(void);
- Parameter
  - void
- Returns
  - PortNumber
- Description
  - Returns SerialPort pointer address
 
#### void DXL_Close(void);
- Parameter
  - void
- Returns
  - void
- Description
  - End communications with Dynamixel
 
#### void Arm_ID_Setup(veci Arm_ID_LIST);
- Parameter
  - array of ID List
- Returns
  - void
- Description
  - Sets arm’s ID list
 
#### int Arm_Torque_On(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turn torque on every joint
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Torque_Off(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turns torque off on every joint
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Set_JointPosition(veci position);
- Parameter
  - joint angle array
- Returns
  - Communication Result
- Description
  - Sets joint angles
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Set_JointVelocity(veci velocity);
- Parameter
  - int joint velocity array
- Returns
  - Communication Result
- Description
  - Sets joint valocities
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Set_JointVelocity(int velocity);
- Parameter
  - int joint velocity
- Returns
  - Communication Result
- Description
  - Sets joint velocities
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Set_JointAcceleration(veci accel);
- Parameter
  - int joint Acceleration array
- Returns
  - Communication Result
- Description
  - Sets joint accelerations
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Set_JointAcceleration(int accel);
- Parameter
  - int joint Acceleration
- Returns
  - Communication Result
- Description
  - Sets joint accelerations
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Set_Position_PID_Gain(int P_Gain, int I_Gain, int D_Gain);
- Parameter
  - int joint Position P, I, D gain
- Returns
  - Communication Result
- Description
  - Sets joints’ PID gain values
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Set_Position_PID_Gain(int id, int P_Gain, int I_Gain, int D_Gain, int* ErrorStatus);
- Parameter
  - int id, int joint Position P, I, D gain
- Returns
  - Communication Result
- Description
  - Sets joints’ PID gain values
  - ErrorStatus is error pointer
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Get_JointPosition(veci *position);
- Parameter
  - joint position array
- Returns
  - Communication Result
- Description
  - Access position array and gets joint positions
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Get_JointCurrent(veci *torque);
- Parameter
  - joint current array
- Returns
  - Communication Result
- Description
  - Reads joint’s electrical current flow and saves in (*torque) return pointer
  - COMM_RXSUCCESS return of 1
 
#### int Arm_LED_On(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turns joints’ LED on
  - COMM_RXSUCCESS return of 1
 
#### int Arm_LED_Off(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turns joints’ LED off
  - COMM_RXSUCCESS return of 1
 
#### int Arm_LED_On(int r, int g, int b);
- Parameter
  - int r, int g, int b
- Returns
  - Communication Result
- Description
  - Controls DYNAMIXEL Pro’s RGB LED
  - r, g, b, rage is 0~255 each
  - COMM_RXSUCCESS return of 1
 
#### int Arm_Red_LED_On(void);
#### int Arm_Green_LED_On(void);
#### int Arm_Blue_LED_On(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - turns joints’ LED on to red(Arm_Red_LED_On)
  - turns joints’ LED on to green(Arm_Green_LED_On)
  - turns joints’ LED on to blue(Arm_Blue_LED_On)
  - COMM_RXSUCCESS return of 1
 
#### void Gripper_ID_Setup(veci Gripper_ID_List);
- Parameter
  - ID array
- Returns
  - void
- Description
  - Sets ID for gripper.
 
#### int Gripper_Ping(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Pings comm to gripperGripper
  - COMM_RXSUCCESS return of 1
 
#### int Gripper_Torque_On(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turns gripper torque on
  - COMM_RXSUCCESS return of 1
 
#### int Gripper_Torque_Off(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turns gripper torque off
  - COMM_RXSUCCESS return of 1
 
#### int Gripper_Get_Joint_Value(veci *value);
- Parameter
  - Joint value array stored in address
- Returns
  - Communication Result
- Description
  - Access gripper’s angles from stored address
  - COMM_RXSUCCESS return of 1
 
#### int Gripper_Set_Joint_Value(veci value);
- Parameter
  - Joint value array
- Returns
  - Communication Result
- Description
  - Sets gripper joint value
  - COMM_RXSUCCESS return of 1

## [Timer](#timer)

### MotionTimer.h

time measurement fromQueryPerformanceCounter
 
#### void Start(void)
- Parameter
  - void
- Returns
  - void
- Description
  - Sets start time
 
#### void Stop(void)
- Parameter
  - void
- Returns
  - void
- Description
  - Stops time measurement
 
#### double GetElapsedTime(void)
- Parameter
  - void
- Returns
  - ElapsedTime in milliseconds
- Description
  - Returns time from start to stop
 
#### void Wait(double millisec)
- Parameter
  - millisecond - waiting time in milliseconds you want
- Returns
  - void
- Description
  - Waits amount of time(msec) for standby

## [Mass Property](#mass-property)

### Coordinate

![](/assets/images/platform/manipulator/manipulator_h_087.jpg)

Total Mass : 5,551g
 
### Link 1

![](/assets/images/platform/manipulator/manipulator_h_088.jpg)

- Mass(g) : 1,030
- Center of Gravity(mm)
  - x : 0
  - y : 1
  - z : -1.1
- Inertia Tensor(g * mm<sup>2</sup>)
  - Ixx Ixy Ixz : 1.4957303e+06 0.0000000e+00 0.0000000e+00
  - Iyx Iyy Iyz : 0.0000000e+00 4.5009641e+05 -1.0959043e+04
  - Izz Izy Izz : 0.0000000e+00 -1.0959043e+04 1.4874997e+06
- Principal Moments(g * mm<sup>2</sup>)
  - I1 : 4.4998065e+05
  - I2 : 1.4876155e+06
  - I3 : 1.4957303e+06
 
### Link 2

![](/assets/images/platform/manipulator/manipulator_h_089.jpg)

- Mass(g) : 1,404
- Center of Gravity(mm)
  - x : 17.9
  - y : 0.3
  - z : 206.9
- Inertia Tensor(g * mm<sup>2</sup>)
  - Ixx Ixy Ixz : 1.0627201e+07 1.2357497e+04 -1.2920605e+06
  - Iyx Iyy Iyz : 1.2357497e+04 1.0014640e+07 1.5798255e+05
  - Izz Izy Izz : -1.2920605e+06 1.5798255e+05 1.9568681e+06
- Principal Moments(g * mm<sup>2</sup>)
  - I1 : 1.7653895e+06
  - I2 : 1.0017530e+07
  - I3 : 1.0815789e+07
 
### Link 3

![](/assets/images/platform/manipulator/manipulator_h_090.jpg)

- Mass(g) : 1,236
- Center of Gravity(mm)
  - x : 0.2
  - y : 0.3
  - z : 387.9
- Inertia Tensor(g * mm<sup>2</sup>)
  - Ixx Ixy Ixz : 3.1318491e+06 –6.0760429e+03 2.4765806e+04
  - Iyx Iyy Iyz : -6.0760429e+03 2.9193915e+06 4.2823763e+04
  - Izz Izy Izz : 2.4765806e+04 4.2823763e+04 9.2402606e+05
- Principal Moments(g * mm<sup>2</sup>)
  - I1 : 9.2282696e+05
  - I2 : 2.9201652e+06
  - I3 : 3.1322745e+06
 
### Link 4

![](/assets/images/platform/manipulator/manipulator_h_091.jpg)

- Mass(g) : 491
- Center of Gravity(mm)
  - x : 0
  - y : -1.5
  - z : 514.3
- Inertia Tensor(g * mm<sup>2</sup>)
  - Ixx Ixy Ixz : 3.9670485e+05 –3.3867048e+00 -4.7608394e+01
  - Iyx Iyy Iyz : -3.3867048e+00 2.3556702e+05 3.9098238e+03
  - Izz Izy Izz : -4.7608394e+01 3.9098238e+03 2.9647894e+05
- Principal Moments(g * mm<sup>2</sup>)
  - I1 : 2.3531708e+05
  - I2 : 2.9672886e+05
  - I3 : 3.9670487e+05
   
### Link 5 

![](/assets/images/platform/manipulator/manipulator_h_092.jpg)

- Mass(g) : 454
- Center of Gravity(mm)
  - x : 0
  - y : 0.8
  - z : 591.5
- Inertia Tensor(g * mm<sup>2</sup>)
  - Ixx Ixy Ixz : 4.7548066e+05 0.0000000e+00 0.0000000e+00
  - Iyx Iyy Iyz : 0.0000000e+00 3.9961989e+05 1.4840847e+04
  - Izz Izy Izz : 0.0000000e+00 1.4840847e+04 1.9795791e+05
- Principal Moments(g * mm<sup>2</sup>)
  - I1 : 1.9687159e+05
  - I2 : 4.0070622e+05
  - I3 : 4.7548066e+05
