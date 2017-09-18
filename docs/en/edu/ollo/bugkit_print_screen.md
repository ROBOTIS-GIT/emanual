---
layout: archive
lang: en
ref: ollo_bugkit_print_screen
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/ollo/bugkit_print_screen/
sidebar:
  title: Bug Kit
  nav: "ollo_bug"
---

## [Print on the Screen](#print-on-the-screen)

### [Objective](#objective)

Write a program which prints out and checks the value of central IR sensor of the controller (CM-100) on the monitor for program output window.

![img_01][img_01]

### [Preparation](#preparation)

To accomplish the learning objectives, write a task code first; RoboPlus software which can pop up the monitor window for program printout and the controller(CM-100) which can transmit the value of central IR sensor to PC by executing task code are necessary. Moreover, USB Downloader(LN-101) is needed to connect PC and the controller.

### [Writing Task Code](#writing-task-code)

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


### [Download Task Code](#download-task-code)

Download the task code written above to the controller. ([How to Download Task code])


### [Run Program](#run-program)

1. Popping up the monitor for program printing window. To see the screen output during the program execution, monitor for program printing window must be popped up before program execution. How to pop up the monitor for program printing window: Click View Program Output button in the Program Download window, click View Program Output button in Toolbox, select View Program Output(V) of Program(V) menu, or Press F5 button.

2. Executing the Program. Once the monitor for program printing window is popped up, execute the downloaded program for the controller.  The internal LED is turned on by pressing the start button on the controller, and the downloaded program is executed. Check if the number values on the monitor for program printing window are changing or not by moving hands close and far from the front of central IR sensor of the controller.
![img_11][img_11]


[img_01]: /emanual/assets/images/edu/ollo/ollo_bug_03.png
[img_02]: /emanual/assets/images/edu/ollo/ollo_bug_04.png
[img_03]: /emanual/assets/images/edu/ollo/ollo_bug_05.jpg
[img_04]: /emanual/assets/images/edu/ollo/ollo_bug_06.png
[img_05]: /emanual/assets/images/edu/ollo/ollo_bug_07.png
[img_06]: /emanual/assets/images/edu/ollo/ollo_bug_08.png
[img_07]: /emanual/assets/images/edu/ollo/ollo_bug_09.png
[img_08]: /emanual/assets/images/edu/ollo/ollo_bug_10.png
[img_09]: /emanual/assets/images/edu/ollo/ollo_bug_11.png
[img_10]: /emanual/assets/images/edu/ollo/ollo_bug_12.png
[img_11]: /emanual/assets/images/edu/ollo/ollo_bug_13.png
