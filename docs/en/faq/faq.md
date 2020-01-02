---
layout: archive
lang: en
ref: faq
read_time: true
share: true
author_profile: false
permalink: /docs/en/faq/
sidebar:
  title: FAQ
  nav: "faq"
---




# [Product Compatibility Guide](/docs/en/parts/controller/controller_compatibility/)

# [Download Task Code](/docs/en/faq/download_task_code/)

# [Task Rule Check](/docs/en/software/rplus1/task/task_misc/#rule-check)

# [CM 510/530 Fuse Replacement](/docs/en/faq/cm_510_530_fuse/)



# How the X-series can communicate with dynamixel with protocol 1.0?

Users can select DYNAMIXEL [Protocol 1.0] and [Protocol 2.0] when using X-series.
Even if Protocol 1.0 is selected, Protocol 2.0 Control Table will be used.
It is recommended to use an identical protocol version for multiple DYNAMIXEL's.

**TIP** : MX-series DYNAMIXEL except MX-12W can be upgraded to Control Table 2.0 for the new firmware features, new control table, and "Protocol Version" parameter for Communication Protocol flexibility.
{: .notice--success}

# What is RoboPlus?

RoboPlus is a software to create a customized programming for every ROBOTIS product.

  - [RoboPlus 1.0](http://en.robotis.com/model/board.php?bo_table=print_en&wr_id=48)

  - [RoboPlus 2.0](http://en.robotis.com/model/board.php?bo_table=print_en&wr_id=47)

  - [Download](http://en.robotis.com/service/downloadpage.php?ca_id=10)

# What is the difference between RoboPlus Task and RoboPlus Motion?

 To use motions in a task code, the motion file must be downloaded.

  - [RoboPlus Task](http://emanual.robotis.com/docs/en/software/rplus1/task/getting_started/#introduction)

  - [RoboPlus Motion](http://emanual.robotis.com/docs/en/software/rplus1/motion/#introduction)

# I want to know the meaning of the error code occurs during "RoboPlus Task" program execution.

 [Please refer to the page](http://emanual.robotis.com/docs/en/software/rplus1/task/task_misc/#error-messages)

# What shall I do if the rule check error shows up while I am writing RoboPlus Task code?

 [Please refer to the page](http://emanual.robotis.com/docs/en/software/rplus1/task/task_misc/#rule-check)

# My robots' joints get loose while I make the motions.

 DYNAMIXEL's have an [Auto Shutdown function](http://emanual.robotis.com/docs/en/software/rplus1/motion/#dynamixel-auto-shutdown-function). This function prevents DYNAMIXEL's from being damaged.

# How can I develop a firmware for the controller by myself using C Language?

 For advanced users, Embedded C is offered to develop its own programming.

| Embeded c                                                                                               | Download                                                                                                      |
|:--------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------|
| [CM-510 / 700](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm510/#introduction) | [Downlaod SDK file](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm510/#cm-510-cm-700) |
| [CM-530](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm530/#introduction)       | [Download SDK file](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm530/#cm-530)        |

# I want to develop a software to communicate with RoboPlus Task code.

  You can use [Zigbee SDK.](http://emanual.robotis.com/docs/en/software/embedded_sdk/zigbee_sdk/)

# I want to control DYNAMIXEL with PC development environment such as Visual Studio.

  [DYNAMIXEL SDK] is a standard programming library to develop S/W controls DYNAMIXEL.

# I want to communicate with multiple Zigbees simultaneously.

  [1:N  Communication](http://emanual.robotis.com/docs/en/parts/communication/zig-110/#11-communication)

  [N:N Communication](http://emanual.robotis.com/docs/en/parts/communication/zig-110/#1n-communication)

# Are ROBOTIS products RoHS compliant?
Please refer to [the page.](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=46&sca=GENERAL)
# Where can I download the drawings for ROBOTIS products?
Please refer to [the page.](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=35&sca=GENERAL)

# What is stall torque?
Please refer to [the page.](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=34&sca=GENERAL)

# What is the difference between normal horns and thrust horns?
 Please refer to [the page.](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=32&sca=GENERAL)

# How much is N.m when converted to kgf.cm?
 Please refer to [the page.](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=33&sca=GENERAL)

# I want to check the controller and dynamixel.

  [Selfcheck](http://en.robotis.com/model/selfcheck.php) is offered

# Software installation for OS X fails with a security warning.


## Minimum System Requirements

  OS : Mac OS X 10.5 or higher
  Hardware : Release after October 2007 (64bit)

## Software installation for OS X fails with a security warning.

  1 . **Open System panel from Launchpad or Dock.**

  ![](/assets/images/faq/OS_X_fail/osx_system_config.png)

  2 . **Click on the Security & Privacy icon.**

  ![](/assets/images/faq/OS_X_fail/osx_security.png)

  3 . **Click the lock icon and enter the password.**

  ![](/assets/images/faq/OS_X_fail/osx_security_mod.png)
  ![](/assets/images/faq/OS_X_fail/osx_authority.png)

  4 . Select **"Anywhere"** and try installation again.

  ![](/assets/images/faq/OS_X_fail/osx_all_app_allowance.png)


[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[Protocol 1.0]: /docs/en/dxl/protocol1/
[Protocol 2.0]: /docs/en/dxl/protocol2/
