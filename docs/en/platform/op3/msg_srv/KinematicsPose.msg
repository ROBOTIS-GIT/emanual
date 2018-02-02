- File: [`manipulation_module_msgs/KinematicsPose.msg`](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/thormang3_manipulation_module_msgs/msg/KinematicsPose.msg)

- Message Definition
 ```
 string               name
 geometry_msgs/Pose   pose
 float64              time
 ```

- Description
A message to move to a specific pose in the Task Space.
If `time` is set to 0, the moving speed is automatically configured proportional to the moving distance.

* `name`
&emsp;&emsp; target kinematics group
* `pose`
&emsp;&emsp; target Pose
* `time`
&emsp;&emsp; movement time to reach the target pose

<br>
[[&lt;&lt; Back|thormang3_manipulation_module_msgs]]
