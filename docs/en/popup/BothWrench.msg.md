---
layout: popup
---

- File: `thormang3_feet_ft_module_msgs/BothWrench.msg`

- Message Definition
 ```
  string                  name
 geometry_msgs/Wrench    right
 geometry_msgs/Wrench    left
 ```

- Description
This message is used when publishing values to calibrate FT sensors in the [thormang3_feet_ft_module](thormang3_feet_ft_module).

* ` string name`
&emsp;&emsp; name
&emsp;&emsp; This field should be either "ft_air" or "ft_gnd".

* `geometry_msgs/Wrench right`
&emsp;&emsp; average output from the force torque sensor on the right foot
* `geometry_msgs/Wrench left`
&emsp;&emsp; average output from the force torque sensor on the left foot

<br>
[[&lt;&lt; Back|thormang3_feet_ft_module_msgs]]
