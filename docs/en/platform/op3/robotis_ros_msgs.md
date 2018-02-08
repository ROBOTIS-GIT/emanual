---
layout: archive
lang: en
ref: op3_robotis_ros_msgs
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/robotis_ros_msgs/
sidebar:
  title: ROBOTIS-OP3
  nav: "op3"
---



## [ROBOTIS OP3 msgs](#robotis-op3-msgs)

### Module msgs



1. [op3_action_module_msgs] : This message/service is used for op3_action_module.  
2. [op3_walking_module_msgs] : This message/service is used for op3_walking_module.
3. [op3_online_walking_module_msgs] : his message/service is used for op3_online_walking_module.  


### Tool msgs
1. [op3_offset_tuner_msgs] : This msessage/service is used for OP3 offset tunning.  

## [ROBOTIS OP3 Demo](#robotis-op3-Demo)

1. [ball_detector] : This package detects a specific colored ball from the image acquired from USB camera.
2. [op3_demo] : Basic Demo for OP3(Soccer, Vision, Action)


## [ROBOTIS OP3 Common](#robotis-op3-common)

1. [robotis_op3_description]
2. [robotis_op3_gazebo]

## [ROBOTIS OP3 Tools](#robotis-op3-tools)

1. [op3_action_editor] : The software that can create and edit actions for ROBOTIS-OP3  
2. [op3_gui_demo] : GUI software for ROBOTIS-OP3  
3. [op3_offset_tuner_server] : op3_offset_tuner_server communicates with op3_offset_tuner_client to control OP3 for offset tuning, and manages tuned offset file.   
4. [op3_offset_tuner_client] : op3_offset_tuner_client is a GUI program to communicate with op3_offset_tuner_server for offset tuning.  
5. [op3_walking_tuner] : This is a terminal program for tuning the walking of ROBOTIS-OP3. Tuning is also possible using op3_gui_demo.
