---
layout: archive
lang: en
ref: ollo_bugkit_getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/ollo/bugkit_getting_started/
sidebar:
  title: Bug Kit
  nav: "ollo_bug"
---

# [Introduction](#introduction)
OLLO Bug Kit is the third kit among the kits for everyone, and the bug robots that play line-tracing game (The robots detect lines by themselves) and control game (The robots are controlled by wireless controllers) can be built by the kit.  The assembly manual is included to build 4 types of bug robots: Beetles, Ladybugs, Callipogon Relictus, and Grasshoppers.  Build the one and only robot for yourself.

`Note` All-in-one sensor type controller([CM-100][1]) and [geared motor][2] are included in OLLO Bug Kit. [USB Downloader(LN-101)][3] must be purchased to build and download the program that the users can control the bug robots directly. Please refer to [Programming] on how to program.
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


- [CM-100][1]
- [RC-100][4]
- [Geared Motor][5]

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

## [Wireless Control](#wireless-control)

`Note` Use ZIG-100/110 for ZIGBee wireless communication.
{: .notice}

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

# [Download]

`Download` Task Code [OLLO_BUG_Product_EN.tsk]

`Note` [How to Download Task code]

`Note` [How to execute the Program]


[ollo_bug_examples]: /emanual/assets/images/edu/ollo/ollo_bug_examples.png
[ollo_bug_battle]: /emanual/assets/images/edu/ollo/ollo_bug_battle.png
[ollo_bug_linetracer]: /emanual/assets/images/edu/ollo/ollo_bug_linetracer.png
[ollo_bug_linetracer2]: /emanual/assets/images/edu/ollo/ollo_bug_linetracer2.png
[ollo_bug_partlist]: /emanual/assets/images/edu/ollo/ollo_bug_partlist.png
[CM-100_label]: /emanual/assets/images/parts/controller/cm100_label_en.png
[ollo-RC100]: /emanual/assets/images/edu/ollo/ollo_bugkit_rc100.png
[ollo_bug_battle]: /emanual/assets/images/edu/ollo/ollo_bug_01.png
[ollo_bug_car]: /emanual/assets/images/edu/ollo/ollo_bug_02.png
[ir_sensor]: /emanual/assets/images/parts/sensors/ir.jpg
[touch_sensor]: /emanual/assets/images/parts/sensors/touch.jpg
[led_module]: /emanual/assets/images/parts/led/led.jpg
[1]: #
[2]: #
[3]: #
[4]: #
[5]: #
[Programming]: #programming
[OLLO_LineTrace.pdf]: #
[OLLO_PuzzleRacing.zip]: #
[OLLO_BUG_Product_EN.tsk]: #
[How to Download Task code]: #
[How to execute the Program]: #
