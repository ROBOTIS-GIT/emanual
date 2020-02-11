---
layout: archive
lang: en
ref: faq
read_time: true
share: true
author_profile: false
permalink: /docs/en/faq/general
sidebar:
  title: GENERAL
  nav: "general"
---

# What Software, DYNAMIXEL and Parts are compatible with my own controller?
- See [Product Compatibility Guide](/docs/en/parts/controller/controller_compatibility/)

# How to download Task Code to my controller? 
- See [Download Task Code](/docs/en/faq/download_task_code/)

# [Task Rule Check](/docs/en/software/rplus1/task/task_misc/#rule-check)

# [CM 510/530 Fuse Replacement](/docs/en/faq/cm_510_530_fuse/)

# How the X-series can communicate with dynamixel with protocol 1.0?

Users can select DYNAMIXEL [Protocol 1.0] and [Protocol 2.0] when using X-series.
Even if Protocol 1.0 is selected, Protocol 2.0 Control Table will be used.
It is recommended to use an identical protocol version for multiple DYNAMIXEL's.

**TIP** : MX-series DYNAMIXEL except MX-12W can be upgraded to Control Table 2.0 for the new firmware features, new control table, and "Protocol Version" parameter for Communication Protocol flexibility.
{: .notice--success}

# What is RoboPlus?

RoboPlus (1.0 / 2.0 / 3.0), which is also called R+, is software tool to provide diverse features, such as programming (R+ Task), 3D motion design tool (R+ Motion), and product manager tool for a firmware recovery/update and control table (R+ Manager).

**R+ 1.0**
  - [R+ Task](/docs/en/software/rplus/task/)
  - [R+ Motion](/docs/en/software/rplus/motion/)
  - [R+ Manager](/docs/en/software/rplus/manager/)
  
**R+ 2.0**
  - [R+ Task 2.0](/docs/en/software/rplus2/task/)
  - [R+ Motion 2.0](/docs/en/software/rplus2/motion/)
  - [R+ Manager 2.0](/docs/en/software/rplus2/manager/)
  - [R+ Design 2.0](/docs/en/software/rplus2/design/)
  - [R+ Scratch](/docs/en/software/rplus2/scratch/)

**R+ 3.0**
  - [R+ Task 3.0](/docs/en/software/rplustask3/)
  
{% capture rplus3 %}
**NOTE**: 
- R+ Task 3.0 is software in which R+ Task 2.0 (a programming tool) and R+ Motion 2.0 (3D Motion desgin tool) are integrated.
- See [Product Compatibility Guide](/docs/en/parts/controller/controller_compatibility/), and choose the right software which is compatible with your controller in use. 
{% endcapture %}
<div class="notice">{{ rplus3 | markdownify }}</div>
  
# What is the meaning of error codes when I use R+ Task 1.0 
- See [Error Messages](/docs/en/software/rplus1/task/task_misc/#error-messages).

# What shall I do if the rule check error shows up while I am writing RoboPlus Task code?
- See [Rule Check](/docs/en/software/rplus1/task/task_misc/#rule-check)

# Why joints on the robot in use get loose while I make the motions.
- See [Auto Shutdown function](http://emanual.robotis.com/docs/en/software/rplus1/motion/#dynamixel-auto-shutdown-function). 

# How can I develop a firmware for the controller by myself using C Language?
- Embedded C can be used to develop its own programming.

| Embeded c                                                                                               | Download                                                                                                      |
|:--------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------|
| [CM-510 / 700](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm510/#introduction) | [Downlaod SDK file](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm510/#cm-510-cm-700) |
| [CM-530](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm530/#introduction)       | [Download SDK file](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm530/#cm-530)        |

# I want to develop software to communicate with RoboPlus Task code.
- See [Zigbee SDK.](http://emanual.robotis.com/docs/en/software/embedded_sdk/zigbee_sdk/).

# I want to use DYNAMIXEL with an development environment.
- [DYNAMIXEL SDK] is a standard programming library to develop S/W controls DYNAMIXEL.

# How to use multiple Zigbees communication?
- [1:N Communication](/docs/en/parts/communication/zig-110/#11-communication).
- [N:N Communication](/docs/en/parts/communication/zig-110/#1n-communication).

# Are ROBOTIS products RoHS compliant?
- See [Are ROBOTIS products ROHS compliant?](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=46&sca=GENERAL).

# Where can I download the drawings for ROBOTIS products?
- See [Download Center](http://en.robotis.com/service/downloadpage.php?ca_id=70)
- A most product manual provides drawings for frame parts, a controller. See its own product e-manual, and download the drawings.

# What is stall torque?
- See [What is stall torque?](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=34&sca=GENERAL).

# What is the difference between normal horns and thrust horns?
- See [What is the difference between normal horns and thrust horns?](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=32&sca=GENERAL).

# How much is N.m when converted to kgf.cm?
- See [How much is N.m when converted to kgf.cm?](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=33&sca=GENERAL).

# I want to check the controller and dynamixel.
- See [Selfcheck](http://en.robotis.com/model/selfcheck.php).

# Software installation for OS X fails with a security warning.
- See [Change System Preferences]{: .popup} 

# How to install USB driver for Windows?
- See [Windows Driver Installation]{: .popup} 

[Windows Driver Installation]: /docs/en/popup/usb_driver_install/
[Change System Preferences]: /docs/en/popup/general/change_system_preference_osx/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[Protocol 1.0]: /docs/en/dxl/protocol1/
[Protocol 2.0]: /docs/en/dxl/protocol2/
