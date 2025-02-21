
## [Basic Operation](#basic-operation)

### [Teleoperation](#teleoperation)

The TurtleBot3 can be teleoperated by remote control. Make sure that the necessary ROS packages are supported for your SBC and ROS version. 

<iframe width="640" height="360" src="https://www.youtube.com/embed/Z4s18hlazb4" frameborder="0" allowfullscreen></iframe>  

**WARNING**: Make sure to run [Bringup][bringup] on the TurtleBot3 SBC before teleoperation. Additionally, be careful when testing the robot on the table as the robot may drive over the edge.
{: .notice--warning}  

#### [Keyboard](#keyboard)

1. Open a terminal on the **Remote PC**.
2. Run the teleoperation node. Replace the `${TB3_MODEL}` with `burger` or `waffle` or `waffle_pi`, if the TURTLEBOT3_MODEL parameter is not predefined.  
**[Remote PC]**  
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

3. If the node is successfully launched, the following instructions will appear on the terminal window.  
**[Remote PC]**  
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

The settings for the [ROBOTIS RC-100B][rc100] are included in the OpenCR firmware for TurtleBot3. It can be used with the [BT410][bt410] Bluetooth module .TurtleBot3 Waffle Pi includes this controller and Bluetooth modules. When using the RC-100B, it is not necessary to execute a specific node because `turtlebot_core` node creates a `/cmd_vel` topic in the firmware directly connected to OpeCR.

![](/assets/images/platform/turtlebot3/example/rc100b_with_bt410.png)

1. Connect BT-410 to any of the OpenCR UART ports.

2. Control the TurtleBot3 with RC-100.
  - Up / Down : Increase or decrease linear velocity
  - Left / Right : Increase or decrease angular velocity

#### [PS3 Joystick](#ps3-joystick)

1. Connect the PS3 Joystick to the **Remote PC** via Bluetooth or a USB cable.

2. Install the `ds4drv` package using pip.  
**[Remote PC]**  
  ```bash
$ sudo pip install ds4drv
  ```

3. Launch the joystick node.  
**[Remote PC]**  
  ```bash
$ sudo ds4drv
$ ros2 run joy joy_node
  ```

4. Open a new terminal and launch the teleoperation node.  
**[Remote PC]**  
  ```bash
$ ros2 run teleop_twist_joy teleop_node
  ```

#### [XBOX 360 Joystick](#xbox-360-joystick)

1. Connect the XBOX 360 Joystick to the remote PC with the Wireless Adapter or USB cable.

2. Open a terminal on the **Remote PC**.

3. Launch the joystick node.  
**[Remote PC]**    
  ```bash
$ ros2 run joy joy_node
  ```

4. Open a new terminal and launch the teleoperation node.  
**[Remote PC]**  
  ```bash
$ ros2 run teleop_twist_joy teleop_node
  ```

### [Topic Monitor](#topic-monitor)

<details>
<summary>
![](/assets/images/icon_unfold.png) **Read more about Topic Monitor**
</summary>
In order to monitor the TurtleBot3 topics use [rqt][rqt], a Qt-based framework for GUI development for ROS. It is a tool that allows for the display all topics of the TurtleBot3.
</details>

1. Run rqt from the PC with the command below. If the topic monitor window is not displayed, select the `plugin` -> `Topics` -> `Topic Monitor`.  
**[Remote PC]**  
  ```bash
$ rqt
  ```  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_1.png)

2. When the topic monitor is loaded, the topic values are not monitored by default. Click the checkbox next to each topic to monitor the topic.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_2.png)

3. To see more detailed topic messages, click the `▶` icon next to the checkbox.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_3.png)

  - `/battery_state` indicates a message relating to the battery condition, such as the current battery voltage and remaining capacity.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_4.png)

  - `/odom` indicates a message containing the odometry of the TurtleBot3. This topic has orientation and position encoder data.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_5.png)

  - `/sensor_state` indicates a message containing encoder values, battery and torque status.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_6.png)

  - `/scan` indicates a message containing LDS data, such as angle_max and min, and range_max and min.  
  ![](/assets/images/platform/turtlebot3/ros2/rqt_7.png)

[topic_monitor]: /docs/en/platform/turtlebot3/topic_monitor/
[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/
[basic_examples]: /docs/en/platform/turtlebot3/basic_examples/
[additional_sensors]: /docs/en/platform/turtlebot3/additional_sensors/
[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[rqt]: http://wiki.ros.org/rqt
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/
