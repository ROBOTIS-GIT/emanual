Objective for this tutorial is to build an intellectual car which runs and avoids obstacles. Please refer to 2-2-9 Obstacle Detection Car of the assembly manual and complete the hardware.

![Obstacle_Car-1][img_029]

The behavior patterns of the obstacle detection car pursuant to obstacle detection in each direction are as follows.

|Left|Front|Right|Behavior Pattern|
|:---:|:---:|:---:|:---:|
|-|-|-|Forward|
|O|-|-|Turn Right|
|-|O|-|Backward|
|O|O|-|Turn Right|
|-|-|O|Turn Left|
|O|-|O|Forward|
|-|O|O|Turn Left|
|O|O|O|Stop|

The mode of the robot is changed to wheel mode (infinite spinning mode) to use AX-12+ as the wheels of the obstacle detection car.
Using RoboPlus Manager, set both the CW location limit value and the CCW location limit value of AX-12+ to 0.

![Obstacle_Car-2][img_030]

### Write Task Code

  ![Obstacle_Car-3][img_031]

1. Save the basic value of the motor's moving speed as the variable

2. Use the standard value of the object detection and the object detection existence to judge object detection. To do so, set the object detection standard value.

3. Call appropriate motion functions pursuant to the object detection existence value. (Obstacle Detection Direction)

  ![Obstacle_Car-4][img_032]

4. Make Stop / Forward / Backward / Turn Right / Turn Left Motions. Each motor's moving speed is set by adding moving speed value which is the set speed value at the beginning and CW:0 and CCW:0 which represent directions.

### Download Task Code

[Download][ex_9-2] Complete Task Code ([How to Download Task Code])

### Execute Task Code

Play the downloaded task code. Check if the obstacle detection car runs and avoids the obstacles.

![Obstacle_Car-5][img_033]

[How to Download Task Code]: #download-task-code
[ex_9-2]: http://support.robotis.com/en/baggage_files/bioloid/bio_cmp_obstacledetectioncar_en.tsk
[img_029]: /assets/images/edu/bioloid/bioloid_entry_tutorial_obstaclecar_01.png
[img_030]: /assets/images/edu/bioloid/bioloid_entry_tutorial_obstaclecar_02.png
[img_031]: /assets/images/edu/bioloid/bioloid_entry_tutorial_obstaclecar_03.png
[img_032]: /assets/images/edu/bioloid/bioloid_entry_tutorial_obstaclecar_04.png
[img_033]: /assets/images/edu/bioloid/bioloid_entry_tutorial_obstaclecar_05.png
