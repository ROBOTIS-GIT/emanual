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
page_number: 29
---

<div style="counter-reset: h1 17"></div>

# [[ROS 2] Basic Operation](#ros-2-basic-operation)

## [Topic Monitor](#topic_monitor)

**CAUTION**: Place the robot on a level surface to ensure that it can not fall down from a table.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 18.04` and `ROS Dashing Diademata`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**.
- Make sure to run [Bringup](/docs/en/platform/turtlebot3/ros2_bringup/#bringup) instruction before use of the instruction.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

In order to check topics of TurtleBot3, Use [rqt][rqt] provided by ROS, which is a Qt-based framework for GUI development for ROS. It is a tool displaying all topics of TurtleBot3 with a topic name, type, bandwidth, Hz, and value.

**[Remote PC]**

1. Open a terminal on **Remote PC**.
2. Run **rqt**.
``` bash
$ rqt
```
  
    ![](/assets/images/platform/turtlebot3/ros2/rqt_1.png)

    **TIP**: If rqt is not displayed, select the `plugin` > `Topics` > `Topic Monitor`.
    {: .notice--info}

  - Click on the checkbox to monitor the topic, 

    ![](/assets/images/platform/turtlebot3/ros2/rqt_2.png)

  - Click on the `▶` button next to the checkbox for more details of topic message,.

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

[bringup]: /docs/en/platform/turtlebot3/ros2_bringup/#bringup
[rqt]: http://wiki.ros.org/rqt

## [Teleoperation](#teleoperation)

{% capture notice_01 %}
**NOTE**: 
- This instruction was tested on `Ubuntu 18.04` and `ROS Dashing Diademata`.
- These examples are supposed to be run on the remote PC. Follow the instruction on your **Remote PC**.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**CAUTION**: Place the robot on a level surface during a test, and ensure that it can not fall off an table or desk.
{: .notice--warning}

**WARNING**: Make sure to run the [Bringup][bringup] instruction before performing this examples.
{: .notice--warning}

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

TurtleBot3 can be teleoperated by various devices. It is tested with several wireless devices such as **PS3, XBOX 360, RC-100 controller and etc**. 
Examples of TurtleBot3 can be launched by ROS 2 on Ubuntu 18.04 with Raspberry Pi 3 and OpenCR that controls DYNAMIXEL's.

### [Keyboard](#keyboard)

**[Remote PC]**

1. Open a terminal on **Remote PC**.
2. Run teleoperation node 
  ```bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ ros2 run turtlebot3_teleop teleop_keyboard
  ```
    
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

3. The virtual controller will appear in the terminal.  
  
    ```bash
    Control Your TurtleBot3!
    ---------------------------
    Moving around:
            w
        a   s    d
            x

    w/x : increase/decrease linear velocity (Burger : ~ 0.22, Waffle and Waffle Pi : ~ 0.26)
    a/d : increase/decrease angular velocity (Burger : ~ 2.84, Waffle and Waffle Pi : ~ 1.82)

    space key, s : force stop

    CTRL-C to quit
  ```

### [RC-100](#rc100)

It will be released soon ! 
{: .notice}

The settings for [ROBOTIS RC-100B][rc100] is included in an OpenCR firmware for TurtleBot3. It can be used with the Bluetooth module [BT410][bt410]. TurtleBot3 Waffle Pi includes this controller and Bluetooth modules. When using RC-100B, it is not necessary to execute a specific node because `turtlebot_core` node creates a `/cmd_vel` topic in the firmware directly connected to OpeCR.

![](/assets/images/platform/turtlebot3/example/rc100b_with_bt410.png)

[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/

### [PS3 Joystick](#ps3-joystick)

**[Remote PC]**

1. Connect PS3 Joystick to **Remote PC** via either Bluetooth or USB cable.

2. Open a terminal on **Remote PC**.

3. Install `ds4drv` packages by using pip.
  ```bash
  $ sudo pip install ds4drv
  ```

4. Run teleoperation packages.  
  ```bash
  $ sudo ds4drv
  $ ros2 run joy joy_node
  $ ros2 run teleop_twist_joy teleop_node
  ```
  

### [XBOX 360 Joystick](#xbox-360-joystick)

**[Remote PC]**

1. Connect XBOX 360 Joystick to the Remote PC via either Wireless Adapter or USB cable.

2. Open a terminal on **Remote PC**.

3. Run teleoperation packages.
  ```bash
  $ ros2 run joy joy_node
  $ ros2 run teleop_twist_joy teleop_node
  ```

## [Basic Examples](#basic-examples)

{% capture notice_01 %}
**NOTE**:
- This instruction was tested on `Ubuntu 18.04` and `ROS Dashing Diademata`.
- This instruction is supposed to be run on the remote PC. Follow the instruction on your **Remote PC**.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**CAUTION**: Place the robot on a level surface to ensure that it can not fall down from a table.
{: .notice--warning}

**WARNING**: Make sure to run the [Bringup][bringup] instruction before performing this examples.
{: .notice--warning}

### [Move using Interactive Markers](#move-using-interactive-markers)

It will be released soon ! 
{: .notice}

### [Obstacle Detection](#obstacle-detection)

TurtleBot3 can moves with receiving a certain topic: **/cmd_vel_raw** from obstacle detection node. Using LDS data and detecting obstacles, the robot can stop moving.  

**[Remote PC]**

1. Open a terminal on **Remote PC**.

2. Run the teleoperation keyboard.
  ``` bash
  $ ros2 run turtlebot3_teleop teleop_keyboard /cmd_vel:=/cmd_vel_raw
  ```

3. Launch the obstacle detection.
  ``` bash
  $ ros2 launch turtlebot3_example turtlebot3_obstacle_detection
  ```

### [Position Control](#position-control)

TurtleBot3 can be position controlled using this package.

**[Remote PC]**

1. Open a terminal on **Remote PC**.

2. Launch the pointop file.
  ``` bash
  $ ros2 run turtlebot3_example turtlebot3_position_control
  ```

3. Type input values and press enter for `x`, `y` and `theta` respectively. TurtleBot3 will move to a pose (`x`, `y`, `theta`) from the current pose.

    ``` bash
    TurtleBot3 Position Control
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

**[Remote PC]**

1. Open a terminal on **Remote PC**.

2. Launch the patrol server file.
  ``` bash
  $ ros2 run turtlebot3_example turtlebot3_patrol_server
  ```
  
3. Launch the patrol client file.
  ``` bash
  $ ros2 run turtlebot3_example turtlebot3_patrol_client
  ```

4. Type a input value and press enter. TurtleBot3 will draw a circle of the typed radius.

    ``` bash
    TurtleBot3 Circle Patrol
    ------------------------------------------------------
    radius: circle radius (unit: m)
    ------------------------------------------------------

    Input radius: 1  (input a value and press enter)
    ```

## [Additional Sensors](#additional_sensors)

It will be released soon ! 
{: .notice}
