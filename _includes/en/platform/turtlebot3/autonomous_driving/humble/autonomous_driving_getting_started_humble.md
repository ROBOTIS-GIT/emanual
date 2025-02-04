<!-- ## Getting Started -->
## [Getting Started](#getting-started)

{% capture notice_01 %}
**NOTE**
- Autorace package is mainly developed on `Ubuntu 22.04` with `ROS2 Humble Hawksbill`.
- Autorace package is mainly tested under the Gazebo simulation.
- To simulate given examples properly, complete [Simulation](/docs/en/platform/turtlebot3/simulation/). 
{% endcapture %}

<div class="notice">{{ notice_01 | markdownify }}</div>

In the Humble version, our Autonomous Driving package currently supports only simulation. Running on an actual TurtleBot3 is not yet available, but it is planned for future updates.
{: .notice--warning}

The contents in e-Manual are subject to be updated without a prior notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

### [Prerequisites](#prerequisites)

`Remote PC`

- ROS 2 Humble installed Laptop or desktop PC.
- This instruction is based on Gazebo simulation, but can be ported to the actual robot later.


### [Install Autorace Packages](#install-autorace-packages)

1. Install the AutoRace 2020 meta package on `Remote PC`.
```bash
$ cd ~/turtlebot3_ws/src/
$ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_autorace_2020.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install
```

2. Install additional dependent packages on `Remote PC`.
```bash
$ sudo apt install ros-humble-image-transport ros-humble-cv-bridge ros-humble-vision-opencv python3-opencv libopencv-dev ros-humble-image-pipeline
```