### File: [`thormang3_walking_module_msgs/PoseXYZRPY.msg`](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/thormang3_walking_module_msgs/msg/PoseXYZRPY.msg)

### Message Definition
```
float32 x
float32 y
float32 z
float32 roll
float32 pitch
float32 yaw
```

### Description
This message is developed to define a pose in the 3D space.
There are x, y, z, roll, pitch, yaw parameters in the message.
Given x, y, z, roll, pitch and yaw, Transformation Matrix can be calculated as shown below.
```
  T = translation(x, y, z) * Rz(yaw)* Ry(pitch)* Rx(roll)
```

* `float32 x`
&emsp;&emsp; position of x

* `float32 y`
&emsp;&emsp; position of y

* `float32 z`
&emsp;&emsp; position of z

* `float32 roll`
&emsp;&emsp; a rotation angle of x

* `float32 pitch`
&emsp;&emsp; a rotation angle of y

* `float32 yaw`
&emsp;&emsp;a rotation angle of z

<br>
[[&lt;&lt; Back|thormang3_walking_module_msgs]]
