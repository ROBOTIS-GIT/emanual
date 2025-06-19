---
layout: archive
lang: en
ref: omy_ros2_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/omy/ros2_simulation/
tabs: "ROS"
tab_title1: Jazzy
sidebar:
  title: "OMY"
  nav: "omy"
product_group: omy
page_number: 5
---

<style>body {counter-reset: h1 5 !important;}</style>

# [Simulation](#simulation)

{% capture operation %}
**Note: The basic commands in this manual are written for OMY_F3M. When running with the OMY_3M model, replace omy_f3m with omy_3m in the commands.**
```bash
$ ros2 launch open_manipulator_bringup omy_3m_gazebo.launch.py
```
{% endcapture %}
<div class="notice--danger">{{ operation | markdownify }}</div>

## [Gazebo](#gazebo)
{% include en/platform/omy/simulation/gazebo_jazzy.md %}

## [Mujoco](#Mujoco)
{% include en/platform/omy/simulation/mujoco.md %}

## [Issac Sim](#issac-sim)
{% include en/platform/omy/simulation/Issac_sim.md %}
