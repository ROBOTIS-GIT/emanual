<!-- ## Getting Started -->
{% capture notice_01 %}
**NOTE**
- The Autorace package was developed for `Ubuntu 24.04` running `ROS 2 Jazzy JALISCO`.
- Instructions for correct simulation setup are available in the [Simulation](/docs/en/platform/turtlebot3/simulation/) section of the manual.
{% endcapture %}

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

### [Setting TurtleBot3 Model](#setting-turtlebot3-model)
Add an export line to your ~/.bashrc. Autorace only supports the burger_cam model.
``` bash
$ echo 'export TURTLEBOT3_MODEL=burger_cam' >> ~/.bashrc
```
