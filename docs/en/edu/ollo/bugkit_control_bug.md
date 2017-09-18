---
layout: archive
lang: en
ref: ollo_bugkit_control_bug
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/ollo/bugkit_control_bug/
sidebar:
  title: Bug Kit
  nav: "ollo_bug"
---

## [Control the Bug](#control-the-bug)

### [Objective](#objective)

Let us program a robot so as to control forward, backward, left and right using RC-100 controller(It is programmed in the basis of The sensor-responding bug).

![Bugkit_control][Bugkit_control]

### [Preparation](#preparation)

PC(RoboPlus Task Program), Assembled Bug Robot, USB Downloader(LN-101), RC-100

### [Writing Task Code](#writing-task-code)

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

### [Download Task Code](#download-task-code)

Please refer to Program Download on the program download procedure.

Program Result File :  bug_rc.tsk

### [Run Program](#run-program)

After executing the program, control the robot forward, backward, left, and right using RC-100 controller.

[Bugkit_control]: /emanual/assets/images/edu/ollo/ollo_bugkit_rc100.png
[img_57]: /emanual/assets/images/edu/ollo/ollo_bug_59.png
[img_58]: /emanual/assets/images/edu/ollo/ollo_bug_60.png
[img_59]: /emanual/assets/images/edu/ollo/ollo_bug_61.png
[img_60]: /emanual/assets/images/edu/ollo/ollo_bug_62.png
[img_61]: /emanual/assets/images/edu/ollo/ollo_bug_63.png
[img_62]: /emanual/assets/images/edu/ollo/ollo_bug_64.png
[img_63]: /emanual/assets/images/edu/ollo/ollo_bug_65.png
[img_64]: /emanual/assets/images/edu/ollo/ollo_bug_66.png
[img_65]: /emanual/assets/images/edu/ollo/ollo_bug_67.png
[img_66]: /emanual/assets/images/edu/ollo/ollo_bug_68.png
[img_67]: /emanual/assets/images/edu/ollo/ollo_bug_69.png
