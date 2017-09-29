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

[How to Download Task Code]: #download-task-code
[ex_11-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_attackingduck_en.tsk
[img_025]: /assets/images/edu/bioloid/bioloid_entry_tutorial_attackingduck_01.png
[img_026]: /assets/images/edu/bioloid/bioloid_entry_tutorial_attackingduck_02.png
[img_027]: /assets/images/edu/bioloid/bioloid_entry_tutorial_attackingduck_03.png
[img_028]: /assets/images/edu/bioloid/bioloid_entry_tutorial_attackingduck_04.png
