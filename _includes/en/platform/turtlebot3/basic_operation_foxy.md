
## [Basic Operation](#basic-operation)

### [Teleoperation](#teleoperation)

**WARNING**: Make sure to run the [Bringup][bringup] from the TurtleBot3 SBC before teleoperation. Teleoperate the robot, and be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

The TurtleBot3 can be teleoperated by various remote controllers. Make sure that the necessary ROS packages are supported for your SBC and ROS version. 

<iframe width="640" height="360" src="https://www.youtube.com/embed/Z4s18hlazb4" frameborder="0" allowfullscreen></iframe>

#### [Keyboard](#keyboard)

1. Open a terminal on **Remote PC**.
2. Run teleoperation node. Replace the `${TB3_MODEL}` with `burger` or `waffle` or `waffle_pi`, if TURTLEBOT3_MODEL parameter is not predefined.
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

3. If the node is successfully launched, the following instruction will be appeared to the terminal window.  
```bash
Control Your Turtlebot3
Moving around
        w
    a   s   d
        x
w/x : increase/decrease linear velocity (Burger : ~ 0.22, Waffle and Waffle Pi : ~ 0.26)
a/d : increase/decrease angular velocity (Burger : ~ 2.84, Waffle and Waffle Pi : ~ 1.82)
space key, s : force stop
CTRL-C to quit
```

#### [RC-100](#rc100)

The settings for [ROBOTIS RC-100B][rc100] is included in an OpenCR firmware for TurtleBot3. It can be used with the Bluetooth module [BT410][bt410]. TurtleBot3 Waffle Pi includes this controller and Bluetooth modules. When using RC-100B, it is not necessary to execute a specific node because `turtlebot_core` node creates a `/cmd_vel` topic in the firmware directly connected to OpeCR.

![](/assets/images/platform/turtlebot3/example/rc100b_with_bt410.png)

1. Connect BT-410 to any of OpenCR UART ports.

2. Control TurtleBot3 with RC-100.
  - Up / Down : Increase or decrease linear velocity
  - Left / Right : Increase or decrease angular velocity

#### [PS3 Joystick](#ps3-joystick)

1. Connect PS3 Joystick to **Remote PC** via Bluetooth or a USB cable.

2. Install `ds4drv` packages by using pip.
  ```bash
$ sudo pip install ds4drv
  ```

3. Launch the joystick node.  
  ```bash
$ sudo ds4drv
$ ros2 run joy joy_node
  ```

4. Open a new terminal and launch the teleoperation node.  
  ```bash
$ ros2 run teleop_twist_joy teleop_node
  ```

#### [XBOX 360 Joystick](#xbox-360-joystick)

1. Connect XBOX 360 Joystick to the remote PC with Wireless Adapter or USB cable.

2. Open a terminal on **Remote PC**.

3. Launch the joystick node.  
  ```bash
$ ros2 run joy joy_node
  ```

4. Open a new terminal and launch the teleoperation node.  
  ```bash
$ ros2 run teleop_twist_joy teleop_node
  ```

### [Topic Monitor](#topic-monitor)

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **Read more about Topic Monitor**
{: .notice--success}
</summary>
In order to check topics of TurtleBot3, Use [rqt][rqt] provided by ROS, which is a Qt-based framework for GUI development for ROS. It is a tool displaying all topics of TurtleBot3 with a topic name, type, bandwidth, Hz, and value.
</details>

1. Run the rqt from PC with the command below. If the topic monitor window is not displayed, select the `plugin` -> `Topics` -> `Topic Monitor`.
  ```bash
$ rqt
  ```  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_1.png)

2. When the topic monitor loaded, the topic values are not monitored. Click the checkbox next to each topic to monitor the topic.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_2.png)

3. To see more detailed topic message, click the `▶` icon next to the checkbox.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_3.png)

  - `/battery_state` indicates a message relating to the battery condition, such as the current battery voltage and remaining capacity.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_4.png)

  - `/odom` indicates a message the odometry of the TurtleBot3. This topic has orientation and position by the encoder data.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_5.png)

  - `/sensor_state` indicates a message the encoder values, battery and torque.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_6.png)

  - `/scan` indicates a message all of the LDS data, such as angle_max and min, range_max and min, indicates, ranges.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_7.png)

[topic_monitor]: /docs/en/platform/turtlebot3/topic_monitor/
[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/
[basic_examples]: /docs/en/platform/turtlebot3/basic_examples/
[additional_sensors]: /docs/en/platform/turtlebot3/additional_sensors/
[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[rqt]: http://wiki.ros.org/rqt
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/
