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

## [Power connection](#power-connection)
![](/assets/images/platform/omy/omy_power.png)

## [SSH connection](#ssh-connection)

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

## [Docker Setup](#docker-setup)

1. Connect to OMY via SSH.
2. Check running containers using `docker ps`.
3. Docker-related files are located in `/data/docker/open_manipulator/docker`. Navigate to this location using `cd`.
```bash
cd /data/docker/open_manipulator/docker
```
4. Access the container using `./container.sh enter`.

{% capture unpacking_danger_01 %}

**Note**: The `/workspace` folder inside the container is volume mapped (a feature that links file systems) to `/data/docker/open_manipulator/workspace` on the host. All other areas are volatile and will be lost if the container is damaged or deleted, so please be careful.
{% endcapture %}
<div class="notice--danger">{{ unpacking_danger_01 | markdownify }}</div>



## [Unpacking](#unpacking)

{% capture unpacking_danger_02 %}
**DANGER**

During the first operation, the Unpacking script must be executed to prevent self-collision.  
(always run ONLY in the packed posture)

{% endcapture %}
<div class="notice--danger">{{ unpacking_danger_02 | markdownify }}</div>

When you first receive the OMY, the manipulator is folded as shown in the image below.  
You can move it to the initial position by running the following command for unpacking:  
<img src="/assets/images/platform/omy/omy_pack.png" width="600"/>

The image below shows the initial position after UNPACKING.  

<img src="/assets/images/platform/omy/omy_unpack.png" width="600"/>

This is the command to UNPACK the manipulator,  
```
ros2 launch open_manipulator_bringup unpack_y.launch.py
```

and the following is the command to PACK it back.  
```
ros2 launch open_manipulator_bringup pack_y.launch.py
```
