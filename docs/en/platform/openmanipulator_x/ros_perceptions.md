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
tab_title4: Foxy
tab_title5: Arduino
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 12
---

<div style="counter-reset: h1 7"></div>

{::options parse_block_html="true" /}

# [Perceptions](#perceptions)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
**NOTE**
Please run the instructions below on a PC with ROS packages installed.
{: .notice--info}
</section>

## [Camera](#camera)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
The OpenMAIPULATOR-X can work with some cameras to recognize a front object. Use the following packages with introduced cameras: [Astro Pro](#astra-pro), [Realsense D435](#realsense-d435), [Raspberry Pi Camera V2](#raspberry-pi-camera-v2).
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
This example is not supported.  
[https://github.com/ROBOTIS-GIT/open_manipulator_perceptions](https://github.com/ROBOTIS-GIT/open_manipulator_perceptions)
{: .notice--warning}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
This example is not supported.  
[https://github.com/ROBOTIS-GIT/open_manipulator_perceptions](https://github.com/ROBOTIS-GIT/open_manipulator_perceptions)
{: .notice--warning}
</section>

<section data-id="{{ page.tab_title4 }}" class="tab_contents">
This example is not supported.  
[https://github.com/ROBOTIS-GIT/open_manipulator_perceptions](https://github.com/ROBOTIS-GIT/open_manipulator_perceptions)
{: .notice--warning}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
The following is an example of connecting the OV7725 camera module with AL422B buffer to the GPIO of OpenCR.  
[https://community.robotsource.org/t/opencr-with-ov7725-al422b-camera-2-8-tftlcd/1413](https://community.robotsource.org/t/opencr-with-ov7725-al422b-camera-2-8-tftlcd/1413)

The Arduino sketch code can be found from [OpenCR examples](https://github.com/ROBOTIS-GIT/OpenCR/tree/master/arduino/opencr_arduino/opencr/libraries/OpenCR/examples/10.%20Etc/CAMERA/ov7725_al422b) in Arduino IDE.
</section>

### [Install Camera Package](#install-camera-package)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/perceptions/camera_kinetic.md %}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
Not supported in Arduino
{: .notice--warning}
</section>

### [Install AR Marker Package](#install-ar-marker-package)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/perceptions/ar_marker_kinetic.md %}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
Not supported in Arduino
{: .notice--warning}
</section>

### [Pick and Place Example](#pick-and-place-example)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/perceptions/pick_place_kinetic.md %}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
Not supported in Arduino
{: .notice--warning}
</section>
