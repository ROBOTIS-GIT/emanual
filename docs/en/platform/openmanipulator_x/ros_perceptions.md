---
layout: archive
lang: en
ref: openmanipulator_x_ros_perceptions
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_perceptions/
tabs: "ROS"
tab_title1: Kinetic
tab_title2: Noetic
tab_title3: Dashing
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 12
---

<div style="counter-reset: h1 7"></div>

{::options parse_block_html="true" /}

# [Perceptions](#perceptions)

**NOTE**
Please run the instructions below on a PC with ROS packages installed.
{: .notice--info}

## [Camera](#camera)

The OpenMAIPULATOR-X can work with some cameras to recognize a front object. Use the following packages with introduced cameras: [Astro Pro](#astra-pro), [Realsense D435](#realsense-d435), [Raspberry Pi Camera V2](#raspberry-pi-camera-v2).

### [Install Camera Package](#install-camera-package)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/perceptions/camera_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/perceptions/camera_dashing.md %}
</section>

### [Install AR Marker Package](#install-ar-marker-package)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/perceptions/ar_marker_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/perceptions/ar_marker_dashing.md %}
</section>

### [Pick and Place Example](#pick-and-place-example)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/perceptions/pick_place_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/perceptions/pick_place_dashing.md %}
</section>
