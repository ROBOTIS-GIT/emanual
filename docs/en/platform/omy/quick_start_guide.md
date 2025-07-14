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

## [Hardware Setup](#hardware-setup)

### OMY-3M
<img src="/assets/images/platform/omy/hardware_setup_1.jpg"/>

### OMY-F3M
<img src="/assets/images/platform/omy/hardware_setup_2.jpg"/>

### OMY-L100
<img src="/assets/images/platform/omy/hardware_setup_3.jpg"/>

### OMY-AI3M
<img src="/assets/images/platform/omy/hardware_setup_4.jpg"/>

## [Power connection](#power-connection)

<img src="/assets/images/platform/omy/omy_power.png" width="800"/>

## [SSH connection](#ssh-connection)

### Network Access Method
Start by connecting the `robot pc` to the same network as `user PC` using a LAN cable, then power on the OMY (press and release the power button until it turns white). OMY OS uses mDNS technology to discover or access its IP address.  
Each time OMY OS boots, it sets the SBC’s hostname to the serial number (SN) written on the product (e.g., SNPR44B9999).  
In environments where UDP Multicast is available (such as being on the same router), you can discover and connect to the IP address. Static IP assignment and other network settings are supported through the Manager.

<img src="/assets/images/platform/omy/omy_serial_number.png" width="600"/>

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

{% capture unpacking_info_01 %}

**Note**: The `/workspace` folder inside the container is volume mapped (a feature that links file systems) to `/data/docker/open_manipulator/workspace` on the host. All other areas are volatile and will be lost if the container is damaged or deleted, so please be careful.
{% endcapture %}
<div class="notice--info">{{ unpacking_info_01 | markdownify }}</div>



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

## [Software Setup](#software-setup)

> ⚠️ This setup is intended for development on a **user PC**. **The robot PC** included with OMY comes pre-configured with the same software stack.
###  Software Setup for OMY

The **ROBOTIS OMY** robotic arm utilizes two key software packages to enable intelligent manipulation through **Physical AI**:

- **[open_manipulator](https://github.com/ROBOTIS-GIT/open_manipulator)**: Provides control of the **6-DOF OMY arm** via ros2_control using **DYNAMIXEL-Y** actuators. Supports teleoperation and low-level control.
- **[physical_ai_tools](https://github.com/ROBOTIS-GIT/physical_ai_tools)**: A toolkit for **imitation learning**, including modules for data collection, training, inference, and visualization.

### Prerequisites

* **Operating System**: Any Linux distribution

  * The container runs **Ubuntu 24.04 + ROS 2 Jazzy**
  * Host OS version does **not** need to match

* **Docker Engine**

  * Install using the [official Docker guide](https://docs.docker.com/engine/install/)
  * After installation:

    ```bash
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
    docker run hello-world
    ```

* **Git**

  ```bash
  sudo apt install git
  ```

### Docker Volume Configuration

The Docker container uses volume mappings for **hardware access**, **development**, and **data persistence**:

```bash
volumes:
  # Hardware and system access
  - /dev:/dev
  - /tmp/.X11-unix:/tmp/.X11-unix:rw
  - /tmp/.docker.xauth:/tmp/.docker.xauth:rw

  # Development and data directories
  - ./workspace:/workspace
  - ../:/root/ros2_ws/src/open_manipulator/
  - ./lerobot/outputs:/root/ros2_ws/src/physical_ai_tools/lerobot/outputs
  - ./huggingface:/root/.cache/huggingface
````

>  **Data Persistence Tips**
>
> * Store your development code in `/workspace`
> * Save model outputs in `lerobot/outputs`
> * Track code changes in the mapped `open_manipulator` folder
> * Use `huggingface` volume to cache pretrained models


## Container Lifecycle

### Initial Setup

```bash
# Clone the open_manipulator repository
cd ~
git clone -b jazzy https://github.com/ROBOTIS-GIT/open_manipulator.git
cd open_manipulator
```

### Starting and Managing the Container

```bash
# Start container
./docker/container.sh start

# Enter the running container
./docker/container.sh enter

# Stop the container
./docker/container.sh stop
```

### Docker Command Reference

| Command            | Description                    |
| ------------------ | ------------------------------ |
| `help`             | Display usage help             |
| `start`    | Start container     |
| `enter`            | Enter the running container    |
| `stop`             | Stop the container             |

### Example Usage

```bash
./container.sh help
./container.sh start
./container.sh enter
./container.sh stop
```

