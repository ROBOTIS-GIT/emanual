---
layout: archive
lang: en
ref: openmanipulator_x_ros_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_simulation/
tabs: "ROS"
tab_title1: Kinetic
tab_title2: Noetic
tab_title3: Dashing
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 11
---

<div style="counter-reset: h1 6"></div>

{::options parse_block_html="true" /}

# [Simulation](#simulation)

{% capture notice_01 %}
**NOTE**:
- Make sure ROS dependencies are installed before performing these instructions
- [Install ROS Packages](/docs/en/platform/openmanipulator_x/ros_setup/#install-ros-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Launch gazebo](#launch-gazebo)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/launch_gazebo_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/launch_gazebo_dashing.md %}
</section>

## [Controller for Gazebo](#controller-for-gazebo)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/gazebo_controller_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/gazebo_controller_dashing.md %}
</section>

## [Operation in Gazebo](#operation-in-gazebo)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/gazebo_operation_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/gazebo_operation_dashing.md %}
</section>