---
layout: archive
lang: en
ref: openmanipulator_x_mobile_manipulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/mobile_manipulation/
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 22
---

<div style="counter-reset: h1 21"></div>

# [Mobile Manipulation](#mobile-manipulation)

  <iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/P82pZsqpBg0" frameborder="0" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/DLOq8yNcCoE" frameborder="0" allowfullscreen></iframe>

  **TIP**: You can get a more information about it in [Manipulation section of TurtleBot3](/docs/en/platform/turtlebot3/manipulation/#manipulation)
  {: .notice--success}

Install dependent packages

  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_msgs.git
  $ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
  $ sudo apt-get install ros-kinetic-smach*
  $ cd ~/catkin_ws && catkin_make
  ```

Load a TurtleBot3 Waffle or Waffle Pi with OpenMANIPULATOR-X on RViz.

  **TIP**: TB3_MODEL =  `waffle`, `waffle_pi`
  {: .notice--success}

  ``` bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_rviz.launch
  ```

![](/assets/images/platform/openmanipulator_x/TurtleBot3_with_Open_Manipulator.png)

  **TIP**: You can get a more information about it in [Manipulation section of TurtleBot3](/docs/en/platform/turtlebot3/manipulation/#manipulation)
  {: .notice--success}
