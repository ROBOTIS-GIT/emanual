<!-- ## Getting Started -->
## [Getting Started](#getting-started)

{% capture notice_01 %}
**NOTE**
- The Autorace package was developed for `Ubuntu 22.04` running `ROS 2 Humble Hawksbill`.
- The Autorace package has only been comprehensively tested for operation in the Gazebo simulator.
- Instructions for correct simulation setup are available in the [Simulation](/docs/en/platform/turtlebot3/simulation/) section of the manual.
{% endcapture %}

<div class="notice">{{ notice_01 | markdownify }}</div>

For ROS2 Humble, our Autonomous Driving package has only been tested in simulation.  
{: .notice--warning}

### [Prerequisites](#prerequisites)

`Remote PC`

- ROS 2 Humble installed on a Laptop or desktop PC.

### [Install Autorace Packages](#install-autorace-packages)

1. Install the AutoRace meta package on the `Remote PC`.
```bash
$ cd ~/turtlebot3_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_autorace.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install
```

2. Install additional dependent packages on the `Remote PC`.
```bash
$ sudo apt install ros-humble-image-transport ros-humble-cv-bridge ros-humble-vision-opencv python3-opencv libopencv-dev ros-humble-image-pipeline
```

### [Setting World Plugin](#setting-world-plugin)

1. Add an export line to your .bashrc, put your workspace name in {your_ws}. This plugin allows you to animate dynamic environments in your world.  
``` bash
$ echo 'export GAZEBO_PLUGIN_PATH=$HOME/{your_ws}/build/turtlebot3_gazebo:$GAZEBO_PLUGIN_PATH' >> ~/.bashrc
```
