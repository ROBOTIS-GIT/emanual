---
layout: archive
lang: en
ref: openmanipulator_x_ros_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_simulation/
tabs: "ROS"
tab_title1: Humble
tab_title2: Noetic
tab_title6: Arduino
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 11
---

<style>body {counter-reset: h1 6 !important;}</style>

{::options parse_block_html="true" /}

# [Simulation](#simulation)

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% capture notice_01 %}
**NOTE**:
- Make sure ROS dependencies are installed before performing these instructions
- [Install ROS Packages](/docs/en/platform/openmanipulator_x/quick_start_guide/#install-ros-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>
</section>

<section data-id="{{ page.tab_title6 }}" class="tab_contents">
Not supported with Arduino
{: .notice--warning}
</section>

## [Launch gazebo](#launch-gazebo)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/launch_gazebo_humble.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/launch_gazebo_noetic.md %}
</section>

<section data-id="{{ page.tab_title6 }}" class="tab_contents">
Not supported with Arduino
{: .notice--warning}
</section>

## [Controller for Gazebo](#controller-for-gazebo)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/gazebo_controller_humble.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/gazebo_controller_noetic.md %}
</section>

<section data-id="{{ page.tab_title6 }}" class="tab_contents">
Not supported with Arduino
{: .notice--warning}
</section>

## [Operation in Gazebo](#operation-in-gazebo)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/gazebo_operation_humble.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/simulation/gazebo_operation_noetic.md %}
</section>

<section data-id="{{ page.tab_title6 }}" class="tab_contents">
Not supported with Arduino
{: .notice--warning}
</section>
