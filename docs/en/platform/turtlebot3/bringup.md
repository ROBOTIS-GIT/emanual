---
layout: archive
lang: en
ref: turtlebot3_bringup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/bringup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 8"></div>

# [Bringup](#bringup)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

**Note :** This instruction was tested on <kbd>Ubuntu 16.04</kbd> and <kbd>ROS Kinetic Kame</kbd>.
{: .notice--info}

**Warning :** This instruction is intended to be run on the remote PC. If you are following the instruction on **TurtleBot**, please do **NOT** run *roscore* command.
{: .notice--warning}

**Warning :** Make sure that IP address on each device is set correctly.
{: .notice--warning}

**Warning :** When the battery voltage is lower than 11V, the buzzer alarm will continuously sound and actuators will be disabled. The battery must be recharged when the buzzer alarm sounds.
{: .notice--warning}

**Note :** Before start bringup TurtleBot3, We recommend you add `export` command to `bashrc` depend on your TurtleBot3(`burger` or `waffle` or `waffle_pi`)
``` bash
  gedit ~/.bashrc
```
![](/assets/images/platform/turtlebot3/bringup/bashrc.png)
{: .notice--info}


``` bash
  source ~/.bashrc
```

## [Bringup TurtleBot3](#bringup-turtlebot3)

**Note :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is <kbd>Ctrl</kbd>-<kbd>Alt</kbd>-<kbd>T</kbd>.
{: .notice--info}

**[Remote PC]** Run roscore.

``` bash
$ roscore
```

### [TurtleBot3 Burger](#turtlebot3-burger)

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**Tip :** If you want to launch Lidar sensor and core separately, please use below commands.
``` bash
$ roslaunch turtlebot3_bringup turtlebot3_lidar.launch
$ roslaunch turtlebot3_bringup turtlebot3_core.launch
```

**Note :** If `lost sync with device` error message is displayed on the terminal window, the sensor device of TurtleBot3 might not be securely connected.
{: .notice--info}

**[Remote PC]** Run RViz

``` bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
$ rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz
```

![](/assets/images/platform/turtlebot3/bringup/rviz_burger_model.jpg)

### [TurtleBot3 Waffle](#turtlebot3-waffle)

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**Tip :** If you want to launch Lidar sensor, Intel® RealSense™ R200 and core separately, please use below commands.
``` bash
$ roslaunch turtlebot3_bringup turtlebot3_lidar.launch
$ roslaunch turtlebot3_bringup turtlebot3_realsense.launch
$ roslaunch turtlebot3_bringup turtlebot3_core.launch
```

**Note :** If `lost sync with device` error message is displayed on the terminal window, sensor devices of the TurtleBot3 might not be securely connected.
{: .notice--info}

**[Remote PC]** Run RViz

``` bash
$ export TURTLEBOT3_MODEL=waffle
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
$ rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz
```

![](/assets/images/platform/turtlebot3/bringup/rviz_waffle_model.jpg)

### [TurtleBot3 Waffle Pi](#turtlebot3-waffle-pi)

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**Tip :** If you want to launch Lidar sensor, Raspberry Pi Camera and core separately, please use below commands.

``` bash
$ roslaunch raspicam_node camerav2_1280x960.launch
$ roslaunch turtlebot3_bringup turtlebot3_lidar.launch
$ roslaunch turtlebot3_bringup turtlebot3_core.launch
```

**Note :** If `lost sync with device` error message is displayed on the terminal window, sensor devices of the TurtleBot3 might not be securely connected.
{: .notice--info}

**[Remote PC]** Run RViz

``` bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
$ rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz
```

![](/assets/images/platform/turtlebot3/bringup/rviz_waffle_model.jpg)

In the next chapter, you will be able to test TurtleBot3 with various teleoperation methods.
