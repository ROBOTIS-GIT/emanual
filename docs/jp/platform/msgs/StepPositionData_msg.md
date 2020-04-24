---
layout: archive
lang: en
ref: msgs_StepPositionData_msg
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/msgs/StepPositionData_msg/
sidebar:
  title: MSGS
  nav: "msgs"
---

# [StepPositionData_msg](#steppositiondata-msg)

- File: `thormang3_walking_module_msgs/StepPositionData.msg`

- Message Definition

 ```c
 int16       moving_foot
 int16       LFootMove = 1 # Left foot constant
 int16       RFootMove = 2 # Right foot constant
 int16       NFootMove = 3 # No foot constant

 ### Unit [meter, rad]
 float32     foot_z_swap
 float32     body_z_swap
 float32     torso_yaw_angle_rad
 PoseXYZRPY  left_foot_pose
 PoseXYZRPY  right_foot_pose
 PoseZRPY    body_pose

 ```

- Description
Position related Step Data Parameters
* `int16       moving_foot`
&emsp;&emsp; Flag for Moving Foot
&emsp;&emsp; The flag should be set to one of the following values.
&emsp;&emsp; - LFootMove : constant for the left foot move
&emsp;&emsp; - RFootMove : constant for the right foot move
&emsp;&emsp; - NFootMove : constant for no foot move



* ` float32     foot_z_swap`
&emsp;&emsp; The swept distance by the foot on the Z axis while THORMANG3 is walking. Unit in meter.
&emsp;&emsp;

![foot_z_wap](/assets/images/platform/op3/op3_walking_module_image152.jpg)

* ` float32     body_z_swap`
&emsp;&emsp; The swept distance by the body on the Z axis while THORMANG3 is walking. Unit in meter.
&emsp;&emsp;

 ![body_z_wap](/assets/images/platform/op3/op3_walking_module_image154.jpg)

* ` float32     torso_yaw_angle_rad`
&emsp;&emsp; ~~Waist target angle for upcoming step. Unit in rad~~ (Not supported. This parameter is not used.)

* `PoseXYZRPY  left_foot_pose`([thormang3_walking_module_msgs/PoseXYZRPY]{: .popup})
&emsp;&emsp; Target pose of the left foot for upcoming step. Unit in meter, rad.

* `PoseXYZRPY  right_foot_pose`([thormang3_walking_module_msgs/PoseXYZRPY]{: .popup})
&emsp;&emsp; Target pose of the right foot for upcoming step. Unit in meter, rad.

* `PoseZRPY    body_pose` ([thormang3_walking_module_msgs/PoseZRPY]{: .popup})
&emsp;&emsp; The target COB for upcoming step. Unit in meter, rad.

[thormang3_walking_module_msgs/PoseXYZRPY]: /docs/en/popup/PoseXYZRPY.msg/
[thormang3_walking_module_msgs/PoseZRPY]: /docs/en/popup/PoseZRPY.msg/
