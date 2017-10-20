---
layout: archive
lang: en
ref: ollo_bugkit
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/ollo/bugkit/
sidebar:
  title: Bug Kit
  nav: "ollo_bugkit"
---

# [Introduction](#introduction)
OLLO Bug Kit is the third kit among the kits for everyone, and the bug robots that play line-tracing game (The robots detect lines by themselves) and control game (The robots are controlled by wireless controllers) can be built by the kit.  The assembly manual is included to build 4 types of bug robots: Beetles, Ladybugs, Callipogon Relictus, and Grasshoppers.  Build the one and only robot for yourself.

`Note` All-in-one sensor type controller([CM-100]) and [Geared Motor] are included in OLLO Bug Kit. [USB Downloader(LN-101)] must be purchased to build and download the program that the users can control the bug robots directly. Please refer to [Programming] on how to program.
{: .notice}


## The Examples of 4-Types of Bug Robot built according to the Assembly Manual.

![img_01][ollo_bug_examples]


## The Examples of Game with OLLO Bug Robots

`OLLO Bug Game 1` Bug Battle
1. Place a robot in the circle.
2. Start the game with the whistling of the referee.
3. Push the opponent's robot to the outside of the circle, You Win~!!

![img_02][ollo_bug_battle]

`OLLO Bug Game 2` Bug Line-Tracing
1. Place a bug robot on the line.
2. The robot traces the line as soon as the power is turned on.
3. Line-printed handout for OLLO Bug Line-Tracing : [OLLO_LineTrace.pdf]

![img_03][ollo_bug_linetracer]

Make the line to be traced by the bug using the enclosed puzzle board with various shapes.
The robot can go anywhere it wants.
Line-printed handout for bug puzzle race : [OLLO_PuzzleRacing.zip]

![img_04][ollo_bug_linetracer2]

# [Getting Started](#getting-started)

## [Part List](#part-list)

![img_05][ollo_bug_partlist]


- [CM-100]
- [RC-100]
- [Geared Motor]

## [How to Play](#how-to-play)

The Basic Bug Program is supposed to be included when OLLO Bug Kit is manufactured. How to play of the basic bug program is as below.

Powering Bug

If you press the start button one time, the power is turned on; if you press the button once again, it is turned off.
The bug controller (CM-100) has power-saving function, if the start button is not pressed again, the power is automatically turned off in 5 minutes.
The power-saving function can be controlled by task code, and it is set to 5 minutes in the basic program.(See How to Control with Task Code)

![img_06][CM-100_label]

The Control Mode of the Remote Controller

![img_07][ollo-RC100]

It is executed if the start button is pressed 1 or 2 times.( time: IR Channel 1, 2 times: IR Channel 2)
The IR channel of RC-100 remote control must be matched to control wireleslly. (See How to Change the RC-100 IR Channel)
The moving direction of  the bug robot is controlled using U / L / D / R button of RC-100.
If servo motor is connected to Port 3, the motor is controlled using button 1 and 3.
If servo motor is connected to Port 4, the motor is controlled using button  2 and 4.
(Servo motor is not a basic-offered item; please purchase and connect it.)

Line-Tracer Mode

![img_08][ollo_bug_linetracer]

If you press the start button 3 times, it is executed.
The robot traces the black line on the white floor.
If an object is detected, it stops; if you clap, it traces the line again.

{% include en/parts/communication/zigbee_control.md %}

# [Applications](#applications)

## [Battle Bug](#battle-bug)
If you purchase and connect additional Servo Motor to OLLO Bug Kit, various types of battle bugs can be built.
The Basic Program for OLLO Bug is programmed to be able to control using RC-100 when a servo motor is connected to port 3 or 4.
If servo motor is connected to Port 3, the motor is controlled using button 1 and 3.
If servo motor is connected to Port 4, the motor is controlled using button 2 and 4.

![img_09][ollo_bug_battle]

## [Car](#car)
If you purchase Big Tire Set additionally for OLLO Bug Kit, you can build cars with the tires.

![img_10][ollo_bug_car]

## [Other Devices](#other-devices)
Besides the parts introduced in 'Building Battle Bugs' and 'Building Cars,'  the following parts for OLLO controller (CM-100) are used to build various types of robots.

|IR Sensor|Touch Sensor|LED Module|
| :-----: | :-----: | :-----: |
|![img_10][ir_sensor]|![img_11][touch_sensor]|![img_12][led_module]|



# [Learning Program](#learning-program)

## [Print on the Screen](#print-on-the-screen)

### Objective

Write a program which prints out and checks the value of central IR sensor of the controller (CM-100) on the monitor for program output window.

![img_01][img_01]

### Preparation

To accomplish the learning objectives, write a task code first; RoboPlus software which can pop up the monitor window for program printout and the controller(CM-100) which can transmit the value of central IR sensor to PC by executing task code are necessary. Moreover, USB Downloader(LN-101) is needed to connect PC and the controller.

### Writing Task Code

1. Execute RoboPlus Task Program.

    ![img_02][img_02]

2. Select the Controller. If you select an empty line, and then Double Click or press Enter, Selecting Controller window is popped up. Select a controller, and then press OK button.

    ![img_03][img_03]

3. Writing Start Program. In the Select Instruction Type window, Select Program Start by Double clicking, and then press Enter.

    ![img_04][img_04]

4. Enter Endless Loop. Use Endless Loop to read the IR sensor value repeatedly and print out on the screen. Select the empty line between { and } and Instruction Selection window pops up if you press Enter or Double click.  Select Loop -> Endless Loop (while(1)).

    ![img_05][img_05]

5. Enter Load. Use Load to read the IR sensor value and enter as Screen Display. Input in the empty line between { and } of Endless Loop by selecting Execute -> Load (Assignment Value).

    ![img_06][img_06]

6. Load the value of Central IR Sensor by Screen Output. Select the left parameter( ? ) among the parameters of Load instruction. (Explanation Regrading Parameter). Parameter selection window is popped up as below if you double click ? and then press Enter.  Select Controller -> Print with Line and press OK.

    ![img_07][img_07]

    As above, input Controller -> Central IR Sensor in the right parameter ( ? ).

    ![img_08][img_08]

    The following screen shows that all the parameters of Load instruction are entered.

    ![img_09][img_09]

7. Save Task Code. Press Ctrl + S or Save Button to save.

    ![img_10][img_10]


### Download Task Code

Download the task code written above to the controller. ([How to Download Task code])


### Run Program

1. Popping up the monitor for program printing window. To see the screen output during the program execution, monitor for program printing window must be popped up before program execution. How to pop up the monitor for program printing window: Click View Program Output button in the Program Download window, click View Program Output button in Toolbox, select View Program Output(V) of Program(V) menu, or Press F5 button.

2. Executing the Program. Once the monitor for program printing window is popped up, execute the downloaded program for the controller.  The internal LED is turned on by pressing the start button on the controller, and the downloaded program is executed. Check if the number values on the monitor for program printing window are changing or not by moving hands close and far from the front of central IR sensor of the controller.
![img_11][img_11]


## [Move the Bug](#move-the-bug)

### Objective

Let us move the bug forward, left, right, and backward. (The bug robot can be made with OLLO Explorer and Inventor.)

|![img_12-1][img_12-1]|![img_12-2][img_12-2]|![img_12-3][img_12-3]|![img_12-4][img_12-4]|
|:---:|:---:|:---:|:---:|
|Forward|Left|Right|Backward|
|Left Motor: Forward<br />Right Motor: Forward|Left Motor: Stop<br />Right Motor: Forward|Left Motor: Forward<br />Right Motor: Stop|Left Motor: Backward<br />Right Motor: Backward|


### Preparation

PC(RoboPlus Task Program), Assembled Bug Robot, USB Downloader(LN-101)

### Writing Task Code

#### Move Forward

1. Executing RoboPlus Task and Creating program start (Please refer to See Printing Out the Screen). If RoboPlus Task is executed, the following screen can be seen.

    ![img_13][img_13]

2. Making Forward Function (Please refer here for more information on functions). Functions must be made outside of { and } in program start. Therefore, let us start making the functions from the 6th line. First of all, select Make Function on Function (Sub-routine) in the select instruction window which pops up if the 6th line is selected.

    ![img_14][img_14]

    The function is made as below.

    ![img_15][img_15]

    To designate function name, double click "Input_Name" part or enter the function name as "Forward" by pressing Enter as selected, and then press Enter again.

    ![img_16][img_16]

3. Motor Controlling to move the bug forward. For bug, two geared motors are supposed to move the legs made of left and right joints. To move the bug forward, both motors which move the legs must spin forward. To control geared motor, the motor control value must be entered using Load instruction. Select instruction type window is popped up if you double click the empty line between { and } of Forward function.  Select Execute -> Load (Assignment value).

    ![img_17][img_17]

    To control the geared motor (left motor) which is connected to port 1, select the first ? and enter Geared Motor Port 1.

    ![img_18][img_18]

    To designate the speed and the spin direction of the left motor, select the second ? and enter Direction : CCW and power : 1023. (CCW represents counter clockwise and the direction of the left motor.  Power 1023 is the maximum power value of geared motor; if the power is strong, the spinning power is also strong, The speed is fast.)

    ![img_19][img_19]

    The following image shows the control value CCW:1023 is entered port 1 of the geared motor.

    ![img_20][img_20]

    To control port 2 of the geared motor, insert an empty line under the instruction line just entered.  To insert an empty line, press Space at the desired location. The following image shows the Space is pressed after clicking the } location of Forward.

    ![img_21][img_21]

    As the method above, insert an instruction line which orders to spin at the power of 1023 (Maximum power) and CW direction (Clockwise) to port 2 of the geared motor. (In case of the right motor, CW is the forward direction.)

    ![img_22][img_22]

4. Calling Function (Please refer here for more information on functions). To execute Forward function as soon as the program of CM-100 is executed, Forward function must be called in Program Start. To make the program execute continuously, Endless Loop is used.  Enter Endless Loop between { and } of Program Start.

    ![img_23][img_23]

    Call Forward function in Endless Loop sentences.  Double click an empty line of Endless Loop or press Enter to select Call function on Function (Sub-routine).

    ![img_24][img_24]

    Double click Input_Name part or press Enter to make the list of currently-made functions.  Select Forward function or enter it directly.

    ![img_25][img_25]

    The following image shows the final results have been entered so far.

    ![img_26][img_26]


#### Moving Backward

For moving backward, simply change the direction of two motors from the forward direction. Thus, let us make Backward function by modifying the Forward function.

1. Copying the Forward function and then pasting (Pleaser refer to 5. Copy/Cut/Paste). Select all the Forward function while dragging the Mouse and pressing Shift Key or Ctrl Key.

    ![img_27][img_27]

    In the menu popped up by right-click, Copy by selecting Copy(C) or pressing Ctrl + C.

    ![img_28][img_28]

    After clicking the 15th line under the Forward function, attach the function copied by clicking Paste(P) in the popped-up menu or pressing Ctrl + V.

    ![img_29][img_29]

    The following image shows the copy and the paste of Forward function are completed.

    ![img_30][img_30]

2. Changing the name into Backward function and the direction of the motors. Change the name of copied fuction from Forward to Backward.  Double-click the function name part or press Enter to modify.
    ![img_31][img_31]

    Change the spin direction of both motors to the opposite. Double-click the right parameter (CW:1023 or CCW:1023) part or Enter to modify.
    ![img_32][img_32]

3. In start program, change the calling function from Forward to Backward. When the program is started, Backward function is executed repeatedly.
    ![img_33][img_33]


#### Turning Left

To make TurnLeft function, copy the Forward function the same as Backward function is copied and change the function name to TurnLeft; let the right motor (port 2) spin forward direction and stop only the left motor (port1) - Enter 0 in Power regardless CW/CCW;  the bug robot turns left.

![img_34][img_34]


#### Turning Right

To make TurnRight function, copy the Forward function the same as the Backward function is copied and change the function name to TurnRight; let the left motor (port 1) spin forward direction and stop only the right motor (port 2) - Enter 0 in Power regardless CW/CCW;  the bug robot turns right.

![img_35][img_35]

### Download Task Code

Please refer to Program Download on the program download procedure.

Program Result File :  bug_move.tsk


### Run Program

If you turn on CM-100 by pressing the start button, the bug robot continuously moves forward or backward, or it turns left or right depending on the function called from Start Program.

## [Line Tracing Bug](#line-tracing-bug)

### Objective

The degree of IR reflection varies pursuant to the colors of objects.  White reflects more IR, whereas black reflects less IR. Using such characteristics, let us program the IR sensor of CM-100 so that the robot can distinguish the white floor and the black line and trace the line.
(It is programmed in the basis of Moving the Bug.)

![img_linetracer][img_linetracer]

### Preparation

PC(RoboPlus Task Program), Assembled Bug Robot, USB Downloader(LN-101), a white board with a black line.

### Writing Task Code

The algorithm of program which distinguishes the white floor and the black line and makes the bug trace the black line using left IR sensor and right IR sensor on the bottom of CM-100 is as below.

![img_36][img_36]

- The right sensor detecting the black line (O), The left sensor detecting the black line (X) : Turn Right

    If the black line is detected only by the right sensor, it means the line is curved to the right; change the robot's moving direction to the right by stopping the right motor.

- The right sensor detecting the black line (X), The left sensor detecting the black line (O) : Turn Left

    In opposite to the case above, since the line is curved to the left, change the robot's moving direction to the left by stopping the left motor.

- The right sensor detecting the black line (X), The left sensor detecting the black line (X) : Forward

    If both sensors do not detect the line, the robot moves forward without changing the direction since the line is located in between the sensors or the robot escaped from the line.

- The right sensor detecting the black line (O), The left sensor detecting the black line (O) : Forward

    If both sensors detect the line, the robot moves forward without changing the direction since there is a black line in width such as an intersection of crossroads(+) or the floor is black.


Enter the code which calls different function depending on the detecting conditions of the left/right IR sensors in program start, as mentioned In the previous example of Moving the Bug, and move the bug robot.

1. Turn left if the black line is detected only in the left IR sensor. Enter IF instruction of a conditional sentence to move in different ways depending on the conditions between { and } of Endless Loop in program. (Please refer here for more information on IF instruction). The screen after entering IF instruction is as below.

    ![img_37][img_37]

    In the case that the black line is detected only on the left IR sensor, the value of left IR sensor is less than 200, while the value of right IR sensor is greater than 200. To find such conditions, enter left IR sensor in comparison parameter 1(the first ?) of the conditional sentence.

    ![img_38][img_38]

    Since the left IR sensor value must be less than 200, < is entered as the comparison operator between the two comparison parameters.

    ![img_39][img_39]

    Enter 200 in the comparison parameter 2 (the second ?).

    ![img_40][img_40]

    Since the conditions must be satisfied: ( Left IR Sensor < 100 ) and ( Right IR Sensor > 200 ), change the connecting operator to && (AND) by clicking then.  If the connecting operator is changed, a conditional sentence is automatically added to the next.

    ![img_41][img_41]

    Complete the IF instruction; enter right IR sensor on comparison parameter 1 of the second conditional sentence, > as the comparison operator, and 200 for comparison parameter 2.

    ![img_42][img_42]

    If the completed conditional sentence is True (If the black line is detected only on the left IR sensor), Calls TurnLeft function.

    ![img_43][img_43]

2. Conversely, turn right if the black line is detected only in the right IR sensor. To check the conditions continuously after the IF instruction of 1, enter ELSE IF instruction of a conditional sentence. If IF instruction conditional sentence of 1 is True, the ELSE IF instruction is not executed.

    ![img_44][img_44]

    Not like in 1, if the black line is detected only by the right IR sensor, the left IR sensor value is greater than 200, while the right IR sensor value is less than 200. Regarding the conditional sentence, refer to 1 and write the comparison operator in the opposite of 1.  In this case, TurnRight function is called.

    ![img_45][img_45]

3. In the cases besides 1 and 2, that it, the black line is detected by both IR sensors, or the line is not detected by both IR sensors; the robot moves forward. In the case that not belongs to the conditional sentences mentioned above, enter ELSE instruction of a conditional sentence to move forward, and call Forward function.

    ![img_46][img_46]


### Download Task Code

Please refer to Program Download on the program download procedure.

Program Result File :  bug_linetracer.tsk

Download the Handout for Line Tracer


### Run Program

Place the bug on the white board with a black line and play.  Check if the bug traces the line or not.

## [Sensing Bug](#sensing-bug)

### Objective

Let us program a robot which traces the black line on the white floor like the line-tracing bug and stops if an object is detected by the central IR sensor; moreover, if clapping sounds are detected, it traces the black line again. (It is programmed in the basis of The Line-Tracing Bug)

![img_47][img_47]

### Preparation

 PC(RoboPlus Task Program), Assembled Bug Robot, USB Downloader(LN-101), a white board with a black line.

### Writing Task Code

1. Add Stop Function. If an object is detected by the central IR sensor, Stop function is added to stop the movement. Make function referring to Moving the Bug.

    Enter Power 0 in the Left and Right Geared Motors and make Stop function.

    ![img_48][img_48]

2. Call Stop function if an object is detected by the central IR sensor.

    If the value of the central IR Sensor becomes greater than 200 by adding IF instruction in start program (an object is detected), call Stop function.

    ![img_49][img_49]

3. Wait shortly until the bug stops completely.

    To use sound detection, the bug must stop completely; it is assumed that if the bug moves, the sounds of the bug are detected since the moving sounds such as the motor sound are recognized by the mic of CM-100 as quite loud sounds.
    Therefore, add the code which waits for certain time period using timer. (Please refer here for more information on timer.)

    Enter 1 second in the timer using Load instruction.

    ![img_50][img_50]

    ![img_51][img_51]

    ![img_52][img_52]

    To wail until the timer becomes 0, use Conditional Stand instruction(Pleaser refer here for more information on conditional stand). It is Conditional Stand;;  waits until the value becomes 0 by counting (while the value is greater than 0).

    ![img_53][img_53]

    ![img_54][img_54]

4. Wait until the clapping sounds come out through mic.

    If the motions are stopped because an object is detected by the central IR sensor, make the code which waits until sounds are detected in stop status. Since Sound count is not automatically initialized to 0, it must be initialized to 0 by Load instruction before waiting(Please refer here for more information on sound count).

    ![img_55][img_55]

    ![img_56][img_56]

    Wait if the Sound Count is 0.


### Download Task Code

Please refer to Program Download on the program download procedure.

Program Result File :  bug_sensor.tsk


### Run Program

After executing the program, check if the bug robot stops or not when an object is detected by the central IR sensor. Later on, check if the bug moves again or not by clapping.

## [Control the Bug](#control-the-bug)

### Objective

Let us program a robot so as to control forward, backward, left and right using RC-100 controller(It is programmed in the basis of The sensor-responding bug).

![Bugkit_control][Bugkit_control]

### Preparation

PC(RoboPlus Task Program), Assembled Bug Robot, USB Downloader(LN-101), RC-100

### Writing Task Code

1. In the existing code, delete the surrounded part with { and } of Endless Loop in start program.

    ![img_57][img_57]

2. Wait until new wireless data arrive using Conditional Stand instruction to receive wireless control signal of RC-100(Please refer here for more information on new wireless data arrival).

    ![img_58][img_58]

    ![img_59][img_59]

3. If the new wireless data is arrived, enter the received wireless data in ReceivedData variable using Load instruction(Please refer here for more information on Variable).

    ![img_60][img_60]

    ![img_61][img_61]

    ![img_62][img_62]

4. Separate the RC-100 Moving Control Button value from the Received Wireless Data values.

    Enter U, L, D, R button values of RC-100 in MovingControlKey variable by separating necessary values through Bit Operator & from ReceivedData values using Compute instruction. Enter Compute instruction (Please refer here for more information on Compute instruction.)

    ![img_63][img_63]

    Enter MovingControlKey variable in Result column and then ReceivedData variable in Operation Parameter 1; select & (AND) as the next operator.

    ![img_64][img_64]

    Select U, L, D, R as RC-100 button values and enter them in Operation Parameter 2(Please refer here for more information on RC-100 button values).

    ![img_65][img_65]

    The following image shows the data are completely entered.

    ![img_66][img_66]

5. Move forward and backward and turn left and right depending on the value of MovingControlKey. it stops if all the MovingControlKey buttons are released.

    ![img_67][img_67]

### Download Task Code

Please refer to Program Download on the program download procedure.

Program Result File :  bug_rc.tsk

### Run Program

After executing the program, control the robot forward, backward, left, and right using RC-100 controller.

# [Download]

`Download` Task Code [OLLO_BUG_Product_EN.tsk]

`Note` [How to Download Task code]

`Note` [How to play Bug]


[ollo_bug_examples]: /assets/images/edu/ollo/ollo_bug_examples.png
[ollo_bug_battle]: /assets/images/edu/ollo/ollo_bug_battle.png
[ollo_bug_linetracer]: /assets/images/edu/ollo/ollo_bug_linetracer.png
[ollo_bug_linetracer2]: /assets/images/edu/ollo/ollo_bug_linetracer2.png
[ollo_bug_partlist]: /assets/images/edu/ollo/ollo_bug_partlist.png
[CM-100_label]: /assets/images/parts/controller/cm-100/cm-100_label_en.png
[ollo-RC100]: /assets/images/edu/ollo/ollo_bugkit_rc100.png
[ollo_bug_battle]: /assets/images/edu/ollo/ollo_bug_01.png
[ollo_bug_car]: /assets/images/edu/ollo/ollo_bug_02.png
[ir_sensor]: /assets/images/parts/sensors/ir.jpg
[touch_sensor]: /assets/images/parts/sensors/touch.jpg
[led_module]: /assets/images/parts/led/led.jpg
[img_01]: /assets/images/edu/ollo/ollo_bug_03.png
[img_02]: /assets/images/edu/ollo/ollo_bug_04.png
[img_03]: /assets/images/edu/ollo/ollo_bug_05.jpg
[img_04]: /assets/images/edu/ollo/ollo_bug_06.png
[img_05]: /assets/images/edu/ollo/ollo_bug_07.png
[img_06]: /assets/images/edu/ollo/ollo_bug_08.png
[img_07]: /assets/images/edu/ollo/ollo_bug_09.png
[img_08]: /assets/images/edu/ollo/ollo_bug_10.png
[img_09]: /assets/images/edu/ollo/ollo_bug_11.png
[img_10]: /assets/images/edu/ollo/ollo_bug_12.png
[img_11]: /assets/images/edu/ollo/ollo_bug_13.png
[img_12-1]: /assets/images/edu/ollo/ollo_bug_14-1.jpg
[img_12-2]: /assets/images/edu/ollo/ollo_bug_14-2.jpg
[img_12-3]: /assets/images/edu/ollo/ollo_bug_14-3.jpg
[img_12-4]: /assets/images/edu/ollo/ollo_bug_14-4.jpg
[img_13]: /assets/images/edu/ollo/ollo_bug_15.png
[img_14]: /assets/images/edu/ollo/ollo_bug_16.jpg
[img_15]: /assets/images/edu/ollo/ollo_bug_17.png
[img_16]: /assets/images/edu/ollo/ollo_bug_18.png
[img_17]: /assets/images/edu/ollo/ollo_bug_19.jpg
[img_18]: /assets/images/edu/ollo/ollo_bug_20.png
[img_19]: /assets/images/edu/ollo/ollo_bug_21.png
[img_20]: /assets/images/edu/ollo/ollo_bug_22.png
[img_21]: /assets/images/edu/ollo/ollo_bug_23.png
[img_22]: /assets/images/edu/ollo/ollo_bug_24.png
[img_23]: /assets/images/edu/ollo/ollo_bug_25.png
[img_24]: /assets/images/edu/ollo/ollo_bug_26.png
[img_25]: /assets/images/edu/ollo/ollo_bug_27.png
[img_26]: /assets/images/edu/ollo/ollo_bug_28.png
[img_27]: /assets/images/edu/ollo/ollo_bug_29.png
[img_28]: /assets/images/edu/ollo/ollo_bug_30.png
[img_29]: /assets/images/edu/ollo/ollo_bug_31.png
[img_30]: /assets/images/edu/ollo/ollo_bug_32.png
[img_31]: /assets/images/edu/ollo/ollo_bug_33.png
[img_32]: /assets/images/edu/ollo/ollo_bug_34.png
[img_33]: /assets/images/edu/ollo/ollo_bug_35.png
[img_34]: /assets/images/edu/ollo/ollo_bug_36.png
[img_35]: /assets/images/edu/ollo/ollo_bug_37.png
[img_linetracer]: /assets/images/edu/ollo/ollo_bug_linetracer.png
[img_36]: /assets/images/edu/ollo/ollo_bug_38.jpg
[img_37]: /assets/images/edu/ollo/ollo_bug_39.png
[img_38]: /assets/images/edu/ollo/ollo_bug_40.png
[img_39]: /assets/images/edu/ollo/ollo_bug_41.png
[img_40]: /assets/images/edu/ollo/ollo_bug_42.png
[img_41]: /assets/images/edu/ollo/ollo_bug_43.png
[img_42]: /assets/images/edu/ollo/ollo_bug_44.png
[img_43]: /assets/images/edu/ollo/ollo_bug_45.png
[img_44]: /assets/images/edu/ollo/ollo_bug_46.png
[img_45]: /assets/images/edu/ollo/ollo_bug_47.png
[img_46]: /assets/images/edu/ollo/ollo_bug_48.png
[img_47]: /assets/images/edu/ollo/ollo_bug_49.jpg
[img_48]: /assets/images/edu/ollo/ollo_bug_50.png
[img_49]: /assets/images/edu/ollo/ollo_bug_51.png
[img_50]: /assets/images/edu/ollo/ollo_bug_52.png
[img_51]: /assets/images/edu/ollo/ollo_bug_53.png
[img_52]: /assets/images/edu/ollo/ollo_bug_54.png
[img_53]: /assets/images/edu/ollo/ollo_bug_55.png
[img_54]: /assets/images/edu/ollo/ollo_bug_56.png
[img_55]: /assets/images/edu/ollo/ollo_bug_57.png
[img_56]: /assets/images/edu/ollo/ollo_bug_58.png
[Bugkit_control]: /assets/images/edu/ollo/ollo_bugkit_rc100.png
[img_57]: /assets/images/edu/ollo/ollo_bug_59.png
[img_58]: /assets/images/edu/ollo/ollo_bug_60.png
[img_59]: /assets/images/edu/ollo/ollo_bug_61.png
[img_60]: /assets/images/edu/ollo/ollo_bug_62.png
[img_61]: /assets/images/edu/ollo/ollo_bug_63.png
[img_62]: /assets/images/edu/ollo/ollo_bug_64.png
[img_63]: /assets/images/edu/ollo/ollo_bug_65.png
[img_64]: /assets/images/edu/ollo/ollo_bug_66.png
[img_65]: /assets/images/edu/ollo/ollo_bug_67.png
[img_66]: /assets/images/edu/ollo/ollo_bug_68.png
[img_67]: /assets/images/edu/ollo/ollo_bug_69.png

[How to Download Task code]: /docs/en/faq/download_task_code/

[ZIG-100/110]: /docs/en/parts/communication/zig-110/
[CM-100]: /docs/en/parts/controller/cm-100/
[Geared Motor]: /docs/en/parts/motor/geared_motor/
[USB Downloader(LN-101)]: /docs/en/parts/interface/ln-101/
[RC-100]: /docs/en/parts/communication/rc-100/
[Programming]: #programming
[OLLO_LineTrace.pdf]: http://support.robotis.com/en/baggage_files/ollo/ollo_linetrace.pdf
[OLLO_PuzzleRacing.zip]: http://support.robotis.com/en/baggage_files/ollo/ollo_puzzle_racing_line.zip
[OLLO_BUG_Product_EN.tsk]: http://support.robotis.com/en/baggage_files/ollo/bug/ollo_bug_product_en.tsk
[How to play Bug]: #how-to-play
