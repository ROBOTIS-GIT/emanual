- File: [`thormang3_walking_module_msgs/RobotPose.msg`](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/thormang3_walking_module_msgs/msg/RobotPose.msg)

- Message Definition
 ```
 geometry_msgs/Pose global_to_center_of_body
 geometry_msgs/Pose global_to_right_foot
 geometry_msgs/Pose global_to_left_foot
 ```

- Description
These are the parameters used for improving trajectory following of leg.
PD Control is used, therefore, PD gains for each joints are declared in this message file.

* `geometry_msgs/Pose global_to_center_of_body`([geometry_msgs/Pose](http://docs.ros.org/api/geometry_msgs/html/msg/Pose.html))
&emsp;&emsp; desired pose of center of body with respect to global
* `geometry_msgs/Pose global_to_right_foot`([geometry_msgs/Pose](http://docs.ros.org/api/geometry_msgs/html/msg/Pose.html))
&emsp;&emsp; desired pose of right foot with respect to global
* `geometry_msgs/Pose global_to_left_foot`([geometry_msgs/Pose](http://docs.ros.org/api/geometry_msgs/html/msg/Pose.html))
&emsp;&emsp; desired pose of left foot with respect to global

<br>
[[&lt;&lt; Back|thormang3_walking_module_msgs]]
