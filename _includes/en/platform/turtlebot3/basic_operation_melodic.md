
## [Basic Operation](#basic-operation)

### [Teleoperation](#teleoperation)

**WARNING**: Make sure to run the [Bringup][bringup] from the TurtleBot3 SBC before teleoperation. Teleoperate the robot, and be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

The TurtleBot3 can be teleoperated by various remote controllers. Make sure that the necessary ROS packages are supported for your SBC and ROS version. 

<iframe width="640" height="360" src="https://www.youtube.com/embed/Z4s18hlazb4" frameborder="0" allowfullscreen></iframe>

#### [Keyboard](#keyboard)

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`.  
{: .notice--success}

1. Launch `turtlebot3_teleop_key` node from Remote PC for the teleoperation using a keyboard. Replace the `${TB3_MODEL}` parameter with your model name such as `burger`, `waffle`, `waffle_pi`.  
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

2. If the node is successfully launched, the following instruction will be appeared to the terminal window.  
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
The `export TURTLEBOT3_MODEL=${TB3_MODEL}` command can be omitted if the **TURTLEBOT3_MODEL** parameter is predefined in the `.bashrc` file. The `.bashrc` file is automatically loaded when a terminal window is created.  

- Example of defining TurtlBot3 Burger as a default.  
```bash
$ echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc
$ source ~/.bashrc
```

- Example of defining TurtlBot3 Waffle Pi as a default.  
```bash
$ echo 'export TURTLEBOT3_MODEL=waffle_pi' >> ~/.bashrc
$ source ~/.bashrc
```
</details>

#### [RC100](#rc100)

The settings for [ROBOTIS RC-100B][rc100] controller is included in the OpenCR firmware for TurtleBot3 Burger, Waffle and Waffle Pi. This controller can be used with the Bluetooth module [BT410][bt410]. The TurtleBot3 Waffle Pi includes the RC-100 controller and Bluetooth modules. When using RC-100, it is not necessary to execute a specific node because `turtlebot_core` node creates a `/cmd_vel` topic in the firmware directly connected to OpeCR.

![](/assets/images/platform/turtlebot3/example/rc100b_with_bt410.png)

1. Connect BT-410 to OpenCR UART1 port (as described [here][appendix_opencr1_0]).

2. Control TurtleBot3 with RC-100.
  - Up / Down : Increase or decrease linear velocity
  - Left / Right : Increase or decrease angular velocity

#### [PS3 Joystick](#ps3-joystick)

1. Connect the PS3 Joystick to the remote PC via Bluetooth or a USB cable.

2. Install packages for teleoperation using PS3 joystick.  
  ```bash
$ sudo apt-get install ros-melodic-joy ros-melodic-joystick-drivers ros-melodic-teleop-twist-joy
  ```

3. Launch the teleoperation node.  
  ```bash
$ roslaunch teleop_twist_joy teleop.launch
  ```

#### [XBOX 360 Joystick](#xbox-360-joystick)

1. Connect XBOX 360 Joystick to the remote PC with Wireless Adapter or USB cable.

2. Install packages for teleoperation using XBOX 360 joystick.  
  ```bash
$ sudo apt-get install xboxdrv ros-melodic-joy ros-melodic-joystick-drivers ros-melodic-teleop-twist-joy
  ```

3. Launch teleoperation packages for XBOX 360 joystick.  
  ```bash
$ sudo xboxdrv --silent
$ roslaunch teleop_twist_joy teleop.launch
  ```

#### [Wii Remote](#wii-remote)

1. Connect Wii remote to the remote PC via Bluetooth.

2. Install packages for teleoperation using Wii remote.
  ```bash
$ sudo apt-get install ros-melodic-wiimote libbluetooth-dev libcwiid-dev
$ cd ~/catkin_ws/src
$ git clone https://github.com/ros-drivers/joystick_drivers.git  
$ cd ~/catkin_ws && catkin_make
  ```

3. Run teleoperation packages for Wii remote.
  ```bash
$ rosrun wiimote wiimote_node
$ rosrun wiimote teleop_wiimote
  ```

### [Topic Monitor](#topic-monitor)

<details>
<summary>
![](/assets/images/icon_unfold.png) **Read more about Topic Monitor**
</summary>
In order to check the topics of TurtleBot3, we will use [rqt][rqt] provided by ROS. The rqt is a Qt-based framework for GUI development for ROS. The rqt is a tool that allows users to easily see the topic status by displaying all the topics in the topic list. There are topic names, types, bandwidth, Hz, value in GUI.
</details>

1. Run the rqt from PC with the command below. If the topic monitor window is not displayed, select the `plugin` -> `Topics` -> `Topic Monitor`.
  ```bash
$ rqt
  ```  
  ![](/assets/images/platform/turtlebot3/example/rqt_1.png)

2. When the topic monitor loaded, the topic values are not monitored. Click the checkbox next to each topic to monitor the topic.  
  ![](/assets/images/platform/turtlebot3/example/rqt_2.png)

3. To see more detailed topic message, click the `▶` icon next to the checkbox.  
  ![](/assets/images/platform/turtlebot3/example/rqt_3.png)

  - `/battery_state` indicates a message relating to the battery condition, such as the current battery voltage and remaining capacity.  
  ![](/assets/images/platform/turtlebot3/example/rqt_4.png)

  - `/diagnostics` indicates a message the status of the components connected to the TurtleBot3, such as a MPU9250, DYNAMIXEL-X, a HLS-LFCD-LDS, a battery and a OpenCR.  
  ![](/assets/images/platform/turtlebot3/example/rqt_5.png)

  - `/odom` indicates a message the odometry of the TurtleBot3. This topic has orientation and position by the encoder data.  
  ![](/assets/images/platform/turtlebot3/example/rqt_6.png)

  - `/sensor_state` indicates a message the encoder values, battery and torque.  
  ![](/assets/images/platform/turtlebot3/example/rqt_7.png)

  - `/scan` indicates a message all of the LDS data, such as angle_max and min, range_max and min, indicates, ranges.  
  ![](/assets/images/platform/turtlebot3/example/rqt_8.png)


[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/
[basic_examples]: /docs/en/platform/turtlebot3/basic_examples/
[additional_sensors]: /docs/en/platform/turtlebot3/additional_sensors/
[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[rqt]: http://wiki.ros.org/rqt
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/
