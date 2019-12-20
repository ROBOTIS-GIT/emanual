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
---

# [Applications](#applications)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 18.04` and `ROS 2 Dashing Diademata`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**. However, the part marked **[TurtleBot]** is the content that runs on SBC of TurtleBot3.
- Make sure to run the [Bringup](/docs/en/platform/turtlebot3/bringup/#bringup) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

This chapter shows some demos using TurtleBot3. In order to implement these demos, you have to install the [turtlebot3_applications][turtlebot3_applications] package.

**[Remote PC]** Go to `robotis workspace` directory (/home/(user_name)/robotis_ws/src) and clone the turtlebot3_applications. Then run the `colcon build` to build the new packages.

``` bash
$ cd ~/robotis_ws/src
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
$ cd ~/robotis_ws && colcon build --symlink-install
```

<!-- ## [TurtleBot Follower Demo](#turtlebot-follower-demo)

{% capture notice_02 %}
**NOTE**:
- The follower demo was implemented only using a 360 Laser Distance Sensor LDS-01. a classification algorithm is used based on previous fitting with samples of person and obstacles positions to take actions. It follows someone in front of the robot within a 50 centimeter range and 140 degrees.
- Running the follower demo in an area with obstacles may not work well. Therefore, it is recommended to run the demo in an open area without obstacles.
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify }}</div>

**[TurtleBot]** In order to run this demo, parameter in LIDAR launch file has to be modified. In the below example. In the param tag with `frame_id` as a name, replace `base_scan` to `odom` and save the file as shown in the below images.

``` bash
$ nano ~/robotis_ws/src/turtlebot3/turtlebot3_bringup/launch/turtlebot3_lidar.launch.py
```

**NOTE**: Turtlebot Follower Demo requires `scikit-learn`, `NumPy` and `ScyPy` packages.
{: .notice--info}



**[Remote PC]** Install `scikit-learn`, `NumPy` and `ScyPy` packages with below commands.

``` bash
$ sudo apt-get install python-pip3
$ sudo pip3 install -U scikit-learn numpy scipy
$ sudo pip3 install --upgrade pip
```

**[TurtleBot]** Launch the [bringup][bringup]

```bash
$ ros2 launch turtlebot3_bringup robot.launch.py
```

**[Remote PC]** Launch `turtlebot3_follower` with below command.

``` bash
$ ros2 launch turtlebot3_follower turtlebot3_follower.launch.py
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/w9YTxZVY6yQ" frameborder="0" allowfullscreen></iframe>
 -->


## [Automatic Parking](#automatic-parking)

{% capture notice_04 %}
**NOTE**:
- The `turtlebot3_automatic_parking` demo was using a 360 laser Distance Sensor LDS-01 and a reflective tape. The LaserScan topic has intensity and distance data from LDS. The TurtleBot3 uses this to locate the reflective tape.
- The `turtlebot3_automatic_parking` demo requires `NumPy` package.
{% endcapture %}
<div class="notice--info">{{ notice_04 | markdownify }}</div>

**[Remote PC]** Install `NumPy` package with below commands. If you already installed numpy, you can **skip** below commands.

``` bash
$ sudo apt-get install python-pip3
$ sudo pip3 install -U numpy
$ sudo pip3 install --upgrade pip
```

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

```bash
$ ros2 launch turtlebot3_bringup robot.launch.py
```

**[Remote PC]** If you use TurtleBot3 Burger, set the model of TurtleBot3 like command below. Launch the automatic parking file.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_automatic_parking turtlebot3_automatic_parking.launch.py
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/IRtdxoPo8Y8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


## [Automatic Parking Vision](#automatic-parking-vision)

It will be released soon ! 
{: .notice}

## [Load Multiple TurtleBot3s](#load-multiple-turtlebot3s)

It will be released soon ! 
{: .notice}
