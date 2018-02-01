---
layout: archive
lang: en
ref: rplus1_motion
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplus1/motion/
sidebar:
  title: R+ Motion 1.0
  nav: "rplusmotion1"
---

# [Introduction](#introduction)

## What is a Motion?
A motion is a set of actuator position and speed data necessary for robot movements.  
In order for the robot to move, a motion file is required.  A suitable motion file must be downloaded for the assembled robot.  
A motion file is identified by the icon below, and its file extension is .mtn.

![](/assets/images/sw/rplus1/motion/roboplus_motion_001.png)
 
## What is the relationship between a motion and task code?

A task code file is a program while a motion file is data.  For better understanding, let us think about MP3 players and MP3 files. If there were no MP3 players, you will not be able to listen to music because MP3 file could not be played.  The result is the same when there is an MP3 player but no MP3 file.  If you want to make your robot move, you need a task code file.  If the task code downloaded into your robot uses motions, you must download the motion file as well.  If no motions are used in the task code, you do not need the motion file.

`Note` To use motions in a task code, the motion file must be downloaded.
{: .notice}
 
![](/assets/images/sw/rplus1/motion/roboplus_motion_002.png)

## [Install](#install)

`Download` [RoboPlus]
{: .notice--download}

RoboPlus is a software to create a customized programme for every ROBOTIS product.

### RoboPlus System Requirements
+ OS : Windows XP Service Pack 2 or above / Vista/ 7 (32/64bit)/8 (32/64bit)
+ 32bit(x86) or 64bit (x64) processor with over 800MHz
+ Graphic card with 3D acceleration
+ System memory over 512MB
+ Hard disk with the extra space of 500MB

![img_install](/assets/images/sw/roboplus_install_en.png)

`Note` To execute RoboPlus, .NET FrameWork 3.5 or higher version is required. When installing RoboPlus, if the automatic installation of .NET FrameWork fails, .NET FrameWork must be installed separately.
{: .notice}

### RoboPlus Install Failure

Most reason for installation failure is caused by .NET Framework install error. Please manually intsall Windows Installer 3.1 and .NET Framework 3.5

Windows installer and .NET Framework can be downloaded from [Microsoft Download Center].

`Download` [Windows installer 3.1], [.NET Framework 3.5]
{: .notice--download}


# [Getting Started](#getting-started)

## [Robot Motion](#robot-motion)

"Robot Motion" refers to the motion data in the controller.  
These data can be seen and edited on the "Robot Motion" window.  
This window is displayed only when the robot is connected.  
(See how to [Connect to Robot](#connect-to-robot))

![](/assets/images/sw/rplus1/motion/roboplus_motion_003.png)

## [File Motion](#file-motion)

"File Motion" refers to the motion data in the form of files in the PC.  
These data can be seen and edited on the "File Motion" window.  
Multiple "File Motion" windows can be displayed at once.

![](/assets/images/sw/rplus1/motion/roboplus_motion_004.png)

## [Connect to Robot](#connect-to-robot)

1. Connect the robot to the PC (Please refer to [Controller Information] for details)
2. Select the communication port to use.  
    Choose the communication port to which the robot is connected.  If you don't know the port number, use the "Auto Searching" function.

    ![](/assets/images/sw/rplus1/motion/roboplus_motion_005.png)
 
3. Connect with the robot. Choose the "Connect Robot" menu.

    ![](/assets/images/sw/rplus1/motion/roboplus_motion_006.png)

    If you are unable to connect to the robot, please check following:
    - Is the controller connected to the PC?
    - Is the controller turned on?
    - Was the correct port selected?
    - Is the controller compatible with RoboPlus Motion?
      - CM-100 is not compatible.
      - CM-5 is compatible only after a firmware upgrade.
 
4. Disconnect the Robot.  
    To disconnect from the robot, choose the "Exit" menu or simply close the window.
    
    ![](/assets/images/sw/rplus1/motion/roboplus_motion_007.png)

## [Download Motion](#download-motion)

File motions can be converted into robot motions.
- Open the file motion to download.
- Connect to the robot.
- Click on the "Download Motion" menu and wait for the download to complete.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_008.png)
 
- Verify that the contents of the file motion have been copied to the robot motion as seen below.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_009.png)

- Download RoboPlus Program (for CM-510/530)

<iframe width="560" height="315" src="https://www.youtube.com/embed/dHCqPs1_2yY" frameborder="0" allowfullscreen></iframe>

## [Play Motion](#play-motion)

You can play the created motions. Search the page to play and click "Play Motion".

![](/assets/images/sw/rplus1/motion/roboplus_motion_010.png)
 
- Errors may occur when trying to play motions.
  - This error can be seen while working on a "Robot Motion" window. In this case, the page linked as Next or Exit has been modified, but the controller does not have enough memory to temporarily save it.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_011.png)

  > This can be solved by saving the page before execution.  If you proceed without saving, only the current page will be played.
 
  - This error can be seen while working on a "File Motion" window. In this case, the data in the PC is not the controller, and the controller does not have enough memory  to temporarily save the Next or Exit page.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_012.png)

  > You can execute only the chosen page.  To play linked pages, you must download the motion to the robot.
 
## [Stop Motion](#stop-motion)

Stops the motion that is being carried out.

![](/assets/images/sw/rplus1/motion/roboplus_motion_013.png)

"Stop Motion" does not stop execution right away. Instead, the "Exit" page is executed before stopping.  
 
## [Emergency Stop](#emergency-stop)

Stops the motion that is being carried out.

![](/assets/images/sw/rplus1/motion/roboplus_motion_014.png)

Unlike "Stop Motion," "Emergency Stop" halts execution immediately.  


# [Motion Editing](#motion-editing)

Things to be aware of before editing motions are introduced here.
 
## Setting the Dynamixel ID

The motion player in the controller can control a total of 26 Dynamixels (from ID 0 to 25). Therefore, to create a motion with RoboPlus Motion, the ID of each Dynamixel must be between 0 and 25.
 
## Control Priority

Dynamixels may be controlled by both RoboPlus Motion and RoboPlus Task. Generally, the control priority is as follows:
1. RoboPlus Motion (ID of Dynamixel is between 0 and 25.)
2. RoboPlus Task

In other words, once a motion is executed, the Dynamixel will be controlled by only RoboPlus Motion, and RoboPlus Task will have no control over the  Dynamixel. However, this control priority may be changed by users, if so desired.  
There are 2 ways to change the control priority:
- In the motion data : Use [ID Used/Not-Used](#set-id-usage-status) function.
- In the task code : Use the [Joint Offset Parameter]. The advantage of this method is that the control priority may be changed according to the situation.
 
## Dynamixel Auto Shutdown Function

Dynamixels have an Auto Shutdown function. This function prevents Dynamixels from being damaged. The Auto Shutdown function will be triggered in the following situations.  
- The motor has overheated due to an increase in internal temperature.
- The motor has been under too much load for an extensive period of time.

When the Auto Shutdown function is triggered, the following will be seen.  
- The Dynamixel's LED will blink.
- The motor will stop moving, resulting in no torque.

To solve this problem, the following steps must be taken.
- Resolve what triggered the Auto Shutdown function.
- If the motor has overheated, let it cool with some rest.  
- If the motor is under too much load, remove some of the load.
- Turn off the Dynamixel and turn it back on.

When creating a motion, the joint may not move. This is because the Auto Shutdown function has been triggered by the causes listed above.

## [Pose Editing](#pose-editing)

A pose is the robot's position at a point in time.  It is a collection of motor position values required for the posture.   
 
![](/assets/images/sw/rplus1/motion/roboplus_motion_015.png)
 
- `Pose of Step` refers to the data values of the pose.

- `Pose of Robot` refers to the position values of the connected robot's joints. When the Pose of Robot is modified, the robot will move accordingly.  

### <a name="basic-pose-editing"></a>[Basic Pose Editing](#basic-pose-editing)

The Basic Pose Editor is a simple editor that may be used for any type of robot. To change the number of ID's used at "Pose of Step," use the [ID Editing Function](#edit-all-page).

![](/assets/images/sw/rplus1/motion/roboplus_motion_016.png)

#### [Select Actuator ID](#select-actuator-id)

Click on a row to select an actuator.
The following methods may be used to select multiple actuators.
- To select actuators in consecutive order.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_017.png)

  - Drag with mouse.
  - Select actuators while holding down the "Shift" key.

- To select actuators separately.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_018.png)

  - Select actuators while holding down the "Ctrl" key.

- To select all actuators.
  - Press the button in the upper left corner.

    ![](/assets/images/sw/rplus1/motion/roboplus_motion_019.png)

  - Click on the "Select All" menu.

    ![](/assets/images/sw/rplus1/motion/roboplus_motion_020.png)

#### [Torque On/Off](#torque-onoff)

The "Torque On/Off" function enables you to make a pose manually by turning the robot's joints on or off.  
This function is only available in "Pose of Robot."  
If the torque is on, its position value will be shown. Otherwise, the value will be displayed as 'OFF'.  

![](/assets/images/sw/rplus1/motion/roboplus_motion_021.png)
 
The torque may be turned on or off through the following methods.
- Press the "On" button to turn on the selected actuator.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_022.png)

- Press the "Off" button to turn off the selected actuator.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_023.png)

- Click the "Torque Toggle" menu to turn it off when it is on and to turn it on when it is off.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_024.png)

#### [Change Actuator Value](#change-actuator-value)

The position value of the selected actuator may be changed after choosing the joint in "Pose".

![](/assets/images/sw/rplus1/motion/roboplus_motion_025.png)

#### <a name="play-pose"></a>[Play Pose](#play-pose)

To execute a pose, move "Pose of Step" to "Pose of Robot."  

![](/assets/images/sw/rplus1/motion/roboplus_motion_026.png)

![](/assets/images/sw/rplus1/motion/roboplus_motion_027.png)
 
#### <a name="capture-pose"></a>[Capture Pose](#capture-pose)

To "Capture"(Store) a pose, move "Pose of Robot" to "Pose of Step."

![](/assets/images/sw/rplus1/motion/roboplus_motion_028.png)

![](/assets/images/sw/rplus1/motion/roboplus_motion_029.png)

#### [Copy/Paste Pose](#copypaste-pose)

These functions enable the actuator values to be changed easily.  
Not only can poses be copied and pasted within the program, but texts from other files, such as Microsoft Excel, may be copied.  
(When copying text from another program, values are delimited by spaces, new lines and tabs.)  

![](/assets/images/sw/rplus1/motion/roboplus_motion_030.png)

![](/assets/images/sw/rplus1/motion/roboplus_motion_031.png)

- Copy Pose: Click on "Copy" or press Ctrl+C.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_032.png)

- Paste Pose: Click on "Paste" or press Ctrl+V.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_033.png)

#### [Mask Pose](#mask-pose)

Masking a pose refers to the process of making a new pose by combining 2 poses by setting whether the value is used or not while executing or capturing a pose.  
For example, Pose C may be created by adding the upper body of Pose A with the lower body of Pose B.

![](/assets/images/sw/rplus1/motion/roboplus_motion_034.png)

![](/assets/images/sw/rplus1/motion/roboplus_motion_035.png)

### [Pose Utility]

The pose utility is a tool to easily create a pose based on previously supplied information.
- 3D robot control : A pose can be created by moving the 3D robot's joints.
- Mirror: A symmetrical pose can be created or the pose can be reversed.
- Inverse Kinematics: The accurate positions of each joint can be calculated.

{% capture motion_01 %}
`Note`
- Information regarding the robot are required to create a pose using the pose utility. Therefore, a robot not on the list cannot be used. 
- Some robots may not support the functions listed above. 
- Because the pose utility uses 3D graphics, its performance depends on your graphic card.
{% endcapture %}

<div class="notice">{{ motion_01 | markdownify }}</div>
 
![](/assets/images/sw/rplus1/motion/roboplus_motion_036.png)
 
#### [Select Robot](#select-robot)

Before using the pose utility, you must first select the robot. Click the robot's name on the list below to select an applicable robot.
 
`Note` Pose utility cannot be used on a robot not on the list. In case of a user's robot, the motions of the robot must be created by [Basic Pose Editor](#basic-pose-editing).
{: .notice}
 
![](/assets/images/sw/rplus1/motion/roboplus_motion_037.png)
 
- Select the name of robot to create a pose for.

|Robot Name|Description|
|:---:|:---:|
|Bioloid Battle Droid|Battle Droid Robot from Bioloid Intermediate Example.|
|Bioloid Dinosaur|Dinosaur Robot from Bioloid Advanced Example.|
|Bioloid Fawn|Baby Fawn Robot from Bioloid Intermediate Example.|
|Bioloid Gerwalk|Gerwalk Robot from Bioloid Advanced Example.|
|Bioloid Humanoid|Humanoid from Bioloid Advanced Exampe.|
|Bioloid King|Spider	King Spider Robot from Bioloid Advanced Example|
|Bioloid Puppy|Puppy Robot from Bioloid Advanced Example|
|Bioloid Spider|Spider Robot from Bioloid Intermediate Example|
|Bioloid Turtle|Turtle Robot from Bioloid Intermediate Example|
|Bioloid Walking|Droid	Walking Droid Robot from Bioloid Beginner Example|
|Premium Humanoid|A-type	Bioloid Premium Humanoid|
|Premium Humanoid|B-type	Bioloid Premium Humanoid|
|Premium Humanoid|C-type	Bioloid Premium Humanoid|
 
- When the "Initial Pose" button is pressed, the robot will assume its initial position.

#### [Control 3D Robot](#control-3d-robot)

##### Control View

3D robot can be seen from various angle using the view control function.
 
![](/assets/images/sw/rplus1/motion/roboplus_motion_038.png)
 
- **Zoom Fit** : The view angle is reset to the initial status.
- **Select Objects** : The joints can be selected by the mouse cursor.
- **Rotate the View** : The view can be rotated using the mouse. The same thing as above occurs when you press the wheel button of mouse and move.
- **Move the View** : The view can be moved horizontally using the mouse. The same thing as above occurs when you press the wheel button of mouse and move, while pressing "Ctrl" key.
- **Increase/Decrease the View** : The view can be increased or decreased using the mouse. The same thing as above occurs when you spin the mouse wheel.

##### Control Joints

The number appeared on the robot are the ID of Dynamixel. If you place your mouse on the ID, the color of choosable Dynamixel is changed.

![](/assets/images/sw/rplus1/motion/roboplus_motion_039.png)
 
If you click the relevant joint, the joint value appears. The joint value is appeared as angle, not the motor value.

![](/assets/images/sw/rplus1/motion/roboplus_motion_040.png)
 
If you move the mouse to left and right  while pressing the left botton of the mouse, the value increases or decreases.  
In case of 1,024-based control, the unit of the value is approximately 0.29(300 / 1,024), and in case of 4,096-base, it is approximately 0.06(250.92 / 4,096).

#### [Mirror](#mirror)

The mirror function provides two functions:  "exchange" and "symmetric." Press "Apply" after choosing the function to apply it to your robot.
 
1. Exchange  
    The robot's left side and right side are reversed to create a mirror image of the previous pose.

    ![](/assets/images/sw/rplus1/motion/roboplus_motion_041.jpg)
    
    ![](/assets/images/sw/rplus1/motion/roboplus_motion_042.png)
 
2. Symmetry  
    A symmetric pose based on the selected side is created.
    
    ![](/assets/images/sw/rplus1/motion/roboplus_motion_043.png)
    
    ![](/assets/images/sw/rplus1/motion/roboplus_motion_044.png)

#### [Inverse Kinematics](#inverse-kinematics)

##### Position and Coordinate System

Understanding the kinematics of the robot's movements starts with figuring out where each robot part is located.  We must first assign a coordinate point as the origin, and then mark the displacement of each part on the coordinate system.  
Coordinates axis and origin on the View are shown as below, and the unit of the grid is 20mm.  
Here, Origin means that the coordinates of  X, Y, Z is (0, 0, 0).

![](/assets/images/sw/rplus1/motion/roboplus_motion_045.png)
 
##### Kinematics and Inverse Kinematics

Kinematics is used to determine the location or movement of the end point from the angle or movement of the joint.  In other words, kinematics allows us to determine where the end points once the joint values have been decided. For example, suppose there is a manipulator with two joints in the same plane as shown below.  Using the angles of the joints, the coordinate (x,y) of the end point can be determined through kinematics.  Kinematics results in only one solution.

![](/assets/images/sw/rplus1/motion/roboplus_motion_046.png)
 
On the other hand, inverse kinematics may be used to determine the angle or movement of the joint from the location or movement of the end point.  For example, suppose again that there is a manipulator with two joints in the same plane coordinates.  If the end point (x,y) has been determined, there are 2 possible values for each joint as seen below.

![](/assets/images/sw/rplus1/motion/roboplus_motion_047.png)

When using inverse kinematics, the coordinate (x,y) of the end point may be located at an unreachable distance from the origin or no solution may be obtained due to limitations on joint angles. If more joints are used, there may be infinitely many solutions.
 
##### End Point Control

When the user selects how much and in which direction to move the end point, the "Inverse Kinematics" function in the pose utility will calculate the values of each joint and move the end point automatically.  
This function needs a module executes "Inverse Kinematics" calculation.  Currently, the robots support "Inverse Kinematics" calculation are as follows:
- Bioloid Humanoid
- Bioloid Premium Humanoid Type A
- Bioloid Premium Humanoid Type B
- Bioloid Premium Humanoid Type C

This subject is explained on the basis of Bioloid Premium Humanoid Type A.
 
###### Select the end point
- Walking Step : Located at the middle of both feet, used to move both feet.
- Right Foot : Located at the center of the right foot, used to move only the right foot.
- Left Foot : Located at the center of the left foot, used to move only the left foot.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_048.png)
 
###### Initialize the end point

The location of the end point is initialized.
 
###### Move the end point

The end point in 3D space can be controlled by 6 parameters.  Depending on the structure of robots, all the 6 paramters may not be appeared.  
To change the values, select relevant parameters, and then use the following methods.
- Press the `[`or `]` to increase or decrease the value by 1.
- Press the `[` or `]` while pressing `Shift` to increase or decrease the value by 10.
- The controller can change the values appears if you double-click or press `Enter`.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_049.png)

- X(mm): it is moved to the  X-axis diretion by the unit of mm.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_050.png)

- Y(mm): it is moved to the Y-axis direction by the unit of mm.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_051.png)

- Z(mm): it is moved to the Z-axis direction by the unit of mm.
  
  ![](/assets/images/sw/rplus1/motion/roboplus_motion_052.png)

- &phi;(&deg;): it is rotated based on the X-axis by the unit of angle.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_053.png)

- &theta;(&deg;): it is rotated based on the Y-axis by the unit of angle.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_054.png)

- &psi;(&deg;): it is rotated based on the Z-axis by the unit of angle.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_055.png)

{% capture rplusmotion_notice_01 %}
Since each paramater has its minimum and maximum values, it can be changed only in the range.  
Sometimes, mathematical results cannot be obtained by inverse kinematics calculation, so the situation is called "no solutions" or "Infinite solutions." Due to the such fact, the parameter values are not changed despite they are located in the range.  In that case, the solution can be obtained if other parameter values are replaced.  
(For instance, in case that the legs are straightened until the end (z=0), X or Y parameter is not changed.)
{% endcapture %}

<div class="notice">{{ rplusmotion_notice_01 | markdownify }}</div>

###### Apply the Result

When Pose of Step is selected, the pose values on the data are changed, and if Pose of Robot is selected, the pose values of robot are changed.

#### [Pose Execution/Capture](#pose-executioncapture)

![](/assets/images/sw/rplus1/motion/roboplus_motion_056.png)

##### Pose of Step and Pose of Robot

Pose of Step means the steps on the `currently selected motion file.  That is, the pose changed in pose utility is reflected to the motion file immediately, while Pose of Step has been selected.
 
`Note` Pose of Step is activated only when there are steps on the currently selected page. Pose of Robot is activated only when the robot is connected.
{: .notice}

##### Pose Execution/Capture

It is the same function as [Play Pose](#play-pose), [Capture Pose](#capture-pose) of the Basic Pose Editor.
- Pose Execution: Pose of Step is reflected to Pose of Robot.
- Pose Capture : Pose of Robot is reflected to currently selected Pose of Step.

## [Step Editing](#step-editing)

A "Motion Step" means by key frames, that are  required to play consecutive motions.

![](/assets/images/sw/rplus1/motion/roboplus_motion_057.png)

The speed of a motion is determined by the time of each step.  
The step editor enables steps to be edited easily.

![](/assets/images/sw/rplus1/motion/roboplus_motion_058.png)

Each [page](#page-editing) consists of a maximum of 7 steps.  
To make a motion with more than 7 steps, you will need to [connect pages](#connect-page).

### [Add/Insert/Delete/Move Step](#addinsertdeletemove-step)

#### Add Step

A new step is added at the bottom of the step list.

![](/assets/images/sw/rplus1/motion/roboplus_motion_059.png)
 
#### Insert Step

A new step is inserted above the selected step.

![](/assets/images/sw/rplus1/motion/roboplus_motion_060.png)
 
#### Delete Step

The selected step is deleted from the list.

![](/assets/images/sw/rplus1/motion/roboplus_motion_061.png)
 
#### Move Step

The selected step may be moved up or down.

![](/assets/images/sw/rplus1/motion/roboplus_motion_062.png)

### [Pause](#pause)

- "Pause" is the time between the end of the current step and the start of the next step.
- The unit of the value is seconds, and the value can be changed in 0.008 increments.
- The value is between 0 and 2.04 seconds.
- The value can be changed using the upper scroll bar.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_063.png)
 
### [Time](#time)

- "Time" is the time between the time from the start of the current step to the end of the current step.
- The unit of the value is seconds, and the value can be changed in 0.008 increments.
- The value is between 0.072 and 2.04 seconds.
- The value can be changed using the lower scroll bar.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_064.png)

### [Copy/Cut/Paste Step](#copycutpaste-step)

#### Copy Step

The selected step is copied.

![](/assets/images/sw/rplus1/motion/roboplus_motion_065.png)
 
#### Cut Step

The selected step is cut.

![](/assets/images/sw/rplus1/motion/roboplus_motion_066.png)
 
#### Paste Step

The copied or cut step is pasted.  The value in the selected step is overwritten.

![](/assets/images/sw/rplus1/motion/roboplus_motion_067.png)

## <a name="page-editing"></a>[Page Editing](#page-editing)

"Motion page" is the unit used to distinguish between saved motions.  
Imported motions are read in terms of pages.  
Motion data consists of 255 pages. (Some controllers are limited to only 127 pages.)

![](/assets/images/sw/rplus1/motion/roboplus_motion_068.png)

### <a name="select-page"></a>[Select Page](#select-page)

Click on a row to select a page.
The following methods may be used to select multiple pages.
 
- To choose pages in consecutive order

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_069.png)

  - Drag with mouse
  - Choose pages while holding down the "Shift" key.
 
- To choose pages separately

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_070.png)

  - Choose pages while holding down the "Ctrl" key.
 
- To choose all pages
  - Press the button in the upper left corner

    ![](/assets/images/sw/rplus1/motion/roboplus_motion_071.png)

### <a name="conenct-page"></a>[Connect Page](#connect-page)

Pages can be connected to each other if necessary.
 
`Note` When data is exchanged using the Copy/Cut/Paste functions, page connection information is not exchanged.
{: .notice}
 
#### Next Page

A single page can have a maximum of 7 steps.  Therefore, some motions may not fit in one page.  To use multiple pages for one motion, designate the page to link to.

![](/assets/images/sw/rplus1/motion/roboplus_motion_072.png)

Enter the number of the next page in the "Next" column.  

![](/assets/images/sw/rplus1/motion/roboplus_motion_073.png)

#### Exit Page

When commands are made to stop a motion, the robot will usually be in a highly unstable state due to the motion being executed.  To stop a motion in a stable state, designate an exit page.

![](/assets/images/sw/rplus1/motion/roboplus_motion_074.png)

Enter the number of the exit page in the "Exit" column.

![](/assets/images/sw/rplus1/motion/roboplus_motion_075.png)

### [Copy/Cut/Paste Page](#copycutpaste-page)

#### Copy Page

The selected page is copied.

![](/assets/images/sw/rplus1/motion/roboplus_motion_076.png)
 
#### Cut Page

The selected page is cut.

![](/assets/images/sw/rplus1/motion/roboplus_motion_077.png)

#### Paste page

The copied or cut page is pasted.  The contents of selected page is overwritten.

![](/assets/images/sw/rplus1/motion/roboplus_motion_078.png)

### [Set Page Repeat/Time](#set-page-repeattime)

#### Repeat Time

This is the number of times the current page is repeated during motion execution.

![](/assets/images/sw/rplus1/motion/roboplus_motion_079.png)
 
#### Speed Rate

- This is the playback speed of the page during motion execution.  Unlike "Step Time," this applies to the entire page.
  - If the speed rate is 1.0, the page will be executed at  normal speed.
  - If the speed rate is lower than 1.0, the execution speed will decrease.
  - If the speed rate is higher than 1.0, the execution speed will increase.  

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_080.png)

### [Inertial Force Control](#inertial-force-control)

Force is generated between steps. We call this force "inertial force," because it is the result of the law of inertia.  In general, inertial forces are created by acceleration, which is the change in speed.  That is, as acceleration increases, inertial force also increases, and as acceleration decreases, inertial force also decreases.  To reduce acceleration, increase or decrease the speed gradually, and to increase acceleration, change the speed drastically ."Ctrl Inertial Force" is used to control this acceleration.  Increase this value to increase or decrease the speed gradually, reducing the acceleration.
 
- The value is between 0 and 127. (Default is 32.)

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_081.png)
  
- The closer the value is to 0, the greater the inertial force.
- The closer the value is to 127, the lower the inertial force.

### [Joint Softness](#joint-softness)

Joint softness is used to set the compliance of the Dynamixel.
The pros and cons of different joint softness values are as follows:
- When the joint softness is big
  - Pro: Movement is smooth.  Used for fluid movements, such as dancing.
  - Con : May not be good for legs that need much support.
- When the joint softness is small  
  - Pro: Movement is stable.  Used for movements that require support, such as walking.
  - Con: Movement may look too rigid when performing fluid motions.
 
There are 7 joint softness levels.
- Level 1: Almost none  (Not recommended)
- Level 2: Very Low
- Level 3: Low
- Level 4: Somewhat Low
- Level 5: Average (Default)
- Level 6: High
- Level 7: Very High

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_082.png)

# [More Information](#more-information)

## [Upload Robot Motion](#upload-robot-motion)

Transferring motion data from the controller to the PC is called "uploading."
1. Connect the robot to the PC to see the Robot Motion window.

    ![](/assets/images/sw/rplus1/motion/roboplus_motion_083.png)
    
    ![](/assets/images/sw/rplus1/motion/roboplus_motion_084.png)

2. After selecting the Robot Motion window, click on "Save As".

    ![](/assets/images/sw/rplus1/motion/roboplus_motion_085.png)

## [Motion Offset](#motion-offset)

Offset is the difference from a standard value. Motion offset refers to the difference from the standard motion, and the robot that performs the standard motion is called the "Master Robot".  
Even when robots of the same type are performing the same motions, there will be differences in their poses. This is due to discrepancies in motor locations and errors in assembly.  These differences may even cause some robots to fall down.  "Motion Offset" is used to resolve these differences.

`Note` Generally, motion offset is small enough to be ignored. However, for robots that are sensitive to balance, such as humanoids, motion offset can be a source of critical problems.  
{: .notice}
 
### Edit Motion Offset

Discrepancies in the location of robot joints can be fixed using the "Edit Motion Offset" function.

When the menu is selected, the torque of all joints will be turned on to sustain its current position.  Therefore, it would be beneficial to execute this function when the robot is in a pose where the differences can be easily distinguished.   
{: .notice} 

![](/assets/images/sw/rplus1/motion/roboplus_motion_086.png)
 
Select the joint to edit its value with the editor.  
- Positive values indicate movement in the CCW direction.
- Negative values indicate movement in the CW direction.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_087.png)
 
### Initialize

Initiaizes all values to 0.

![](/assets/images/sw/rplus1/motion/roboplus_motion_088.png)
 
### Save

Saves the current offset values.  The values are saved in the controller.

![](/assets/images/sw/rplus1/motion/roboplus_motion_089.png)
 
### Save as File

Saves the robot's current offset values as a file in the PC. The file extension of motion offset files is .ofs.

![](/assets/images/sw/rplus1/motion/roboplus_motion_090.png)
 
### Download

Motion Offset files(*.ofs) in the PC can be downloaded to the robot.

![](/assets/images/sw/rplus1/motion/roboplus_motion_091.png)

## <a name="edit-all-page"></a>[Edit All Page](#edit-all-page)

"Edit All Page" is used to duplicate revisions on all pages. This function is required in the following situations:
- To change all motor values simultaneously Changes the value of every motor at once.
- To change ID usage status (whether it is being used or not)
 
### [Set Resolution](#set-resolution)

- The monitor's resolution can be set.
- For the MX and EX series, please set the resolution value as 4096.  For other Dynamixels, 1024 is the recommended value.
- EX series have position control of 250 degrees.
- MX series have position control of 360 degrees.

![](/assets/images/sw/rplus1/motion/roboplus_motion_092.png)
 
- When the resolution value is set as 4,096, the default values in the basic pose editor will be automatically changed from 512 to 2,048.

![](/assets/images/sw/rplus1/motion/roboplus_motion_093.png)
 
### <a name="set-id-usage-status"></a>[Set ID Usage Status](#set-id-usage-status)

- RoboPlus Motion can handle the motions of robots with up to 26 motors. (Dynamixel ID between 0 and 25). Set whether an ID is being used to edit only the necessary ID's.

![](/assets/images/sw/rplus1/motion/roboplus_motion_094.png)
 
### [Exchange ID](#exchange-id)

The position values of the robot's joints can be easily exchanged.
Select the 2 ID's to exchange, and then click "Exchange ID."

![](/assets/images/sw/rplus1/motion/roboplus_motion_095.png)
 
### [Change All Values](#change-all-values)

Use this function to change the value of the selected ID.

![](/assets/images/sw/rplus1/motion/roboplus_motion_096.png)
 
### Apply Offset Values to All

Offset is the difference from a standard value.  Use this function to add or subtract a value from all joints with the selected ID.

![](/assets/images/sw/rplus1/motion/roboplus_motion_097.png)

## [Keyboard Shortcuts](#keyboard-shortcuts)

When creating robot motions, it is difficult to use the mouse and keyboard at the same time, while holding the robot with one hand.  Here, we introduce useful tips to make motions using only the keyboard.
 
### Use arrow keys to move within the program

Arrow keys can be used to move the focus between the Page Edit Window, Step Edit Window, and Pose Edit Window.

![](/assets/images/sw/rplus1/motion/roboplus_motion_098.png)
 
### Change the Joint Values

- Press the `[` or `]` keys to increase or decrease the joint value by 1.
- Press the `{` or  `}` keys (`Shift` + `[` or `]`) to increase or decrease the joint value by 10.
- Press `Enter` to move the focus to the setting window.  When you are done changing the value, press `Enter` again to return the focus.

![](/assets/images/sw/rplus1/motion/roboplus_motion_099.png)

This function is available in the following windows:
- Pose of Step

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_100.png)
  
- Pose of Robot

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_101.png)

- Edit Motion Offset

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_102.png)

- 3D drawing of robot

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_103.png)
 
### Turn the torque on/off

After selecting the joint, press the space bar to turn the torque on or off.
 
### Moving robot according to each step  

Please choose the step that you want and press the enter key. Your robot will take the pose of selected step. (This is available only at robot motion window )   

![](/assets/images/sw/rplus1/motion/roboplus_motion_104.png)

## [Making Robots](#making-robots)

Users can make and operate their own robots usig RoboPlus Motion

{% capture roboplus_motion_warning_01 %}
`Warning` For this section, some previous knowledge on the following is required.
- XML
- 3D Graphics
- C# Programming
{% endcapture %}

<div class="notice--warning">{{ roboplus_motion_warning_01 | markdownify }}</div>

### [Folder Structure](#folder-structure)

If you look at the folder inside RoboPlus Motion, there are robot information file as shown below.
(i.e, C:/Program Files/ROBOTIS/RoboPlus/Motion)
- `/Robots`: There are files on robot’s information.
- `/Models`: There are 3D model data for each part
- `/PlugIn`: There are IK(Inverse Kinematics) calculation modules.

In order for users to make their own robot, they need to make their own files and put them into folders accordingly

### [Robot Information File](#robot-information-file)

Robot Infromation file has all the information required for the use of RoboPlus Motion.  
This file has extension of .rbt. Robot list in "Pose Utility" tab shows the .rbt file list of various robots showed in the e-manual.

![](/assets/images/sw/rplus1/motion/roboplus_motion_105.png)
 
Robot Information file is written in the format of XML. Users can read the files using Windows TextPad.
 
![](/assets/images/sw/rplus1/motion/roboplus_motion_106.png)
 
#### &lt;General&gt;

In this part, general information on the robot users making must be recorded.
 

#### &lt;Name&gt;

Put in the name that will be shown on the robot list.  
You can give different "culture" values to show different languages (only for languages supported by RoboPlus Motion)
 
|Value|Language|
|:---:|:---:|
|kor|Korean|
|jpn|Japanese|
|N/A|English or any other languages|
 
```xml
<Name>Premium Humanoid A-type</Name> 
<Name culture=”kor”> Bioloid Premium Type A</Name> 
```
> Example of Bioloid Premium Type A 
 
#### &lt;Motor&gt;

Input information for the Dynamixels used in robots.
- id: Dynamixel's ID
- model: model type
- init: position value for when "Initial Pose" button is pressed
 
![](/assets/images/sw/rplus1/motion/roboplus_motion_105.png)
 
```xml
<Motor id="1" model="AX-12+" init="205"></Motor>
<Motor id="2" model="AX-12+" init="818"></Motor>
<Motor id="3" model="AX-12+" init="251"></Motor>
<Motor id="4" model="AX-12+" init="772"></Motor>
<Motor id="5" model="AX-12+" init="512"></Motor>
<Motor id="6" model="AX-12+" init="512"></Motor>
<Motor id="7" model="AX-12+" init="358"></Motor>
<Motor id="8" model="AX-12+" init="666"></Motor>
<Motor id="9" model="AX-12+" init="512"></Motor>
<Motor id="10" model="AX-12+" init="512"></Motor>
<Motor id="11" model="AX-12+" init="475"></Motor>
<Motor id="12" model="AX-12+" init="549"></Motor>
<Motor id="13" model="AX-12+" init="437"></Motor>
<Motor id="14" model="AX-12+" init="587"></Motor>
<Motor id="15" model="AX-12+" init="549"></Motor>
<Motor id="16" model="AX-12+" init="475"></Motor>
<Motor id="17" model="AX-12+" init="512"></Motor>
<Motor id="18" model="AX-12+" init="512"></Motor>
```

> Example of Bioloid Premium Type A
 
#### &lt;Mirror&gt;

Infromation needed for Mirror function. Not necessary if the function is not in use.

![](/assets/images/sw/rplus1/motion/roboplus_motion_108.jpg)
 
Only use for Dynamixels in symmetric positions. If there is no symmetrically positioned Dynamixles, do not input anything.
- Right: Dynamixel IDs for devices on the right side
- Left: Dynamixel IDs for devices on the left side

```xml
<Mirror>
   <Right>1,3,5,9,11,13,15,17</Right>
   <Left>2,4,6,10,12,14,16,18</Left>
</Mirror>
```

> Example of Bioloid Premium Type A

![](/assets/images/sw/rplus1/motion/roboplus_motion_109.png)

#### &lt;InverseKinematics&gt;

This connects the modules for Inverse Kinematics computing. Computing modules are in the form of DDL. To learn how to make modules, please refer to [Plug-In SDK Programming](#plug-in-sdk-programming) in the next section. If not using Inverse Kinematis, this section can be ignored.

![](/assets/images/sw/rplus1/motion/roboplus_motion_110.png)

```xml
<InverseKinematics>
   <Module>
      <Name>PremiumHumanoidA.dll</Name>
   </Module>
</InverseKinematics>
```

> Example of Bioloid Premium Type A

#### &lt;Object3D&gt;

In this section, robot assembly information is included for 3D display. The robot assembly information is in the Tree structure.
If 3D display not needed, this section can be ignored.

#### &lt;Part&gt;

In this section, each part's information is included. The relationship between parts are expressed through the Tree structure.
- name: 3D Model name. There is no need to include extensions.  
  (i.e., for f3.igs, just put f3)
- T: 3x4 matrix that contains movement and rotation information for 3D display.  
  Each element is separated by space.

  ![](/assets/images/sw/rplus1/motion/roboplus_motion_111.png)

- id: Input ID number for Dynamixels.
- type: Define what type of motor a part is.
  - If the whole body moves, define the motor's type as "body." (Horn is fixed in this case)

    ![](/assets/images/sw/rplus1/motion/roboplus_motion_112.png)

  - If the motor's body is fixed and only its horn moves, define "body" to the part you want to fix and define "horn" to the part you want it to move.

    ![](/assets/images/sw/rplus1/motion/roboplus_motion_113.png)

```html
<Object3D>
    <Part name="f51" T="0 0 1 0 1 0 0 0 0 1 0 302.5">
      <Part name ="f3" T="1 0 0 0 0 0 1 -70.5 0 -1 0 19"></Part>
      <Part name ="f3" T="1 0 0 0 0 0 -1 -70.5 0 1 0 -19"></Part>
      <Part name="f52" T="1 0 0 0 0 1 0 0 0 0 1 0">
```

> Example of Bioloid Premium Type A

### [3D Model Data](#3d-model-data)

Shown below are the 3D models of parts. These parts can be generated by various Computer Aided Design softwares. Users can add the parts created on their own in addition to the provided parts by ROBOTIS.  
RoboPlus Motion only supports IGES(*.igs) format. ROBOTIS recommends to make data files small since if the data is too big, it will slow down the 3D display.  
The following are the basic parts provided with RoboPlus.
 
|Name|Diagram|File|
|:---:|:---:|:---:|
|F1|![](/assets/images/sw/rplus1/motion/roboplus_motion_114.png)|f1.igs|
|F2|![](/assets/images/sw/rplus1/motion/roboplus_motion_115.png)|f2.igs|
|F3|![](/assets/images/sw/rplus1/motion/roboplus_motion_116.png)|f3.igs|
|F4|![](/assets/images/sw/rplus1/motion/roboplus_motion_117.png)|f4.igs|
|F5|![](/assets/images/sw/rplus1/motion/roboplus_motion_118.png)|f5.igs|
|F6|![](/assets/images/sw/rplus1/motion/roboplus_motion_119.png)|f6.igs|
|F7|![](/assets/images/sw/rplus1/motion/roboplus_motion_120.png)|f7.igs|
|F8|![](/assets/images/sw/rplus1/motion/roboplus_motion_121.png)|f8.igs|
|F9|![](/assets/images/sw/rplus1/motion/roboplus_motion_122.png)|f9.igs|
|F10|![](/assets/images/sw/rplus1/motion/roboplus_motion_123.png)|f10.igs|
|F11|![](/assets/images/sw/rplus1/motion/roboplus_motion_124.png)|f11.igs|
|F12|![](/assets/images/sw/rplus1/motion/roboplus_motion_125.png)|f12.igs|
|F15 + F16|![](/assets/images/sw/rplus1/motion/roboplus_motion_126.png)|f15.igs|
|F51|![](/assets/images/sw/rplus1/motion/roboplus_motion_127.png)|f51.igs|
|F52|![](/assets/images/sw/rplus1/motion/roboplus_motion_128.png)|f52.igs|
|F53|![](/assets/images/sw/rplus1/motion/roboplus_motion_129.png)|f53.igs|
|F56|![](/assets/images/sw/rplus1/motion/roboplus_motion_130.png)|f56.igs|
|F57|![](/assets/images/sw/rplus1/motion/roboplus_motion_131.png)|f57.igs|
|F58|![](/assets/images/sw/rplus1/motion/roboplus_motion_132.png)|f58.igs|
|F60|![](/assets/images/sw/rplus1/motion/roboplus_motion_133.png)|f60.igs|
|WA|![](/assets/images/sw/rplus1/motion/roboplus_motion_134.png)|wa,igs|
|BU|![](/assets/images/sw/rplus1/motion/roboplus_motion_135.png)|bu.igs|
|CM-5|![](/assets/images/sw/rplus1/motion/roboplus_motion_136.png)|cm-5.igs|
|ADAPTOR-CM5|![](/assets/images/sw/rplus1/motion/roboplus_motion_137.png)|adaptor_cm5.igs|
|BATTERY|![](/assets/images/sw/rplus1/motion/roboplus_motion_138.png)|battery.igs|
|AX-12|![](/assets/images/sw/rplus1/motion/roboplus_motion_139.png)|ax-12.igs|
|AX-12 Horn|![](/assets/images/sw/rplus1/motion/roboplus_motion_140.png)|ax-12_horn.igs|
|AX-S1|![](/assets/images/sw/rplus1/motion/roboplus_motion_141.png)|ax-s1.igs|

### <a name="#plug-in-sdk-programming"></a>[Plug-In SDK](#plug-in-sdk)

Users can use Plug-In SDK to add inverse kinematics computing module from "Pose Utility."
Instruction is given using an example of developing C# from Visual Studio 2005. (Sample example included)
- `Download ZIP` [PlugInSDK_Example.zip](http://support.robotis.com/en/baggage_files/zigbee_sdk/pluginsdk_example.zip)
 
#### Create Project

Go to Visual Studio's menu and select `File` > `Create New` > `Project`. Then select `Visual C#` > `Windows` > `Classic Library` to create a new project.
 
#### Add Reference

Go to Visual Studio's menu and select `Project` > `Add Reference`. When a window box pops up, click "Find" then select `Motion` > `PlugInSDK.dll` in the folder Roboplus is installed.(i.e, C:\Program Files\ROBOTIS\RoboPlus\Motion\PlugInSDK.dll)
 
#### Implement Interface

Write command lines shown below in the Class file that is to be implemented. (i.e, Class1.cs)

```csharp
using ROBOTIS.MotionEditor.SDK  // add namespace
namespace MyPlugIn
{
  public class MyPlugIn : IInverseKinematics // Interface succession
  {
  }
}
```

Put the mouse cursor on "IInverseKinematics" and right click it. Then select "Implement Interface -> Implement Interface" and sources will be automatically generated.

##### CurrentPose

It's Pose data transferred from and received by RoboPlus Motion. Users must follow the rules shown below.
- Users create the arrangement of 26 pose data.
- The index of arrangement are the ID numbers of Dynamixels.
- In order to deliever values to motors, put some number in between 0 ~ 1,023 or 4,096. If not, put -1.

When RoboPlus Motion is in "get" direction, inverse kinematics computing result should be delievered and when it is in "set" direction, endpoints should be calculated and computed using forward kinematics and based on Pose data.

##### EndPoints

This is the name to be printed on endpoint list.

![](/assets/images/sw/rplus1/motion/roboplus_motion_142.png)

Users can either choose one form the endpoint list or run the interface shown below to see the result.
- SelectedIndex: Index of endpoint
- SelectedEndPoint: Name of endpoint
 
##### X, Y, Z, Roll, Pitch, Yaw

It's the data of location of end points from the origin.  
Users can set minimum and/or maximum using user DLL.  
Roll signifies rotation in x-axis, Pitch is in y-axis, and Yaw z-axis.

![](/assets/images/sw/rplus1/motion/roboplus_motion_143.png)

- MinX, MinY, MinZ, MinRoll, MinPitch, MinYaw: Minimum values for endpoints.
- MaxX, MaxY, MaxZ, MaxRoll, MaxPitch, MaxYaw: Maximum values for endpoints.
- If the minimum and maximum values are set at the same value for an endpoint, such endpoint is considered as not in use and thus, does not show up on the list.
- X, Y, Z, Roll, Pitch, Yaw: position values of endpoints.
 
##### Reset

By clicking the "reset" button on RoboPlus Motion,  users can default the position values of endpoints.

![](/assets/images/sw/rplus1/motion/roboplus_motion_144.png)
 
#### Add Plug-In

If successful with building the project, copy the DLL file to the "PlugIn" folder inside the RoboPlus Motion folder. (For example, C:\Program Files\ROBOTIS\RoboPlus\Motion\PlugIn)  
In robot informational file (*.rbt), write DLL information that wil compute inverse kinematics.

```xml
<InverseKinematics>
   <Module>
      <Name>PremiumHumanoidA.dll</Name>
   </Module>
</InverseKinematics>
```

> Example of Bioloid Premium Type A

Run RoboPlus Motion and check if the (new) robot is operating properly.

[Joint Offset Parameter]: /docs/en/software/rplus1/task/programming_02/#joint-offset
[ID Editing Function]: ???
