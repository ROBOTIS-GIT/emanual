---
layout: archive
lang: en
ref: teleoperation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/teleoperation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 
---

<div style="counter-reset: h1 8"></div>
<div style="counter-reset: h2 1"></div>

<!--[dummy Header 1]>
  <h1 id="dummy">Dummy</h1>
  <h2 id="dummy">Dummy</h2>
  <p class="dummy_content">Deprecated</p>
<![end dummy Header 1]-->

## [Teleoperation](#ros-teleoperation)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

{% capture notice_01 %}
**NOTE**: 
- This instruction was tested on `Ubuntu 16.04` with `ROS Kinetic Kame` and `Windows 10` with `ROS Melodic Morenia`
- This examples are supposed to be running on the remote PC. Follow the instruction on your **Remote PC**.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**WARNING**: Make sure to run the [Bringup][bringup] instruction before performing this examples, and be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

The TurtleBot3 can be teleoperated by various devices. It is tested with several wireless devices such as PS3, XBOX 360, ROBOTIS RC100 and etc. This examples shown here(except the LEAP Motion) can be launched by ROS on Ubuntu mate 16.04 with Raspberry Pi 3 and OpenCR which controls DYNAMIXEL.

<iframe width="640" height="360" src="https://www.youtube.com/embed/Z4s18hlazb4" frameborder="0" allowfullscreen></iframe>

The contents in e-Manual are subject to be updated without a prior notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning} 

### [Keyboard](#keyboard)

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

**[Remote PC]** Launch `turtlebot3_teleop_key` node for simple teleoperation test.

#### on Ubuntu
```bash
$ export TURTLEBOT3_MODEL=%{TB3_MODEL}
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

#### on Windows
```bash
> set TURTLEBOT3_MODEL=%{TB3_MODEL}
> roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

If the node is successfully launched, the following instruction will be appeared to the terminal window.

``` bash
  Control Your Turtlebot3!
  ---------------------------
  Moving around:
          w
     a    s    d
          x

  w/x : increase/decrease linear velocity
  a/d : increase/decrease angular velocity
  space key, s : force stop

  CTRL-C to quit
```

## [RC100](#rc100)

The settings for [ROBOTIS RC-100B][rc100] controller is included in the OpenCR firmware for TurtleBot3 Burger, Waffle and Waffle Pi. This controller can be used with the Bluetooth module [BT410][bt410]. The TurtleBot3 Waffle Pi includes this controller and Bluetooth modules. When using RC-100, it is not necessary to execute a specific node because `turtlebot_core` node creates a `/cmd_vel` topic in the firmware directly connected to OpeCR.

![](/assets/images/platform/turtlebot3/example/rc100b_with_bt410.png)

## [PS3 Joystick](#ps3-joystick)

**[Remote PC]** Connect PS3 Joystick to the remote PC via Bluetooth or with USB cable.

**[Remote PC]** Install packages for teleoperation using PS3 joystick.

``` bash
$ sudo apt-get install ros-kinetic-joy ros-kinetic-joystick-drivers ros-kinetic-teleop-twist-joy
```

**[Remote PC]** Launch teleoperation packages for PS3 joystick.

``` bash
$ roslaunch teleop_twist_joy teleop.launch
```

## [XBOX 360 Joystick](#xbox-360-joystick)

**[Remote PC]** Connect XBOX 360 Joystick to the remote PC with Wireless Adapter or USB cable.

**[Remote PC]** Install packages for teleoperation using XBOX 360 joystick.

``` bash
$ sudo apt-get install xboxdrv ros-kinetic-joy ros-kinetic-joystick-drivers ros-kinetic-teleop-twist-joy
```

**[Remote PC]** Launch teleoperation packages for XBOX 360 joystick.

``` bash
$ sudo xboxdrv --silent
$ roslaunch teleop_twist_joy teleop.launch
```

## [Wii Remote](#wii-remote)

**[Remote PC]** Connect Wii remote to the remote PC via Bluetooth.

**[Remote PC]** Install packages for teleoperation using Wii remote.

``` bash
$ sudo apt-get install ros-kinetic-wiimote libbluetooth-dev libcwiid-dev
```

``` bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/ros-drivers/joystick_drivers.git  
$ cd ~/catkin_ws && catkin_make
```

**[Remote PC]** Run teleoperation packages for Wii remote.

``` bash
$ rosrun wiimote wiimote_node
$ rosrun wiimote teleop_wiimote
```

## [Nunchuk](#nunchuk)

(TODO)

## [Android App](#android-app)

Download [ROS CONTROL][ros_control] and run the application.

After connecting `roscore` to ROS_CONTROL app, enter `Topic` tab in `Preferences` to confiture topic name.

![](/assets/images/platform/turtlebot3/example/ros_control.png)

You are supposed to change topic name as `/cmd_vel` in Joystick Topic, `/scan` in LaserScan Topic,
`/image_raw/compressed` in Image Topic and `/odom` in Odometry Topic.

Then, you can check state of node and topic connection by `rqt_graph` commands

![](/assets/images/platform/turtlebot3/example/ros_control_graph.png)

## [LEAP Motion](#leap-motion)

**[Remote PC]** Connect LEAP motion to the remote PC via Bluetooth.

**[Remote PC]** Install packages for teleoperation using LEAP motion.

- [LEAP Setup][leap_setup]
- [Download SDK][leap_sdk]

``` bash
$ leapd
$ LeapCommandPanel
$ git clone git@github.com:warp1337/rosleapmotion.git
```

**[Remote PC]** Run teleoperation package for LEAP motion.

``` bash
$ rosrun leap_motion sender.py
```

## [Myo](#myo)

We are developing its contents ! 
{: .notice--info}

## [Windows] Joystick Instructions
The Windows implementation of the Joystick control uses the [Open Source Simple DirectMedia Layer](https://www.libsdl.org/), which supports many tethered and wireless joysticks. The Joystick driver is currently (As of January 2020) deployed as a source package, which you need to clone into your catkin workspace.

``` bash
> git clone -b init_windows https://github.com/ms-iot/joystick_drivers
```


[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/
[ros_control]: https://play.google.com/store/apps/details?id=com.robotca.ControlApp
[leap_setup]: https://www.leapmotion.com/setup
[leap_sdk]: https://developer.leapmotion.com/get-started/
