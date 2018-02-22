---
layout: archive
lang: en
ref: msgs_JointFeedBackGain_msg
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/msgs/JointFeedBackGain_msg/
sidebar:
  title: MSGS
  nav: "msgs"
---

# [JointFeedBackGain_msg](#jointfeedbackgain-msg)

- File: `thormang3_walking_module_msgs/JointFeedBackGain.msg`

- Message Definition

  ```c
  float32 r_leg_hip_y_p_gain
  float32 r_leg_hip_r_p_gain
  float32 r_leg_hip_p_p_gain
  float32 r_leg_kn_p_p_gain
  float32 r_leg_an_p_p_gain
  float32 r_leg_an_r_p_gain
  float32 l_leg_hip_y_p_gain
  float32 l_leg_hip_r_p_gain
  float32 l_leg_hip_p_p_gain
  float32 l_leg_kn_p_p_gain
  float32 l_leg_an_p_p_gain
  float32 l_leg_an_r_p_gain

  float32 r_leg_hip_y_d_gain
  float32 r_leg_hip_r_d_gain
  float32 r_leg_hip_p_d_gain
  float32 r_leg_kn_p_d_gain
  float32 r_leg_an_p_d_gain
  float32 r_leg_an_r_d_gain
  float32 l_leg_hip_y_d_gain
  float32 l_leg_hip_r_d_gain
  float32 l_leg_hip_p_d_gain
  float32 l_leg_kn_p_d_gain
  float32 l_leg_an_p_d_gain
  float32 l_leg_an_r_d_gain
  ```

- Description  
  These are the parameters used for improving trajectory following of leg.  
  PD Control is used, therefore, PD gains for each joints are declared in this message file.

- **P Gain**
  * ` float32 r_leg_hip_y_p_gain`
  &emsp;&emsp; P Gain for right hip yaw joint
  * ` float32 r_leg_hip_r_p_gain`
  &emsp;&emsp; P Gain for right hip roll joint
  * ` float32 r_leg_hip_p_p_gain`
  &emsp;&emsp; P Gain for right hip pitch joint
  * ` float32 r_leg_kn_p_p_gain`
  &emsp;&emsp; P Gain for right knee pitch joint
  * ` float32 r_leg_an_p_p_gain`
  &emsp;&emsp; P Gain for right ankle pitch joint
  * ` float32 r_leg_an_r_p_gain`
  &emsp;&emsp; P Gain for right ankle roll joint
  * ` float32 l_leg_hip_y_p_gain`
  &emsp;&emsp; P Gain for left hip yaw joint
  * ` float32 l_leg_hip_r_p_gain`
  &emsp;&emsp; P Gain for left hip roll joint
  * ` float32 l_leg_hip_p_p_gain`
  &emsp;&emsp; P Gain for left hip pitch joint
  * ` float32 l_leg_kn_p_p_gain`
  &emsp;&emsp; P Gain for left knee pitch joint
  * ` float32 l_leg_an_p_p_gain`
  &emsp;&emsp; P Gain for left angkle pitch joint
  * ` float32 l_leg_an_r_p_gain`
  &emsp;&emsp; P Gain for left angkle roll joint

- **D Gain**
  * ` float32 r_leg_hip_y_d_gain`
  &emsp;&emsp; D Gain for right hip yaw joint
  * ` float32 r_leg_hip_r_d_gain`
  &emsp;&emsp; D Gain for right hip roll joint
  * ` float32 r_leg_hip_p_d_gain`
  &emsp;&emsp; D Gain for right hip pitch joint
  * ` float32 r_leg_kn_p_d_gain`
  &emsp;&emsp; D Gain for right knee pitch joint
  * ` float32 r_leg_an_p_d_gain`
  &emsp;&emsp; D Gain for right ankle pitch joint
  * ` float32 r_leg_an_r_d_gain`
  &emsp;&emsp; D Gain for right ankle roll joint
  * ` float32 l_leg_hip_y_d_gain`
  &emsp;&emsp; D Gain for left hip yaw joint
  * ` float32 l_leg_hip_r_d_gain`
  &emsp;&emsp; D Gain for left hip roll joint
  * ` float32 l_leg_hip_p_d_gain`
  &emsp;&emsp; D Gain for left hip pitch joint
  * ` float32 l_leg_kn_p_d_gain`
  &emsp;&emsp; D Gain for left knee pitch joint
  * ` float32 l_leg_an_p_d_gain`
  &emsp;&emsp; D Gain for left angkle pitch joint
  * ` float32 l_leg_an_r_d_gain`
  &emsp;&emsp; D Gain for left angkle roll joint
