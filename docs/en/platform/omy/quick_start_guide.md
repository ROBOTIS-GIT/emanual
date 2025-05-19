---
layout: archive
lang: en
ref: omy_quick_start_guide
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/omy/quick_start_guide/
sidebar:
  title: "OMY"
  nav: "omy"
product_group: omy
page_number: 3
---

<style>body {counter-reset: h1 2 !important;}</style>

# [Quick Start Guide](#quick-start-guide)

## Power connection
![](/assets/images/platform/omy/omy_power.png)

## SSH connection

### Network Access Method
Start by connecting the SBC to the same network as your PC using a LAN cable, then power on the OM-Y (press and release the power button until it turns white).  
OM-Y OS uses mDNS technology to discover or access its IP address.  
Each time OM-Y OS boots, it sets the SBC’s hostname to the serial number (SN) written on the product (e.g., SNPR44B9999).  
In environments where UDP Multicast is available (such as being on the same router),  
you can discover and connect to the IP address.  
Static IP assignment and other network settings are supported through the Manager.

![](/assets/images/platform/omy/omy_serial_number.png)

### SSH Access Method
(Assuming the SN is ‘SNPR44B9999’)
To access via SSH from a Linux environment, use the following command:
```
ssh root@omy-SNPR44B9999.local
```

## Unpacking

{% capture unpacking_danger_01 %}
`DANGER`

During the first operation, the Unpacking script must be executed to prevent self-collision.  
(always run ONLY in the packed posture)

{% endcapture %}
<div class="notice--danger">{{ unpacking_danger_01 | markdownify }}</div>

## Teleoperation

Execute the following command:
```
ros2 launch open_manipulator_bringup ai_teleoperation.launch.py
```

The following procedures will be performed sequentially, enabling operation of the Leader-Follower system:
1. Move Follower to initial position
2. Start gravity compensation for Leader
3. Synchronize Leader and Follower