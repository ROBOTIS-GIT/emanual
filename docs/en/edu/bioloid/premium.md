---
layout: archive
lang: en
ref: bioloid-premium
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/bioloid/premium/
sidebar:
  title: BIOLOID Premium
  nav: "bioloid-premium"
---

# [Introduction](#introduction)

![](/assets/images/edu/bioloid/premium_product.png)

- Excellent walking humanoid (Self-Adjusts posture while walking)
- Various sensors including Gyro, Distance, and IR
- Remote control capability (IR-default, Bluetooth-optional)
- C-style programming & motion teaching with RoboPlus S/W (USB interface included)
- Semi-transparent humanoid skin for customization
- Digital packet communication with daisy chain topology
- Build various robots through versatile expansion mechanism

# [Getting Started](#getting-started)

## [Part List](#part-list)

![](/assets/images/edu/bioloid/premium_partlist_en_01.png)

![](/assets/images/edu/bioloid/premium_partlist_en_02.png)

- [CM-530]
- [AX-12A]
- [DMS Sensor]
- [IR Sensor]
- [Gyro Sensor]
- [USB2Dynamixel]

## [Operating](#operating)

### Downloading the Program

- Program for type A is installed by default in CM-530.
- You can find task codes and motion files for other actions on the [Default Program](#default-program) page.

{% include en/parts/controller/cm510_530_turnon.md %}

### Checking the robot's basic posture (To check whether the robot has been assembled correctly)

- The robot should stand in the basic stance and play a melody according to its type as in the picture below.
- Make sure to hold the robot in its basic posture for 1 minute.
  > This is to allow the robot to automatically configure its gyro sensors so that it can walk properly.

- Check the angles of the arms and legs. If they are different from the picture, go back to "Check Assembly Mode"
- Check whether the cables have been assembled on the outer part of the leg.

If the robot has been incorrectly assembled to an extent where it may be severely damaged, a warning sound will be activated. Also, the LED of the motor with the problem will turn on and release its torque to prevent damage.
{: .notice}

![](/assets/images/edu/bioloid/premium_operation_01.jpg)

![](/assets/images/edu/bioloid/premium_operation_02.jpg)

#### The robot's basic posture and movements are awkward.
- Awkward Basic Posture?
  > Go back to "Check Assembly Mode" and re-check whether all the dynamixels have been properly assembled.
- Unable to detect obstacles while in Free Walk Mode?
  > Check whether the absolute distance measurement sensor's cables are properly in place.

#### The robot falls down easily while walking or is otherwise unstable.
- The gyro sensor used to detect the robot's posture is not working
  > Please refer to the Assembly Manual to check whether the gyro sensor has been properly assembled.

#### The torque is released and the dynamixel's LED turns on after a warning sound.
- If the motor and frames have not been properly assembled or if the robot's joints can not move properly, a warning sound will be activated to prevent damage.
  > Find the motor indicated by the LED and refer to the Assembly Manual to check whether it has been assembled correctly.

  > Make sure that the joints are free of cables or other debris.  Please refer to "Check Assembly Mode"

#### The robot type and melody do not match.
- Check whether the motors with ID 7 ~ 10 are assembled properly. Check for loose connections

|Robot Type|"Do"|"Do Re"|"Do Re Mi"|Repeat "Do Re Mi"|
|:---:|:---:|:---:|:---:|:---:|
|TYPE A|O(Correctly Assembled)|Check cables for ID 9~10|Check cables for ID 7~8|Some of the cables have not been connected properly. Please refer to the Assembly Manual and check again.|
|TYPE B|-|O(Correctly Assembled)|ID 9 and10 connected where ID 7 and 8 should be connected|Some of the cables have not been connected properly. Please refer to the Assembly Manual and check again.|
|TYPE C|-|ID 7 and 8 connected where  ID 9 and 10 should be connected|O(Correctly Assembled)|Some of the cables have not been connected properly. Please refer to the Assembly Manual and check again.|

### Robot in Action

- `R` : Remote Control Mode
- `D` : Demo Mode
- `L` : Autonomous Walking Mode
- `U` : Check Assembly Mode

![](/assets/images/edu/bioloid/premium_operation_03.jpg)

**NOTE** : If you press a button on RC-100 before choosing a mode, the robot will enter remote control mode.
{: .notice}

#### Remote Control Mode

The RC-100 is used to control the robot.

1. Press the POWER/MODE button for 2 seconds.
2. Press the buttons below to control the robot.
  - Walking : U / L / D / R
  - Change Posture : 1 + U / L / D / R
  - Demonstration Moves : 2 + U / L / D / R
  - Soccer Moves : 3 + U / L / D / R
  - Battle Moves : 4 + U / L / D / R

![](/assets/images/edu/bioloid/premium_operation_04.jpg)

##### Walking Motions

|Buttons| Motion |
|:---:|:---:|
|U|Forward|
|D|Backward|
|L|Turn Left|
|R|Turn Right|
|U + L|Walk Forward + Left|
|D + L|Walk Left Sideways|
|U + R|Walk Forward + Right|
|D + R|Walk Right Sideways|

##### Change Postures

|Buttons| Motion |
|:---:|:---:|
|1 + U|Getting up Backward (When lying on stomach)|
|1 + D|Getting up Forward (When lying on back)|
|1 + L|Push-up|
|1 + R|Handstand|
|2 + U|Pound Chest|
|2 + D|Scratch Head|
|2 + L|Cheer|
|2 + R|Bow|

##### Soccer Motions

|Buttons| Motion |
|:---:|:---:|
|3 + U|Block Right (Release button to return to normal position)|
|3 + D|Block Left (Release button to return to normal position)|
|3 + L|Shoot with left foot|
|3 + R|Shoot with right foot|

##### Battle Motions

|Buttons| Motion |
|:---:|:---:|
|4 + U|Attack|
|4 + D|Defend (Release button to return to normal position)|
|4 + L|Attack Left|
|4 + R|Attack Right|

##### Setting the CM-510 IR Channels

After mounting the IR receiver on CM-530 under control mode, you can set the channels to control it remotely by pressing the Aux button. If you change the channel of the controller, you must also change the channel of RC-100. On how to change the channel of RC-100, please refer to Changing RC-100's Channel.

|Buttons| Motion |
|:---:|:---:|
|Start + U|Set the RC-100 channel as 1|
|Start + D|Set the RC-100 channel as 3|
|Start + L|Set the RC-100 channel as 2|
|Start + R|Set the RC-100 channel as 4|

- If the robot does not receive commends for a period of time, it will standby in a seated position.

|![](/assets/images/edu/bioloid/premium_operation_05.jpg)|![](/assets/images/edu/bioloid/premium_operation_06.jpg)|![](/assets/images/edu/bioloid/premium_operation_07.jpg)|
|:---:|:---:|:---:|
|When being controlled||Seated in a standby position|

##### My remote controller does not work properly.
- Set to control mode.
- Check whether the IR receiver has been properly connected.
- Check whether the remote controller is on. Replace the battery and try again.
Point towards the IR receiver and try again.
Check if there are others controlling robots nearby, which may cause wireless interferences.

##### We want to play soccer or battle with several robots.
- In order to play a game with several users, you must install the [ZIG-110] set.
- [ZIG-110] set is available at the Robotis shopping mall.
- Please refer to [Controller] and [RC-100] for installation information.

#### Demo Mode

The robot will clap depending on how many times you clap.
When DMS senor detects an object, the robot greets the user.
If the robot does not sense any sound or object for a while, it performs various motions on its own.

|![](/assets/images/edu/bioloid/premium_operation_08.jpg)|![](/assets/images/edu/bioloid/premium_operation_06.jpg)|![](/assets/images/edu/bioloid/premium_operation_09.jpg)|
|:---:|:---:|:---:|
|Claps depending on how many times you clap||Shows various movements|

#### Autonomous Walking Mode

The robot will walk by itself while avoiding obstacles.  When absolute distance sensor detects an obstacle, the robot will stop and turn left until the obstacle is no longer detected.  If it falls down while walking, it will get back up in the direction it was moving.

![](/assets/images/edu/bioloid/premium_operation_10.jpg)

#### Check Assembly Mode

You may use the Check Assembly Mode to see whether your robot has been properly assembled. Isolate each motor and compare it to the standard posture.
1. Start the Check Assembly Mode. It will release the torque.
2. Press the U or D button and check one motor at a time. The selected motor's LED will turn on and move to its basic position. ( U : Increases the ID by 1,  D : Decreases the ID by 1 )
3. Check the ID of the motor with the LED and compare it with the ID in the Assembly Manual.
  > If the ID does not exist in the robot, a warning sound will be activated.
4. Compare the position of the motors you have assembled to the basic posture.
  > If the LED is on but the torque is released, check the cables or the motor's assembly status.


## [Battery Charge](#battery-charge)

{% include en/edu/bioloid/stem_charge.md %}

# [Tutorial](#tutorial)

## [Screen Output](#screen-output)

{% include en/edu/bioloid/screen_output.md %}

## [Button & LED](#button--led)

{% include en/edu/bioloid/button_led.md %}

## [Walking Machine](#walking-machine)

Objective for this tutorial is to learn how to use the `Walking Machine`.

`Waking Machine` is a combination of a walking motion file made up of specific patterns and a task code that plays theh role of smoothly connecting the walking motions in this motion file.

- [Download](http://support.robotis.com/en/baggage_files/bioloid/bio_prm_walkingmachineexam_en.mtn) Walking Motion File
- [Download](http://support.robotis.com/en/baggage_files/bioloid/bio_prm_walkingmachineexam_en.tsk) Walking Task Code

Let’s use the `Walking Machine` to learn about how walking motions are converted smoothly.

### Motion File Overview

#### Walking Motion File

![](/assets/images/edu/bioloid/premium_tutorial_01.png)

The walking motion files used in the Walking Machine can be found on pages 31~224. Several motion pages are gathered and repeatedly played to make up one walking pattern (forward, backward, etc). Each page is made to be conveniently converted to the next walking pattern’s motion page.

#### The walking patterns written in the Walking Motion File

The walking motion files used in the Walking Machine contain 16 different walking patterns shown below.

|Forward|Backward|Left Turn|Right Turn|
|:---:|:---:|:---:|:---:|
|![](/assets/images/edu/bioloid/premium_tutorial_02.png)|![](/assets/images/edu/bioloid/premium_tutorial_03.png)|![](/assets/images/edu/bioloid/premium_tutorial_04.png)|![](/assets/images/edu/bioloid/premium_tutorial_05.png)|

|Walk Sideways + Left|Walk Sideways + Right|Turn Left + Forward|Turn Right + Forward|
|:---:|:---:|:---:|:---:|
|![](/assets/images/edu/bioloid/premium_tutorial_06.png)|![](/assets/images/edu/bioloid/premium_tutorial_07.png)|![](/assets/images/edu/bioloid/premium_tutorial_08.png)|![](/assets/images/edu/bioloid/premium_tutorial_09.png)|

|Backward + Left|Backward + Right|Avoid Left|Avoid Right|
|:---:|:---:|:---:|:---:|
|![](/assets/images/edu/bioloid/premium_tutorial_10.png)|![](/assets/images/edu/bioloid/premium_tutorial_11.png)|![](/assets/images/edu/bioloid/premium_tutorial_12.png)|![](/assets/images/edu/bioloid/premium_tutorial_13.png)|

|Forward + Left Diagonally|Forward + Right Diagonally|Backward + Left Diagonally|Backward + Right Diagonally|
|:---:|:---:|:---:|:---:|
|![](/assets/images/edu/bioloid/premium_tutorial_14.png)|![](/assets/images/edu/bioloid/premium_tutorial_15.png)|![](/assets/images/edu/bioloid/premium_tutorial_16.png)|![](/assets/images/edu/bioloid/premium_tutorial_17.png)|

### Task Code Overview

The walking machine task code includes a `InitializationWalk` Function and a `WalkExecute` function. There are samples that use these 2 functions to control the robot with a remote controller.

#### InitializationWalk Function

The `InitializationWalk` function initializes the variables and brings the robot to its default position.

![](/assets/images/edu/bioloid/premium_tutorial_18.png)

#### WalkExecute Function

The `WalkExecute` function executes each walking pattern and smoothly joins the walking pattern.

![](/assets/images/edu/bioloid/premium_tutorial_19.png)

#### Walk Command No.

|No.|Walking Pattern|No.|Walking Pattern|No.|Walking Pattern|No.|Walking Pattern|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|1|Forward	|2|Backward	|3|Left Turn	|4|Right Turn|
|5|Walk Sideways + Left	|6|Walk Sideways + Right	|7|Turn Left + Forward	|8|Turn Right + Forward|
|9|Backward + Left	|10|Backward + Right	|11|Avoid Left	|12|Avoid Right|
|13|Forward + Left Diagonally	|14|Forward + Right Diagonally	|15|Backward + Left Diagonally|16|Backward + Right Diagonally|

#### Start Program

Let’s try writing a simple “Start Program” sample using the "InitializationWalk" function and "WalkExecute" functions to smoothly connect walking patterns.

![](/assets/images/edu/bioloid/premium_tutorial_20.png)

1. First, call the `InitializationWalk` function to initialize the variable and to bring the robot to its default position.
2. Select and input a walking pattern between 0 and 16 for the `WalkCommand` variable, then call the `WalkExecute` function to run the selected walking pattern.
3. When you input a different number in the `WalkCommand` variable and call the `WalkExecute` function, it will convert to the new walking pattern as naturally as possible.

There are 16 different walking pattern sample codes to control via remote control in the walking machine's task code file. Change the `Start Program` function in the sample codes to suit your needs.

## [Gyro Sensor Calibration](#gyro-sensor-calibration)

- Prerequisite : [Walking Machine]

Code to control the gyro sensor will be added to the task code used in the [Walking Machine] section. Review the [Walking Machine] section before getting started.

Objective for this tutorial is to learn how to adjust a humanoid’s posture using a gyro sensor.

A Gyro sensor is used to determine angular velocity (angular variation per second). When the robot tilts and angular velocity increases in a specific direction, the servo motor's value can be adjusted in the opposite direction to straighten the robot.

[Download](http://support.robotis.com/en/baggage_files/bioloid/bio_prm_gyrosensorexam_en.tsk) TASK Code(BIO_PRM_GyroSensorExam_EN.tsk)

### Things to Prepare

- The gyro sensor’s X-axis value should be connected to port #3, and Y-axis value should be connected to port #4.
- Other than that, modify the task code to suit your robot.

### Concept

- [Callback Function]

  A humanoid with a gyro uses the [Callback Function] to determin the posture adjustment value.
  The callback function is a function that runs independently of the main program routine and is automatically executed at  fixed intervals. Therefore, by calculating the adjustment value  and using the value in a callback function to adjust the posture at regular intervals, the robot can adjust its posture automatically.

[Callback Function]: /docs/en/software/rplus1/task/programming_01/#callback-function

- [Joint Offset]

  The joint off set is added to the adjustment value from the gyro sensor before being used to adjust the humanoid’s posture. (More information on [Joint Offset]) This is a parameter that gives an offset to the specific actuator’s joint position value. Thus, the actuator with joint offset execute their motions using the position value + joint offset value, which are designated in the motion file.

[Joint Offset]: /docs/en/software/rplus1/task/programming_02/#joint-offset

### Task Code Overview

1. `InitializationGyro` Call Function

  ![](/assets/images/edu/bioloid/premium_tutorial_21.png)

2. Execute `BalancePage` to Apply Joint Offset

  In order to apply the joint offset a motion must be executed. When no motion is being played, the joint offset will not be applied even if a  value is input by the gyro sensor. The **BalancePage** is used to apply the joint when no motion is being executed.

  ![](/assets/images/edu/bioloid/premium_tutorial_22.png)

3. `InitializationGyro` Function

  The `InitializeGyro` function reads the gyro sensor value 10 times in a 0.128 second intervals and saves the average value as a gyro sensor standard value. (The standard value is Approximate 250 degrees.) If the gyro sensor value is less than 230 or greater than 270, it assumes there is no gyro sensor and does not use adjustment (when there is no gyro sensor or the robot has moved during initialization).

  ![](/assets/images/edu/bioloid/premium_tutorial_23.png)

4. Calculating the adjustment value in the `Callback Function`

  At regular intervals, the callback function reads the current gyro sensor value and compares it to the standard value to calculate the adjustment value. If the `UseGyro` variable is false, the robot it will not adjust itself. Thus, set the `UseGyro` variable to false where you do not wish to use the gyro adjustment.

  ![](/assets/images/edu/bioloid/premium_tutorial_24.png)

  Apply the calculated adjustment value to the joint offset and adjust the robot’s posture.  To adjust the front/back tilt, you must use the joints in the knees and ankle, which are actuators 13-16.  To adjust the left/right tilt, you must use the joints in the ankle and waist, which are actuators 9-10 and 17-18.

  ![](/assets/images/edu/bioloid/premium_tutorial_25.png)

### Adjustment Test

- Download the task code to your robot([How to Download Task Code]).
- In order to initialize the gyro, you must leave your robot on flat ground for at least 1.5 seconds after executing the task code.  If the gyro sensor is not connected or if there is movement while initializing the gyro, the gyro will not make any  adjustments.
- Check whether the robot attempts to adjust itself when its posture is changed by a strong outside force while standing straight.
- Compare the robot's actions when it uses and does not use a gyro while stanind on a slope.

[How to Download Task Code]: /docs/en/faq/download_task_code/#cm-5

## [Custom Motions(Create)](#custom-motionscreate)

Prerequisite : [Walking Machine]

Motions will be added to the motion file used in the "Walking Machine" section. Review the "Walking Machine" section before getting started.

Objective for this tutorial is to add a new motion using RoboPlus Motion.

Let’s learn how to add 4 motions below using the RoboPlus Motion program.

|Motion Page No|Movement Description|Motion Page No|Movement Description|
|:---:|:---:|:---:|:---:|
|14|Block ball on the right|27|Get up while lying on stomach|
|16|Block ball on the left|28|Get up while lying on back|

[Download](http://support.robotis.com/en/baggage_files/bioloid/bio_prm_usermotionexam_en.mtn) Motion File(BIO_PRM_UserMotionExam_EN.mtn)

### Make a motion to block a ball on the right

1. Execute RoboPlus Motion, then connect it to the controller(Please refer to [Connect Robot](/docs/en/software/rplus1/motion/???))

  ![](/assets/images/edu/bioloid/premium_tutorial_26.png)

  ![](/assets/images/edu/bioloid/premium_tutorial_27.jpg)

2. To add the “Block Ball” motion in page 14, input a name and step.

  ![](/assets/images/edu/bioloid/premium_tutorial_28.jpg)

3. Turn off all motors, then set the robot’s pose.  The "Block ball on the right" pose is shown below.

  ![](/assets/images/edu/bioloid/premium_tutorial_29.jpg)

4. Set the robot’s pose as above. When you press the "torque on" button, the robot’s current actuator values will automatically be saved. When you press the left arrow button, you can read the robot’s current input actuator values into Step’s Pose column.

  ![](/assets/images/edu/bioloid/premium_tutorial_30.jpg)

5. You can adjust the pause and play durations. (Please refer for more information about [STEP STOP/PLAY](/docs/en/software/rplus1/motion/???))

  ![](/assets/images/edu/bioloid/premium_tutorial_31.jpg)

6. Designating the NEXT page as itself(14) will cause the robot to enter an infinite loop and maintain its pose.  Also designate an EXIT page for the robot to smoothly transiton into when it exits the infinite loop.

  ![](/assets/images/edu/bioloid/premium_tutorial_32.jpg)

7. Make a motion to return to the standard position on the page designated as the Exit page (15). Add the following 3 steps and poses to page 15.

  ![](/assets/images/edu/bioloid/premium_tutorial_33.jpg)

8. Additional settings ([Number of Repeats, Play Speed, etc](/docs/en/software/rplus1/motion/???))

  You can also set the number of repeats, entire speed, etc. for each page.

  ![](/assets/images/edu/bioloid/premium_tutorial_34.jpg)

### Make a motion to block a ball on the left

Repeat STEP 1 to make a motion to block a ball on the left on pages 16 and 17.

### Make motions to get up when the robot lying on its back and chest.

Add the following steps in motion page 27 and 28 to make a "Get up while lying on stomach" and "Get up while lying on back" motions.

- Get up while lying on the stomach

  ![](/assets/images/edu/bioloid/premium_tutorial_35.jpg)

- Get up while lying on the back

  ![](/assets/images/edu/bioloid/premium_tutorial_36.jpg)

### Save

Use the `Save(S)` command to save your work in the robot or use `Save As(A)` to save as a .mtn file in your PC.

  ![](/assets/images/edu/bioloid/premium_tutorial_37.png)


## [Custom Motions(Task Code)](#custom-motionstask-code)

Prerequisite : [Adjustment using the Gyro Sensor, Custom Motions: Create](#custom-motions-create)

Code to execute user-defined motions will be added to the task code used in  the `Adjustment using the Gyro Sensor` section.  The motion file is from the [Custom Motions: Create](#custom-motions-create) section.  Review the two sections before getting started.

### Write task code to execute user-defined motions.

Let’s learn how to run the motion added on " User-defined Motions 1 : Create Motion " with the RC-100.

- [Download](http://support.robotis.com/en/baggage_files/bioloid/bio_prm_usermotionexam_en.mtn) Motion File(BIO_PRM_UserMotionExam_KR.mtn)
- [Download](http://support.robotis.com/en/baggage_files/bioloid/bio_prm_usermotionexam_en.tsk) TASK Code(BIO_PRM_UserMotionExam_KR.tsk)

### Task Code Overview

Code to execute user-defined motions has been added to the task code written in "Adjusting using the Gyro Sensor."

  ![](/assets/images/edu/bioloid/premium_tutorial_38.png)

1. Set `WalkCommand`  as 0 to make the robot stop.
2. If the motion added by the user does not require the gyro sensor to maintain posture, you must turn off the gyro sensor adjustment to prevent motion variation due to the offset. Set the `UseGyro` variable as FALSE.  Then call the `EXITPageWaitMotion` function and wait for the robot to come to a complete stop.
3. The `Getting Up` motions added in motion pages 27 and 28 can be played just once. Thus, execute the motion, and wait for the motion to finish before executing another motion.
4. The `Block Ball` motions added in motion page 14 and 16 are endlessly repeating motions. Thus, in order to end the motion, an EXIT page is needed.  Using the `WAIT WHILE` command so that if the button is not pressed and held, the `EXITPageWaitMotion` function will execute the EXIT to end the motion
(For more information, please refer to the [Motion Page](/docs/en/software/rplus1/task/programming_02/#motion-page)).
5. After the user's motion ends, set the `UseGyro` variable back to TRUE to restore gyro adjustment.

## [Gripper Control](#gripper-control)

Prerequisite : [Custom Motions: Create](#custom-motions-create), [Custom Motions: Task Code](#custom-motions-task-code)

Review the two sections before getting started.

Objective for this tutorial is to learn how to control the grippers regardless of the motions.

When you add a gripper to your robot, there is a need to keep the robot’s arm fixed regardless of the motion.

In this case, it is not necessary to revise the motions to keep the arm still.  Instead, let’s learn to control the gripper using the task code, while preventing specific actuators from being controlled by the motion data.

- [Download](http://support.robotis.com/en/baggage_files/bioloid/bio_prm_humanoidtypeb_en.mtn) Motion File(BIO_PRM_HumanoidTypeB_EN.mtn)
- [Download](http://support.robotis.com/en/baggage_files/bioloid/bio_prm_gripperexam_en.tsk) TASK Code(BIO_PRM_GripperExam_EN.tsk)

### Background Knowledge

Setting priorities to control the gripper and motions separately.

- Normal Control Priorities

  Normally, **motion data** has the highest priority and **task code** has the next highest priority. Thus, under normal circumstances, if a motion is executed, it is impossible to control specific dyanmixels using task code.

- Changing Control Priorities

  There are 2 methods to control the motor (entire arm including the gripper) with a task code while a motion is being executed.

  1. Uncheck the “Using Now/Not Using” checkbox for the acutator’s ID in the motion data.
  2. Set the actuator’s “Joint Offset” parameter to 1024.

  The first method disables the actuator in the entire page.  Even If there is a motion requiring the corresponding actuator, there is no way to control it with the motion data. Therefore, the second method, which allows you to activate /deactivate the application of the motion data for the specific actuator depending on your needs, may be the better option.

### Assembly

Please refer to the [Gripper Assembly].

### Writing Task Code

1. Initializing Gripper Control

  Set the joint offsets of the actuatorsfor both arms to 1024, so that they are not controlled by the motion data.  Initialize the other data , such as  the arms' and grippers’ movement speeds, and gripper’s grasping power and flexibility, then place the arms in their default position.

  ![](/assets/images/edu/bioloid/premium_tutorial_39.png)

2. Revise Callback Function (Gyro Adjustment)

  If the joint offset is used in the callback function to apply the gyro adjustment value, the joint offset should not be set for the joints used by the grippers.  This is to prevent the values set as 1024 in STEP 1 from being changed.

  ![](/assets/images/edu/bioloid/premium_tutorial_40.png)

3. Gripper/Arm Control Function

  Copy the following fuction to control the gripper and arm.  This function can control the gripper's and arm's movements, regardless of the motion status.

  ![](/assets/images/edu/bioloid/premium_tutorial_41.png)

  Write a function for the left arm and gripper as above.

4. Controlling the arm and gripper with a remote controller

  Add code to control the gripper and arm using the remote controller. Reviewing [Custom Motions: Task Code] will help you understand the code below.

  ![](/assets/images/edu/bioloid/premium_tutorial_42.png)

### Download and Verify Result

- Download the task code written in STEP 2 ([How to Download of task code]).
- While controlling the robot’s motion with the remote controller, check whether the gripper and arm are fixed.
- Control the gripper with the remote controller.

# [Download](#download)

## [Default Program](#default-program)

- [How to Download of task code]
- [How to Download motion file]

|Robot Type|File Type|Download|
|:---:|:---:|:---:|
|Assembly Manual|PDF File|[Download][premium_file_01]|
|A Type|Task Code|[Download][premium_file_02]|
|A Type|Motion File|[Download][premium_file_03]|
|B Type|Task Code|[Download][premium_file_04]|
|B Type|Motion File|[Download][premium_file_05]|
|C Type|Task Code|[Download][premium_file_06]|
|C Type|Motion File|[Download][premium_file_07]|

### [Humanoid Fight](#humanoid-fight)

|Robot Type|File Type|Download|
|:---:|:---:|:---:|
|A Type|Humanoid Fight Task Code|[Download][premium_file_08]|
|A Type|Humanoid Fight Motion File|[Download][premium_file_09]|

#### Walking

|Buttons| Motion |Buttons| Motion |
|:---:|:---:|:---:|:---:|
|U|Move Forward|D|Move Backward|
|L|Turn Left|R|Turn Right|
|U + L|Move Forward and Turn Left|U + R|Move Forward and Turn Right|
|L + 5|Move Leftward|L + 5 + 6|Move Leftward Quickly|
|L + U + 5|Move Forward and Leftward|L + D + 5|Move Backward and Leftward|
|R + 5|Move Rightward|R + 5 + 6|Move Rightward Quickly|
|R + U + 5|Move Forward and Rightward|R + D + 5|Move Backward and Rightward|

#### Attack

|Buttons| Motion |Buttons| Motion |
|:---:|:---:|:---:|:---:|
|1 + L|Attack Diagonal Left|6 + 2|Strong Left Attack|
|1 + R|Attack Diagonal Right|6 + 4|Strong Right Attack|
|2 + U|Attack Front|6 + 1|Strong Front Attack|
|2 + L|Attack Left|4 + U(4 + L)|Grab 1|
|2 + R|Attack Right|4 + D(4 + R)|Grab 2|
|3|Attack Left and Right|-|-|

#### ETC

|Buttons| Motion |Buttons| Motion |
|:---:|:---:|:---:|:---:|
|5+6+D+3|Torque Off|5+6+U+1|Torque On|
|1 + U|Stand Up from face down|1 + D|Stand Up from back down|

### [Humanoid Soccer](#humanoid-soccer)

|Robot Type|File Type|Download|
|:---:|:---:|:---:|
|A Type|Humanoid Soccer Task Code|[Download][premium_file_10]|
|A Type|Humanoid Soccer Motion File|[Download][premium_file_11]|

#### Walking

|Buttons| Motion |Buttons| Motion |
|:---:|:---:|:---:|:---:|
|U|Move Forward|D|Move Backward|
|L|Turn Left|R|Turn Right|
|U + L|Move Forward and Turn Left|U + R|Move Forward and Turn Right|
|L + 5|Move Leftward|L + 5 + 6|Move Leftward Quickly|
|L + U + 5|Move Forward and Leftward|L + D + 5|Move Backward and Leftward|
|R + 5|Move Rightward|R + 5 + 6|Move Rightward Quickly|
|R + U + 5|Move Forward and Rightward|R + D + 5|Move Backward and Rightward|

#### Offense

|Buttons| Motion |Buttons| Motion |
|:---:|:---:|:---:|:---:|
|2 + U|Left Kick Forward|4 + U|Right Kick Forward|
|2 + 6 + U|Strong Left Kick Forward|4 + 6 + U|Strong Right Kick Forward|
|2 + D|Kick Backward|4 + D|Kick Backward|
|2 + L|Kick Left|4 + L|Kick Left|
|2 + R|Kick Right|4 + R|Kick Right|

#### Defense

|Buttons| Motion |Buttons| Motion |
|:---:|:---:|:---:|:---:|
|3|Prepare for Blocking|3 + L|Block Left|
|3 + U|Block Front|3 + R|Block Right|

#### ETC

|Buttons| Motion |Buttons| Motion |
|:---:|:---:|:---:|:---:|
|5+6+D+3|Torque Off|5+6+U+1|Torque On|
|1 + U|Stand Up from face down|1 + D|Stand Up from back down|
|1 + L|Chest Beat|1 + R|Cheer|


## [Examples](#examples)

### [Beginner](#beginner)

|Examples|Description|
|:---:|:---|
|1. Crossing Gate<br />![Ex_01][img_ex_beginner_01]|[Download][ex_beginner_1-1] Assembly Manual<br />[Download][ex_beginner_1-2] Task Code<br />[Download][ex_beginner_1-3] Video<br />`Devices` CM-530(x1), AX-12+(x1)<br />`Dynamixel Setting` AX-12+ ID[1]: Joint Mode<br />`RoboPlus Language`	Function, Call, Load, Endless Loop, If, Wait While<br />`Algorithm`	Control the Dynamixel's position using the buttons on the CM-530<br />`Operation Guide`<br />- Press the `U` button on the CM-530 to open the bar.<br />- Press the `D` button on the CM-530 to lower the bar.|
|2. Universal Gauge<br />![Ex_02][img_ex_beginner_02]|[Download][ex_beginner_2-1] Assembly Manual<br />[Download][ex_beginner_2-2] Task Code<br />[Download][ex_beginner_2-3] Video<br />`Devices` CM-530(x1), AX-12+(x1)<br />`Dynamixel Setting`: AX-12+ ID[1]: Joint Mode<br />`RoboPlus Language`	Function, Call, Return, Load, Calculate, Endless Loop, If, Else if<br />`Algorithm`	Control the Dynamixel's speed using the buttons on the CM-530<br />`Operation Guide`<br />- Press the `U` button on the CM-530 to increase the gauge's speed.<br />- Press the `D` button on the CM-530 to decrease the gauge's speed.|
|3. Crocodile Mouth<br />![Ex_03][img_ex_beginner_03]|[Download][ex_beginner_3-1] Assembly Manual<br />[Download][ex_beginner_3-2] Task Code<br />[Download][ex_beginner_3-3] Video<br />`Devices` CM-530(x1), AX-12+(x1), IR Sensor(x1)<br />`Dynamixel Setting`: AX-12+ ID[1]: Joint Mode<br />`RoboPlus Language`	Function, Call, Load, Endless Loop, If, Else If, Wait While<br />`Algorithm` Control the Dynamixel position and Buzzer with the value from the IR Sensor and Timer<br />`Operation Guide`<br />- The mouth opens when the front sensor detects something, and close when nothing is detected.<br />- It will open its mouth when it detects something.<br />- A melody will activate if nothing is detected for 10 seconds.|
|4. Pan Tilt<br />![Ex_04][img_ex_beginner_04]|[Download][ex_beginner_4-1] Assembly Manual<br />[Download][ex_beginner_4-2] Task Code<br />[Download][ex_beginner_4-3] Video<br />`Devices` CM-530(x1), AX-12+(x2)<br />`Dynamixel Setting`: AX-12+ ID[1, 2]: Joint Mode<br />`RoboPlus Language`	Function, Call, Load, Calculate,Endless Loop,If, Else If, Wait While<br />`Algorithm`	Control the Pan Tilt using the buttons on the CM-530<br />`Operation Guide`<br />- Press the `U` button on the CM-530 to move  the tilt actuator (Up, Down) up.<br />- Press the `D` button on the CM-530 to move  the tilt actuator (Up, Down) down.<br />- Press the `R` button on the CM-530 to turn  the pan actuator (Sideways)  right.<br />- Press the `L` button on the CM-530 to turn  the pan actuator (Sideways) left.|
|5. Parking Gate<br />![Ex_05][img_ex_beginner_05]|[Download][ex_beginner_5-1] Assembly Manual<br />[Download][ex_beginner_5-2] Task Code<br />[Download][ex_beginner_5-3] Video<br />`Devices` CM-530(x1), AX-12+(x2), IR Sensor(x1)<br />`Dynamixel Setting`: AX-12+ ID[1, 2]: Joint Mode<br />`RoboPlus Language` Function, Call, Load, Endless Loop, If, Else If, Wait While, Break Loop<br />`Algorithm`	Control the Dynamixel's position using the IR Sensor and Dynamixel's load value.<br />`Operation Guide`<br />- When an object is detected, the parking gate opens perpendicularly.<br />- When an object is detected and the bar is pushed, the parking gate opens horizontally.<br />- When an object is not detected, the parking gate closes.|
|6. Smart Car<br />![Ex_06][img_ex_beginner_06]|[Download][ex_beginner_6-1] Assembly Manual<br />[Download][ex_beginner_6-2] Task Code<br />[Download][ex_beginner_6-3] Video<br />`Devices` CM-530(x1), AX-12+(x4), IR sensor(x2)<br />`Dynamixel Setting`: AX-12+ ID[1 ~ 4]: Wheel Mode<br />`RoboPlus Language` Function, Call, Load, Calculate, Jump, Lable, Endless Loop, If, Else If, Wait While<br />`Algorithm` Use the CM-530's buttons to set the mode and use the buttons and sensor value to control the rotation direction.<br />`Operation Guide`<br />- Press the `U` button together with the START button on the CM-530 to change to CONTROL mode.<br />- Press the `D` button together with the START button on the CM-530 to change to FREE mode.<br />- When you press the `L` button in CONTROL mode, it moves forward. The `R` button moves backward, `U` button moves rights, and the `D` button moves left. A melody will play each time it moves.<br />- When front sensor detects an object in FREE mode, it will turn right. When the lower sensor detects something, it will avoid the edge and turn right.|
|7. Clapping Crab<br />![Ex_07][img_ex_beginner_07]|[Download][ex_beginner_7-1] Assembly Manual<br />[Download][ex_beginner_7-2] Task Code<br />[Download][ex_beginner_7-3] Video<br />`Devices` CM-530(x1), AX-12+(x2)<br />`Dynamixel Setting`: AX-12+ ID[1, 2]: Joint Mode<br />`RoboPlus Language` Load, Calculate, Endless Loop, If, Wait While<br />`Algorithm` Control the Dynamixel position using the number of times the MIC detects a sound.<br />`Operation Guide`<br />- The robot will standby with its arm open.<br />- The robot the number of time it detects a sound.|
|8. Attacking Duck<br />![Ex_08][img_ex_beginner_08]|[Download][ex_beginner_8-1] Assembly Manual<br />[Download][ex_beginner_8-2] Task Code<br />[Download][ex_beginner_8-3] Video<br />`Devices` CM-530(x1), AX-12+(x3), IR Sensor(x2)<br />`Dynamixel Setting`: AX-12+ ID[1, 2, 3]: Joint Mode<br />`RoboPlus Language` Function, Call, Load, Endless Loop, If, Loop While, Wait While<br />`Algorithm`	Use the sensor detecting to control the Dynamixels<br />`Operation Guide`<br />- The robot moves sideways continuously and watches for objects.<br />- The robot follows the direction in which an object is detected then attacks when both sensors detect an object.|
|9. Distance Level Meter<br />![Ex_09][img_ex_beginner_09]|[Download][ex_beginner_9-1] Assembly Manual<br />[Download][ex_beginner_9-2] Task Code<br />[Download][ex_beginner_9-3] Video<br />`Devices` CM-530(x1), AX-12+(x1), DMS Sensor(x1)<br />`Dynamixel Setting`: AX-12+ ID[1]: Joint Mode<br />`RoboPlus Language` Function, Call, Load, Calculate, Endless Loop<br />`Algorithm`	Control the Dynamixel position using the distance detected by the sensor.<br />`Operation Guide` The bar moves depending on the distance detected by the sensor.|
|10. Line Tracer<br />![Ex_10][img_ex_beginner_10]|[Download][ex_beginner_10-1] Assembly Manual<br />[Download][ex_beginner_10-2] Task Code<br />[Download][ex_beginner_10-3] Video<br />`Devices` CM-530(x1), AX-12+(x2), IR Sensor(x2)<br />`Dynamixel Setting`: AX-12+ ID[1, 2]: Wheel Mode<br />`RoboPlus Language` Function, Call, Load, Calculate, Endless Loop, If, Else If, Else, Wait While<br />`Algorithm` Control the line tracer using the sensor's detection value.<br />`Operation Guide` The robot traces the black line.|
|11. Walking Droid<br />![Ex_11][img_ex_beginner_11]|[Download][ex_beginner_11-1] Assembly Manual<br />[Download][ex_beginner_11-2] Task Code<br />[Download][ex_beginner_11-3] Motion File<br />[Download][ex_beginner_11-4] Video<br />`Devices` CM-530(x1), AX-12+(x4), IR Sensor(x1)<br />`Dynamixel Setting`: AX-12+ ID[1 ~ 4]: Joint Mode<br />`RoboPlus Language` Function, Call, Load, Endless Loop, If, Loop While, Wait While<br />`Algorithm`	Control various motions using the IR Sensor's value.<br />`Operation Guide`<br />- Place an object in the robot's path and start your robot.<br />- Checks whether the robot avoids obstacles while walking.|

[img_ex_beginner_01]: /assets/images/edu/bioloid/premium_crossinggate.jpg
[img_ex_beginner_02]: /assets/images/edu/bioloid/premium_universalgauge.jpg
[img_ex_beginner_03]: /assets/images/edu/bioloid/premium_crocodilemouth.jpg
[img_ex_beginner_04]: /assets/images/edu/bioloid/premium_pantilt.jpg
[img_ex_beginner_05]: /assets/images/edu/bioloid/premium_parkinggate.jpg
[img_ex_beginner_06]: /assets/images/edu/bioloid/premium_smartcar.jpg
[img_ex_beginner_07]: /assets/images/edu/bioloid/premium_clappingcrab.jpg
[img_ex_beginner_08]: /assets/images/edu/bioloid/premium_attackingduck.jpg
[img_ex_beginner_09]: /assets/images/edu/bioloid/premium_distancelevelmeter.jpg
[img_ex_beginner_10]: /assets/images/edu/bioloid/premium_linetracer.jpg
[img_ex_beginner_11]: /assets/images/edu/bioloid/premium_walkingdroid.jpg

[ex_beginner_1-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_CrossingGate_ASM_EN.pdf
[ex_beginner_1-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_crossinggate_en.tsk
[ex_beginner_1-3]: http://www.robotis.com/video/BIO_PRM_CrossingGate.wmv
[ex_beginner_2-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_UniversalGauge_ASM_EN.pdf
[ex_beginner_2-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_universalgauge_en.tsk
[ex_beginner_2-3]: http://www.robotis.com/video/BIO_PRM_UniversalGauge.wmv
[ex_beginner_3-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_CrocodileMouth_ASM_EN.pdf
[ex_beginner_3-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_crocodilemouth_en.tsk
[ex_beginner_3-3]: http://www.robotis.com/video/BIO_PRM_CrocodileMouth.wmv
[ex_beginner_4-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_PanTilt_ASM_EN.pdf
[ex_beginner_4-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_pantilt_en.tsk
[ex_beginner_4-3]: http://www.robotis.com/video/BIO_PRM_PanTilt.wmv
[ex_beginner_5-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_ParkingGate_ASM_EN.pdf
[ex_beginner_5-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_parkinggate_en.tsk
[ex_beginner_5-3]: http://www.robotis.com/video/BIO_PRM_ParkingGate.wmv
[ex_beginner_6-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_SmartCar_ASM_EN.pdf
[ex_beginner_6-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_smartcar_en.tsk
[ex_beginner_6-3]: http://www.robotis.com/video/BIO_PRM_SmartCar.wmv
[ex_beginner_7-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_ClappingCrab_ASM_EN.pdf
[ex_beginner_7-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_clappingcrab_en.tsk
[ex_beginner_7-3]: http://www.robotis.com/video/BIO_PRM_ClappingCrab.wmv
[ex_beginner_8-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_AttackingDuck_ASM_EN.pdf
[ex_beginner_8-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_attackingduck_en.tsk
[ex_beginner_8-3]: http://www.robotis.com/video/BIO_PRM_AttackingDuck.wmv
[ex_beginner_9-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_DistanceLevelMeter_ASM_EN.pdf
[ex_beginner_9-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_distancelevelmeter_en.tsk
[ex_beginner_9-3]: http://www.robotis.com/video/BIO_PRM_DistanceLevelMeter.wmv
[ex_beginner_10-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_LineTracer_ASM_EN.pdf
[ex_beginner_10-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_linetracer_en.tsk
[ex_beginner_10-3]: http://www.robotis.com/video/BIO_PRM_LineTracer.wmv
[ex_beginner_11-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_WalkingDroid_ASM_EN.pdf
[ex_beginner_11-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_walkingdroid_en.tsk
[ex_beginner_11-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_walkingdroid_en.mtn
[ex_beginner_11-4]: http://www.robotis.com/video/BIO_PRM_WalkingDroid.wmv

### [Intermediate](#intermediate)

|Examples|Description|
|:---:|:---|
|1. Probing Robot<br />![Ex_01][img_ex_intermediate_01]|[Download][ex_intermediate_1-1] Assembly Manual<br />[Download][ex_intermediate_1-2] Task Code<br />[Download][ex_intermediate_1-3] Video<br />`Devices` CM-530(1), AX-12+(7),IR Sensor(1), DMS Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~4] : Wheel Mode, AX-12+ ID[5~7] : Joint Mode<br />`RoboPlus Language`	Function, Call, Return, Load, Calculate, Endless Loop, If, Else, Wait While, Break Loop<br />`Algorithm` Object sensing and processing depending on IR Sensor's and DMS Sensor's value<br />`Operation Guide`<br />- Place objects of various sizes in the robot's path, then turn the robot on.<br />- If the obstacle is too big, it will avoid it.<br />- If the obstacle is not too big, it will move it then proceed going its way.|
|2. Excavator<br />![Ex_02][img_ex_intermediate_02]|[Download][ex_intermediate_2-1] Assembly Manual<br />[Download][ex_intermediate_2-2] Task Code<br />[Download][ex_intermediate_2-3] Motion File<br />[Download][ex_intermediate_2-4] Video<br />`Devices` CM-530(1), AX-12+(8), IR Sensor(1), DMS Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~4] : Wheel Mode, AX-12+ ID[5~8] : Joint Mode<br />`RoboPlus Language`	Function, Call, Load, Calculate, Endless Loop, If, Else, Wait While<br />`Algorithm`	Dynamixel Position control depending on IR Sensor's and DMS Sensor's value.<br />`Operation Guide`<br />- Place an object in the robot's path, then turn the robot on.<br />- When an object is detected in front of it, it will begin excavating.<br />- If an object is detected while carrying an object, the robot will turn in that direction and put the object it was carrying down.|
|3. Robot Flower<br />![Ex_03][img_ex_intermediate_03]|[Download][ex_intermediate_3-1] Assembly Manual<br />[Download][ex_intermediate_3-2] Task Code<br />[Download][ex_intermediate_3-3] Motion File<br />[Download][ex_intermediate_3-4] Video<br />`Devices` CM-530(1)(Sound Detection), AX-12+(6)<br />`Dynamixel Setting` AX-12+ ID[1~6] : Joint Mode<br />`RoboPlus Language`	Function, Call, Load,Endless Loop, If, Else, Wait While<br />`Algorithm` 	Motion control depending on the number of time sound is detected.<br />`Operation Guide`<br />- When the power is turned on, the flower blooms and moves as though it is dancing.<br />- If one clap is detected, the petals will pucker up slowly.<br />- If several claps are detected, the petals will pucker up quickly.|
|4. Fawn<br />![Ex_04][img_ex_intermediate_04]|[Download][ex_intermediate_4-1] Assembly Manual<br />[Download][ex_intermediate_4-2] Task Code<br />[Download][ex_intermediate_4-3] Motion File<br />[Download][ex_intermediate_4-4] Video<br />`Devices` CM-530(1)(Sound Detection), AX-12+(7), IR Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~7] : Joint Mode<br />`RoboPlus Language`	Function, Call, Load, Endless Loop, If, Else If, Else, Wait While<br />`Algorithm`		Object sensing using IR Sensor's value.<br />`Operation Guide`<br />- When no change is detected, the fawn sits down and looks around.<br />- If an object is detected in front of the face, the fawn will follow the object.|
|5. Turtle<br />![Ex_05][img_ex_intermediate_05]|[Download][ex_intermediate_5-1] Assembly Manual<br />[Download][ex_intermediate_5-2] Task Code<br />[Download][ex_intermediate_5-3] Motion File<br />[Download][ex_intermediate_5-4] Video<br />`Devices` CM-530(1), AX-12+(8), IR Sensor(2), DMS Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~8] : Joint Mode<br />`RoboPlus Language` Function, Call, Load, Endless Loop, If, Else If, Else, Wait While<br />`Algorithm`		Avoids obstacles depending on the IR Sensor and DMS Sensor value.<br />`Operation Guide`<br />- Place an obstacle in the robots path and turn the robot on.<br />- The turtle avoids obstacles in front of it.|
|6. GerWalk<br />![Ex_06][img_ex_intermediate_06]|[Download][ex_intermediate_6-1] Assembly Manual<br />[Download][ex_intermediate_6-2] Task Code<br />[Download][ex_intermediate_6-3] Motion File<br />[Download][ex_intermediate_6-4] Video<br />`Devices` CM-530(1), AX-12+(7), IR Sensor(2), DMS Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~7] : Joint Mode<br />`RoboPlus Language` Function, Call, Load, Endless Loop, If, Else If, Else, Loop While<br />`Algorithm` Control the Bird's walking pattern using the IR Sensor and DMS Sensor value.<br />`Operation Guide`<br />- Place an obstacle in the robots path and turn the gerwalk robot on.<br />- The robot avoids obstacles in front of it and on the sides.|
|7. Battle Droid<br />![Ex_07][img_ex_intermediate_07]|[Download][ex_intermediate_7-1] Assembly Manual<br />[Download][ex_intermediate_7-2] Task Code<br />[Download][ex_intermediate_7-3] Motion File<br />[Download][ex_intermediate_7-4] Video<br />`Devices` CM-530(1), AX-12+(8), IR Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~8] : Joint Mode<br />`RoboPlus Language` Variables, Function, Call, Load, Calculate, Endless Loop, If, Else If, Else, Wait While<br />`Algorithm` Dynamixel control using the IR Sensor's value<br />`Operation Guide`<br />- Place an obstacle in the robots path and turn the battle droid robot on.<br />- When the robot detects an object while walking, it will attack with both arms.<br />- When battle droid falls down, it will know which side it has fallen up and get up on its own.|
|8. Quadruped Robot<br />![Ex_08][img_ex_intermediate_08]|[Download][ex_intermediate_8-1] Assembly Manual<br />[Download][ex_intermediate_8-2] Task Code<br />[Download][ex_intermediate_8-3] Motion File<br />[Download][ex_intermediate_8-4] Video<br />`Devices` CM-530(1), AX-12+(8), IR Sensor(1), DMS Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~8] : Joint Mode<br />`RoboPlus Language` Function, Call, Load, Endless Loop, If, Wait While<br />`Algorithm`	Control the walking using the IR Sensor and DMS Sensor value<br />`Operation Guide`<br />- Place an obstacle in the robots path and turn the quadruped robot on.<br />- The robot avoids obstacles in front of it.|
|9. Biped Walking Robot<br />![Ex_09][img_ex_intermediate_09]|[Download][ex_intermediate_9-1] Assembly Manual<br />[Download][ex_intermediate_9-2] Task Code<br />[Download][ex_intermediate_9-3] Motion File<br />[Download][ex_intermediate_9-4] Video<br />`Devices` CM-530(1), AX-12+(8), IR Sensor(1), DMS Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[11~18] : Joint Mode<br />`RoboPlus Language` Function, Call, Load, Endless Loop, If, Else If, Else, Wait While, Loop While<br />`Algorithm` Control the walking using the IR Sensor and DMS Sensor value<br />`Operation Guide`<br />- Place an obstacle in the robots path and turn the robot on.<br />- The robot avoids obstacles in front of it and on the sides.|
|10. Robot Arm<br />![Ex_10][img_ex_intermediate_10]|[Download][ex_intermediate_10-1] Assembly Manual<br />[Download][ex_intermediate_10-2] Task Code<br />[Download][ex_intermediate_10-3] Video<br />`Devices` CM-530(1), AX-12+(8)<br />`Dynamixel Setting` AX-12+ ID[1~8] : Joint Mode<br />`RoboPlus Language` Function, Call, Load, Calculate, Endless Loop, If, Else, Loop While<br />`Algorithm` Dynamixel Communication for Position Value<br />`Operation Guide` Check whether the responding motor reacts to the control motor's movement.|

[img_ex_intermediate_01]: /assets/images/edu/bioloid/premium_probingrobot.jpg
[img_ex_intermediate_02]: /assets/images/edu/bioloid/premium_excavator.jpg
[img_ex_intermediate_03]: /assets/images/edu/bioloid/premium_robotflower.jpg
[img_ex_intermediate_04]: /assets/images/edu/bioloid/premium_fawn.jpg
[img_ex_intermediate_05]: /assets/images/edu/bioloid/premium_turtle.jpg
[img_ex_intermediate_06]: /assets/images/edu/bioloid/premium_gerwalk.jpg
[img_ex_intermediate_07]: /assets/images/edu/bioloid/premium_battledroid.jpg
[img_ex_intermediate_08]: /assets/images/edu/bioloid/premium_quadrupedrobot.jpg
[img_ex_intermediate_09]: /assets/images/edu/bioloid/premium_bipedwalkingrobot.jpg
[img_ex_intermediate_10]: /assets/images/edu/bioloid/premium_robotarm.jpg

[ex_intermediate_1-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_ProbingRobot_ASM_eng.pdf
[ex_intermediate_1-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_probingrobot_en.tsk
[ex_intermediate_1-3]: http://www.robotis.com/video/BIO_PRM_ProvingRobot.wmv
[ex_intermediate_2-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_Excavator_ASM_EN.pdf
[ex_intermediate_2-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_excavator_en.tsk
[ex_intermediate_2-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_excavator_en.mtn
[ex_intermediate_2-4]: http://www.robotis.com/video/BIO_PRM_Excavator.wmv
[ex_intermediate_3-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_RobotFlower_ASM_EN.pdf
[ex_intermediate_3-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_robotflower_en.tsk
[ex_intermediate_3-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_robotflower_en.mtn
[ex_intermediate_3-4]: http://www.robotis.com/video/BIO_PRM_RobotFlower.wmv
[ex_intermediate_4-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_Fawn_ASM_EN.pdf
[ex_intermediate_4-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_fawn_en.tsk
[ex_intermediate_4-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_fawn_en.mtn
[ex_intermediate_4-4]: http://www.robotis.com/video/BIO_PRM_Fawn.wmv
[ex_intermediate_5-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_Turtle_ASM_EN.pdf
[ex_intermediate_5-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_turtle_en.tsk
[ex_intermediate_5-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_turtle_en.mtn
[ex_intermediate_5-4]: http://www.robotis.com/video/BIO_PRM_Tuttle.wmv
[ex_intermediate_6-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_GerWalk_ASM_EN.pdf
[ex_intermediate_6-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_gerwalk_en.tsk
[ex_intermediate_6-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_gerwalk_en.mtn
[ex_intermediate_6-4]: http://www.robotis.com/video/BIO_PRM_GerWalk.wmv
[ex_intermediate_7-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_BattleDroid_ASM_EN.pdf
[ex_intermediate_7-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_battledroid_en.tsk
[ex_intermediate_7-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_battledroid_en.mtn
[ex_intermediate_7-4]: http://www.robotis.com/video/BIO_PRM_BattleDroid.wmv
[ex_intermediate_8-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_QuadrupedRobot_ASM_EN.pdf
[ex_intermediate_8-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_quadrupedrobot_en.tsk
[ex_intermediate_8-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_quadrupedwalkingrobot_en.mtn
[ex_intermediate_8-4]: http://www.robotis.com/video/BIO_PRM_QuadrupedWalkingRobot.wmv
[ex_intermediate_9-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_BipedRobot_ASM_EN.pdf
[ex_intermediate_9-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_bipedrobot_en.tsk
[ex_intermediate_9-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_bipedwalkingrobot_en.mtn
[ex_intermediate_9-4]: http://www.robotis.com/video/BIO_PRM_BipedWalkingRobot.wmv
[ex_intermediate_10-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_RobotArm_ASM_EN.pdf
[ex_intermediate_10-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_robotarm_en.tsk
[ex_intermediate_10-3]: http://www.robotis.com/video/BIO_PRM_RobotArm.wmv


### [Advanced](#advanced)

|Examples|Description|
|:---:|:---|
|1. Dinosaur<br />![Ex_01][img_ex_advanced_01]|[Download][ex_advanced_1-1] Assembly Manual<br />[Download][ex_advanced_1-2] Task Code<br />[Download][ex_advanced_1-3] Motion File<br />[Download][ex_advanced_1-4] Video<br />`Devices` CM-530(1), AX-12+(15), IR Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~15] : Joint Mode<br />`RoboPlus Language` Function, Call, Load, Lable, Jump, If, Else If, Else, Wait While<br />`Algorithm` Object detection and motion control using IR Sensor value.<br />`Operation Guide`<br />- Place an obstacle in the robots path and turn the dinosaur robot on.<br />- The dinosaur robot attacks.<br />- When the obstacle disappears, it continues walking.<br />- When nothing is detected for a while, it will sleep.|
|2. Puppy<br />![Ex_02][img_ex_advanced_02]|[Download][ex_advanced_2-1] Assembly Manual<br />[Download][ex_advanced_2-2] Task Code<br />[Download][ex_advanced_2-3] Motion File<br />[Download][ex_advanced_2-4] Video<br />`Devices` CM-530(1)(Sound Detection, Timer), AX-12+(17), IR Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~17] : Joint Mode<br />`RoboPlus Language`	Function, Call, Load, Lable, Jump, If, Else If, Wait While<br />`Algorithm`	Motion control depending on the sound detection of the IR Sensor and Timer.<br />`Operation Guide`<br />- Place an obstacle in the robots path and turn the puppy robot on.<br />- When a sound is detected, it will walk avoiding obstacles.<br />- If you touch its mouth, it will do cute things.<br />- It will do different things depending on the number of claps.<br />- When nothing is detected for a while, it will sleep.|
|3. King Spider<br />![Ex_03][img_ex_advanced_03]|[Download][ex_advanced_3-1] Assembly Manual<br />[Download][ex_advanced_3-2] Task Code<br />[Download][ex_advanced_3-3] Motion File<br />[Download][ex_advanced_3-4] Video<br />`Devices` CM-530(1)(Timer), AX-12+(18), IR Sensor(2)<br />`Dynamixel Setting` AX-12+ ID[1~18] : Joint Mode<br />`RoboPlus Language`	Function, Call, Load, Lable, Jump, If, Wait While<br />`Algorithm` Application motion control depending on the sound detection of the IR Sensor and Timer.<br />`Operation Guide`<br />- When it detects an object while walking, it will avoid it.<br />- It will attack when something is detected near the front.<br />- When an object is detected above it, it will crumple up its body.<br />- When nothing is detected for a while, it will sleep.|
|4. Scorpion<br />![Ex_04][img_ex_advanced_04]|[Download][ex_advanced_4-1] Assembly Manual<br />[Download][ex_advanced_4-2] Task Code<br />[Download][ex_advanced_4-3] Motion File<br />[Download][ex_advanced_4-4] Video<br />`Devices` CM-530(1)(Sound detection), AX-12+(18), DMS Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~18] : Joint Mode<br />`RoboPlus Language` Function, Call, Load, Lable, Jump, If, Else If, Loop For, Wait While<br />`Algorithm`	Application motion control depending on the number of sounds detected and DMS Sensor value.<br />`Operation Guide`<br />- The robot sleeps when you first turn it on.<br />- The robot will awake when you clap.<br />- If you clap twice when the robot is awake, it will run away.<br />- The closer your hand gets to the sensor, the tail will rise to threaten you.<br />- If you get too close, it will attack.|
|5. Lizard<br />![Ex_05][img_ex_advanced_05]|[Download][ex_advanced_5-1] Assembly Manual<br />[Download][ex_advanced_5-2] Task Code<br />[Download][ex_advanced_5-3] Motion File<br />[Download][ex_advanced_5-4] Video<br />`Devices` CM-530(1), AX-12+(14), IR Sensor(1),DMS Sensor(1)<br />`Dynamixel Setting` AX-12+ ID[1~14] : Joint Mode<br />`RoboPlus Language` Function, Call, Load, Calculate, Endless Loop, If, Else If, Else, Wait  While<br />`Algorithm` Obstacle avoidance motion control using the IR Sensor and DMS Sensor value.<br />`Operation Guide`<br />- It will being crawling once turned on, and will stop when it detects an object then avoid it.<br />- When the tail is caught, it will try to escape.|

[img_ex_advanced_01]: /assets/images/edu/bioloid/premium_dinosaur.jpg
[img_ex_advanced_02]: /assets/images/edu/bioloid/premium_puppy.jpg
[img_ex_advanced_03]: /assets/images/edu/bioloid/premium_kingspider.jpg
[img_ex_advanced_04]: /assets/images/edu/bioloid/premium_scorpion.jpg
[img_ex_advanced_05]: /assets/images/edu/bioloid/premium_lizard.jpg

[ex_advanced_1-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_Dinosaur_ASM_EN.pdf
[ex_advanced_1-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_dinosaur_en.tsk
[ex_advanced_1-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_dinosaur_en.mtn
[ex_advanced_1-4]: http://www.robotis.com/video/BIO_PRM_Dinosaur.wmv
[ex_advanced_2-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_Puppy_ASM_EN.pdf
[ex_advanced_2-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_puppy_en.tsk
[ex_advanced_2-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_puppy_en.mtn
[ex_advanced_2-4]: http://www.robotis.com/video/BIO_PRM_Puppy.wmv
[ex_advanced_3-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_KingSpider_ASM_EN.pdf
[ex_advanced_3-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_kingspider_en.tsk
[ex_advanced_3-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_kingspider_en.mtn
[ex_advanced_3-4]: http://www.robotis.com/video/BIO_PRM_KingSpider.wmv
[ex_advanced_4-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_Scorpion_ASM_EN.pdf
[ex_advanced_4-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_scorpion_en.tsk
[ex_advanced_4-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_scorpion_en.mtn
[ex_advanced_4-4]: http://www.robotis.com/video/BIO_PRM_Scorpion.wmv
[ex_advanced_5-1]: http://www.robotis.com/download/doc/ENG/BIO_PRM_Lizard_ASM_EN.pdf
[ex_advanced_5-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_lizard_en.tsk
[ex_advanced_5-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_lizard_en.mtn
[ex_advanced_5-4]: http://www.robotis.com/video/BIO_PRM_Lizard.wmv

# [References](#references)

## [Replacing Fuse](#replacing-fuse)

{% include en/parts/controller/fuse_cm510_530.md %}

## [Dynamixel Management](#dynamixel-management)

{% include en/edu/bioloid/dynamixel_management.md %}

{% include en/parts/communication/zigbee_control.md %}

## [Control Multiple Robots](#control-multiple-robots)

{% include en/edu/bioloid/control_multirobot.md %}

## [Customizing Robot](#customizing-robot)

Use the semi-transparent skins provided only in the Premium Kit to make your humanoid unique.

### Customizing your semi-transparent skins

Samples of customized chest skins

|![](/assets/images/edu/bioloid/premium_skin_01.jpg)|![](/assets/images/edu/bioloid/premium_skin_02.jpg)|
|:---:|:---:|
|![](/assets/images/edu/bioloid/premium_skin_03.jpg)|![](/assets/images/edu/bioloid/premium_skin_04.jpg)|
|![](/assets/images/edu/bioloid/premium_skin_05.jpg)|![](/assets/images/edu/bioloid/premium_skin_06.jpg)|

Samples of customized head skins

![](/assets/images/edu/bioloid/premium_skin_07.jpg)

![](/assets/images/edu/bioloid/premium_skin_08.jpg)

Samples of robots with customized skins

|![](/assets/images/edu/bioloid/premium_skin_09.jpg)|![](/assets/images/edu/bioloid/premium_skin_10.jpg)|![](/assets/images/edu/bioloid/premium_skin_11.jpg)|
|:---:|:---:|:---:|
|![](/assets/images/edu/bioloid/premium_skin_12.jpg)|![](/assets/images/edu/bioloid/premium_skin_13.jpg)|![](/assets/images/edu/bioloid/premium_skin_14.jpg)|

## [Adding Sensors](#adding-sensors)

With the Bioloid Premium Kit, you can connect additional [IR Sensor] and [Touch Sensor] to the CM-530.
For more information on each sensors, please click on the names of the sensors.

### IR Sensor

![](/assets/images/parts/sensors/ir.jpg)

- IR Sensor Applications
  - The IR sensor can detects objects in front of the robot.
  - It can also be used to detect object on the side when walking or moving.

[More information](/docs/en/software/rplus1/task/programming_02/#ir-sensor)

### Touch Sensor

![](/assets/images/parts/sensors/touch.jpg)

- Touch Sensor Applications
  - The touch sensor enables the robot to feel when it has been touched.
  - For example, the sensor can be used to make the robot react to certain touches.

[More information](/docs/en/software/rplus1/task/programming_02/#touch-sensor)

## [Make Your Own Sensor](#make-your-own-sensor)

You can make your own sensor with simple control functions using the ADC port and OUT port on CM-510/CM-530.

`Caution` Connecting poorly designed circuits may damage the controller. Please be sure to acquire sufficient knowledge about circuits beforehand.
{: .notice--warning}

### PIN Information

![](/assets/images/parts/controller/cm-530/cm510_external_io.png)

- Below is a pin diagram of CM-510’s external port.
  1. OUT : 5V Output
  2. VCC (5V)
  3. ADC : Can read analog signals made by users.
  4. GND
  5. NC : Not used

- Below is a pin diagram of CM-530’s external port.
  1. OUT1 : 3.3V Output (Maximum Allowed Current 0.3A)
  2. VCC (5V)
  3. ADC : Can read analog signals made by users.
  4. GND
  5. OUT2 : 3.3V Output (Maximum Allowed Current 0.3A)

**NOTE** : Please use the 5P Cable when using other sensors. The 5P cable can be purchased from ROBOTIS.
{: .notice}

### Controlling User’s Device

#### External Output Control
Below is an example of an LED circuit to turn the LED on and off using the OUT port (Pin 1).
You need to adjust the amound of resistance depending on the type of controller and/or the type of LED.

![](/assets/images/edu/bioloid/premium_led_circuit.png)

A high signal can be sent to the OUT port using RoboPlus Task.

1. Select the user's device in the writable parameter such as LOAD and CALCULATE, then select the port on which the device is connected.
2. Then, set the high signal to the readable parameter using a constant.

![](/assets/images/edu/bioloid/premium_diy_sensor_01.png)

![](/assets/images/edu/bioloid/premium_diy_sensor_02.png)

When the code above is executed, high signal will be sent to the OUT port of the device connected to PORT 3, and the LED will turn on.

#### Reading the ADC Value
Most of the sensors used in robots, such as IR sensors and distance sensors, support analog output. The CM-510 can use its external ports to read the sensor’s analog output signals. These sensors may be designed by the user or bought from a store.

- Below is an image of a tilt sensor. When the sensor is tilted, it prints the tilted value as the analog singal.

![](/assets/images/edu/bioloid/premium_diy_sensor_03.png)

- The left pin of the tilt sensor is 5V VCC. The center is an analog signal output pin, and the right pin is GND.  This sensor can be used by connecting its pins to the corresponding pins on CM-510’s external port.  To try for yourself, please refer to the pin information for CM-510’s external ports.

![](/assets/images/edu/bioloid/premium_diy_sensor_04.png)

- You can incorporate the sensor’s analog output to your robot's movements as in the example below.

![](/assets/images/edu/bioloid/premium_diy_sensor_05.png)

## [Gripper Assembly](#gripper-assembly)

- Users can add grippers to humanoid robots to fit their needs.
- Grippers are useful when holding or throwing things.

### Materials

There are 2 spare AX-12+'s when assembling a humanoid Type B or Type C using the Bioloid Premium Kit.
You can use these spare parts to make a gripper to your humanoid.
Below are the parts required to make a gripper.

![](/assets/images/edu/bioloid/premium_gripper_assy_01.png)

### Making a gripper

![](/assets/images/edu/bioloid/premium_gripper_assy_02.jpg)

The image above shows how to make a gripper using frames and an AX-12+. Make two of these if you want to attach a gripper on both hands.

### Attaching Grippers

By making a robot with grippers, you can expand the things you can do with the robot.
For more information on controlling the gripper robot, please refer to gripper control.
Below is an image of a Type B humanoid with a grippers.
AX-12+ #9 was used for the right gripper and AX-12+ #10 was used for the left.

![](/assets/images/edu/bioloid/premium_gripper_assy_03.png)


[CM-530]: /docs/en/parts/controller/cm-530/
[AX-12A]: /docs/en/dxl/ax/ax-12a/
[DMS Sensor]: /docs/en/parts/sensor/dms-80/
[IR Sensor]: /docs/en/parts/sensor/irss-10/
[Touch Sensor]: /docs/en/parts/sensor/ts-10/
[Gyro Sensor]: /docs/en/parts/sensor/gs-12/
[USB2Dynamixel]: /docs/en/parts/interface/usb2dynamixel/
[Controller]: /docs/en/parts/controller/controller_compatibility/
[RC-100]: /docs/en/parts/communication/rc-100/
[ZIG-110]: /docs/en/parts/communication/zig-100_110/
[How to Download of task code]: /docs/en/faq/download_task_code/
[How to Download motion file]: /docs/en/software/rplus1/motion/#download-motion

[premium_file_01]: http://www.robotis.com/download/doc/BIO_PRM_Humanoid_ASM.pdf
[premium_file_02]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_humanoidtypea_en.tsk
[premium_file_03]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_humanoidtypea_en.mtn
[premium_file_04]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_humanoidtypeb_en.tsk
[premium_file_05]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_humanoidtypeb_en.mtn
[premium_file_06]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_humanoidtypec_en.tsk
[premium_file_07]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_humanoidtypec_en.mtn
[premium_file_08]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_fighttypea_en.tsk
[premium_file_09]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_fighttypea_en.mtn
[premium_file_10]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_soccertypea_en.tsk
[premium_file_11]: http://support.robotis.com/en/baggage_files/bioloid/bio_prm_soccertypea_en.mtn
