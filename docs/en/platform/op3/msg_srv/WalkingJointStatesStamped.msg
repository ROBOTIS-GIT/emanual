- File: [`thormang3_walking_module_msgs/WalkingJointStatesStamped.msg`](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/thormang3_walking_module_msgs/msg/WalkingJointStatesStamped.msg)

- Message Definition
 ```
 Header header

 float32 r_goal_hip_y
 float32 r_goal_hip_r
 float32 r_goal_hip_p
 float32 r_goal_kn_p
 float32 r_goal_an_p
 float32 r_goal_an_r
 float32 l_goal_hip_y
 float32 l_goal_hip_r
 float32 l_goal_hip_p
 float32 l_goal_kn_p
 float32 l_goal_an_p
 float32 l_goal_an_r

 float32 r_present_hip_y
 float32 r_present_hip_r
 float32 r_present_hip_p
 float32 r_present_kn_p
 float32 r_present_an_p
 float32 r_present_an_r
 float32 l_present_hip_y
 float32 l_present_hip_r
 float32 l_present_hip_p
 float32 l_present_kn_p
 float32 l_present_an_p
 float32 l_present_an_r
 ```

- Description
These are goal position of each joint of leg.
This message will be used for debugging

* `Header header`([std_msgs/Header](http://docs.ros.org/api/std_msgs/html/msg/Header.html))
&emsp;&emsp; header
* ` float32 r_goal_hip_y`
&emsp;&emsp; the desired angle in radian of right hip yaw joint
* ` float32 r_goal_hip_r`
&emsp;&emsp; the desired angle in radian of right hip roll joint
* ` float32 r_goal_hip_p`
&emsp;&emsp; the desired angle in radian of right hip pitch joint
* ` float32 r_goal_kn_p`
&emsp;&emsp; the desired angle in radian of right knee joint
* ` float32 r_goal_an_p`
&emsp;&emsp; the desired angle in radian of right ankle pitch joint
* ` float32 r_goal_an_r`
&emsp;&emsp; the desired angle in radian of right ankle roll joint
* ` float32 l_goal_hip_y`
&emsp;&emsp; the desired angle in radian of left hip yaw joint
* ` float32 l_goal_hip_r`
&emsp;&emsp; the desired angle in radian of left hip roll joint
* ` float32 l_goal_hip_p`
&emsp;&emsp; the desired angle in radian of left hip pitch joint
* ` float32 l_goal_kn_p`
&emsp;&emsp; the desired angle in radian of left knee joint
* ` float32 l_goal_an_p`
&emsp;&emsp; the desired angle in radian of left ankle pitch joint
* ` float32 l_goal_an_r`
&emsp;&emsp; the desired angle in radian of left ankle roll joint
* ` float32 r_present_hip_y`
&emsp;&emsp; the present angle in radian of right hip yaw joint
* ` float32 r_present_hip_r`
&emsp;&emsp; the present angle in radian of right hip roll joint
* ` float32 r_present_hip_p`
&emsp;&emsp; the present angle in radian of right hip pitch joint
* ` float32 r_present_kn_p`
&emsp;&emsp; the present angle in radian of right knee joint
* ` float32 r_present_an_p`
&emsp;&emsp; the present angle in radian of right ankle pitch joint
* ` float32 r_present_an_r`
&emsp;&emsp; the present angle in radian of right ankle roll joint
* ` float32 l_present_hip_y`
&emsp;&emsp; the present angle in radian of left hip yaw joint
* ` float32 l_present_hip_r`
&emsp;&emsp; the present angle in radian of left hip roll joint
* ` float32 l_present_hip_p`
&emsp;&emsp; the present angle in radian of left hip pitch joint
* ` float32 l_present_kn_p`
&emsp;&emsp; the present angle in radian of left knee joint
* ` float32 l_present_an_p`
&emsp;&emsp; the present angle in radian of left ankle pitch joint
* ` float32 l_present_an_r`
&emsp;&emsp; the present angle in radian of left ankle roll joint

<br>
[[&lt;&lt; Back|thormang3_walking_module_msgs]]
