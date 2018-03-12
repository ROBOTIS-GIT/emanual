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

- [Download][ex_14-2] Complete Task Code ([How to Download Task Code])
- [Download][ex_14-3] Example Motion File ([How to Download Motion File])

### Execute Task Code

Play the downloaded task code. Using RC-100, check if the robot moves to the desired directions by performing forward / backward / turn left / turn right motions.

[ex_14-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_walkingdroid_en.tsk
[ex_14-3]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_walkingdroid_en.mtn
[How to Download Task Code]: #download-task-code
[How to Download Motion File]: #download-motion-file
[img_054]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_21.png
