---
layout: archive
lang: en
ref: basic_operation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/basic_operation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 7"></div>

# [Basic Operation](#basic-operation)

{% capture notice_02 %}
**TIP**:
- We are happy to announce a new ROS book: “ROS Robot Programming, A Handbook is written by TurtleBot3 Developers”. Now, this book has been published English and Chinese versions. This book contains the following:
  - ROS Kinetic Kame: Basic concept, instructions and tools
  - How to use sensor and actuator packages on ROS
  - Embedded board for ROS: OpenCR
  - SLAM & Navigation with TurtleBot3
  - How to program a delivery robot using ROS Java
  - OpenManipulator simulation using MoveIt! and Gazebo
- Please refer to this book for more information on ROS, SLAM, and Navigation that are not covered in this e-manual. You can download the [pdf of this book](/docs/en/platform/turtlebot3/learn/#books).
{% endcapture %}
<div class="notice--success">{{ notice_02 | markdownify }}</div>

## [Topic Monitor](#topic-monitor)
- [Topic Monitor][topic_monitor]: Display all the topics of TurtleBot3 using Topic Monitor plugin of RQT.

## [Teleoperation](#teleoperation)
- [Teleoperation][teleoperation]: Control the TurtleBot3 using wireless devices such as PS3, XBOX 360, ROBOTIS RC100 and etc.

<iframe width="640" height="360" src="https://www.youtube.com/embed/Z4s18hlazb4" frameborder="0" allowfullscreen></iframe>

## [Basic Examples](#basic-examples)
- [Basic Examples][basic_examples]: It contains various basic examples such as the following.
  - Move using Interative Marker on RViz
  - Move and Stop using LDS
  - Move to goal position
  - Move to custom routes

<iframe width="560" height="315" src="https://www.youtube.com/embed/Xg1pKFQY5p4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## [Additional Sensors](#additional-sensors)
- [Additional Sensors][additional_sensors]: Let's use IR sensor, ultrasonic sensor, switch, etc. in OpenCR of TurtleBot3.

[topic_monitor]: /docs/en/platform/turtlebot3/topic_monitor/
[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/
[basic_examples]: /docs/en/platform/turtlebot3/basic_examples/
[additional_sensors]: /docs/en/platform/turtlebot3/additional_sensors/