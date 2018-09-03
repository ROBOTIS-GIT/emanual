---
layout: archive
lang: en
ref: overview
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/overview/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 0"></div>

# [Overview](#overview)

![](/assets/images/platform/turtlebot3/overview/turtlebot3_with_logo.png)

## [TurtleBot](#turtlebot)

[TurtleBot][turtlebot] is a [ROS][ros] standard platform robot. Turtle is derived from the Turtle robot, which was driven by the educational computer programming language [Logo][logo] in 1967. In addition, the [turtlesim node][turtlesim], which first appears in the basic tutorial of ROS, is a program that mimics the command system of the [Logo turtle program][logo_primer]. It is also used to create the [Turtle icon][tuturtle] as a symbol of ROS. The nine dots used in the ROS logo derived from the back shell of the turtle. TurtleBot, which originated from the Turtle of Logo, is designed to easily teach people who are new to ROS through TurtleBot as well as to teach computer programming language using Logo. Since then TurtleBot has become the standard platform of ROS, which is the most popular platform among developers and students.

## [TurtleBot3](#turtlebot3)

There are 3 versions of the [TurtleBot][turtlebot] series. TurtleBot1 was developed by Tully (Platform Manager at Open Robotics) and Melonee (CEO of Fetch Robotics) from Willow Garage on top of the iRobot’s Roomba-based research robot, Create, for ROS deployment. It was developed in 2010 and has been on sale since 2011. In 2012, TurtleBot2 was developed by Yujin Robot based on the research robot, iClebo Kobuki. In 2017, TurtleBot3 was developed with features to supplement the lacking functions of its predecessors, and the demands of users. The TurtleBot3 adopts ROBOTIS smart actuator [Dynamixel][dynamixel] for driving. For more information on the TurtleBot series, please see the following [link][history].

TurtleBot3 is a small, affordable, programmable, ROS-based mobile robot for use in education, research, hobby, and product prototyping. The goal of TurtleBot3 is to dramatically reduce the size of the platform and lower the price without having to sacrifice its functionality and quality, while at the same time offering expandability. The TurtleBot3 can be customized into various ways depending on how you reconstruct the mechanical parts and use optional parts such as the computer and sensor. In addition, TurtleBot3 is evolved with cost-effective and small-sized SBC that is suitable for robust embedded system, 360 degree distance sensor and 3D printing technology.

The TurtleBot3’s core technology is [SLAM][slam], [Navigation][navigation] and [Manipulation][manipulation], making it suitable for home service robots. The TurtleBot can run SLAM(simultaneous localization and mapping) algorithms to build a map and can drive around your room. Also, it can be controlled remotely from a laptop, joypad or Android-based smart phone. The TurtleBot can also follow a person’s legs as they walk in a room. Also the TurtleBot3 can be used as a mobile manipulator capable of manipulating an object by attaching a manipulator like OpenManipulator. The [OpenManipulator][openmanipulator] has the advantage of being compatible with TurtleBot3 Waffle and Waffle Pi. Through this compatibility can compensate for the lack of freedom and can have greater completeness as a service robot with the the SLAM and navigation capabilities that the TurtleBot3 has.

## [TurtleBot3 Introduction Video](#turtlebot3-introduction-video)

<iframe width="640" height="360" src="https://www.youtube.com/embed/9OC3J53RUsk" frameborder="0" allowfullscreen></iframe>

## [TurtleBot3 Collaboration Project](#turtlebot3-collaboration-project)

TurtleBot3 is a collaboration project among [Open Robotics][open_robotics], [ROBOTIS][robotis], and more partners like [The Construct][the_construct], [Intel][intel], [Onshape][onshape], [OROCA][oroca], [AuTURBO][auturbo], [ROS in Robotclub Malaysia][ros_in_robotclub_malaysia], [Astana Digital][astana digital], [Polariant Experiment][polariant_experiment], [Tokyo University of Agriculture and Technology, GVlab][gvlab], [Networked Control Robotics Lab at National Chiao Tung University][nctu], [SIM Group at TU Darmstadt][sim_group]. The Open Robotics is in charge of software and community activities, while ROBOTIS is in charge of manufacturing and global distribution.

The most important part of this TurtleBot3 collaboration project is open source based software, hardware, and content. We are encouraging more partners and research collaborators to participate in this project to enrich the robotics field.

If you are interested in partnership with us to realize open source robotics, please fill out form [here][partners].

### TurtleBot3 Providers
![](/assets/images/platform/turtlebot3/logo_platform_providers.png)

### TurtleBot3 Partners and Research Collaborators
![](/assets/images/platform/turtlebot3/logo_platform_sponsors.png)

\* Each collaboration member's web page can be found [here][partners].

### TurtleBot3 Distributors
![](/assets/images/platform/turtlebot3/logo_platform_players.png)

\* Each collaboration member's web page can be found [here][partners].

### TurtleBot3 Map

<script type="text/javascript" src="https://embed.githubusercontent.com/view/geojson/turtlebot/map/master/Distributors.geojson"></script>


[turtlebot]: https://www.turtlebot.com/
[ros]: http://www.ros.org/about-ros/
[logo]: http://el.media.mit.edu/logo-foundation/index.html
[turtlesim]: http://wiki.ros.org/turtlesim
[logo_primer]: http://el.media.mit.edu/logo-foundation/what_is_logo/logo_primer.html
[tuturtle]: http://wiki.ros.org/tuturtle
[dynamixel]: http://en.robotis.com/subindex/dxl_en.php
[history]: https://www.turtlebot.com/about/
[slam]: https://en.wikipedia.org/wiki/Simultaneous_localization_and_mapping
[navigation]: https://en.wikipedia.org/wiki/Robot_navigation
[manipulation]: https://en.wikipedia.org/wiki/Robotic_manipulation
[openmanipulator]: http://emanual.robotis.com/docs/en/platform/openmanipulator/

[open_robotics]: https://www.openrobotics.org/
[robotis]: http://www.robotis.com/
[the_construct]: http://www.theconstructsim.com/
[intel]: http://www.intel.com/
[onshape]: https://www.onshape.com/
[oroca]: http://www.oroca.org/
[auturbo]: https://github.com/AuTURBO/
[ros_in_robotclub_malaysia]: https://www.youtube.com/channel/UCLvvXbwPkostryBQt4MIbUw
[astana digital]: https://www.youtube.com/channel/UCWiIY_zrKH-LMlx2GBWu3yA
[polariant_experiment]: https://www.polariant.io/
[gvlab]: http://web.tuat.ac.jp/~gvlab/
[nctu]: https://sites.google.com/a/g2.nctu.edu.tw/ncrl/
[sim_group]: https://www.sim.informatik.tu-darmstadt.de/en/index/
[partners]: https://www.turtlebot.com/partners
