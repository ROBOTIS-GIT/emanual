Objective for this tutorial is to make a walking droid which walks forward in normal situation and avoids obstacles.
Since the walking droid uses various postures when it performs such as walking, avoiding obstacles, etc., it is convenient to use by saving the postures as motions.

The following table represents the behavior patterns of the walking droid pursuant to surroundings and motion status.

|Status|Behavior|
|:---:|:---:|
|Initially executed|Stay in basic posture|
|No obstacles|Walking forward|
|Obstacles Found|Stop and walking backward|
|After walking backward|Changing direction to the left|
|Obstacles found even if turned left|Changing direction to the left|

Besides duplicated motions, 4 motions must be made as below, and the robot can avoid obstacles while walking.
- Stop
- Walking forward
- Walking backward
- Changing direction to the left

### Make Motions

1. Execute RoboPlus Motion and connect to the controller. (See "Connect Robot")

  ![Walking_Droid-1][img_034]

  ![Walking_Droid-2][img_035]

2. Enter the name on the page 1 to make "Stop" motion, and then add steps.

  ![Walking_Droid-3][img_036]

3. The joint values of ID 1, 2, 3, 4 are set to 512. The values are applied to the robot if the rightward arrow is pressed, and the set posture can be checked. (This is the method that users enter the joint values directly.)

  ![Walking_Droid-4][img_037]

4. Adjust the executing time. It is set to 0.072 second which is the fastest time.

  ![Walking_Droid-5][img_038]

5. Enter the name on the page 12 to make "Walking Forward" motion, and then add steps.

  ![Walking_Droid-6][img_039]

6. Turn off torques of all joints by pressing torque-off button. You can see all the joint values are set to "OFF."

  ![Walking_Droid-7][img_040]

  ![Walking_Droid-8][img_041]

7. The posture of robot are set by users. The following picture shows the walking posture of the walking droid.

  ![Walking_Droid-9][img_042]

8. As shown above, if the posture of robot is set and the "Torque-on" button is pressed, the present joint values of the robot are entered automatically to the posture of robot. The currently entered robot's joints can be read as steps' posture if the leftward arrow button is pressed(This is the method that users read the joint values from the robot).

  ![Walking_Droid-10][img_043]

9. Repeating the procedure from number 5, add "Walking Forward" posture to each step. If the posture addition is completed, adjust the stop time and the execution time properly.

  ![Walking_Droid-11][img_044]

10. If the motion execution button is pressed, the steps of present page are executed sequentially. Check if the robot is operating well.

  ![Walking_Droid-12][img_045]

11. Using the same method so far, add "Walking Backward" on the page 13 and "Turn Left" on the page 15.

  ![Walking_Droid-13][img_046]

12. Save the works have been done so far.

  ![Walking_Droid-14][img_047]

### Download Motion File

[Download][walking_droid_ex-1] Example Motion File ([How to Download Motion File])

[How to Download Motion File]: #download-motion-file
[walking_droid_ex-1]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_walkingdroidexam1_en.mtn
[img_034]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_01.png
[img_035]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_02.png
[img_036]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_03.png
[img_037]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_04.png
[img_038]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_05.png
[img_039]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_06.png
[img_040]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_07.png
[img_041]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_08.png
[img_042]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_09.png
[img_043]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_10.png
[img_044]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_11.png
[img_045]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_12.png
[img_046]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_13.png
[img_047]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_14.png
