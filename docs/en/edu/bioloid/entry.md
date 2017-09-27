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

Objective for this tutorial is to print 1 and 2 on the output screen as below.

![Screen-Output-1][img_011]

### Write Task Code

1. Execute RoboPlus Task Program.

  As seen in the picture below, go to `Start > All Programs > ROBOTIS > RoboPlus > Software > RoboPlus Task` to execute RoboPlus Task.

  ![Screen-Output-2][img_012]

 - RoboPlus Task Initial Screen

  ![Screen-Output-3][img_013]

2. Select a Controller.

  Double click an empty line or press `Enter`, In the `Select Control` window, select the controller to use, then press the `OK` button.

  ![Screen-Output-4][img_014]

3. Generating `Start Program`.

  Select `Start Program` from the `Select Instruction Type` window, `Start Program` will be automatically generated in RoboPlus Task.

  ![Screen-Output-5][img_015]

4. Input `Endless Loop` command

  To print the numbers on the screen endlessly, use the `Endless Loop` command(Create a command line).
  Double click or press `Enter` on an empty line between `{` and `}` of Start Program to invoke the `Select Instruction Type` window. Select `Loop > Endless Loop(while(1))` from the list.

  ![Screen-Output-6][img_016]

5. Input `Load` command

  Use `Load` command to input a `Print` command, which is needed to print numbers on the screen.
  Insert `Execute > Load (Assignment value)` into an empty line between `{` and `}` of `Endless Loop`.

  ![Screen-Output-7][img_017]

6. Load `1` into `Print`

  Choose the left parameter ( ? ) among the `Load` parameters(Explanation on the parameter).
  The left parameter receives input from the right parameter.
  Double click the left parameter ( ? ), or press `Enter` key after clicking it once to invoke the `Select Parameter Window`.
  Select `Controller > Print` then press `OK`.

  ![Screen-Output-8][img_018]

  Select `Constant Numbers > Number > 1` for the right parameter ( ? ) in the same way.

  ![Screen-Output-9][img_019]

  When both parameters of the `Load` command have been set, it should look like below.

  ![Screen-Output-10][img_020]

7. Load `2` into `Print with Line`

  Select `}` under `Print` command (at the end of the endless loop section), and add new lines by pressing the `Space` key. Repeat Steps 5 and 6 to input the `Load` command and to input  `Controller > Print with Line` and `2`. The final task code is shown below.

  ![Screen-Output-11][img_021]

8. Save Task Code

  Press Ctrl + S or the Save icon.

  ![Screen-Output-12][img_022]

### Download Task Code

Download the task code created above.([How to Download Task Code])

### Execute Task Code

1. Open the Program Output Monitor

  To see the output of the program, **you must open the Program Output Monitor BEFORE executing the program**.
  There are three ways to open the Program Output Monitor.

  - Click on the View Print of Program in the Download Program window

    ![Screen-Output-13][img_023]

  - Click on the `View Print of Program` button in TOOLS.
  - Press `F5` or click on View Print of Program (V)  menu under Program (P).

2. Executing the Program

  When you turn on the controller, the LED will blink, showing it is in standby mode.
  Press the MODE button to move it to PLAY, then press START to execute the downloaded task code.
  You should see "1" and "2" being printed on the Program Output Monitor.

  ![Screen-Output-1][img_011]

## [Button & LED](#button-led)

Objective for this tutorial is to program the `U` button to turn the AUX LED on and the `D` button to turn it off. Pressing the `START` button will end the program.

### Write Task Code

![Button_LED][img_024]

### Download Task Code

Download the task code created above.([How to Download Task Code])

### Execute Task Code

Execute the program and check whether the AUX LED turns on when you press the `U` button and turns off when you press the `D` button. Press `START` button to end.

## [Attacking Duck](#attacking-duck)

Objective for this tutorial is to build an attacking duck which attacks approaching objects. Please refer to 2-2-11 Attacking Duck of the assembly manual and complete the hardware.

`Caution` Do not approach your face near the robot when the power is on. You may get injured by the robot.
{: .notice--warning}

![Attacking_Duck-1][img_025]

The attacking patterns of the duck are as follows.
- If any object is not detected, the robot gets ready to attack by locating ID[1] joint in the middle and folding ID[2] ~ ID[3] joints.
- If objects are detected on the left and the right side, the robot turns to the direction where objects are detected by moving ID[1] joint.
- If objects are detected at the front, the robot unfolds ID[2] ~ ID[3] joints for attack.
- It goes back to the status of "2" above.

### Write Task Code

![Attacking_Duck-2][img_026]

1. Enter the basic value of the motor's moving speed and Call initial behavior.

2. If an object is detected from the left side of the robot, turn the beak left.

  If an object is detected by the left distance sensor of AX-S1, the location value (present location  value of the ID[1] joint + 20) is entered as the goal position to turn left.  However, to prevent from turning too much, it is written to move only if the present location value is less than 812.

3. If an object is detected from the right side of the robot, turn the beak right.

  If an object is detected by the right distance sensor of AX-S1, the location value (present location value of the ID[1] joint -20) is entered as the goal position to turn right.  However, to prevent from turning too much, it is written to move only if the present location value is greater than 212.

4. Attack if an object is detected at the front
If an object is detected by the central distance sensor of AX-S1, the robot attacks by calling "Attack with beak."

  ![Attacking_Duck-3][img_027]

5. Make Initial Behavior

  Move the beak in the center by inputting proper goal position value(512) into ID[1] joint, and then call "Attack with Beak" once to make initial behavior.

6. Make Attack Behavior

  Make behaviors such as attack behaviors and raising head (ready behavior) by inputting proper goal position values into ID[2], ID[3] joints, and program "Behavior Wating(7)" function which can stop the behavior control program processing shortly until each behavior is completed.

### Download Task Code

[Download][ex_11-2] Complete Task Code ([How to Download Task Code])

### Execute Task Code

Play the downloaded task code.
Check if the attacking duck attacks an approaching object or not.
Do not approach your face near the robot when the power is on. You may get injured by the robot.

![Attacking_Duck-4][img_028]

## [Obstacle Detecting Car](#obstacle-detecting-car)

Objective for this tutorial is to build an intellectual car which runs and avoids obstacles. Please refer to 2-2-9 Obstacle Detection Car of the assembly manual and complete the hardware.

![Obstacle_Car-1][img_029]

The behavior patterns of the obstacle detection car pursuant to obstacle detection in each direction are as follows.

|Left|Front|Right|Behavior Pattern|
|:---:|:---:|:---:|:---:|
|-|-|-|Forward|
|O|-|-|Turn Right|
|-|O|-|Backward|
|O|O|-|Turn Right|
|-|-|O|Turn Left|
|O|-|O|Forward|
|-|O|O|Turn Left|
|O|O|O|Stop|

The mode of the robot is changed to wheel mode (infinite spinning mode) to use AX-12+ as the wheels of the obstacle detection car.
Using RoboPlus Manager, set both the CW location limit value and the CCW location limit value of AX-12+ to 0.

![Obstacle_Car-2][img_030]

### Write Task Code

  ![Obstacle_Car-3][img_031]

1. Save the basic value of the motor's moving speed as the variable

2. Use the standard value of the object detection and the object detection existence to judge object detection. To do so, set the object detection standard value.

3. Call appropriate motion functions pursuant to the object detection existence value. (Obstacle Detection Direction)

  ![Obstacle_Car-4][img_032]

4. Make Stop / Forward / Backward / Turn Right / Turn Left Motions. Each motor's moving speed is set by adding moving speed value which is the set speed value at the beginning and CW:0 and CCW:0 which represent directions.

### Download Task Code

[Download][ex_9-2] Complete Task Code ([How to Download Task Code])

### Execute Task Code

Play the downloaded task code. Check if the obstacle detection car runs and avoids the obstacles.

![Obstacle_Car-5][img_033]

## [Walking Droid 1](#walking-droid-1)

Objective for this tutorial is to make a walking droid which walks forward in normal situation and avoids obstacles.
Since the walking droid uses various postures when it performs such as walking, avoiding obstacles, etc., it is convenient to use by saving the postures as motions.

The following table represents the behavior patterns of the walking droid pursuant to surroundings and motion status.

|Status|Behavior|
|:---:|:---:|
|Initially executed|Stay in basic posture|
|No obstacles|Walking forward|
|Obstacles Found|Stop and walking backward|
|After walking backward|Changing direction to the left|
|Obstacles found even if turned left|Changing direction to the left|

Besides duplicated motions, 4 motions must be made as below, and the robot can avoid obstacles while walking.
- Stop
- Walking forward
- Walking backward
- Changing direction to the left

### Make Motions

1. Execute RoboPlus Motion and connect to the controller. (See "Connect Robot")

  ![Walking_Droid-1][img_034]

  ![Walking_Droid-2][img_035]

2. Enter the name on the page 1 to make "Stop" motion, and then add steps.

  ![Walking_Droid-3][img_036]

3. The joint values of ID 1, 2, 3, 4 are set to 512. The values are applied to the robot if the rightward arrow is pressed, and the set posture can be checked. (This is the method that users enter the joint values directly.)

  ![Walking_Droid-4][img_037]

4. Adjust the executing time. It is set to 0.072 second which is the fastest time.

  ![Walking_Droid-5][img_038]

5. Enter the name on the page 12 to make "Walking Forward" motion, and then add steps.

  ![Walking_Droid-6][img_039]

6. Turn off torques of all joints by pressing torque-off button. You can see all the joint values are set to "OFF."

  ![Walking_Droid-7][img_040]

  ![Walking_Droid-8][img_041]

7. The posture of robot are set by users. The following picture shows the walking posture of the walking droid.

  ![Walking_Droid-9][img_042]

8. As shown above, if the posture of robot is set and the "Torque-on" button is pressed, the present joint values of the robot are entered automatically to the posture of robot. The currently entered robot's joints can be read as steps' posture if the leftward arrow button is pressed(This is the method that users read the joint values from the robot).

  ![Walking_Droid-10][img_043]

9. Repeating the procedure from number 5, add "Walking Forward" posture to each step. If the posture addition is completed, adjust the stop time and the execution time properly.

  ![Walking_Droid-11][img_044]

10. If the motion execution button is pressed, the steps of present page are executed sequentially. Check if the robot is operating well.

  ![Walking_Droid-12][img_045]

11. Using the same method so far, add "Walking Backward" on the page 13 and "Turn Left" on the page 15.

  ![Walking_Droid-13][img_046]

12. Save the works have been done so far.

  ![Walking_Droid-14][img_047]

### Download Motion File

[Download][walking_droid_ex-1] Example Motion File ([How to Download Motion File])

## [Walking Droid 2](#walking-droid-2)

### Execute Motions

To use this motion after saving the motions written on RoboPlus Motion in CM-5, the motions of CM-5 must be executed in the task code. Using the two parameters, the motions of robots can be executed.

![Walking_Droid-15][img_048]

"Load" command must be used to execute the motions. If the "Load" command is selected, two parameter are created. In one parameter on the left, Motion Page in Controller -> Motion is selected, and in the other parameter on the right, the motion page number which includes desired motions is entered.
If the task code is written as below and downloaded and executed in CM-5, the saved motions are executed on the page 5.

![Walking_Droid-16][img_049]

#### Executing Asynchronous Motions

It is a motion control method which makes robots do the next work without checking motion status of the robots. It is suitable for beginners because understanding the code is very intuitive. However, it may not be controlled as desired since duplicate execution can happen during the motion execution.

#### Executing Synchronous Motions

It is a motion control method which make robots do the next work after completing the execution by checking the motion status of the robots. It is suitable for intermediate-level users because the concept of Multi-Task is needed. In the case of infinite repetition motions, the task code must be written well since it may wait continuously when the motion status is checked.

![Walking_Droid-17][img_050]

#### Infinite Repetition Motions

It is effective to make regularly-repeated motions such as walking as an infinite repetition motion.

### Write Task Code

  ![Walking_Droid-18][img_051]

1. Call "Ready" when it is executed for the first time.
2. Call "Forward" if there is no obstacle.
3. If an object is detected by Central Distance Sensor, Stop and walk backward,and then turn left.
4. Even though it turns left, if an object is detected by Central Distance Sensor, it turns left until no object is detected.

  ![Walking_Droid-19][img_052]

5. Write a  function which executes the motion on the page 1 where the "Ready" motion is saved. To wait until the motion is complete after execution, Call the function "WaitMotion."
6. Write a function which executes the motion on the page 12 where the "Forward" motion is saved. To wait until the motion is complete after execution, Call the function "WaitMotion."
7. Write a function which executes the motion on the page 13 where the "Backward" motion is saved. To wait until the motion is complete after execution, Call the function "WaitMotion."
8. Write a function which executes the motion on the page 15 where the "TurnLeft" motion is saved. To wait until the motion is complete after execution, Call the function "WaitMotion."
9. Check the parameter value of the motion status, and write a function which waits while the motion is operating.

### Download Task Code

[Download][ex_14-2] Complete Task Code ([How to Download Task Code])

### Execute Task Code

Play the downloaded task code.  Leave obstacles on the way of the path, and then check if the walking droid avoids the obstacles and walks.

![Walking_Droid-20][img_053]

## [Walking Droid 3](#walking-droid-3)

After adding turn-right motion to previously built Walking Droid, let us try wireless control(Zigbee Communication) using RC-100.
Referring to Building Walking Droid 1 - Making Motion, you can make the right-turn motion additionally on the page 4 of the motion.
For Zigbee communication, CM-5 and RC-100 are equipped with ZIG-100 module. (Please refer to the explanation pages on CM-5 and RC-100.)


If U / L / D / R buttons of RC-100 are pressed, the Walking Droid performs forward / turn left / backward /turn right motions.

### Write Task Code

Based on previously written task code in Building Walking Droid 2 - Task Code:

![Walking_Droid-21][img_054]

1. Wait until the new wireless data is coming in, and if the data is coming in, it is saved in the received data variable.
2. In the received data, only the values regarding U / D / L / R keys in RC-100 are sorted by & Bit Calculation.
3. Compose the conditional sentences to perform forward / backward / turn left / turn right pursuant to the pressed buttons among all buttons. RC-Call "Ready" at the moment of releasing the pressed button of RC-100.
4. Write a function which executes the motion on the page 14 where the "TurnRight" motion is saved.  To wait until the motion is complete after execution, call the function "WaitMotion."

### Download Task Code

[Download][ex_14-2] Complete Task Code ([How to Download Task Code])
[Download][ex_14-3] Example Motion File ([How to Download Motion File])

### Execute Task Code

Play the downloaded task code. Using RC-100, check if the robot moves to the desired directions by performing forward / backward / turn left / turn right motions.

## [Converting .bpg to .tsk](#converting-bpg-to-tsk)

Objective for this tutorial is to convert .bpg files written in Behavior Control Program into the Task code (.tsk) for RoboPlus Task.

### Open .bpg File

1. Open .bpg file using Open
  Press Menu ≫ File(F) ≫ Open(O), Shortcut(Ctrl + O), or  Open() to select a file.

2. Open .bpg file using Drag & Drop
  Drag .bpg file to RoboPlus Task.

![Convert_tsk_01][img_055]

### Convert Commands

- Start Program (Click here to see more information on the "Start Program." )

  It is the same as existing "Start".
  `}` (Section End) of Start Program is the same as existing "End".

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_02][img_056]|![Convert_tsk_03][img_057]|

- End Program ( Click here to see more information on the "End Program" )

  It is the same as existing Jump to the Label of "End" Command.

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_04][img_058]|![Convert_tsk_05][img_059]|

- `{` (Start Block) / } (End Block) ( Click here to see more information on the "Start/End of Block." )

  Lately added concept-  it is not included in existing Behavior Control Program 1.0.

- `//` (Comment or Memo) ( Click here to see more information. )

  It is the same as existing "Comment."  It does not have any influences on motions.

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_06][img_060]|![Convert_tsk_07][img_061]|

- Calculate (Basic Calculation and Bit Calculation) ( Click here to see more information on the "Calculate." )

  It is the same as existing "Compute."

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_08][img_062]|![Convert_tsk_09][img_063]|

- Load (Input Values) ( Click here to see more information on the "Load." )

  It is the same as existing  "LOAD".

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_10][img_064]|![Convert_tsk_11][img_065]|

- Label (The Site for Jump) ( Click here to see more information on the "Label." )

  It is the same as existing "Label". However, it is not possible to be called as in Behavior Control Program 1.0; only Jump is possible.

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_12][img_066]|![Convert_tsk_13][img_067]|

- Jump (goto) ( Click here to see more information on the "Jump." )

  It is the same as existing "JUMP."

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_14][img_068]|![Convert_tsk_15][img_069]|

- (if) / (else if) / (else) ( Click here to see more information on the "if / else if / else." )

  It is the same as existing "(IF) / (ELSE IF) / (ELSE)".

|RoboPlus Task|
|:---:|
|![Convert_tsk_16][img_070]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_17][img_071]|

- In case that (CONT IF) comes after existing (AND), it is changed to &&.
- In case that (CONT IF) comes after existing (OR),  it is changed to ||.

|RoboPlus Task|
|:---:|
|![Convert_tsk_18][img_072]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_19][img_073]|

- Endless Loop (while(1)) ( Click here to see more information on the "Endless Loop." )

  It is the same as the code repeating the execution of certain blocks unconditionally using Label and JUMP.

|RoboPlus Task|
|:---:|
|![Convert_tsk_20][img_074]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_21][img_075]|


- Loop While (while(Condition)) ( Click here to see more information on the "Loop While." )
  It is the same as the code repeating the execution of certain blocks using Label and JUMP, depending on conditions.

|RoboPlus Task|
|:---:|
|![Convert_tsk_22][img_076]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_23][img_077]|


- Loop For (for) ( Click here to see more information on the "Loop For." )
  It is the same as the code repeating the execution of certain blocks only designated times using variables.

|RoboPlus Task|
|:---:|
|![Convert_tsk_24][img_078]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_25][img_079]|


- Break Loop (break) ( Click here to see more information on the "Break Loop." )

  It is used equally as the code jumping to the next label of repeated sentences.

|RoboPlus Task|
|:---:|
|![Convert_tsk_26][img_080]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_27][img_081]|

- Wait While (Conditional Repeat without Execution Paragraph) ( Click here to see more information on "Wait While." )

  In case the condition is "True", it is used equally as the code jumping to its own label.

|RoboPlus Task|
|:---:|
|![Convert_tsk_28][img_082]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_29][img_083]|


- Callback Function (callback) ( Click here to see more information on "Callback" function. )

  Lately added concept : it is not included in existing Behavior Control Program 1.0.

- Make/Call Function ( Click here to see more information on "Make/Call Function. )

  The function is the same as the sub-routine composed of existing Label and RETURN.
  In RoboPlus Task, the function must be located outside of the block where is owned by Start Program (the block tied with { AND }).

|RoboPlus Task|
|:---:|
|![Convert_tsk_30][img_084]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_31][img_085]|


- Exit Function (return) ( Click here to see more information on "Exit Function." )

  It is the same as the code performing JUMP to the label of existing RETURN.

|RoboPlus Task|
|:---:|
|![Convert_tsk_32][img_086]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_33][img_087]|

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/aHIJ5pKkC6Q" frameborder="0" allowfullscreen></iframe>

# [Download](#download)

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

## [Download Motion File](#download-motion-file)

File motions can be converted into robot motions.

1. Open the file motion to download.

2. Connect to the robot.

3. Click on the "Download Motion" menu and wait for the download to complete.

  ![Download_Motion-01](/assets/images/edu/bioloid/bioloid_down_motion_01.png)

4. Verify that the contents of the file motion have been copied to the robot motion as seen below.

  ![Download_Motion-02](/assets/images/edu/bioloid/bioloid_down_motion_02.png)

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/dHCqPs1_2yY" frameborder="0" allowfullscreen></iframe>

## [Examples](#examples)

|Robot|Description|
|:---:|:---|
|1. Crossing Gate<br />![Ex_01][img_ex_01]|[Download][ex_1-1] Assembly Check Task File<br />[Download][ex_1-2] Task File<br />[Download][ex_1-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[1]: Joint Mode<br />- When `U` button on CM-5 is pressed, the gate will be opened.<br />- When `D` button on CM-5 is pressed, the gate will be closed.|
|2. Universal Gauge<br />![Ex_02][img_ex_02]|[Download][ex_2-1] Assembly Check Task File<br />[Download][ex_2-2] Task File<br />[Download][ex_2-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[2]: Joint Mode<br />- When `U` button on CM-5 is pressed, the speed of gauge will be increased.<br />- When `D` button on CM-5 is pressed, the speed of gauge will be decreased.|
|3. Sound Lever Meter<br />![Ex_03][img_ex_03]|[Download][ex_3-1] Assembly Check Task File<br />[Download][ex_3-2] Task File<br />[Download][ex_3-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[1]: Joint Mode, AX-S1 ID[100]<br />- The gauge will move according to the sound volumes detected.<br />- The sound level can be measured because the gauge makes move more when the sound is getting louder.|
|4. Crocodile Mouth<br />![Ex_04][img_ex_04]|[Download][ex_4-1] Assembly Check Task File<br />[Download][ex_4-2] Task File<br />[Download][ex_4-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[3]: Joint Mode, AX-S1 ID[100]<br />- The mouth will be opened when the sensor detects an object.<br />- The mouth will be opened, if there is an object in the mouth.<br />- It will play a melody if no object is detected for 10 sec.|
|5. Pan Tilt<br />![Ex_05][img_ex_05]|[Download][ex_5-1] Assembly Check Task File<br />[Download][ex_5-2] Task File<br />[Download][ex_5-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[3, 4]: Joint Mode<br />- Upper/lower tilt joint will move upwards, when you press the U button on CM-5.<br />- Upper/lower tilt joint will move downwards, when you press the D button on CM-5.<br />- Right/Left pan joint will move rightwards, when you press the R button on CM-5.<br />- Right/Left pan joint will move leftwards, when you press the L button on CM-5.|
|6. Parking Gate<br />![Ex_06][img_ex_06]|[Download][ex_6-1] Assembly Check Task File<br />[Download][ex_6-2] Task File<br />[Download][ex_6-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[1, 2]: Joint Mode, AX-S1 ID[100]<br />- If an object is detected from a sensor, the barrier bar will be open vertically.<br />- If an object is detected from a sensor and the barrier bar is pushed ahead at the same time, the bar will be open horizontally.<br />- The barrier bar will be closed, if no objects are detected.|
|7. Melody Car<br />![Ex_07][img_ex_07]|[Download][ex_7-1] Assembly Check Task File<br />[Download][ex_7-2] Task File<br />[Download][ex_7-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[1, 2, 3, 4]: Wheel Mode, AX-S1 ID[100]<br />- It will move forward some distance with melody, when `L` button is pressed.<br />- It will move backward some distance with melody, when `R` button is pressed.<br />- It will turn right with melody, when `U` button is pressed.<br />- It will turn left with melody, when `D` button is pressed.|
|8. Robot Arm<br />![Ex_08][img_ex_08]|[Download][ex_8-1] Assembly Check Task File<br />[Download][ex_8-2] Task File<br />[Download][ex_8-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[1, 2, 3]: Wheel Mode<br />- It will rotate its arms rightward, if you press the R button on CM-5.<br />- It will rotate it arms leftward, if you press the L button on CM-5.<br />- It will stretch its elbows, if you press the U button on CM-5.<br />- It will bend over its elbows, if you press the D button on CM-5.<br />- It will stretch its wrists, if you press the start button and U button at the same time.<br />- It will bend over its wrists, if you press the start button and D button at the same time.|
|9. Obstacle Detecting Car<br />![Ex_09][img_ex_09]|[Download][ex_9-1] Assembly Check Task File<br />[Download][ex_9-2] Task File<br />[Download][ex_9-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[1, 2, 3, 4]: Wheel Mode, AX-S1 ID[100]<br />- Operate the detecting car after installing obstacles on the driving path.<br />- Detect obstacles by itself, and avoid them while driving.|
|10. Greeting Penguin<br />![Ex_10][img_ex_10]|[Download][ex_10-1] Assembly Check Task File<br />[Download][ex_10-2] Task File<br />[Download][ex_10-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[1, 2, 3, 4]: Joint Mode, AX-S1 ID[100]<br />- If you put on your hands ahead of its head, it will bow.<br />- If you put on your hands on the right side of its head, it will lift up its right hand.<br />- If you put on your hands on the left side of its head, it will lift up its left hand.|
|11. Attacking Duck<br />![Ex_11][img_ex_11]|[Download][ex_11-1] Assembly Check Task File<br />[Download][ex_11-2] Task File<br />[Download][ex_11-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[1, 2, 3]: Joint Mode, AX-S1 ID[100]<br />- If you try to touch on its head with hands, it will attack  using its beak.<br />- If  you touch on the right side of its head, it turns its head right.<br />- If you touch on the left side of its head, it turns its head left.|
|12. Cliff Detecting Car<br />![Ex_12][img_ex_12]|[Download][ex_12-1] Assembly Check Task File<br />[Download][ex_12-2] Task File<br />[Download][ex_12-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[1, 2, 3, 4]: Wheel Mode, AX-S1 ID[100]<br />- Operate the detecting car after installing cliffs and obstacles on the driving path.<br />- Detects cliffs and obstacles by it self, and avoid them while driving.|
|13. Clapping Penguin<br />![Ex_13][img_ex_13]|[Download][ex_13-1] Assembly Check Task File<br />[Download][ex_13-2] Task File<br />[Download][ex_13-3] Video<br /> `Dynamixel Setting`: AX-12+ ID[1, 2, 3, 4]: Joint Mode, AX-S1 ID[100]<br />- It will bow, if you put your hands in front of its head.<br />- It will clap as much times as your clapping sounds are heard.|
|14. Waking Droid<br />![Ex_14][img_ex_14]|[Download][ex_14-1] Assembly Check Task File<br />[Download][ex_14-2] Task File<br />[Download][ex_14-3] Motion File<br />[Download][ex_14-4] Video<br />`Dynamixel Setting`: AX-12+ ID[1, 2, 3, 4]: Joint Mode, AX-S1 ID[100]<br />- Operate the walking droid, after installing obstacles on walking path.<br />- Detect obstacles by itself and avoid them while walking by feet.|


# [References](#references)

## [Replacing Fuse(CM-5)](#replacing-fuse-cm-5)

The fuse prevents the over power that flows in the CM-5 which can damage the circuit.
If the CM-5 does not turn on with the battery but turns on when connected to the SMPS, replace your fuse.

If the fuse is disconnected, followings will happen.
- Can turn on the power of CM-5 with SMPS only.
- The LED doesn't blink even when you press the U button for charging.

The fuse used for CM-5 is available at electric shops( Fuse Volume : 220V/5A )
{: .notice}

![CM-5_Fuse](/assets/images/parts/controller/cm-5/cm_5_fuse.png)

<iframe width="560" height="315" src="https://www.youtube.com/embed/sRWP5QLsqiU" frameborder="0" allowfullscreen></iframe>

## [Dynamixel Management](#dynamixel-management)

Dynamixels used as robot actuators possess many functions. This section explains how to change the dynamixel's settings.

### Changing the ID

1. Select the port the controller is connected to.
2. Click “Connect”.

  ![DXL_Management_01](/assets/images/sw/rplus1/manager/dxl_management_01.png)

3. A list of connected dynamixels is shown on the left. Click on the dynamixel you wish to change the ID of.
4. Click on the ID row in the Control Table.
5. Click on the ID List combo box to see a list of possible ID's. Select the ID, then click Apply.

  ![DXL_Management_02](/assets/images/sw/rplus1/manager/dxl_management_02.png)


- To use in RoboPlus Motion and RoboPlus Task, the ID must be within the following ranges.
  - The Dynamixel’s ID must be between 0 and 25.
  - The ID for AX-S1 should be set between 100 and 109.

### Changing the Movement Mode

The dynamixel can operate in 2 different modes.
- Wheel Mode : Rotates 360 degrees like a regular motor.
- Joint Mode : Moves at a set angle with normal servo motors.

The mode can be changed using RoboPlus Manager. Once the mode is set, it will be maintained, even when turned off.

1. Select the port the controller is connected to.
2. Click “Connect”.

  ![DXL_Management_03](/assets/images/sw/rplus1/manager/dxl_management_03.png)

3. A list of connected Dynamixels is shown on the left.  Click on the Dynamixel you wish to change the mode of. Then, click on the CW/CCW Angle Limit line in the Control Table.
4. To set to Wheel Mode, change the CW/CCW Angle Limit value to “0.”  Or, simply click on the "Wheel Mode" button.

  ![DXL_Management_04](/assets/images/sw/rplus1/manager/dxl_management_04.png)

5. To set to Joint Mode again, set the CW/CCW Angle Limit value to any number other than "0".
The initial values for Joint Mode are "0" for CW Angle Limit, and "1023" for CCW Angle Limit.

### Troubleshooting

If you cannot find the dynamixel you are looking for using RoboPlus Manager, try the following :
1. Connect just 1 Dynamixel and check if there are any duplicate IDs. If you see a Dynamixel on the left even though only 1 Dynamixel is connected, there is a high probability of a duplicate ID. Change the ID immediately.
2. If you are unable to find any Dynamixels as in the image below, click on "Dynamixel Search". If the communication speed is not set to 1Mbps, the "Dynamixel Search" function automatically resets the controller’s communication speed to 1Mbps to enable it to be recognized.

  ![DXL_Management_05](/assets/images/sw/rplus1/manager/dxl_management_05.png)

If the problem persists, your dynamixel may need repair. Please contact the service department of the company you purchased from.

{% include en/parts/communication/zigbee_control.md %}

## [Control Multiple Robots](#control-multiple-robots)


[CM-5]: /docs/en/parts/controller/cm_5/
[AX-12]: /docs/en/dxl/ax/ax-12a/
[AX-S1]: /docs/en/parts/sensor/ax-s1/
[latest version of RoboPlus]: http://en.robotis.com/BlueAD/board.php?bbs_id=downloads&mode=view&bbs_no=1152561&page=1&key=&keyword=&sort=&scate=
[Firmware Update]: ???
[USB2Dynamixel]: ???
[How to Download Task Code]: #download-task-code
[How to Download Motion File]: #download-motion-file
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
[img_011]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_01.png
[img_012]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_02.png
[img_013]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_03.png
[img_014]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_04.png
[img_015]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_05.png
[img_016]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_06.png
[img_017]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_07.png
[img_018]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_08.png
[img_019]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_09.png
[img_020]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_10.png
[img_021]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_11.png
[img_022]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_12.png
[img_023]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_13.png
[img_024]: /assets/images/edu/bioloid/bioloid_entry_tutorial_led.png
[img_025]: /assets/images/edu/bioloid/bioloid_entry_tutorial_attackingduck_01.png
[img_026]: /assets/images/edu/bioloid/bioloid_entry_tutorial_attackingduck_02.png
[img_027]: /assets/images/edu/bioloid/bioloid_entry_tutorial_attackingduck_03.png
[img_028]: /assets/images/edu/bioloid/bioloid_entry_tutorial_attackingduck_04.png
[img_029]: /assets/images/edu/bioloid/bioloid_entry_tutorial_obstaclecar_01.png
[img_030]: /assets/images/edu/bioloid/bioloid_entry_tutorial_obstaclecar_02.png
[img_031]: /assets/images/edu/bioloid/bioloid_entry_tutorial_obstaclecar_03.png
[img_032]: /assets/images/edu/bioloid/bioloid_entry_tutorial_obstaclecar_04.png
[img_033]: /assets/images/edu/bioloid/bioloid_entry_tutorial_obstaclecar_05.png
[img_034]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_01.png
[img_035]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_02.png
[img_036]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_03.png
[img_037]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_04.png
[img_038]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_05.png
[img_039]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_06.png
[img_040]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_07.png
[img_041]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_08.png
[img_042]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_09.png
[img_043]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_10.png
[img_044]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_11.png
[img_045]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_12.png
[img_046]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_13.png
[img_047]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_14.png
[img_048]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_15.png
[img_049]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_16.png
[img_050]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_17.png
[img_051]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_18.png
[img_052]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_19.png
[img_053]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_20.png
[img_054]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_21.png
[img_055]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_01.png
[img_056]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_02.png
[img_057]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_03.png
[img_058]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_04.png
[img_059]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_05.png
[img_060]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_06.png
[img_061]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_07.png
[img_062]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_08.png
[img_063]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_09.png
[img_064]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_10.png
[img_065]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_11.png
[img_066]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_12.png
[img_067]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_13.png
[img_068]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_14.png
[img_069]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_15.png
[img_070]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_16.png
[img_071]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_17.png
[img_072]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_18.png
[img_073]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_19.png
[img_074]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_20.png
[img_075]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_21.png
[img_076]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_22.png
[img_077]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_23.png
[img_078]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_24.png
[img_079]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_25.png
[img_080]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_26.png
[img_081]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_27.png
[img_082]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_28.png
[img_083]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_29.png
[img_084]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_30.png
[img_085]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_31.png
[img_086]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_32.png
[img_087]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_33.png

[img_ex_01]: /assets/images/edu/bioloid/bioloid_entry_crossinggate.png
[img_ex_02]: /assets/images/edu/bioloid/bioloid_entry_universal_gauge.jpg
[img_ex_03]: /assets/images/edu/bioloid/bioloid_entry_sound_level.jpg
[img_ex_04]: /assets/images/edu/bioloid/bioloid_entry_crocodilemouth.jpg
[img_ex_05]: /assets/images/edu/bioloid/bioloid_entry_pantilt.jpg
[img_ex_06]: /assets/images/edu/bioloid/bioloid_entry_parkinggate.jpg
[img_ex_07]: /assets/images/edu/bioloid/bioloid_entry_melodycar.png
[img_ex_08]: /assets/images/edu/bioloid/bioloid_entry_robot_arm.png
[img_ex_09]: /assets/images/edu/bioloid/bioloid_entry_obstacledetection.jpg
[img_ex_10]: /assets/images/edu/bioloid/bioloid_entry_greetingpenguin.jpg
[img_ex_11]: /assets/images/edu/bioloid/bioloid_entry_attackingduck.jpg
[img_ex_12]: /assets/images/edu/bioloid/bioloid_entry_melodycar.png
[img_ex_13]: /assets/images/edu/bioloid/bioloid_entry_clappingpenguin.png
[img_ex_14]: /assets/images/edu/bioloid/bioloid_entry_walkingdroid.png

[ex_1-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_crossinggate_check_en.tsk
[ex_1-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_crossinggate_en.tsk
[ex_1-3]: http://www.robotis.com/video/1_1.wmv
[ex_2-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_universalgauge_check_en.tsk
[ex_2-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_universalgauge_en.tsk
[ex_2-3]: http://www.robotis.com/video/1_2.wmv
[ex_3-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_soundlevelmeter_check_en.tsk
[ex_3-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_soundlevelmeter_en.tsk
[ex_3-3]: http://www.robotis.com/video/1_3.wmv
[ex_4-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_crocodilemouth_check_en.tsk
[ex_4-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_crocodilemouth_en.tsk
[ex_4-3]: http://www.robotis.com/video/1_4.wmv
[ex_5-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_pantilt_check_en.tsk
[ex_5-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_pantilt_en.tsk
[ex_5-3]: http://www.robotis.com/video/1_5.wmv
[ex_6-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_parkinggate_check_en.tsk
[ex_6-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_parkinggate_en.tsk
[ex_6-3]: http://www.robotis.com/video/1_6.wmv
[ex_7-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_melodycar_check_en.tsk
[ex_7-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_melodycar_en.tsk
[ex_7-3]: http://www.robotis.com/video/1_7.wmv
[ex_8-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_robotarm_check_en.tsk
[ex_8-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_robotarm_en.tsk
[ex_8-3]: http://www.robotis.com/video/1_8.wmv
[ex_9-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_obstacledetectioncar_check_en.tsk
[ex_9-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_obstacledetectioncar_en.tsk
[ex_9-3]: http://www.robotis.com/video/1_9.wmv
[ex_10-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_greetingpenguin_check_en.tsk
[ex_10-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_greetingpenguin_en.tsk
[ex_10-3]: http://www.robotis.com/video/1_10.wmv
[ex_11-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_attackingduck_check_en.tsk
[ex_11-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_attackingduck_en.tsk
[ex_11-3]: http://www.robotis.com/video/1_11.wmv
[ex_12-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_cliffdetectioncar_check_en.tsk
[ex_12-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_cliffdetectioncar_en.tsk
[ex_12-3]: http://www.robotis.com/video/1_12.wmv
[ex_13-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_clappingpenguin_check_en.tsk
[ex_13-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_clappingpenguin_en.tsk
[ex_13-3]: http://www.robotis.com/video/1_13.wmv
[ex_14-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_walkingdroid_check_en.tsk
[ex_14-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_walkingdroid_en.tsk
[ex_14-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_walkingdroid_en.mtn
[ex_14-4]: http://www.robotis.com/video/1_14.wmv
[walking_droid_ex-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_walkingdroidexam1_en.mtn
