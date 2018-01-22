### File: [`op3_offset_tuner_msgs/JointOffsetData.msg`](https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-msgs/blob/master/op3_offset_tuner_msgs/msg/JointOffsetData.msg)

### Message Definition
```
string    joint_name
float64   goal_value
float64   offset_value
int32     p_gain
int32     i_gain
int32     d_gain
```


### Description
Data set for joint offset tuning

* `string  joint_name`
&emsp;&emsp; joint name
* `float64 goal_value`
&emsp;&emsp; Joint position for Offset Tuning(Unit in rad)
* `float64 offset_value`
&emsp;&emsp; Offset(Unit in rad)
* `int32   p_gain`
&emsp;&emsp; P Gain of the joint Position
* `int32   i_gain`
&emsp;&emsp; I Gain of the joint Position(Not used)
* `int32   d_gain`
&emsp;&emsp; D Gain for the joint Position(Not used)

[&lt;&lt; Back](op3_offset_tuner_msgs)
