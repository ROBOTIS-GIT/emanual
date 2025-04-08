---
layout: archive
lang: en
ref: navigation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/navigation/
tabs: "ROS"
tab_title1: Humble
tab_title2: Jazzy
tab_title3: Noetic
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 11
---

<style>body {counter-reset: h1 4 !important;}</style>

# [Navigation](#navigation)

{::options parse_block_html="true" /}

<!-- Common Intro -->
**WARNING**: While following these instructions, your TurtleBot3 may move and rotate unexpectedly. Please place the robot in safe location on the ground.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**
- Navigation should be run on the Remote PC.
- Make sure to launch [Bringup](/docs/en/platform/turtlebot3/bringup/) on your TurtleBot3 before executing the following operations.
- Navigation uses maps created by [SLAM](/docs/en/platform/turtlebot3/slam/). Please prepare a map before running Navigation.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**Navigation** is used move the robot from one location to a specified destination in a given environment. For this purpose, a map that contains geometry information describing furniture, objects, and walls of the given environment is required. As described in the previous SLAM section, a map was created with the distance information obtained by the sensor and the pose information of the robot itself.

## [Run Navigation Nodes](#run-navigation-nodes)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_run_navigation_nodes_humble.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_run_navigation_nodes_jazzy.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_run_navigation_nodes_noetic.md %}
</section>

## [Estimate Initial Pose](#estimate-initial-pose)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_estimate_initial_pose_humble.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_estimate_initial_pose_jazzy.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_estimate_initial_pose_noetic.md %}
</section>

## [Set Navigation Goal](#set-navigation-goal)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_set_navigation_goal_humble.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_set_navigation_goal_jazzy.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_set_navigation_goal_noetic.md %}
</section>

## [Tuning Guide](#tuning-guide)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_tuning_guide_humble.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_tuning_guide_jazzy.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/turtlebot3/navigation/navigation_tuning_guide_noetic.md %}
</section>
