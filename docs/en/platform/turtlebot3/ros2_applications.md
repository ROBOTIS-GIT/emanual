---
layout: archive
lang: en
ref: ros2_applications
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_applications/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 36
---

<div style="counter-reset: h1 24"></div>

# [[ROS 2] Applications](#ros-2-applications)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 18.04` and `ROS Dashing Diademata`.
- Make sure to run the [Bringup](/docs/en/platform/turtlebot3/ros2_bringup/#bringup) instruction before use of the instruction.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

This chapter shows some demos using TurtleBot3. In order to implement these demos, install the turtlebot3_applications package by following the given instructions.

**[Remote PC]** 

Go to `robotis workspace` directory (/home/(user_name)/robotis_ws/src) and clone the turtlebot3_applications. Then run the `colcon build` to build the new packages.

1. Open a terminal on **Remote PC**.
2. Run the following commands.
``` bash
$ cd ~/robotis_ws/src
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
$ cd ~/robotis_ws && colcon build --symlink-install
```

<!-- 

## [TurtleBot Follower Demo](#turtlebot-follower-demo)

{% capture notice_02 %}
**NOTE**:
- The follower demo was implemented only using a 360 Laser Distance Sensor LDS-01. a classification algorithm is used based on previous fitting with samples of person and obstacles positions to take actions. It follows someone in front of the robot within a 50 centimeter range and 140 degrees.
- Running the follower demo in an area with obstacles may not work well. Therefore, it is recommended to run the demo in an open area without obstacles.
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify }}</div>

**[TurtleBot]** 

In order to run this demo, parameter in LIDAR launch file has to be modified. 
In the param tag with `frame_id` as a name, replace `base_scan` to `odom` and save the file as shown in the below images.

1. Open a terminal on **TurtleBot3**.
2. Run the following commands.
``` bash
$ nano ~/robotis_ws/src/turtlebot3/turtlebot3_bringup/launch/turtlebot3_lidar.launch.py
```

    **NOTE**: Turtlebot Follower Demo requires `scikit-learn`, `NumPy` and `ScyPy` packages.
    {: .notice--info}

**[Remote PC]** 

1. Open a terminal on **Remote PC**.
2. Install `scikit-learn`, `NumPy`, and `ScyPy` packages using the following commands.
``` bash
$ sudo apt-get install python-pip3
$ sudo pip3 install -U scikit-learn numpy scipy
$ sudo pip3 install --upgrade pip
```

**[TurtleBot]** 

1. Open a terminal on **TurtleBot3**.
2. Launch the [bringup](/docs/en/platform/turtlebot3/ros2_bringup/#bringup) package using the following commands.
```bash
$ ros2 launch turtlebot3_bringup robot.launch.py
```

**[Remote PC]**

1. Open a terminal on **Remote PC**.
2. Launch `turtlebot3_follower` using the following command.
``` bash
$ ros2 launch turtlebot3_follower turtlebot3_follower.launch.py
```

    <iframe width="560" height="315" src="https://www.youtube.com/embed/w9YTxZVY6yQ" frameborder="0" allowfullscreen></iframe> 
    
-->

## [Automatic Parking](#automatic-parking)

{% capture notice_04 %}
**NOTE**:
- The `turtlebot3_automatic_parking` demo uses a 360 laser Distance Sensor LDS-01 and a reflective tape. The LaserScan topic has intensity and distance data from LDS. The TurtleBot3 uses this to locate the reflective tape.
- The `turtlebot3_automatic_parking` demo requires `NumPy` package.
{% endcapture %}
<div class="notice--info">{{ notice_04 | markdownify }}</div>

**[Remote PC]** 

1. Open a terminal on **Remote PC**.
2. Install `NumPy` package using the following commands. Skip this step if `NumPy` package is already installed.
``` bash
$ sudo apt-get install python-pip3
$ sudo pip3 install -U numpy
$ sudo pip3 install --upgrade pip
```

**[TurtleBot]** 

1. Open a terminal on **TurtleBot3**.
2. Bring up basic packages to start TurtleBot3 applications using the following command.
```bash
$ ros2 launch turtlebot3_bringup robot.launch.py
```

**[Remote PC]** 

1. Open a terminal on **Remote PC**.
2. Launch the automatic parking file using the following commands.
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_automatic_parking turtlebot3_automatic_parking.launch.py
```
  
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

    <iframe width="560" height="315" src="https://www.youtube.com/embed/IRtdxoPo8Y8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## [Automatic Parking Vision](#automatic-parking-vision)

It will be released soon ! 
{: .notice}

## [Load Multiple TurtleBot3s](#load-multiple-turtlebot3s)

It will be released soon ! 
{: .notice}
