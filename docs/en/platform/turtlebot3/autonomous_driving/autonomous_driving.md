---
layout: archive
lang: en
ref: autonomous_driving
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/autonomous_driving/
tabs: "ROS"
tab_title2: Noetic
tab_title5: Humble
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 19
---

<style>body {counter-reset: h1 7 !important;}</style>

{::options parse_block_html="true" /}

![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_rbiz_challenge_2017_robots_1.png)

# [Autonomous Driving](#autonomous-driving)

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

## Getting Started
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_getting_started_noetic.md %}

## [Camera Calibration](#camera-calibration)
Calibrating the camera is very important for autonomous driving. The following describes how to simply calibrate the camera step by step.

### [Camera Imaging Calibration](#camera-imaging-calibration)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_camera_imaging_calibration_noetic.md %}

### [Intrinsic Camera Calibration](#intrinsic-camera-calibration)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_intrinsic_camera_calibration_noetic.md %}

### [Extrinsic Camera Calibration](#extrinsic-camera-calibration)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_extrinsic_camera_calibration_noetic.md %}

### [Check Calibration Result](#check-calibration-result)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_check_calibration_result_noetic.md %}

## [Lane Detection](#lane-detection)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_lane_detection_noetic.md %}

## [Traffic Sign Detection](#traffic-sign-detection)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_traffic_sign_detection_noetic.md %}

## [Missions](#missions)

The AutoRace is a competition for autonomous driving robot platforms.  
To provide various conditions for a robot application development, the game provide structural regulation as less as possible. Provided open sources are based on ROS, and can be applied to this competition. The contents can be continually updated. Join the competition and show your skill.

**WARNING**: Be sure to read [Autonomous Driving](#autonomous-driving) in order to start missions.
{: .notice--warning}

### [Traffic Lights](#traffic-lights)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_traffic_lights_noetic.md %}

### [Intersection](#intersection)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_intersection_noetic.md %}

### [Construction](#construction)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_construction_noetic.md %}

### [Parking](#parking)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_parking_noetic.md %}

### [Level Crossing](#level-crossing)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_level_crossing_noetic.md %}

### [Tunnel](#tunnel)
{% include en/platform/turtlebot3/autonomous_driving/noetic/autonomous_driving_sim_tunnel_noetic.md %}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
**NOTE**: The TurtleBot3 Autorace Humble version is scheduled to be released soon
{: .notice--warning}
</section>

