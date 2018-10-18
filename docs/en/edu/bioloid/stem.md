---
layout: archive
lang: en
ref: bioloid-stem
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/bioloid/stem/
sidebar:
  title: BIOLOID STEM
  nav: "bioloid-stem"
---

# [Introduction](#introduction)

![](/assets/images/edu/bioloid/stem_product.jpg)

- Educational kit for science, technology, engineering, and mathematics
- Curricula of 16 sample robots with a total of 48 different types of lessons.
- Robots optimized for competition with high-speed Dynamixel and IR array.
- Robot kits aimed at solving problems creatively.

# [Getting Started](#getting-started)

## [Standard Part List](#standard-part-list)

![](/assets/images/edu/bioloid/stem_standard_partlist_01_en.png)

![](/assets/images/edu/bioloid/stem_standard_partlist_02_en.png)

## [Expansion Part List](#expansion-part-list)

![](/assets/images/edu/bioloid/stem_expansion_partlist_01_en.png)

![](/assets/images/edu/bioloid/stem_expansion_partlist_02_en.png)

- [CM-530]
- [AX-12W]
- [AX-12A]
- [IR Sensor Array]
- [IR Sensor]

## [Operating](#operating)

### Download the Program

You can find task codes and motion files for other actions on the [Standard](#standard-examples), [Expansion](#expansion-examples) page.  
[How to download Task Code to controller]

{% include en/parts/controller/cm510_530_turnon.md %}

### Assembly Check

- In Assembly Check mode you can verify whether your robot has been properly assembled. Compare the initial position of the motors.
  1. To run Assembly Check mode select ‘Manage’,  hold the ‘D’ button followed by ‘START’.
    > Keep holding until melody finished playing.
  2. Select the motor with either ‘U’ or ‘D’ buttons. The selected motor with turn its LED on and position itself into its initial position.
    > ‘U’ ups ID order while ‘D’ downs ID order.
  3. Compare the ID against the assembly check guide.
    > If the motor is not detected by the controller then it will beep.
  4. Compare whether the motor “froze” or it goes to its initial position.
    > Although the LED may be on the motor may be loose; check its wiring.
  5. Check the port for the IR array.
    > The IR array connected to its pre-assigned will blink when detecting an object.

## [Battery Charge](#battery-charge)

{% include en/edu/bioloid/stem_charge.md %}


# [Download](#download)

## [Standard Examples](#standard-examples)

|Robot|Description|
|:---:|:---|
|1. Sequence Racer<br />![Ex_01][img_adv_ex_01]|[Download][adv_ex_1-1] Basic Phase<br />[Download][adv_ex_1-2] Application Phase<br />[Download][adv_ex_1-3] Practical Phase<br />[Download][adv_ex_1-4] Video<br />`Dynamixel Setting`<br />AX-12W ID[1, 2]: Wheel Mode<br />`Algorithm`<br />Control the robot’s moving direction with the controller’s directional buttons.<br />`Operation Guide`<br />if you press the forward ‘U’, turn left ‘L’, turn right ‘R’, and reverse ‘D’ sequentially pressing ‘START’ the robot will move in the order the directional buttons were pressed.|
|2. Bug Fighter<br />![Ex_02][img_adv_ex_02]|[Download][adv_ex_2-1] Basic Phase<br />[Download][adv_ex_2-2] Application Phase<br />[Download][adv_ex_2-3] Practical Phase<br />[Download][adv_ex_2-4] Video<br /> `Dynamixel Setting`<br />AX-12W ID[1, 2]: Wheel Mode<br />`Algorithm`<br />Robot follows the black line by following said line.<br />`Operation Guide`<br />The robot remains inbounds and push others out if found in the same area.|
|3. Tumbler<br />![Ex_03][img_adv_ex_03]|[Download][adv_ex_3-1] Basic Phase<br />[Download][adv_ex_3-2] Application Phase<br />[Download][adv_ex_3-3] Practical Phase<br />[Download][adv_ex_3-4] Video<br /> `Dynamixel Setting`<br />AX-12W ID[1, 2]: Wheel Mode<br />`Algorithm`<br />The IR sensors detect obstacles and control the robot’s direction.<br />`Operation Guide`<br />The robot can go over large or small obstacles; with large obstacles it can change directions or react accordingly if flipped over.|
|4. Line Follower<br />![Ex_04][img_adv_ex_04]|[Download][adv_ex_4-1] Basic Phase<br />[Download][adv_ex_4-2] Application Phase<br />[Download][adv_ex_4-3] Practical Phase<br />[Download][adv_ex_4-4] Video<br /> `Dynamixel Setting`<br />AX-12W ID[1, 2]: Wheel Mode<br />`Algorithm`<br />The robot can move on a determined in a criss-cross grid.<br />`Operation Guide`<br />The robot can move forward, reverse, turn left or right along its determined path via its IR array.|
|5. Digital Piano<br />![Ex_05][img_adv_ex_05]|[Download][adv_ex_5-1] Basic Phase<br />[Download][adv_ex_5-2] Application Phase<br />[Download][adv_ex_5-3] Practical Phase<br />[Download][adv_ex_5-4] Video<br />`Algorithm`<br />Plays a different tune based IR sensor reading.<br />`Operation Guide`<br />The robot can output a musical note from the active sensors from the IR array.|
|6. Motorcycle<br />![Ex_06][img_adv_ex_06]|[Download][adv_ex_6-1] Basic Phase<br />[Download][adv_ex_6-2] Application Phase<br />[Download][adv_ex_6-3] Practical Phase<br />[Download][adv_ex_6-4] Video<br /> `Dynamixel Setting`<br />AX-12W ID[1]: Wheel Mode, AX-12W ID[2]: Joint Mode<br />`Algorithm`<br />Control action by following the black line and avoiding obstacles<br />`Operation Guide`<br />Follows the line while avoiding obstacles by steering itself away from such obstacle.|
|7. Avoider<br />![Ex_07][img_adv_ex_07]|[Download][adv_ex_7-1] Basic Phase<br />[Download][adv_ex_7-2] Application Phase<br />[Download][adv_ex_7-3] Practical Phase<br />[Download][adv_ex_7-4] Video<br /> `Dynamixel Setting`<br />AX-12W ID[1, 2]: Wheel Mode<br />`Algorithm`<br />maintains distance by its right sensor.<br />`Operation Guide`<br />The robot can escape a maze by using its left, right and center IR sensors.|

## [Expansion Examples](#expansion-examples)

|Robot|Description|
|:---:|:---|
|8. Scribbler<br />![Ex_08][img_adv_ex_08]|[Download][adv_ex_8-1] Basic Phase<br />[Download][adv_ex_8-2] Application Phase<br />[Download][adv_ex_8-3] Practical Phase<br />[Download][adv_ex_8-4] Video<br />`Dynamixel Setting`<br />AX-12W ID[1]: Wheel Mode, AX-12A ID[3, 4]: Wheel Mode<br />`Algorithm`<br />Robot follows the order of sequentially inputted commands.<br />`Operation Guide`<br />Write '가' and '어' when augmented with a pen.|
|9. Transporter<br />![Ex_09][img_adv_ex_09]|[Download][adv_ex_9-1] Basic Phase<br />[Download][adv_ex_9-2] Application Phase<br />[Download][adv_ex_9-3] Practical Phase<br />[Download][adv_ex_9-4] Video<br /> `Dynamixel Setting`<br />AX-12W ID[1, 2]: Wheel Mode, AX-12A ID[3 ~ 5]: Joint Mode<br />`Algorithm`<br />The robot follows a pre-determined path and completes a mission.<br />`Operation Guide`<br />Obstacles at certain locations the robot moves them at 2 specific locations from start the robot follows a determined path until finishing.|
|10. Probe Car<br />![Ex_10][img_adv_ex_10]|[Download][adv_ex_10-1] Basic Phase<br />[Download][adv_ex_10-2] Application Phase<br />[Download][adv_ex_10-3] Practical Phase<br />[Download][adv_ex_10-4] Video<br /> `Dynamixel Setting`<br />AX-12W ID[1, 2]: Wheel Mode, AX-12A ID[3, 4]: Joint Mode<br />`Algorithm`<br />While following a path if the robot encounters an obstacle it will move it.<br />`Operation Guide`<br />If the robot detects obstacles over boxes via its IR sensors it moves them to specified locations.|
|11. Beetle Gripper<br />![Ex_11][img_adv_ex_11]|[Download][adv_ex_11-1] Basic Phase<br />[Download][adv_ex_11-2] Application Phase<br />[Download][adv_ex_11-3] Practical Phase<br />[Download][adv_ex_11-4] Video<br /> `Dynamixel Setting`<br />AX-12W ID[1, 2]: Wheel Mode, AX-12A ID[3 ~ 5]: Joint Mode<br />`Algorithm`<br />Clamp robot follows button input<br />`Operation Guide`<br />The remote control can control forward, reverse, left and right turns, left and right pivots, grab, lift and lower objects.|
|12. Robot Arm<br />![Ex_12][img_adv_ex_12]|[Download][adv_ex_12-1] Basic Phase<br />[Download][adv_ex_12-2] Application Phase<br />[Download][adv_ex_12-3] Practical Phase<br />[Download][adv_ex_12-4] Video<br /> `Dynamixel Setting`<br />AX-12A ID[3 ~ 6]: Joint Mode<br />`Algorithm`<br />Detects a cup with the IR sensors and move it to a specified location.<br />`Operation Guide`<br />An example robot that moves 2 small cups and 2 big cups to the designated position regardless of the order of dection.|
|13. Walking Droid<br />![Ex_13][img_adv_ex_13]|[Download][adv_ex_13-1] Basic Phase<br />[Download][adv_ex_13-2] Application Phase<br />[Download][adv_ex_13-3] Practical Phase<br />[Download][adv_ex_13-4] Motion File<br />[Download][adv_ex_13-5] Video<br /> `Dynamixel Setting`<br />AX-12A ID[3 ~ 6]: Joint Mode<br />`Algorithm`<br />Robot detects obstacles and avoids it with its IR sensors.<br />`Operation Guide`<br />The robot moves forwards and turns left; it shifts to the right if the left sensors detects an obstacle; shifts to the left if the right sensor detects an obstacle; reverses if the center sensor detects an obstacle.|
|14. Hexapod<br />![Ex_14][img_adv_ex_14]|[Download][adv_ex_14-1] Basic Phase<br />[Download][adv_ex_14-2] Application Phase<br />[Download][adv_ex_14-3] Practical Phase<br />[Download][adv_ex_14-4] Motion File<br />[Download][adv_ex_14-5] Video<br /> `Dynamixel Setting`<br />AX-12A ID[3 ~ 5]: Joint Mode<br />`Algorithm`<br />Robot detects obstacles and avoids it with its IR sensors.<br />`Operation Guide`<br />The robot shifts to the right if the left sensors detects an obstacle; shifts to the left if the right sensor detects an obstacle; it speeds up when the upper sensor detects a hand.|
|15. Greeting Penguin<br />![Ex_15][img_adv_ex_15]|[Download][adv_ex_15-1] Basic Phase<br />[Download][adv_ex_15-2] Application Phase<br />[Download][adv_ex_15-3] Practical Phase<br />[Download][adv_ex_15-4] Motion File<br />[Download][adv_ex_15-5] Video<br /> `Dynamixel Setting`<br />AX-12W ID[1, 2]: Joint Mode, AX-12A ID[3 ~ 6]: Joint Mode<br />`Algorithm`<br />Robot remembers the order of input commands and performs in the same input order.<br />`Operation Guide`<br />Robot remembers lifting of left and right arms and clapping and repeats the motions in the same order.|
|16. Cannon Shooter<br />![Ex_16][img_adv_ex_16]|[Download][adv_ex_16-1] Basic Phase<br />[Download][adv_ex_16-2] Application Phase<br />[Download][adv_ex_16-3] Practical Phase<br />[Download][adv_ex_16-4] Video<br /> `Dynamixel Setting`<br />AX-12W ID[1, 2]: Wheel Mode, AX-12A ID[3 ~ 6]: Joint Mode<br />`Algorithm`<br />Slingshot robot follows input commands for clamping and launching.<br />`Operation Guide`<br />The remote control can control forward, reverse, left and right turns, left and right pivots, grab, lift and lower objects.|


# [References](#references)

## [Replacing Fuse](#replacing-fuse)

{% include en/parts/controller/fuse_cm510_530.md %}

## [Dynamixel Management](#dynamixel-management)

{% include en/edu/bioloid/dynamixel_management.md %}

{% include en/parts/communication/zigbee_control.md %}


[CM-530]: /docs/en/parts/controller/cm-530/
[AX-12W]: /docs/en/dxl/ax/ax-12w/
[AX-12A]: /docs/en/dxl/ax/ax-12a/
[IR Sensor Array]: /docs/en/parts/sensor/ir_array/
[IR Sensor]: /docs/en/parts/sensor/irss-10/
[How to download Task Code to controller]: /docs/en/faq/download_task_code/#cm-530

[img_adv_ex_01]: /assets/images/edu/bioloid/stem_sequenceracer.jpg
[img_adv_ex_02]: /assets/images/edu/bioloid/stem_bugfighter.jpg
[img_adv_ex_03]: /assets/images/edu/bioloid/stem_tumbler.jpg
[img_adv_ex_04]: /assets/images/edu/bioloid/stem_linefollower.jpg
[img_adv_ex_05]: /assets/images/edu/bioloid/stem_digitalpiano.jpg
[img_adv_ex_06]: /assets/images/edu/bioloid/stem_motorcycle.jpg
[img_adv_ex_07]: /assets/images/edu/bioloid/stem_avoider.jpg
[img_adv_ex_08]: /assets/images/edu/bioloid/stem_scribbler.jpg
[img_adv_ex_09]: /assets/images/edu/bioloid/stem_transporter.jpg
[img_adv_ex_10]: /assets/images/edu/bioloid/stem_probecar.jpg
[img_adv_ex_11]: /assets/images/edu/bioloid/stem_beetlegripper.jpg
[img_adv_ex_12]: /assets/images/edu/bioloid/stem_robotarm.jpg
[img_adv_ex_13]: /assets/images/edu/bioloid/stem_walkingdroid.jpg
[img_adv_ex_14]: /assets/images/edu/bioloid/stem_hexapod.jpg
[img_adv_ex_15]: /assets/images/edu/bioloid/stem_greetingpenguin.jpg
[img_adv_ex_16]: /assets/images/edu/bioloid/stem_cannonshooter.jpg

[adv_ex_1-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/1.bio_stem_sequenceracer1_en.tsk
[adv_ex_1-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/1.bio_stem_sequenceracer2_en.tsk
[adv_ex_1-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/1.bio_stem_sequenceracer3_en.tsk
[adv_ex_1-4]: http://www.robotis.com/video/BIO_STEM_SequenceRacer.wmv
[adv_ex_2-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/2.bio_stem_bugfighter1_en.tsk
[adv_ex_2-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/2.bio_stem_bugfighter2_en.tsk
[adv_ex_2-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/2.bio_stem_bugfighter3_en.tsk
[adv_ex_2-4]: http://www.robotis.com/video/BIO_STEM_BugFighter.wmv
[adv_ex_3-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/3.bio_stem_tumbler1_en.tsk
[adv_ex_3-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/3.bio_stem_tumbler2_en.tsk
[adv_ex_3-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/3.bio_stem_tumbler3_en.tsk
[adv_ex_3-4]: http://www.robotis.com/video/BIO_STEM_Tumbler.wmv
[adv_ex_4-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/4.bio_stem_linefollower1_en.tsk
[adv_ex_4-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/4.bio_stem_linefollower2_en.tsk
[adv_ex_4-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/4.bio_stem_linefollower3_en.tsk
[adv_ex_4-4]: http://www.robotis.com/video/BIO_STEM_LineFollower.wmv
[adv_ex_5-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/5.bio_stem_digitalpiano1_en.tsk
[adv_ex_5-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/5.bio_stem_digitalpiano2_en.tsk
[adv_ex_5-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/5.bio_stem_digitalpiano3_en.tsk
[adv_ex_5-4]: http://www.robotis.com/video/BIO_STEM_DigitalPiano.wmv
[adv_ex_6-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/6.bio_stem_motorcycle1_en.tsk
[adv_ex_6-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/6.bio_stem_motorcycle2_en.tsk
[adv_ex_6-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/6.bio_stem_motorcycle3_en.tsk
[adv_ex_6-4]: http://www.robotis.com/video/BIO_STEM_MotorCycle.wmv
[adv_ex_7-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/7.bio_stem_avoider1_en.tsk
[adv_ex_7-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/7.bio_stem_avoider2_en.tsk
[adv_ex_7-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/7.bio_stem_avoider3_en.tsk
[adv_ex_7-4]: http://www.robotis.com/video/BIO_STEM_Avoider.wmv
[adv_ex_8-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/8.bio_stem_scribbler1_en.tsk
[adv_ex_8-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/8.bio_stem_scribbler2_en.tsk
[adv_ex_8-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/8.bio_stem_scribbler3_en.tsk
[adv_ex_8-4]: http://www.robotis.com/video/BIOLOID_STEM_8.Scribbler.wmv
[adv_ex_9-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/9.bio_stem_transporter1_en.tsk
[adv_ex_9-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/9.bio_stem_transporter2_en.tsk
[adv_ex_9-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/9.bio_stem_transporter3_en.tsk
[adv_ex_9-4]: http://www.robotis.com/video/BIOLOID_STEM_9.Transporter.wmv
[adv_ex_10-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/10.bio_stem_probecar1_en.tsk
[adv_ex_10-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/10.bio_stem_probecar2_en.tsk
[adv_ex_10-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/10.bio_stem_probecar3_en.tsk
[adv_ex_10-4]: http://www.robotis.com/video/BIOLOID_STEM_10.ProbeCar.wmv
[adv_ex_11-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/11.bio_stem_beetlegripper1_en.tsk
[adv_ex_11-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/11.bio_stem_beetlegripper2_en.tsk
[adv_ex_11-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/11.bio_stem_beetlegripper3_en.tsk
[adv_ex_11-4]: http://www.robotis.com/video/BIOLOID_STEM_11.BeetleGripper.wmv
[adv_ex_12-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/12.bio_stem_robotarm1_en.tsk
[adv_ex_12-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/12.bio_stem_robotarm2_en.tsk
[adv_ex_12-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/12.bio_stem_robotarm3_en.tsk
[adv_ex_12-4]: http://www.robotis.com/video/BIOLOID_STEM_12.RobotArm.wmv
[adv_ex_13-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/13.bio_stem_walking_droid1_en.tsk
[adv_ex_13-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/13.bio_stem_walking_droid2_en.tsk
[adv_ex_13-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/13.bio_stem_walking_droid3_en.tsk
[adv_ex_13-4]: http://support.robotis.com/en/baggage_files/bioloid/stem/13.bio_stem_walking_droid_en.mtn
[adv_ex_13-5]: http://www.robotis.com/video/BIOLOID_STEM_13.WalkingDroid.wmv
[adv_ex_14-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/14.bio_stem_hexapod1_en.tsk
[adv_ex_14-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/14.bio_stem_hexapod2_en.tsk
[adv_ex_14-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/14.bio_stem_hexapod3_en.tsk
[adv_ex_14-4]: http://support.robotis.com/en/baggage_files/bioloid/stem/14.bio_stem_hexapod_en.mtn
[adv_ex_14-5]: http://www.robotis.com/video/BIOLOID_STEM_14.Hexapod.wmv
[adv_ex_15-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/15.bio_stem_greetingpenguin1_en.tsk
[adv_ex_15-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/15.bio_stem_greetingpenguin2_en.tsk
[adv_ex_15-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/15.bio_stem_greetingpenguin3_en.tsk
[adv_ex_15-4]: http://support.robotis.com/en/baggage_files/bioloid/stem/15.bio_stem_greetingpenguin_en.mtn
[adv_ex_15-5]: http://www.robotis.com/video/BIOLOID_STEM_15.GreetingPenguin.wmv
[adv_ex_16-1]: http://support.robotis.com/en/baggage_files/bioloid/stem/16.bio_stem_cannonshooter1_en.tsk
[adv_ex_16-2]: http://support.robotis.com/en/baggage_files/bioloid/stem/16.bio_stem_cannonshooter2_en.tsk
[adv_ex_16-3]: http://support.robotis.com/en/baggage_files/bioloid/stem/16.bio_stem_cannonshooter3_en.tsk
[adv_ex_16-4]: http://www.robotis.com/video/BIOLOID_STEM_16.CannonShooter.wmv
