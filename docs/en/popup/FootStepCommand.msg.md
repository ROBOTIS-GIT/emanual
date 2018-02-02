---
layout: popup
---

- File: `thormang3_foot_step_generator/FootStepCommand.msg`

- Message Definition
 ```
 string   command
 int32    step_num
 float64  step_length
 float64  side_step_length
 float64  step_angle_rad
 ```


- Description
Command with parameters to create stepdata.

* ` string   command`
&emsp;&emsp; direction of walking
&emsp;&emsp; - "forward"    : forward walking
&emsp;&emsp; - "backward"   : backward walking
&emsp;&emsp; - "turn left"  : turn left in place
&emsp;&emsp; - "turn right" : turn right in place
&emsp;&emsp; - "left"       : leftward walking
&emsp;&emsp; - "right"      : rightward walking

* ` int32    step_num`
&emsp;&emsp; Number of steps
* ` float64  step_length`
&emsp;&emsp; Step length of forward/backward walking(Unit in meter)
* ` float64  side_step_length`
&emsp;&emsp; Step length of rightward/leftward walking(Unit in meter)
* ` float64  step_angle_rad`
&emsp;&emsp; Step length of turn right/left walking(Unit in rad)


<br>
[&lt;&lt; Back](thormang3_foot_step_generator)
