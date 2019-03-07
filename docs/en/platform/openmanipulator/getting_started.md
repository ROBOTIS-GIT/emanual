---
layout: archive
lang: en
ref: openmanipulator
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/getting_started/
sidebar:
  title: OpenManipulator
  nav: "openmanipulator"
---

<div style="counter-reset: h1 2"></div>

# [Getting Started](#getting-started)
This chapter is for users who are new to OpenManipulator. The manual has an enormous amount of content, but this chapter explains how information is divided.

## [About OpenManipulator](#about-openmanipulator)
First of all, collect information from the Overview and Specifications pages to get an overall understanding of OpenManipulator.

## [OpenManipulator Setup](#openmanipulator-setup)
When you have enough understanding about OpenManipulator from above step, here are the hardware and software setups. It is recommended to proceed in the following order.

1. [Hardware Setup](/docs/en/platform/openmanipulator/specification/#hardware-setup): The OpenManipulator is delivered as a non-assembled part to the box. Assemble the OpenManipulator according to the instructions.  
[U2D2](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3288&keyword=u2d2) + [U2D2 Power Hub Board](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3332&GC=GD0B01) or [OpenCR](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3289&GC=GD0B0100) is required to operate OpenManipulator.
Please prepare [U2D2](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3288&keyword=u2d2) + [U2D2 Power Hub Board](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3332&GC=GD0B01) or [OpenCR](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3289&GC=GD0B0100) when you want to operate on ROS environment, prepare [OpenCR](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3289&GC=GD0B0100) when you want to operate on embedded system.
In both case,  [SMPS 12V5A](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=1369&keyword=smps) is required to supply powers to DYNAMIXEL.

2. [Software Setup](/docs/en/platform/openmanipulator/ros-setup/#ros-setup): If you want to run OpenManipulator in ROS environment, please install Linux, ROS and ROS package on PC according to [[ROS] Setup](/docs/en/platform/openmanipulator/ros-setup/#ros-setup) chapter. If you want to run the OpenManipulator on an embedded system, install the software on your PC and set up OpenCR by following the [[OpenCR] Setup](/docs/en/platform/openmanipulator/opencr-setup/#opencr-setup) chapter.

<img src="/assets/images/platform/openmanipulator/OpenManipulator_all_setup.png" width="500">

## [Let's try basic manipulation](#lets-try-basic-manipulation)
Once you have completed the above steps, run OpenManipulator through the provided Controller package. You can command the OpenManipulator to move specific position via ROS messages. As package for publishing messages, we provid the following examples.

- [GUI Program](/docs/en/platform/openmanipulator/ros-operation/#gui-program)
- [Teleoperation](/docs/en/platform/openmanipulator/ros-operation/#teleoperation)

OpenManipulator can also be operated using MoveIt!. You can run the controller package that uses MoveIt! by changing the variables in the launch file of the controller package. Please refer to the following chapters and try out various motions with MoveIt!.

- [MoveIt!](/docs/en/platform/openmanipulator/ros-operation/#moveit)

If you want to use the embedded system (OpenCR) to operate the OpenManipulator, you can use the Processing and RC100 controllers to perform various manipulations by referring to the following chapters.

- [Basic Manipulation on OpenCR](/docs/en/platform/openmanipulator/opencr-operation/#opencr-operation)


![](/assets/images/platform/openmanipulator/OpenManipulator_basic_manipul.png)

## [Challenge Various Applications](#challenge-various-applications)

We provide examples of AR marker recognition using Astra pro, Realsence D435, and Raspberry Pi Camera V2. Refer the example below to challenge the camera-based manipulation applications.

- [Camera Application](/docs/en/platform/openmanipulator/ros-operation/#camera-application)

We are proposing a way to replace and manipulate tool(gripper) of manipulator to take advantage of OpenManipulator for a wider range of applications. Try the new application using the Pen holder or Vacuum gripper as shown in the example below, and create your own tool to challenge more applications.

- [Tool Modiffication](/docs/en/platform/openmanipulator/tool_modification/#tool-modiffication)

OpenManipulator has a complete hardware combination with Turtlebot3 waffle. Challenge your mobile manipulation by assembling TurtleBot3 waffle and OpenManipulator.

- [Mobile Manipulation](/docs/en/platform/openmanipulator/ros-operation/#mobile-manipulation)

![](/assets/images/platform/openmanipulator/OpenManipulator_application.png)

## [Let's design my own manipulator](#lets-design-my-own-manipulator)

Modify the hardware(DOF, structure) and software(kinematics, trajectory) of OpenManipulator and manipulate your own OpenManipulator.  
We provide a variety of [OpenManipulator Friends](/docs/en/platform/openmanipulator/friends/#friends) as examples of hardware transformations. Try to control the manipulator with different structure and enjoy it. And try out the kinematics solving algorithm for the different structure.

<img src="/assets/images/platform/openmanipulator/OpenManipulator_friends.png" width="800">
