---
layout: archive
lang: en
ref: docker_container_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/docker_container_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---
{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="docker-container-setup">Docker Container Setup</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

If you use Docker to set up the TurtleBot3 development environment, you don't need to set up PC and SBC manually and you can get started quickly and easily.  
A Docker container can be used as a replacement for the previous PC and SBC setup.

# [Install Docker](#install-docker)
- Install Docker by following the official Docker installation guide for Ubuntu: [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- It also possible to install Docker using the apt or snap package manager.

# [Set Up TurtleBot3 Docker Container](#set-up-turtlebot3-docker-container)
- The container is created using the same image regardless of whether it is on a PC or an SBC.
- The `start` command creates a container using the image we distributed on Docker Hub.
- In SBC (Raspberry Pi), sudo permission is required to run Docker commands.
```bash
$ cd turtlebot3_ws/src/turtlebot3/docker/${ROS_DISTRO}
$ sudo ./container.sh start
```

- Once the container is created, enter the container.
```bash
$ sudo ./container.sh enter
```

# [Set up the bashrc file](#set-up-the-bashrc-file)
- Set up the bashrc file in the docker container.
- Set your `ROS_DOMAIN_ID`, `TURTLEBOT3_MODEL` and `LDS_MODEL` according to your environment.(Uncomment and modify the lines as needed.)
```bash
$ nano ~/.bashrc
```
![alt text](/assets/images/platform/turtlebot3/quick_start/quick_start/bashrc_setup.png)
- Save and exit the file with `Ctrl` + `S`, `Ctrl` + `X`. And then, apply the changes to bashrc.
```bash
$ source ~/.bashrc
```

# [Description](#description)

**Using Docker on Remote PC:**
- You can run desired commands directly without building (e.g., nav2, slam, teleop, etc.).
  - Slam
  ```bash
  $ ros2 launch turtlebot3_cartographer turtlebot3_cartographer.launch.py
  ```
  - Navigation2
  ```bash
  $ ros2 launch turtlebot3_navigation2 navigation2.launch.py
  ```
  - Teleop
  ```bash
  $ ros2 run turtlebot3_teleop teleop_keyboard.launch.py
  ```


**Using Docker on SBC:**
- You can use bringup directly without building.
  - Bringup
  ```bash
  $ ros2 launch turtlebot3_bringup robot.launch.py
  ```
- PI camera is supported.
  - Camera Launch
  ```bash
  $ ros2 launch turtlebot3_bringup camera.launch.py
  ```
