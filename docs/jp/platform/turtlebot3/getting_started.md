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
product_group: turtlebot3
page_number: 5
---

<div style="counter-reset: h1 4"></div>

# [Getting Started](#getting-started)
This page is for beginners to TurtleBot3. The manual has an enormous amount of contents, but this page explains how information is divided.

## [About TurtleBot3](#about-turtlebot3)
First of all, collect information from the [Overview][overview], [Notices][notices], [Features][features], and [Specifications][specifications] pages to get an overall understanding of TurtleBot3.

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_models_800.png)

## [First steps for using TurtleBot3](#first-steps-for-using-turtlebot3)

**NOTICE**: This page is written based on ROS 1. In order to use ROS 2 with TurtleBot3, see the related pages on e-Manual
{: .notice--warning}

When you have enough understanding about TurtleBot3 from above step, here is guide for software and hardware setups. Be aware that it is a time-saver to set up the SBC and your PC first, rather than assembling the robot. It is recommended to proceed in the following order.

1. [PC Setup](/docs/en/platform/turtlebot3/pc_setup/)
  - Install some applications (ROS 1, particular Linux version, dependent packages) on **Remote PC** that is the one you mainly use to comunicate with TurtleBot3.
2. [SBC Setup](/docs/en/platform/turtlebot3/sbc_setup/#sbc-setup)
  - Install some applications (ROS 1, particular Linux version, dependent packages) on **Single Board Computer** (SBC), which is used to communicate with **Remote PC**.
  
    **NOTE**: If you want to use different SBC and sensors with TurtleBot3, see [Compatible Devices][compatible_devices] page. 
    {: .notice}
  
3. [OpenCR Setup](/docs/en/platform/turtlebot3/opencr_setup/#opencr-setup)
  - Upload latest firmware of TurtleBot3 to OpenCR embedded board.
4. [Hardware Setup][hardware_setup] 
  - Assemble TurtleBot3 using the instructions. 

  ![](/assets/images/platform/turtlebot3/setup/setup.png)

## [Let's try the basic operation](#lets-try-the-basic-operation)
Once you have completed the above steps, run the robot through the provided [Bringup][bringup] package, and remotely move the robot with the teleoperation feature.  
Next, let's check various sensors' value mounted on the robot or learn how to control the robot by reading [Basic Operation][basic_operation] page.

- [Bringup][bringup]
- [Basic Operation][basic_operation]

![](/assets/images/platform/turtlebot3/example/operation.png)

## [Keep TurtleBot3's various technologies with you](#keep-turtlebot3s-various-technologies-with-you)
The TurtleBot3’s core technology is [SLAM][slam], [Navigation][navigation] and [Manipulation][manipulation], making it suitable for home service robots. These technologies can be applied either on a real robot or a virtual robot with [Simulation][simulation] feature.  
Of course, they can be implemented in TurtleBot3, such as [Autonomous Driving][autonomous_driving] and [Machine Learning][machine_learning]. In addition, we are introducing 12 different types of [Locomotion][locomotion] as TurtleBot3 Friends, as well as differential drive mobile robot. With this openended component, handful of TurtleBot3 friends with various characteristics could be built. You can create a totally new robot that is never seen before. Also interesting applications such as Follower Demo, Panoramic Demo, and Automatic Parking are available. See [Applications][applications] page for more application examples.

- [[ROS 1] SLAM][slam]
- [[ROS 1] Navigation][navigation]
- [[ROS 1] Simulation][simulation]
- [[ROS 1] Manipulation][manipulation]
- [[ROS 1] Autonomous Driving][autonomous_driving]
- [[ROS 1] Machine Learning][machine_learning]
- [Locomotion][locomotion]
- [Applications][applications]

![](/assets/images/platform/turtlebot3/example/technologies.png)

## [Learn and Explore more](#learn-and-explore-more)
The above are just a few examples of using TurtleBot3. You can learn more and challenge yourself with the following information.

You can [Learn][learn] more through the ROS courses provided by the Construct, the various lectures created by TurtleBot3 users, web content, YouTube courses, free books, and more. In addition, various [Videos][videos] produced by ROBOTIS will be helpful, and use cases using TurtleBot3 can be checked through various [Projects][projects] released by TurtleBot3 research collaborators and TurtleBot3 users. You can also try a variety of challenges through [Challenges][challenges].

- [Learn][learn]
- [Videos][videos]
- [Projects][projects]
- [Challenges][challenges]

![](/assets/images/platform/turtlebot3/example/projects.png)

## [References and Contacts](#references-and-contacts)
The [Appendixes][appendixes] contains information on components used in TurtleBot3 such as DYNAMIXEL, OpenCR and LDS. The open source used by TurtleBot3 is listed on [OpenSource and Licenses][opensource_and_licenses] page and this page contains information about each license. If you have any questions about TurtleBot3, please refer to our [FAQ][faq] or leave your [Contact information][contact_us].

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
