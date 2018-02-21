---
layout: popup
---

- File: `thormang3_walking_module_msgs/RobotPose.msg`

- Message Definition
 ```c
 geometry_msgs/Pose global_to_center_of_body
 geometry_msgs/Pose global_to_right_foot
 geometry_msgs/Pose global_to_left_foot
 ```

- Description
These are the parameters used for improving trajectory following of leg.
PD Control is used, therefore, PD gains for each joints are declared in this message file.

    * `geometry_msgs/Pose global_to_center_of_body`([geometry_msgs/Pose]{: .popup})
&emsp;&emsp; desired pose of center of body with respect to global
    * `geometry_msgs/Pose global_to_right_foot`([geometry_msgs/Pose]{: .popup})
&emsp;&emsp; desired pose of right foot with respect to global
    * `geometry_msgs/Pose global_to_left_foot`([geometry_msgs/Pose]{: .popup})
&emsp;&emsp; desired pose of left foot with respect to global

[geometry_msgs/Pose]: /dosc/en/popup/geometry_msgs_Pose_msg/
