---
layout: archive
lang: en
ref: ros_2
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_basic_operation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 28
---

<div style="counter-reset: h1 16"></div>

# [Basic Operation](#basic_operation)

## [Topic Monitor](#topic_monitor)

**WARNING**: Be careful when running the robot on the table as the robot might fall.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 18.04` and `ROS 2 Dashing Diatamata`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**.
- Make sure to run the [Bringup](/docs/en/platform/turtlebot3/bringup/#bringup) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

In order to check the topics of TurtleBot3, we will use [rqt][rqt] provided by ROS. The rqt is a Qt-based framework for GUI development for ROS. The rqt is a tool that allows users to easily see the topic status by displaying all the topics in the topic list. There are topic names, types, bandwidth, Hz, value in GUI.

**[Remote PC]** Run the rqt.
``` bash
$ rqt
```
![](/assets/images/platform/turtlebot3/ros2/rqt_1.png)

**TIP**: If rqt is not displayed, select the `plugin` -> `Topics` -> `Topic Monitor`.
{: .notice--info}

When rqt is first run, the topic values are not monitored. To monitor the topic, click the checkbox next to each topic.

![](/assets/images/platform/turtlebot3/ros2/rqt_2.png)

If you want to see more detail topic message, click the `▶` button next to each checkbox.

![](/assets/images/platform/turtlebot3/ros2/rqt_3.png)


- `/battery_state` indicates a message relating to the battery condition, such as the current battery voltage and remaining capacity.

![](/assets/images/platform/turtlebot3/ros2/rqt_4.png)


- `/odom` indicates a message the odometry of the TurtleBot3. This topic has orientation and position by the encoder data.  

![](/assets/images/platform/turtlebot3/ros2/rqt_5.png)

- `/sensor_state` indicates a message the encoder values, battery and torque.

![](/assets/images/platform/turtlebot3/ros2/rqt_6.png)

- `/scan` indicates a message all of the LDS data, such as angle_max and min, range_max and min, indicates, ranges.

![](/assets/images/platform/turtlebot3/ros2/rqt_7.png)

In addition, you can monitor topics through rqt whenever you have a topic added.

[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[rqt]: http://wiki.ros.org/rqt

## [Teleoperation](#teleoperation)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

{% capture notice_01 %}
**NOTE**: 
- This instruction was tested on `Ubuntu 18.04` and `ROS 2 Dashing Diatamata`.
- These examples are supposed to be run on the remote PC. Follow the instruction on your **Remote PC**.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**WARNING**: Make sure to run the [Bringup][bringup] instruction before performing this examples, and be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

TurtleBot3 can be teleoperated by various devices. It is tested with several wireless devices such as PS3, XBOX 360, ROBOTIS RC100 and etc. The examples explained here can be launched by ROS 2 on Ubuntu 18.04 with Raspberry Pi 3 and OpenCR that controls DYNAMIXELs.

### [Keyboard](#keyboard)

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--info}

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

**[Remote PC]** Run teleoperation node

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

**[Remote PC]** If the node is successfully run, the following instruction will be appeared to the terminal window.  

```bash
Control Your TurtleBot3!
---------------------------
Moving around:
        w
    a    s    d
        x

w/x : increase/decrease linear velocity (Burger : ~ 0.22, Waffle and Waffle Pi : ~ 0.26)
a/d : increase/decrease angular velocity (Burger : ~ 2.84, Waffle and Waffle Pi : ~ 1.82)

space key, s : force stop

CTRL-C to quit
```

### [RC100](#rc100)

To be tested soon.

The settings for [ROBOTIS RC-100B][rc100] controller is included in the OpenCR firmware for TurtleBot3 Burger, Waffle and Waffle Pi. This controller can be used with the Bluetooth module [BT410][bt410]. The TurtleBot3 Waffle Pi includes this controller and Bluetooth modules. When using RC-100, it is not necessary to execute a specific node because `turtlebot_core` node creates a `/cmd_vel` topic in the firmware directly connected to OpeCR.

![](/assets/images/platform/turtlebot3/example/rc100b_with_bt410.png)

### [PS3 Joystick](#ps3-joystick)

**[Remote PC]** Connect PS3 Joystick to the remote PC via Bluetooth or with USB cable.

**[Remote PC]** Install packages for teleoperation using PS3 joystick.

```bash
$ sudo pip install ds4drv
```

**[Remote PC]** Run teleoperation packages for PS3 joystick.

```bash
$ sudo ds4drv
$ ros2 run joy joy_node
$ ros2 run teleop_twist_joy teleop_node
```

### [XBOX 360 Joystick](#xbox-360-joystick)
**[Remote PC]** Connect XBOX 360 Joystick to the remote PC with Wireless Adapter or USB cable.

**[Remote PC]** Run teleoperation packages for XBOX 360 joystick.

```bash
$ ros2 run joy joy_node
$ ros2 run teleop_twist_joy teleop_node
```

## [Basic Examples](#basic-examples)

**WARNING**: Make sure to run the [Bringup][bringup] instruction before performing this examples, and be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**:
- This instruction was tested on `Ubuntu 18.04` and `ROS 2 Dashing Diatamata`.
- This instruction is supposed to be run on the remote PC. Follow the instruction on your **Remote PC**.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

### [Move using Interactive Markers](#move-using-interactive-markers)

To be added soon.

### [Obstacle Detection](#obstacle-detection)

The TurtleBot3 can be moved by sending a /cmd_vel_raw topic. When the TurtleBot3 moves, it stops when it detects an obstacle nearby using LDS data.

**[Remote PC]** Run the teleoperation keyboard.
``` bash
$ ros2 run turtlebot3_teleop teleop_keyboard /cmd_vel:=/cmd_vel_raw
```

**[Remote PC]** Launch the obstacle detection.
``` bash
$ ros2 launch turtlebot3_example turtlebot3_obstacle_detection
```

### [Position Control](#position-control)

TurtleBot3 can be position controlled using this package.

**[Remote PC]** launch the pointop file.
``` bash
$ ros2 run turtlebot3_example turtlebot3_position_control
```

Type input values and press enter for x, y and theta respectively. TurtleBot3 will move to a pose (x, y, theta) from the current pose.

**[Remote PC]**

``` bash
Turtlebot3 Position Control
------------------------------------------------------
From the current pose,
x: goal position x (unit: m)
y: goal position y (unit: m)
theta: goal orientation (range: -180 ~ 180, unit: deg)
------------------------------------------------------

Input x: 1  (input a value and press enter)
Input y: 1  (input a value and press enter)
Input theta: 10  (input a value and press enter)
```

### [Patrol](#patrol)

This example uses action topic. The action client translates patrol data(radius) to action server. Then, the action server translates `cmd_vel` to TurtleBot3. 

**[Remote PC]** Launch the patrol server file.
``` bash
$ ros2 run turtlebot3_example turtlebot3_patrol_server
```
**[Remote PC]** Launch the patrol client file.
``` bash
$ ros2 run turtlebot3_example turtlebot3_patrol_client
```

Type a input value and press enter. TurtleBot3 will draw a circle of the typed radius.

``` bash
TurtleBot3 Circle Patrol
------------------------------------------------------
radius: circle radius (unit: m)
------------------------------------------------------

Input radius: 1  (input a value and press enter)
```

## [Additional Sensors](#additional_sensors)

To be added soon...