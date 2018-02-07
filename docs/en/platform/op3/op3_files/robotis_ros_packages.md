---
layout: archive
lang: en
ref: op3_robotis_ros_packages
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/robotis_ros_packages/
sidebar:
  title: ROBOTIS-OP3
  nav: "op3"
---

<div style="counter-reset: h1 2"></div>

# [Robotis Ros Packages](#robotis-ros-packages)

## [ROBOTIS OP3](#robotis-op3)

### [ROBOTIS-OP3 Modules]
 - #### Motion Module
   1. [op3_action_module] : This module manages every joint actions.  
   2. [op3_base_module] : This module manages initial pose and basic functions.  
   3. [op3_head_control_module] : This module controls the head.  
   4. [op3_walking_module] : This module controls walking.  
   5. [op3_online_walking_module] : This module controls online-walking(upgraded walking).

 - #### Sensor Module
   1. [open_cr_module] : This module is required to use OpenCR as a sensor.  

### [op3_manager]
  The package that controls OP3 using framework and various modules.   

### Others
  1. [op3_balance_control]
  2. [op3_localization]
  3. [op3_optimization]


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






[ROBOTIS-OP3 Modules]:ROBOTIS-OP3-Modules.md
[op3_action_module]:op3_action_module.md
[op3_base_module]:op3_base_module.md
[op3_head_control_module]:op3_head_control_module.md
[op3_walking_module]:op3_walking_module.md
[op3_online_walking_module]:op3_online_walking_module.md
[open_cr_module]:open_cr_module.md
[op3_manager]:op3_manager.md
[op3_balance_control]:op3_balance_control.md
[op3_localization]:op3_localization.md
[op3_optimization]:op3_optimization.md

[op3_action_module_msgs]:op3_action_module_msgs.md
[op3_walking_module_msgs]:op3_walking_module_msgs.md
[op3_online_walking_module_msgs]:op3_online_walking_module_msgs.md
[op3_offset_tuner_msgs]:op3_offset_tuner_msgs.md



[ball_detector]:op3_ball_detector.md
[op3_demo]:op3_demo.md


[robotis_op3_description]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/robotis_op3_description
[robotis_op3_gazebo]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/robotis_op3_gazebo


[op3_action_editor]:op3_action_editor.md
[op3_gui_demo]:op3_gui_demo.md
[op3_offset_tuner_server]:op3_offset_tuner_server.md
[op3_offset_tuner_client]:op3_offset_tuner_client.md
[op3_walking_tuner]:op3_walking_tuner.md
