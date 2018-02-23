---
layout: archive
lang: en
ref: msgs_PoseXYZRPY_msg
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/msgs/PoseXYZRPY_msg/
sidebar:
  title: MSGS
  nav: "msgs"
---

# [PoseXYZRPY_msg](#posexyzrpy_msg)

- File: `thormang3_walking_module_msgs/PoseXYZRPY.msg`

- Message Definition
 ```c
 float32 x
 float32 y
 float32 z
 float32 roll
 float32 pitch
 float32 yaw
 ```

- Description
This message is developed to define a pose in the 3D space.
There are x, y, z, roll, pitch, yaw parameters in the message.
Given x, y, z, roll, pitch and yaw, Transformation Matrix can be calculated as shown below.
 ```
  T = translation(x, y, z)     * Rz(yaw)    * Ry(pitch)    * Rx(roll)
 ```

    * ` float32 x`
&emsp;&emsp; position of x

    * ` float32 y`
&emsp;&emsp; position of y

    * ` float32 z`
&emsp;&emsp; position of z

    * ` float32 roll`
&emsp;&emsp; a rotation angle of x

    * ` float32 pitch`
&emsp;&emsp; a rotation angle of y

    * ` float32 yaw`
&emsp;&emsp;a rotation angle of z
