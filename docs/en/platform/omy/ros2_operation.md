---
layout: archive
lang: en
ref: omy_ros2_operation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/omy/ros2_operation/
tabs: "ROS"
tab_title1: Jazzy
sidebar:
  title: "OMY"
  nav: "omy"
product_group: omy
page_number: 4
---

<style>body {counter-reset: h1 4 !important;}</style>


# [Operation](#operation)

## [AI Teleoperation](#ai-teleoperation)
{% include en/platform/omy/operation/ai_teleop_jazzy.md %}

{% capture operation %}
**Note: The basic commands in this manual are written for OMY_F3M. When running with the OMY_3M model, replace omy_f3m with omy_3m in the commands.**
```bash
$ ros2 launch open_manipulator_bringup omy_3m.launch.py
```
{% endcapture %}
<div class="notice--danger">{{ operation | markdownify }}</div>

## [Launch Controller](#launch-controller)
{% include en/platform/omy/operation/launch_controller_jazzy.md %}

## [MoveIt](#moveit)
{% include en/platform/omy/operation/moveit_jazzy.md %}

## [GUI Program](#gui-program)
{% include en/platform/omy/operation/gui_program_jazzy.md %}

## [Keyboard Teleoperation](#keyboard-teleoperation)
{% include en/platform/omy/operation/keyboard_teleop_jazzy.md %}
