---
layout: popup
---

- File: `thormang3_walking_module_msgs/WalkingJointStatesStamped.msg`

- Message Definition
 ```c
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

    * `Header header`([std_msgs/Header])
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

[std_msgs/Header]: /docs/en/platform/msgs/std_msgs_header/#std-msgs-header
