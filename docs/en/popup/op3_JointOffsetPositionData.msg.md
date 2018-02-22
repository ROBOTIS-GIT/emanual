---
layout: popup
---

- File: `op3_offset_tuner_msgs/JointOffsetPositionData.msg`

- Message Definition
 ```c
 string    joint_name
 float64   goal_value
 float64   offset_value
 float64   present_value
 int32     p_gain
 int32     i_gain
 int32     d_gain
 ```

- Description
This message is used when creating [GetPresentJointOffsetData.srv].  

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
&emsp;&emsp; I Gain of the joint Position(Not used)  
    * ` int32   d_gain`  
&emsp;&emsp; D Gain of the joint Position(Not used)  


[GetPresentJointOffsetData.srv]: /docs/en/platform/msgs/op3_GetPresentJointOffsetData_srv/#op3-getpresentjointoffsetdata-srv
