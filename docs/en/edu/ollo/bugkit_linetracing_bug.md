---
layout: archive
lang: en
ref: ollo_bugkit_linetracing_bug
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/ollo/bugkit_linetracing_bug/
sidebar:
  title: Bug Kit
  nav: "ollo_bug"
---

## [Line Tracing Bug](#line-tracing-bug)

### [Objective](#objective)

The degree of IR reflection varies pursuant to the colors of objects.  White reflects more IR, whereas black reflects less IR. Using such characteristics, let us program the IR sensor of CM-100 so that the robot can distinguish the white floor and the black line and trace the line.
(It is programmed in the basis of Moving the Bug.)

![img_linetracer][img_linetracer]

### [Preparation](#preparation)

PC(RoboPlus Task Program), Assembled Bug Robot, USB Downloader(LN-101), a white board with a black line.

### [Writing Task Code](#writing-task-code)

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


### [Download Task Code](#download-task-code)

Please refer to Program Download on the program download procedure.

Program Result File :  bug_linetracer.tsk

Download the Handout for Line Tracer


### [Run Program](#run-program)

Place the bug on the white board with a black line and play.  Check if the bug traces the line or not.


[img_linetracer]: /emanual/assets/images/edu/ollo/ollo_bug_linetracer.png
[img_36]: /emanual/assets/images/edu/ollo/ollo_bug_38.jpg
[img_37]: /emanual/assets/images/edu/ollo/ollo_bug_39.png
[img_38]: /emanual/assets/images/edu/ollo/ollo_bug_40.png
[img_39]: /emanual/assets/images/edu/ollo/ollo_bug_41.png
[img_40]: /emanual/assets/images/edu/ollo/ollo_bug_42.png
[img_41]: /emanual/assets/images/edu/ollo/ollo_bug_43.png
[img_42]: /emanual/assets/images/edu/ollo/ollo_bug_44.png
[img_43]: /emanual/assets/images/edu/ollo/ollo_bug_45.png
[img_44]: /emanual/assets/images/edu/ollo/ollo_bug_46.png
[img_45]: /emanual/assets/images/edu/ollo/ollo_bug_47.png
[img_46]: /emanual/assets/images/edu/ollo/ollo_bug_48.png
