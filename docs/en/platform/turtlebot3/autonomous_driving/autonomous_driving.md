---
layout: archive
lang: en
ref: autonomous_driving
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/autonomous_driving/
tabs: "ROS"
tab_title1: Kinetic
tab_title2: Melodic
tab_title3: Noetic
tab_title4: Dashing
tab_title5: Foxy
tab_title6: Windows
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 19
---

<div style="counter-reset: h1 7"></div>

{::options parse_block_html="true" /}

![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_rbiz_challenge_2017_robots_1.png)

# [Autonomous Driving](#autonomous-driving)

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
**NOTE**: TurtleBot3 Autorace is supported in ROS1 Kinetic and Noetic. 
{: .notice}
</section>

<section data-id="{{ page.tab_title4 }}" class="tab_contents">
**NOTE**: TurtleBot3 Autorace is supported in ROS1 Kinetic and Noetic. 
{: .notice}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
**NOTE**: TurtleBot3 Autorace is supported in ROS1 Kinetic and Noetic. 
{: .notice}
</section>

<section data-id="{{ page.tab_title6 }}" class="tab_contents">
**NOTE**: TurtleBot3 Autorace is supported in ROS1 Kinetic and Noetic. 
{: .notice}
</section>

## Getting Started

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_getting_started_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_getting_started_noetic.md %}
</section>

## [Camera Calibration](#camera-calibration)

<!-- Camera Calli -->

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
Calibrating the camera is very important for autonomous driving. The following describes how to simply calibrate the camera step by step.
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
Calibrating the camera is very important for autonomous driving. The following describes how to simply calibrate the camera step by step.
</section>

### [Camera Imaging Calibration](#camera-imaging-calibration)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_camera_imaging_calibration_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_camera_imaging_calibration_noetic.md %}
</section>

### [Intrinsic Camera Calibration](#intrinsic-camera-calibration)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_intrinsic_camera_calibration_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_intrinsic_camera_calibration_noetic.md %}
</section>

### [Extrinsic Camera Calibration](#extrinsic-camera-calibration)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_extrinsic_camera_calibration_kinetic.md  %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_extrinsic_camera_calibration_noetic.md %}
</section>

### [Check Calibration Result](#check-calibration-result)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_check_calibration_result_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_check_calibration_result_noetic.md %}
</section>

## [Lane Detection](#lane-detection)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_lane_detection_kinetic.md  %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_lane_detection_noetic.md %}
</section>

## [Traffic Sign Detection](#traffic-sign-detection)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_traffic_sign_detection_kinetic.md %}
</section> 

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_traffic_sign_detection_noetic.md %}
</section> 

## [Missions](#missions)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

The AutoRace is a competition for autonomous driving robot platforms.  
To provide various conditions for a robot application development, the game provide structural regulation as less as possible. Provided open sources are based on ROS, and can be applied to this competition. The contents can be continually updated. Join the competition and show your skill.

**WARNING**: Be sure to read [Autonomous Driving](#autonomous-driving) in order to start missions.
{: .notice--warning}

</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">

The AutoRace is a competition for autonomous driving robot platforms.  
To provide various conditions for a robot application development, the game provide structural regulation as less as possible. Provided open sources are based on ROS, and can be applied to this competition. The contents can be continually updated. Join the competition and show your skill.

**WARNING**: Be sure to read [Autonomous Driving](#autonomous-driving) in order to start missions.
{: .notice--warning}
</section>

### [Traffic Lights](#traffic-lights)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_traffic_lights_kinetic.md  %} 
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_traffic_lights_noetic.md %}
</section>

### [Intersection](#intersection)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_intersection_kinetic.md  %}
</section> 

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_intersection_noetic.md %}
</section>

### [Construction](#construction)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_construction_kinetic.md  %}
</section> 

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_construction_noetic.md %}
</section>

### [Parking](#parking)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_parking_kinetic.md  %}
</section> 

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_parking_noetic.md %}
</section>

### [Level Crossing](#level-crossing)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_level_crossing_kinetic.md  %}
</section> 

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_level_crossing_noetic.md %}
</section>

### [Tunnel](#tunnel)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/kinetic/autonomous_driving_tunnel_kinetic.md  %}
</section> 

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_tunnel_noetic.md %}
</section>
