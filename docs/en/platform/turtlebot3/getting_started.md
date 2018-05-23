---
layout: archive
lang: en
ref: getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/getting_started/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 4"></div>

# [Getting Started](#getting-started)
This document is for users who are new to TurtleBot3. It is an enormous amount of content, you can divide it as follows.

## [About TurtleBot3](#about-turtlebot3)
First of all, acquire relevant information from the [Overview][overview], [Notices][notices], [Features][features], and [Specifications][specifications] pages to get an overall understanding of TurtleBot3.

## [First steps for using TurtleBot3](#first-steps-for-using-turtlebot3)
When you have finished understanding TurtleBot3 above, here are the software and hardware setups. Be aware that it is a time-saver to set up the SBC and your PC's software settings first, rather than assembling the robot. It is recommended that you proceed in the following order.

1. [PC Setup][pc_setup]: Install Linux, ROS and application software for TurtleBot3 on your **Remote PC**.
2. [SBC Setup][sbc_setup]: Install Linux, ROS and hardware related software to control the TurtleBot3 on your **TurtleBot PC**.
3. [OpenCR Setup][opencr_setup]: Upload latest firmware of TurtleBot3 to embedded board OpenCR.
4. [Hardware Setup][hardware_setup]: TurtleBots3 is delivered as unassembled parts in the boxes. Follow the instructions to assemble TurtleBot3. At this time, the prepared SBC and OpenCR are mounted on the robot.

If you want to use other products instead of SBCs and Sensors included in the basic configuration, please refer to the [Compatible Devices][compatible_devices] page. 

## [Let's try the basic operation](#lets-try-the-basic-operation)
Once you have completed the above steps, then run the robot through the provided [Bringup][bringup] package, and remotely move the robot through the teleoperation function. Next, let's check various sensors' value mounted on the robot or control the robot by referring to the [Basic Operation][basic_operation] page.

- [Bringup][bringup]
- [Basic Operation][basic_operation]

## [Let's make TurtleBot3's various technologies my own](#lets-make-turtlebot3s-various-technologies-my-own)
The TurtleBot3’s core technology is [SLAM][slam], [Navigation][navigation] and [Manipulation][manipulation], making it suitable for home service robots. These can be operated through a real robot, and can also be operated in a virtual space through [Simulation][simulation]. Moreover, it can be implemented through TurtleBot3, such as [Autonomous Driving][autonomous_driving] and [Machine Learning][machine_learning]. In addition, we are introducing 12 different types of [Locomotion][locomotion] as TurtleBot3 Friends, as well as differential drive mobile robot. With this openended component, handful of TurtleBot3 friends with various characteristics could be built. You can create a totally new robot that is never seen before. Also interesting applications such as Follower Demo, Panorama Demo, and Automatic Parking are available. See the [Applications][applications] page.

- [SLAM][slam]
- [Navigation][navigation]
- [Simulation][simulation]
- [Manipulation][manipulation]
- [Autonomous Driving][autonomous_driving]
- [Machine Learning][machine_learning]
- [Locomotion][locomotion]
- [Applications][applications]

## [Learn more and explore more use cases](#learn-more-and-explore-more-use-cases)
The above are just a few examples of using TurtleBot3. You can learn more and challenge yourself with the following information.

You can [Learn][learn] more through the ROS courses provided by the Construct, the various lectures created by TurtleBot3 users, web content, YouTube courses, free books, and more. In addition, various [Videos][videos] produced by ROBOTIS will be helpful, and use cases using TurtleBot3 can be checked through various [Projects][projects] released by TurtleBot3 research collaborators and TurtleBot3 users. You can also try a variety of challenges through [Challenges][challenges].

- [Learn][learn]
- [Videos][videos]
- [Projects][projects]
- [Challenges][challenges]

## [References and Contacts](#references-and-contacts)
The [Appendixes][appendixes] contain information on components used in TurtleBot3 such as DYNAMIXEL, OpenCR and LDS. The open source used by TurtleBot3 is listed on [OpenSource and Licenses][opensource_and_licenses] page and this page contains information about each license. If you have any questions about TurtleBot3, please refer to our [FAQ][faq] and leave our [Contact information][contact_us].

- [Appendixes][appendixes]
- [OpenSource and Licenses][opensource_and_licenses]
- [FAQ][faq]
- [Contact US][contact_us]

[overview]: /docs/en/platform/turtlebot3/overview/
[notices]: /docs/en/platform/turtlebot3/notices/
[features]: /docs/en/platform/turtlebot3/features/
[specifications]: /docs/en/platform/turtlebot3/specifications/

[getting_started]: /docs/en/platform/turtlebot3/getting_started/

[setup]: /docs/en/platform/turtlebot3/setup/
[pc_setup]: /docs/en/platform/turtlebot3/pc_setup/
[sbc_setup]: /docs/en/platform/turtlebot3/sbc_setup/
[opencr_setup]: /docs/en/platform/turtlebot3/opencr_setup/
[hardware_setup]: /docs/en/platform/turtlebot3/hardware_setup/
[compatible_devices]: /docs/en/platform/turtlebot3/compatible_devices/

[bringup]: /docs/en/platform/turtlebot3/bringup/
[basic_operation]: /docs/en/platform/turtlebot3/basic_operation/

[slam]: /docs/en/platform/turtlebot3/slam/
[navigation]: /docs/en/platform/turtlebot3/navigation/
[simulation]: /docs/en/platform/turtlebot3/simulation/
[manipulation]: /docs/en/platform/turtlebot3/manipulation/
[autonomous_driving]: /docs/en/platform/turtlebot3/autonomous_driving/
[machine_learning]: /docs/en/platform/turtlebot3/machine_learning/
[locomotion]: /docs/en/platform/turtlebot3/locomotion/
[applications]: /docs/en/platform/turtlebot3/applications/

[learn]: /docs/en/platform/turtlebot3/learn/
[videos]: /docs/en/platform/turtlebot3/videos/
[projects]: /docs/en/platform/turtlebot3/projects/
[challenges]: /docs/en/platform/turtlebot3/challenges/

[appendixes]: /docs/en/platform/turtlebot3/appendixes/
[opensource_and_licenses]: /docs/en/platform/turtlebot3/opensource/
[faq]: /docs/en/platform/turtlebot3/faq/
[contact_us]: /docs/en/platform/turtlebot3/contact_us/
