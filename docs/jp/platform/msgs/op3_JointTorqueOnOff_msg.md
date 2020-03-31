---
layout: archive
lang: en
ref: msgs_op3_JointTorqueOnOff_msg
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/msgs/op3_JointTorqueOnOff_msg/
sidebar:
  title: MSGS
  nav: "msgs"
---

# [op3_JointTorqueOnOff_msg](#op3-jointtorqueonoff-msg)

- File: `op3_offset_tuner_msgs/JointTorqueOnOff.msg`
- Message Definition
 ```c
 string  joint_name
 bool    torque_enable
 ```

- Description
The message used to create [JointTorqueOnOffArray.msg]{: .popup}
    * ` string  joint_name`  
&emsp;&emsp; joint name  
    * `bool    torque_enable`  
&emsp;&emsp; true for torque on, false for torque off




[JointTorqueOnOffArray.msg]: /docs/en/popup/op3_JointTorqueOnOffArray.msg
