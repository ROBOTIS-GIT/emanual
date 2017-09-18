---
layout: archive
lang: en
ref: ollo_bugkit_sensor_bug
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/ollo/bugkit_sensor_bug/
sidebar:
  title: Bug Kit
  nav: "ollo_bug"
---

## [Sensing Bug](#sensing-bug)

### [Objective](#objective)

Let us program a robot which traces the black line on the white floor like the line-tracing bug and stops if an object is detected by the central IR sensor; moreover, if clapping sounds are detected, it traces the black line again. (It is programmed in the basis of The Line-Tracing Bug)

![img_47][img_47]

### [Preparation](#preparation)

 PC(RoboPlus Task Program), Assembled Bug Robot, USB Downloader(LN-101), a white board with a black line.

### [Writing Task Code](#writing-task-code)

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


### [Download Task Code](#download-task-code)

Please refer to Program Download on the program download procedure.

Program Result File :  bug_sensor.tsk


### [Run Program](#run-program)

After executing the program, check if the bug robot stops or not when an object is detected by the central IR sensor. Later on, check if the bug moves again or not by clapping.



[img_47]: /emanual/assets/images/edu/ollo/ollo_bug_49.jpg
[img_48]: /emanual/assets/images/edu/ollo/ollo_bug_50.png
[img_49]: /emanual/assets/images/edu/ollo/ollo_bug_51.png
[img_50]: /emanual/assets/images/edu/ollo/ollo_bug_52.png
[img_51]: /emanual/assets/images/edu/ollo/ollo_bug_53.png
[img_52]: /emanual/assets/images/edu/ollo/ollo_bug_54.png
[img_53]: /emanual/assets/images/edu/ollo/ollo_bug_55.png
[img_54]: /emanual/assets/images/edu/ollo/ollo_bug_56.png
[img_55]: /emanual/assets/images/edu/ollo/ollo_bug_57.png
[img_56]: /emanual/assets/images/edu/ollo/ollo_bug_58.png
