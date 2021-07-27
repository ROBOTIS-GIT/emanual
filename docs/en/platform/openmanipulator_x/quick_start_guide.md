---
layout: archive
lang: en
ref: openmanipulator_x_quick_start_guide
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/quick_start_guide/
tabs: "ROS"
tab_title1: Kinetic
tab_title2: Noetic
tab_title3: Dashing
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 4
---

<div style="counter-reset: h1 3"></div>

{::options parse_block_html="true" /}

# [Quick Start Guide](#quick-start-guide)

This step by step quick start guide for running OpenMANIPULATOR-X on ROS<sup>TM</sup> will guide you to operate the OpenMANIPULATOR-X for the first time.  

In order to run this Quick Start Guide, you should be prepared with below items. 
- [OpenMANIPULATOR-X](http://en.robotis.com/shop_en/item.php?it_id=905-0024-000)
- Communication Interface (Use either option you prefer)
  - Option 1 : [DYNAMIXEL Starter Set](http://en.robotis.com/shop_en/list.php?ca_id=302050)
  - Option 2 : [OpenCR1.0](http://en.robotis.com/shop_en/item.php?it_id=903-0257-000)
- Power supply
  - [ROBOTIS SMPS 12V 5A PS-10](http://en.robotis.com/shop_en/list.php?ca_id=3020a0&sort=&sortodr=&page=1) recommended (included in the DYNAMIXEL Starter Set)


## [Setup](#setup)

### [Install Ubuntu on PC](#install-ubuntu-on-pc)

Installing Ubuntu on a PC or laptop may differ by model. Please contact the manufacturer or community for more details.
{: .notice--warning}

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/quick_start_guide/quickstart_kinetic.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/quick_start_guide/quickstart_noetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/quick_start_guide/quickstart_dashing.md %}
</section>

### [Install ROS on PC](#install-ros-on-pc)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/quick_start_guide/quickstart_kinetic_ros.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/quick_start_guide/quickstart_noetic_ros.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/quick_start_guide/quickstart_dashing_ros.md %}
</section>

### [Install ROS Packages](#install-ros-packages)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/quick_start_guide/quickstart_kinetic_ros_packages.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/quick_start_guide/quickstart_noetic_ros_packages.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/quick_start_guide/quickstart_dashing_ros_packages.md %}
</section>

### [Communication Interface](#communication-interface)

{% include en/platform/openmanipulator_x/quick_start_guide/quickstart_comm_interface.md %}
