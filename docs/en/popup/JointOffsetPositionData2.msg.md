---
layout: popup
---

- File: `thormang3_tuning_module_msgs/JointOffsetPositionData.msg`

- Message Definition

 ```c
 string    joint_name
 float64   goal_value
 float64   offset_value
 float64   present_value
 int32     p_gain
 int32     i_gain
 int32     d_gain
 int32     velocity_p_gain
 int32     velocity_i_gain
 int32     velocity_d_gain
 ```

- Description
This message is used when creating `thormang3_tuning_module_msgs/GetPresentJointOffsetData.srv`.

    * ` string  joint_name`
&emsp;&emsp; joint name
    * ` float64 goal_value`
&emsp;&emsp; Joint position for Offset Tuning(Unit in rad)
    * ` float64 offset_value`
&emsp;&emsp; Offset(Unit in rad)
    * ` float64   present_value`
&emsp;&emsp; Current position of the joint
    * ` int32   p_gain`
&emsp;&emsp; P Gain of the joint Position
    * ` int32   i_gain`
&emsp;&emsp; I Gain of the joint Position
    * ` int32   d_gain`
&emsp;&emsp; D Gain for the joint Position
    * ` int32   velocity_p_gain`
&emsp;&emsp; P Gain of the joint Velocity
    * ` int32   velocity_i_gain`
&emsp;&emsp; I Gain of the joint Velocity
    * ` int32   velocity_d_gain`
&emsp;&emsp; D Gain for the joint Velocity

