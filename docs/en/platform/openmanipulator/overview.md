---
layout: archive
lang: en
ref: openmanipulator
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/overview/
sidebar:
  title: OpenManipulator
  nav: "openmanipulator"
---

<div style="counter-reset: h1 0"></div>

# [Overview](#overview)

![](/assets/images/platform/openmanipulator/OpenManipulator.png)

![](/assets/images/platform/openmanipulator/OpenManipulator_Introduction.jpg)

ROS-enabled OpenManipulator is a full open robot platform consisting of **OpenSoftware**​, **OpenHardware** and **OpenCR(Embedded board)​**.

## [OpenSoftware](#opensoftware)
OpenManipulator are based on ROS ​and OpenSource. ROS official hardware platform ,TurtleBot series has been supporting ‘TurtleBot Arm’. The OpenManipulator has full hardware compatibility with TurtleBot3​. Users can also control it more easily by linking it with the MoveIt! package. Even if you do not have an actual robot, you can control the robot in the Gazebo simulator​.

## [OpenHardware](#openhardware)
OpenManipulator is an open-hardware oriented platform​. Most of the components are uploaded as [STL files](http://www.robotis.com/service/download.php?no=690) so that users can easily 3d print them. It also allows users to modify the length of the links or the design of the robot for their own purposes. OpenManipulator is made of **Dynamixel X ​Series** which is used in TurtleBot 3.
![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_OnShape.png)

## [OpenCR (Embedded board)](#opencr-embedded-board)
OpenManipulator can also be controlled using [OpenCR] (Open-source Control module for ROS), the control board used in TurtleBot3. The computing power and real-time controllability of OpenCR can support forward and inverse kinematics, and [profile control](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/#profile-acceleration108) examples. Moreover, OpenCR is compatible with many functions provided by ROS through message-communicating with ROS. OpenCR wil support ROS 2.0 in the near future.

## [Dynamixel Examples](#dynamixel-examples)

OpenManipulator is composed of [Dynamixel X series](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/) and [3D printing parts](http://www.robotis.com/service/download.php?no=767). Dynamixel has a modular form and adopts the daisy chain method. It allows users to easily add or remove joints for their own use. Taking advantage of this characteristic, users can build seven different types of OpenManipulator robots: Chain, SCARA, Link, Planar, Delta, Stewart and Linear.

## [Introduction Video](#introduction-video)

<iframe src="https://player.vimeo.com/video/236147296" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
<p><a href="https://vimeo.com/236147296">ROSCon 2017 Vancouver Day 1: Introducing OpenManipulator; the full open robot platform</a> from <a href="https://vimeo.com/osrfoundation">OSRF</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

<iframe width="560" height="315" src="https://www.youtube.com/embed/B2pnXtooKOg" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>


[OpenCR]: /docs/en/parts/controller/opencr10/
