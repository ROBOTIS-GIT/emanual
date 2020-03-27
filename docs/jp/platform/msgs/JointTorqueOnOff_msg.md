---
layout: archive
lang: en
ref: msgs_JointTorqueOnOff_msg
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/msgs/JointTorqueOnOff_msg/
sidebar:
  title: MSGS
  nav: "msgs"
---

# [JointTorqueOnOff_msg](#jointtorqueonoff-msg)

- File: `thormang3_offset_tuner_msgs/JointTorqueOnOff.msg`

- Message Definition
 ```
 string  joint_name
 bool    torque_enable
 ```

- Description
The message used to create [JointTorqueOnOffArray.msg]{: .popup}
    * ` string  joint_name`
&emsp;&emsp; joint name
    * `bool    torque_enable`
&emsp;&emsp; true for torque on, false for torque off

[JointTorqueOnOffArray.msg]: /docs/en/popup/JointTorqueOnOffArray.msg/
