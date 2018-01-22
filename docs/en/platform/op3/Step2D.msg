### File: [`thormang3_foot_step_generator/Step2D.msg`](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-OPC/blob/master/thormang3_foot_step_generator/msg/Step2D.msg)

### Message Definition
```
geometry_msgs/Pose2D  step2d

uint8  moving_foot
uint8 LEFT_FOOT_SWING  = 1 # Left foot constant
uint8 RIGHT_FOOT_SWING = 2 # Right foot constant
uint8 STANDING         = 3 # Standing constant
```


### Description
The message creates [Step2DArray.msg](Step2DArray.msg).

* `geometry_msgs/Pose2D  step2d`([geometry_msgs::Pose2D](http://docs.ros.org/jade/api/geometry_msgs/html/msg/Pose2D.html))
&emsp;&emsp; 2D Position and orientation of the foot for upcoming step.

* `uint8    moving_foot`
&emsp;&emsp; Flag for the foot to move
&emsp;&emsp; - LEFT_FOOT_SWING  : Left Foot Move
&emsp;&emsp; - RIGHT_FOOT_SWING : Right Foot Move
&emsp;&emsp; - STANDING         : Standing



<br>
[&lt;&lt; Back](thormang3_foot_step_generator)
