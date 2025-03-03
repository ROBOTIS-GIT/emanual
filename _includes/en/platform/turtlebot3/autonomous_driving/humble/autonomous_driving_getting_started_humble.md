<!-- ## Getting Started -->
## [Getting Started](#getting-started)

{% capture notice_01 %}
**NOTE**
- Autorace package is mainly developed on `Ubuntu 22.04` with `ROS 2 Humble Hawksbill`.
- Autorace package is mainly tested under the Gazebo simulation.
- To simulate given examples properly, complete [Simulation](/docs/en/platform/turtlebot3/simulation/). 
{% endcapture %}

<div class="notice">{{ notice_01 | markdownify }}</div>

In the Humble version, our Autonomous Driving package currently supports only simulation.  
{: .notice--warning}

### [Prerequisites](#prerequisites)

`Remote PC`

- ROS 2 Humble installed Laptop or desktop PC.

### [Install Autorace Packages](#install-autorace-packages)

1. Install the AutoRace meta package on `Remote PC`.
```bash
$ cd ~/turtlebot3_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_autorace.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install
```

2. Install additional dependent packages on `Remote PC`.
```bash
$ sudo apt install ros-humble-image-transport ros-humble-cv-bridge ros-humble-vision-opencv python3-opencv libopencv-dev ros-humble-image-pipeline
```

### [Setting World Plugin](#setting-world-plugin)

1. Add export line. Put your workspace name in {your_ws}. This plugin allows you to animate dynamic environments in your world.  
``` bash
$ echo 'export GAZEBO_PLUGIN_PATH=$HOME/{your_ws}/build/turtlebot3_gazebo:$GAZEBO_PLUGIN_PATH' >> ~/.bashrc
```
