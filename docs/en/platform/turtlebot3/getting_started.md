---
layout: archive
lang: en
ref: turtlebot3_getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/getting_started/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 19"></div>

# [Getting Started](#getting-started)
This document is for users who are new to TurtleBot3. It is an enormous amount of content, you can divide it as follows.

## [About TurtleBot3](#about-turtlebot3)
First of all, acquire relevant information from the [Overview][Overview], [Notices][Notices], [Features][Features], and [Specifications][Specifications] pages to get an overall understanding of TurtleBot3.

## [First steps for using TurtleBot3](#First-steps-for-using-turtlebot3)
When you have finished understanding TurtleBot3 above, here are the software and hardware setups. Be aware that it is a time-saver to set up the SBC and your PC's software settings first, rather than assembling the robot. It is recommended that you proceed in the following order.

1. [PC Setup][PC Setup]: Install Linux, ROS and application packages for TurtleBot3 on your Remote PC.
2. [SBC Setup][SBC Setup]: Install Linux, ROS and hardware related packages to control the TurtleBot3 on your TurtleBot PC.
3. [OpenCR Setup][OpenCR Setup]: Upload latest firmware of TurtleBot3 to embedded board OpenCR.
4. [Hardware Setup][Hardware Setup]: TurtleBots3 is delivered as unassembled parts in the boxes. Follow the instructions to assemble TurtleBot3. At this time, the prepared SBC and OpenCR are mounted on the robot.

If you want to use other products instead of SBCs and Sensors included in the basic configuration, please refer to the [Compatible Devices][Compatible Devices] page. 

## [Let's try the basic operation](#lets-try-the-basic-operation)
Once you have completed the above steps, then run the robot through the provided [Bringup][Bringup] package, and remotely move the robot through the teleoperation function. Next,let's check various sensors' value mounted on the robot or control the robot by referring to the [Basic Operation][Basic Operation] page.

- [Bringup][Bringup]
- [Basic Operation][Basic Operation]

## [Let's make TurtleBot3's various technologies my own](#lets-make-turtlebot3s-various-technologies-my-own)
The TurtleBot3’s core technology is [SLAM][SLAM], [Navigation][Navigation] and [Manipulation][Manipulation], making it suitable for home service robots. These can be operated through a real robot, and can also be operated in a virtual space through [Simulation][Simulation]. Moreover, it can be implemented through TurtleBot3, such as [Autonomous Driving][Autonomous Driving] and [Machine Learning][Machine Learning]. Also interesting applications such as Follower Demo, Panorama Demo, and Automatic Parking are available. See the [Applications][Applications] page.

In addition, we are introducing 12 different types of locomotion as TurtleBot3 [Friends][Friends], as well as differential drive mobile robot. With this openended component, handful of TurtleBot3 friends with various characteristics could be built. You can create a totally new robot that is never seen before.

- [SLAM][SLAM]
- [Navigation][Navigation]
- [Simulation][Simulation]
- [Manipulation][Manipulation]
- [Autonomous Driving][Autonomous Driving]
- [Machine Learning][Machine Learning]
- [Applications][Applications]
- [Friends][Friends]

## [Learn more and explore more use cases](#learn-more-and-explore-more-use-cases)
The above are just a few examples of using TurtleBot3. You can learn more and challenge yourself with the following information.

You can [learn][Learn] more through the ROS courses provided by [the Construct](http://www.theconstructsim.com/), the various lectures created by TurtleBot3 users, web content, YouTube courses, free books, and more. In addition, various videos produced by ROBOTIS will be helpful, and use cases using TurtleBot3 can be checked through various [projects][Projects] released by TurtleBot3 research collaborators and TurtleBot3 users. You can also try a variety of challenges through events [events][Events] as competitions.

- [Learn][Learn]
- [Videos][Videos]
- [Projects][Projects]
- [Events][Events]

## [References and Contacts](#references-and-contacts)
The [appendixes][Appendixes] contain information on components used in TurtleBot3 such as DYNAMIXEL, OpenCR and LDS. The open source used by TurtleBot3 is listed on [OpenSource and Licenses][OpenSource and Licenses] page and this page contains information about each license. If you have any questions about TurtleBot3, please refer to our [FAQ][FAQ] and leave our [contact information][Contact US].

- [Appendixes][Appendixes]
- [OpenSource and Licenses][OpenSource and Licenses]
- [FAQ][FAQ]
- [Contact US][Contact US]

[Overview]: /docs/en/platform/turtlebot3/overview/
[Notices]: /docs/en/platform/turtlebot3/notices/
[Features]: /docs/en/platform/turtlebot3/features/
[Specifications]: /docs/en/platform/turtlebot3/specifications/

[Getting Started]: /docs/en/platform/turtlebot3/getting_started/
[Setup]: /docs/en/platform/turtlebot3/setup/
[PC Setup]: /docs/en/platform/turtlebot3/pc_setup/
[SBC Setup]: /docs/en/platform/turtlebot3/sbc_setup/
[OpenCR Setup]: /docs/en/platform/turtlebot3/opencr_setup/
[Hardware Setup]: /docs/en/platform/turtlebot3/hardware_setup/
[Compatible Devices]: /docs/en/platform/turtlebot3/compatible_devices/

[Bringup]: /docs/en/platform/turtlebot3/bringup/
[Basic Operation]: /docs/en/platform/turtlebot3/basic_operation/

[SLAM]: /docs/en/platform/turtlebot3/slam/
[Navigation]: /docs/en/platform/turtlebot3/navigation/
[Simulation]: /docs/en/platform/turtlebot3/simulation/
[Manipulation]: /docs/en/platform/turtlebot3/manipulation/
[Autonomous Driving]: /docs/en/platform/turtlebot3/autonomous_driving/
[Machine Learning]: /docs/en/platform/turtlebot3/machine_learning/
[Applications]: /docs/en/platform/turtlebot3/applications/
[Friends]: /docs/en/platform/turtlebot3/friends/

[Learn]: /docs/en/platform/turtlebot3/learn/
[Videos]: /docs/en/platform/turtlebot3/videos/
[Projects]: /docs/en/platform/turtlebot3/projects/
[Events]: /docs/en/platform/turtlebot3/events/

[Appendixes]: /docs/en/platform/turtlebot3/appendixes/
[OpenSource and Licenses]: /docs/en/platform/turtlebot3/opensource/
[FAQ]: /docs/en/platform/turtlebot3/faq/
[Contact US]: /docs/en/platform/turtlebot3/contact_us/
