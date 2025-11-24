---
layout: archive
lang: en
ref: group_motor_tutorial_step7
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/group_motor_tutorial_step7/
tabs: "Languages"
tab_title1: Python
tab_title2: C++
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-easy-sdk-tutorial-step7">Step 7: OMX Teleoperation Example</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

![](/assets/images/sw/dynamixel_easy_sdk/tutorials/omx_teleoperation_group_control.gif)
- This tutorial shows you example that OMX teleoperates Dynamixel using the Dynamixel Easy SDK.
- Unlike single motor control, commands are executed all at once, allowing all motors to be controlled with a single packet. This enables a faster control cycle.
- With an OMX leader and follower, you can create your own teleoperation system in just a few lines of code.

**NOTE**: This tutorial explains how to write code using the Dynamixel Easy SDK. It assumes that you have already installed the SDK.
{:.notice--warning}

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/software/dynamixel_easy_sdk/group_motor_control_tutorial/group_motor_tutorial_step7_python.md %}
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/software/dynamixel_easy_sdk/group_motor_control_tutorial/group_motor_tutorial_step7_cpp.md %}
</section>
