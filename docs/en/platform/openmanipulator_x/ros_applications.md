---
layout: archive
lang: en
ref: openmanipulator_x_ros_applications
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_applications/
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
page_number: 13
---

<div style="counter-reset: h1 8"></div>

{::options parse_block_html="true" /}

# [Applications](#applications)

## [Master and Slave](#master-and-slave)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
In this example, if the user is holding the master OpenMANIPULATOR, the slave OpenMANIPULATOR-X moves like master robot. Recording mode allows you to save the trajectory as you move the master OpenMANIPULATOR-X and play it back to the slave OpenMANIPULATOR.

<iframe width="560" height="315" src="https://www.youtube.com/embed/kTS3Yx75mLo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
In this example, if the user is holding the master OpenMANIPULATOR, the slave OpenMANIPULATOR-X moves like master robot. Recording mode allows you to save the trajectory as you move the master OpenMANIPULATOR-X and play it back to the slave OpenMANIPULATOR.

<iframe width="560" height="315" src="https://www.youtube.com/embed/kTS3Yx75mLo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
In this example, if the user is holding the master OpenMANIPULATOR, the slave OpenMANIPULATOR-X moves like master robot. Recording mode allows you to save the trajectory as you move the master OpenMANIPULATOR-X and play it back to the slave OpenMANIPULATOR.

<iframe width="560" height="315" src="https://www.youtube.com/embed/kTS3Yx75mLo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</section>

<section data-id="{{ page.tab_title4 }}" class="tab_contents">
Coming Soon (2021 4Q)
{: .notice--success}
</section>

<section data-id="{{ page.tab_title5 }}" class="tab_contents">
Master and Slave is not supported in Arduino
{: .notice--warning}
</section>

### [Setup OpenMANIPULATOR-X](#setup-openmanipulator-x)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/setup_kinetic.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/setup_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
Since you need to control two OpenManipulators on one PC, use two U2D2s and two OpenManipulators to connect as shown below.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_master_slave_connection.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_master_slave.png)

{% include en/platform/openmanipulator_x/applications/setup_dashing.md %}
</section>

### [Install Package](#install-package)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/install_kinetic.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/install_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/install_dashing.md %}
</section>

### [Execute Example](#execute-example)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/execute_kinetic.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/execute_noetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/execute_dashing.md %}
</section>

## [OpenCR Teaching](#opencr-teaching)

This controller is not compatible with ROS, but runs on the OpenCR as a standalone controller.
{: .notice--warning}

<iframe width="560" height="315" src="https://www.youtube.com/embed/t2xUWZYMw8Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
