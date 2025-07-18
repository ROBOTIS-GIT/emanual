
## [Basic Operation](#basic-operation)

### [Teleoperation](#teleoperation)

**WARNING**: Make sure to [Bringup][bringup] the TurtleBot3 SBC before teleoperation, and be careful when testing the robot on a table as the robot may fall off the edge.
{: .notice--warning}

The TurtleBot3 can be teleoperated by remote control. Make sure that the necessary ROS packages are available for your SBC and ROS version. 

<iframe width="640" height="360" src="https://www.youtube.com/embed/Z4s18hlazb4" frameborder="0" allowfullscreen></iframe>

#### [Keyboard](#keyboard)

1. Launch the `turtlebot3_teleop_key` node from the Remote PC for teleoperation. Replace the `${TB3_MODEL}` parameter with your specific model name (`burger` or `waffle` or `waffle_pi`).  
**[Remote PC]**  
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

2. If the node has successfully launched, the following instructions will appear in the terminal window.  
**[Remote PC]**  
```bash
Control Your Turtlebot3
Moving around
        w
    a   s   d
        x
w/x : increase/decrease linear velocity
a/d : increase/decrease angular velocity
space key, s : force stop
CTRL-C to quit
```

<details>
<summary>
![](/assets/images/icon_unfold.png) **Read more about How to predefine the TURTLEBOT3_MODEL**
</summary>
The `export TURTLEBOT3_MODEL=${TB3_MODEL}` command can be omitted if the **TURTLEBOT3_MODEL** parameter is predefined in your system's `.bashrc` file. The `.bashrc` file is automatically loaded when a terminal window is created.  

- Example defining TurtlBot3 Burger as the default in the `.bashrc` file.  
```bash
$ echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc
$ source ~/.bashrc
```

- Example defining TurtlBot3 waffle_pi as the default in the `.bashrc` file.  
```bash
$ echo 'export TURTLEBOT3_MODEL=waffle_pi' >> ~/.bashrc
$ source ~/.bashrc
```
</details>

#### [RC100](#rc100)

Settings for the [ROBOTIS RC-100B][rc100] controller are included in the OpenCR firmware for TurtleBot3 Burger, Waffle and Waffle Pi. This controller can be used with the [BT410][bt410] Bluetooth module. The TurtleBot3 Waffle Pi includes the RC-100 controller and Bluetooth modules. When using the RC-100, it is not necessary to execute a specific node because `turtlebot_core` node creates the required `/cmd_vel`.

![](/assets/images/platform/turtlebot3/quick_start/basic_operation/rc100b_with_bt410.png)

1. Connect BT-410 to the OpenCR UART1 port (as described [here][appendix_opencr1_0]).

2. Control the TurtleBot3 with the RC-100.
  - Up / Down : Increase or decrease linear velocity
  - Left / Right : Increase or decrease angular velocity

#### [PS3 Joystick](#ps3-joystick)

1. Connect the PS3 Joystick to the remote PC via Bluetooth or a USB cable.

2. Install the required packages for teleoperation using a PS3 joystick.  
**[Remote PC]**  
  ```bash
$ sudo apt install ros-noetic-joy ros-noetic-joystick-drivers ros-noetic-teleop-twist-joy
  ```

3. Launch the teleoperation node.  
**[Remote PC]**  
  ```bash
$ roslaunch teleop_twist_joy teleop.launch
  ```

#### [XBOX 360 Joystick](#xbox-360-joystick)

1. Connect the XBOX 360 Joystick to the remote PC with a Wireless Adapter or USB cable.

2. Install the required packages for teleoperation using the XBOX 360 joystick.  
**[Remote PC]**  
  ```bash
$ sudo apt install xboxdrv ros-noetic-joy ros-noetic-joystick-drivers ros-noetic-teleop-twist-joy
  ```

3. Launch the teleoperation packages for the XBOX 360 joystick.  
**[Remote PC]**  
  ```bash
$ sudo xboxdrv --silent
$ roslaunch teleop_twist_joy teleop.launch
  ```

#### [Wii Remote](#wii-remote)

1. Connect the Wii remote to the remote PC via Bluetooth.

2. Install the required packages for teleoperation using the Wii remote.  
**[Remote PC]**  
  ```bash
$ sudo apt install ros-noetic-wiimote libbluetooth-dev libcwiid-dev
$ cd ~/catkin_ws/src
$ git clone https://github.com/ros-drivers/joystick_drivers.git  
$ cd ~/catkin_ws && catkin_make
  ```

3. Run the teleoperation packages for the Wii remote.  
**[Remote PC]**  
  ```bash
$ rosrun wiimote wiimote_node
$ rosrun wiimote teleop_wiimote
  ```

### [Topic Monitor](#topic-monitor)

<details>
<summary>
![](/assets/images/icon_unfold.png) **Read more about Topic Monitor**
</summary>
In order to check the topics of our TurtleBot3, we will use [rqt][rqt].rqt is a Qt-based framework for GUI development in ROS. rqt allows users to easily see topic status by displaying all topics in a single topic list, along with additional information like topic types, bandwidth, and value in the GUI.
</details>

1. Run rqt from PC with the command below. If the topic monitor window is not displayed, select the `plugin` -> `Topics` -> `Topic Monitor`.
  ```bash
$ rqt
  ```  
  ![](/assets/images/platform/turtlebot3/quick_start/basic_operation/legacy/rqt_1.png)

2. When the topic monitor is opened, the topic values are not monitored by default. Click the checkbox next to each topic to monitor the topic.  
  ![](/assets/images/platform/turtlebot3/quick_start/basic_operation/legacy/rqt_2.png)

3. To see more detailed topic messages, click the `▶` icon next to the checkbox.  
  ![](/assets/images/platform/turtlebot3/quick_start/basic_operation/legacy/rqt_3.png)

  - `/battery_state` indicates a message relating to battery condition, such as the current battery voltage and remaining capacity.  
  ![](/assets/images/platform/turtlebot3/quick_start/basic_operation/legacy/rqt_4.png)

  - `/diagnostics` indicates a message reporting the status of the components connected to the TurtleBot3, such as a MPU9250, DYNAMIXEL-X, HLS-LFCD-LDS, battery or an OpenCR.  
  ![](/assets/images/platform/turtlebot3/quick_start/basic_operation/legacy/rqt_5.png)

  - `/odom` indicates a message containing the odometry of the TurtleBot3. This topic contains orientation and position encoder data.  
  ![](/assets/images/platform/turtlebot3/quick_start/basic_operation/legacy/rqt_6.png)

  - `/sensor_state` indicates a message containing encoder values, battery and torque.  
  ![](/assets/images/platform/turtlebot3/quick_start/basic_operation/legacy/rqt_7.png)

  - `/scan` indicates a message with LDS data.  
  ![](/assets/images/platform/turtlebot3/quick_start/basic_operation/legacy/rqt_8.png)


[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/
[basic_examples]: /docs/en/platform/turtlebot3/basic_examples/
[additional_sensors]: /docs/en/platform/turtlebot3/additional_sensors/
[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[rqt]: http://wiki.ros.org/rqt
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/
[appendix_opencr1_0]: /docs/en/platform/turtlebot3/appendix_opencr1_0/
