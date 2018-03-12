---
layout: archive
lang: en
ref: turtlebot3_teleoperation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/teleoperation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 9"></div>

# [Teleoperation](#teleoperation)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

**Note :** This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

**Warning :** Make sure to run the [Bringup](#bringup) instruction before performing Teleoperation.
{: .notice--warning}

**Warning :** Be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

**Tip :** The teleoperation is supposed to be running on the remote PC. **Follow the instruction on your Remote PC**.
{: .notice--info}

TurtleBot3 can be teleoperated by various devices. It is tested with several wireless devices such as PS3, XBOX 360, ROBOTIS RC100 and etc. Examples shown here(except the LEAP Motion) can be launched by ROS on Ubuntu mate 16.04 with Raspberry Pi 3 and OpenCR1.0 which controls DYNAMIXEL.

<iframe width="640" height="360" src="https://www.youtube.com/embed/Z4s18hlazb4" frameborder="0" allowfullscreen></iframe>

## [Keyboard](#keyboard)

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is Ctrl-Alt-T.
{: .notice--info}

**[Remote PC]** Launch the file for simple teleoperation test.

``` bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

**[Remote PC]** If the program is successfully launched, the following instruction will be appeared to the terminal window.

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

The settings for ROBOTIS RC100 controller is included in the OpenCR1.0 firmware.

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

Download [ROS Teleop][ros-teleop] and run the application.


## [LEAP Motion](#leap-motion)

**[Remote PC]** Connect LEAP motion to the remote PC via Bluetooth.

**[Remote PC]** Install packages for teleoperation using LEAP motion.

- [LEAP Setup](https://www.leapmotion.com/setup)
- [Download SDK](https://developer.leapmotion.com/downloads/sdk-preview)

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

(TODO)

[ros-teleop]: https://play.google.com/store/apps/details?id=com.github.rosjava.android_apps.teleop.indigo
