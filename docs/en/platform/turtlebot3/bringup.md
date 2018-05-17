---
layout: archive
lang: en
ref: bringup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/bringup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 6"></div>

# [Bringup](#bringup)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

**NOTE:** This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

{% capture warning_01 %}
**WARNING:** 
1. This instruction is intended to be run on the remote PC. If you are following the instruction on **TurtleBot**, please do **NOT** run *roscore* command. 
2. Make sure that IP address on each device is set correctly.
3. When the battery voltage is lower than 11V, the buzzer alarm will continuously sound and actuators will be disabled. The battery must be recharged when the buzzer alarm sounds.
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

**NOTE:** Before start bringup TurtleBot3, We recommend you add `export` command to `bashrc` depend on your TurtleBot3(`burger` or `waffle` or `waffle_pi`)
{: .notice--info}

``` bash
  gedit ~/.bashrc
```
![](/assets/images/platform/turtlebot3/bringup/bashrc.png)

``` bash
  source ~/.bashrc
```

## [Run roscore](#run-roscore)

**NOTE:** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--info}

**[Remote PC]** Run roscore.

``` bash
$ roscore
```

## [Bringup a TurtleBot3 Burger](#bringup-a-turtlebot3-burger)

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**TIP:** If you want to launch Lidar sensor and core separately, please use below commands.
{: .notice--info}

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_lidar.launch
$ roslaunch turtlebot3_bringup turtlebot3_core.launch
```

**NOTE:** If `lost sync with device` error message is displayed on the terminal window, the sensor device of TurtleBot3 might not be securely connected.
{: .notice--info}

**[Remote PC]** Run RViz

``` bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
$ rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz
```

![](/assets/images/platform/turtlebot3/bringup/rviz_burger_model.jpg)

## [Bringup a TurtleBot3 Waffle](#bringup-a-turtlebot3-waffle)

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**TIP:** If you want to launch Lidar sensor, Intel® RealSense™ R200 and core separately, please use below commands.
{: .notice--info}

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_lidar.launch
$ roslaunch turtlebot3_bringup turtlebot3_realsense.launch
$ roslaunch turtlebot3_bringup turtlebot3_core.launch
```

**NOTE:** Before you use Intel® RealSense™, please check related appendix [Intel® RealSense™](http://emanual.robotis.com/docs/en/platform/turtlebot3/appendix_realsense/#installation)
{: .notice--info}

**NOTE:** If `lost sync with device` error message is displayed on the terminal window, sensor devices of the TurtleBot3 might not be securely connected.
{: .notice--info}

**[Remote PC]** Run RViz

``` bash
$ export TURTLEBOT3_MODEL=waffle
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
$ rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz
```

![](/assets/images/platform/turtlebot3/bringup/rviz_waffle_model.jpg)

## [Bringup a TurtleBot3 Waffle Pi](#bringup-a-turtlebot3-waffle-pi)

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**TIP:** If you want to launch Lidar sensor, Raspberry Pi Camera and core separately, please use below commands.
{: .notice--info}

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
$ roslaunch turtlebot3_bringup turtlebot3_lidar.launch
$ roslaunch turtlebot3_bringup turtlebot3_core.launch
```

**NOTE:** Before you use Raspberry Pi Camera, please check related appendix [Raspberry Pi Camera](http://emanual.robotis.com/docs/en/platform/turtlebot3/appendix_raspi_cam/#installation)
{: .notice--info}

**NOTE:** If `lost sync with device` error message is displayed on the terminal window, sensor devices of the TurtleBot3 might not be securely connected.
{: .notice--info}

**[Remote PC]** Run RViz

``` bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
$ rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz
```

![](/assets/images/platform/turtlebot3/bringup/rviz_waffle_model.jpg)

In the next chapter, you will be able to test TurtleBot3 with various teleoperation methods.
