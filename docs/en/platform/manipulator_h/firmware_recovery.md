---
layout: archive
lang: en
ref: manipulator_h_firmware_recovery
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/manipulator_h/firmware_recovery/
sidebar:
  title: MANIPULATOR-H
  nav: "manipulator_h"
---

<div style="counter-reset: h1 8"></div>

# [Firmware Recovery](#firmware-recovery)

When Dynamixel detection fails ensure is properly wired. If problems persists **restore Dynamixel firmware** (shown below).

**WARNING** : After firmware restoration you will need to set ID and baud rate values again. Always make sure to set USB2Dynamixel switch to “485.”
{: .notice--warning}

1. Restoring firmware
  - From Dynamixel Wizard click on the  icon to begin.
  - Select the corresponding COM port number for USB2Dynamixel.

    ![](/assets/images/platform/manipulator/manipulator_h_076.jpg)

2. Firmware restore process steps explained.

    ![](/assets/images/platform/manipulator/manipulator_h_077.jpg)

3. Always connect one Dynamixel at a time.

    ![](/assets/images/platform/manipulator/manipulator_h_078.jpg)

4. Pick the COM port number
  - With an incorrect number Dynamixel cannot be automatically detected. Always make sure to get the port number right.
  - Click on Search.

    ![](/assets/images/platform/manipulator/manipulator_h_079.jpg)

5. Disconnect and connect Dynamixel
  - The Next button should become clickable

    ![](/assets/images/platform/manipulator/manipulator_h_080.jpg)

6. Upon successful detection the Next button is clickable

    ![](/assets/images/platform/manipulator/manipulator_h_081.jpg)

7. Pick the right model
  - Pick the right type from the list. If not it may result in problems

    ![](/assets/images/platform/manipulator/manipulator_h_082.jpg)

    ![](/assets/images/platform/manipulator/manipulator_h_083.jpg)

    ![](/assets/images/platform/manipulator/manipulator_h_084.jpg)

8. During restoration
  - While restoring, the LED will blink. Do not cut power off during this stage.

    ![](/assets/images/platform/manipulator/manipulator_h_085.jpg)

    ![](/assets/images/platform/manipulator/manipulator_h_086.jpg)

**All Control Table settings are set to default values.**
