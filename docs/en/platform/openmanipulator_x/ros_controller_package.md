---
layout: archive
lang: en
ref: openmanipulator_x_ros_controller_package
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_controller_package/
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
page_number: 6
---

<div style="counter-reset: h1 4"></div>

{::options parse_block_html="true" /}

# [Controller](#controller)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/controller/launch_controller_pkg_kinetic.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/controller/launch_controller_pkg_noetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/controller/launch_controller_pkg_dashing.md %}
</section>

<section data-id="{{ page.tab_title4 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/controller/launch_controller_pkg_foxy.md %}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
Arduino sketch for OpenCR OpenMANIPULATOR-X includes the controller in the code.
{: .notice}
</section>

## [Launch Controller](#launch-controller)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/controller/launch_controller_kinetic.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/controller/launch_controller_noetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/controller/launch_controller_dashing.md %}
</section>

<section data-id="{{ page.tab_title4 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/controller/launch_controller_foxy.md %}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
{% capture note_01 %}
- Arduino sketch for OpenCR OpenMANIPULATOR-X includes the controller in the code.  
- Connecting the OpenMANIPULATOR-X and 12V power source, and turning on the power switch of the OpenCR 1.0 will automatically launch the controller.  
- Please refer to the [Launch Controller](/docs/en/platform/openmanipulator_x/quick_start_guide_basic_operation/#launch-controller) in the Basic Operation section.
{% endcapture %}
<div class="notice--warning">{{ note_01 | markdownify }}</div>
</section>
