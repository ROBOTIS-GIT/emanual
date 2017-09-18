---
layout: archive
lang: en
ref: ollo_bugkit_move_bug
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/ollo/bugkit_move_bug/
sidebar:
  title: Bug Kit
  nav: "ollo_bug"
---

## [Move the Bug](#move-the-bug)

### [Objective](#objective)

Let us move the bug forward, left, right, and backward. (The bug robot can be made with OLLO Explorer and Inventor.)

![img_12][img_12]

### [Preparation](#preparation)

PC(RoboPlus Task Program), Assembled Bug Robot, USB Downloader(LN-101)

### [Writing Task Code](#writing-task-code)

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

### [Download Task Code](#download-task-code)

Please refer to Program Download on the program download procedure.

Program Result File :  bug_move.tsk


### [Run Program](#run-program)

If you turn on CM-100 by pressing the start button, the bug robot continuously moves forward or backward, or it turns left or right depending on the function called from Start Program.


[img_12]: /emanual/assets/images/edu/ollo/ollo_bug_14.jpg
[img_13]: /emanual/assets/images/edu/ollo/ollo_bug_15.png
[img_14]: /emanual/assets/images/edu/ollo/ollo_bug_16.jpg
[img_15]: /emanual/assets/images/edu/ollo/ollo_bug_17.png
[img_16]: /emanual/assets/images/edu/ollo/ollo_bug_18.png
[img_17]: /emanual/assets/images/edu/ollo/ollo_bug_19.jpg
[img_18]: /emanual/assets/images/edu/ollo/ollo_bug_20.png
[img_19]: /emanual/assets/images/edu/ollo/ollo_bug_21.png
[img_20]: /emanual/assets/images/edu/ollo/ollo_bug_22.png
[img_21]: /emanual/assets/images/edu/ollo/ollo_bug_23.png
[img_22]: /emanual/assets/images/edu/ollo/ollo_bug_24.png
[img_23]: /emanual/assets/images/edu/ollo/ollo_bug_25.png
[img_24]: /emanual/assets/images/edu/ollo/ollo_bug_26.png
[img_25]: /emanual/assets/images/edu/ollo/ollo_bug_27.png
[img_26]: /emanual/assets/images/edu/ollo/ollo_bug_28.png
[img_27]: /emanual/assets/images/edu/ollo/ollo_bug_29.png
[img_28]: /emanual/assets/images/edu/ollo/ollo_bug_30.png
[img_29]: /emanual/assets/images/edu/ollo/ollo_bug_31.png
[img_30]: /emanual/assets/images/edu/ollo/ollo_bug_32.png
[img_31]: /emanual/assets/images/edu/ollo/ollo_bug_33.png
[img_32]: /emanual/assets/images/edu/ollo/ollo_bug_34.png
[img_33]: /emanual/assets/images/edu/ollo/ollo_bug_35.png
[img_34]: /emanual/assets/images/edu/ollo/ollo_bug_36.png
[img_35]: /emanual/assets/images/edu/ollo/ollo_bug_37.png
