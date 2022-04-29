### Execute Motions

To use this motion after saving the motions written on RoboPlus Motion in CM-5, the motions of CM-5 must be executed in the task code. Using the two parameters, the motions of robots can be executed.

![Walking_Droid-15][img_048]

"Load" command must be used to execute the motions. If the "Load" command is selected, two parameter are created. In one parameter on the left, Motion Page in Controller -> Motion is selected, and in the other parameter on the right, the motion page number which includes desired motions is entered.
If the task code is written as below and downloaded and executed in CM-5, the saved motions are executed on the page 5.

![Walking_Droid-16][img_049]

#### Executing Asynchronous Motions

It is a motion control method which makes robots do the next work without checking motion status of the robots. It is suitable for beginners because understanding the code is very intuitive. However, it may not be controlled as desired since duplicate execution can happen during the motion execution.

#### Executing Synchronous Motions

It is a motion control method which make robots do the next work after completing the execution by checking the motion status of the robots. It is suitable for intermediate-level users because the concept of Multi-Task is needed. In the case of infinite repetition motions, the task code must be written well since it may wait continuously when the motion status is checked.

![Walking_Droid-17][img_050]

#### Infinite Repetition Motions

It is effective to make regularly-repeated motions such as walking as an infinite repetition motion.

### Write Task Code

  ![Walking_Droid-18][img_051]

1. Call "Ready" when it is executed for the first time.
2. Call "Forward" if there is no obstacle.
3. If an object is detected by Central Distance Sensor, Stop and walk backward,and then turn left.
4. Even though it turns left, if an object is detected by Central Distance Sensor, it turns left until no object is detected.

    ![Walking_Droid-19][img_052]

5. Write a  function which executes the motion on the page 1 where the "Ready" motion is saved. To wait until the motion is complete after execution, Call the function "WaitMotion."
6. Write a function which executes the motion on the page 12 where the "Forward" motion is saved. To wait until the motion is complete after execution, Call the function "WaitMotion."
7. Write a function which executes the motion on the page 13 where the "Backward" motion is saved. To wait until the motion is complete after execution, Call the function "WaitMotion."
8. Write a function which executes the motion on the page 15 where the "TurnLeft" motion is saved. To wait until the motion is complete after execution, Call the function "WaitMotion."
9. Check the parameter value of the motion status, and write a function which waits while the motion is operating.

### Download Task Code

- [Download][ex_14-2] Complete Task Code ([How to Download Task Code])

### Execute Task Code

Play the downloaded task code.  Leave obstacles on the way of the path, and then check if the walking droid avoids the obstacles and walks.

![Walking_Droid-20][img_053]

[ex_14-2]: https://robotis.s3.ap-northeast-2.amazonaws.com/support/en/baggage_files/bioloid/bio_cmp_walkingdroid_en.tsk
[How to Download Task Code]: #download-task-code

[img_048]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_15.png
[img_049]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_16.png
[img_050]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_17.png
[img_051]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_18.png
[img_052]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_19.png
[img_053]: /assets/images/edu/bioloid/bioloid_entry_tutorial_droid_20.png
