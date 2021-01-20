---
layout: archive
lang: en
ref: navigation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/navigation/
tabs: "ROS"
tab_title1: Kinetic
tab_title2: melodic
tab_title3: Noetic
tab_title4: Dashing
tab_title5: Foxy
tab_title6: Windows
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 11
---

<div style="counter-reset: h1 4"></div>

# [Navigation](#navigation)

{::options parse_block_html="true" /}

<!-- Common Intro -->
**WARNING**: In this instruction, TurtleBot3 may move and rotate. Please place the robot on a safe ground.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**
- Please run the Navigation on Remote PC.
- Make sure to launch the [Bringup](/docs/en/platform/turtlebot3/bringup/) from TurtleBot3 before executing any operation.
- The Navigation uses a map created by the [SLAM](/docs/en/platform/turtlebot3/slam/). Please prepare a map before running the Navigation.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**[Navigation][navigation]** is to move the robot from one location to the specified destination in a given environment. For this purpose, a map that contains geometry information of furniture, objects, and walls of the given environment is required. As described in the previous [SLAM][slam] section, the map was created with the distance information obtained by the sensor and the pose information of the robot itself.

The [Navigation][navigation] enables a robot to move from the current pose to the designated goal pose on the map by using the map, robot's encoder, IMU sensor, and distance sensor. The procedure for performing this task is as follows.

## [Run Navigation Nodes](#run-navigation-nodes)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_run_navigation_nodes_kinetic.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_run_navigation_nodes_melodic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_run_navigation_nodes_noetic.md %}
</section>

<section data-id="{{ page.tab_title4 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_run_navigation_nodes_dashing.md %}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_run_navigation_nodes_foxy.md %}
</section>

<section data-id="{{ page.tab_title6 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_run_navigation_nodes_windows.md %}
</section> 


## [Estimate Initial Pose](#estimate-initial-pose)


<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_estimate_initial_pose_kinetic.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_estimate_initial_pose_melodic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_estimate_initial_pose_noetic.md %}
</section>

<section data-id="{{ page.tab_title4 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_estimate_initial_pose_dashing.md %}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_estimate_initial_pose_foxy.md %}
</section>

<section data-id="{{ page.tab_title6 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_estimate_initial_pose_windows.md %}
</section> 


## [Set Navigation Goal](#set-navigation-goal)


<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_set_navigation_goal_kinetic.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_set_navigation_goal_melodic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_set_navigation_goal_noetic.md %}
</section>

<section data-id="{{ page.tab_title4 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_set_navigation_goal_dashing.md %}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_set_navigation_goal_foxy.md %}
</section>

<section data-id="{{ page.tab_title6 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_set_navigation_goal_windows.md %}
</section> 

## [Tuning Guide](#tuning-guide)


<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_tuning_guide_kinetic.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_tuning_guide_melodic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_tuning_guide_noetic.md %}
</section>

<section data-id="{{ page.tab_title4 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_tuning_guide_dashing.md %}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_tuning_guide_foxy.md %}
</section>

<section data-id="{{ page.tab_title6 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_tuning_guide_windows.md %}
</section> 
