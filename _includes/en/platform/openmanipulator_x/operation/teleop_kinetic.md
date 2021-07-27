
{% capture notice_01 %}
**NOTE**:
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_x/ros_setup/#install-ros-packages)
- Make sure to run [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before use of the instruction
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/FGHBMJByJ7k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Keyboard](#keyboard)

**TIP**: Terminal can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for Terminal is `Ctrl`+`Alt`+`t`.
{: .notice--success}

1. Launch `open_manipulator_teleop_keyboard` node for simple teleoperation test using the keyboard.  
The [OpenMANIPULATOR-X Controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) must be running on another terminal.  
```bash
$ roslaunch open_manipulator_teleop open_manipulator_teleop_keyboard.launch
```

2. If the node is successfully launched, the following instruction will appear in the terminal window.  

  ```
  ---------------------------
  Control Your OpenMANIPULATOR-X!
  ---------------------------
  w : increase x axis in task space
  s : decrease x axis in task space
  a : increase y axis in task space
  d : decrease y axis in task space
  z : increase z axis in task space
  x : decrease z axis in task space

  y : increase joint 1 angle
  h : decrease joint 1 angle
  u : increase joint 2 angle
  j : decrease joint 2 angle
  i : increase joint 3 angle
  k : decrease joint 3 angle
  o : increase joint 4 angle
  l : decrease joint 4 angle

  g : gripper open
  f : gripper close

  1 : init pose
  2 : home pose

  q to quit
  ---------------------------
  Present Joint Angle J1: 0.000 J2: 0.000 J3: 0.000 J4: 0.000
  Present Kinematics Position X: 0.000 Y: 0.000 Z: 0.000
  ---------------------------
  ```

### [PS4 Joystick](#ps4-joystick)

Install packages for teleoperation using PS4 joystick.

```bash
$ sudo apt-get install ros-kinetic-joy ros-kinetic-joystick-drivers ros-kinetic-teleop-twist-joy
$ sudo pip install ds4drv
```

Connect PS4 joystick to the PC via Bluetooth using the following command

```bash
$ sudo ds4drv
```

Enter pairing mode with PS4 by pressing and holding Playstation button + share button for 10 sec. If the light on PS4 turns blue, enter the following commands in terminal and control OpenMANIPULATOR-X.

```bash
$ export ROS_NAMESPACE=/open_manipulator
$ roslaunch teleop_twist_joy teleop.launch

$ roslaunch open_manipulator_teleop open_manipulator_teleop_joystick.launch
```

### [XBOX 360 Joystick](#xbox-360-joystick)

Install packages for teleoperation using XBOX 360 joystick.

```bash
$ sudo apt-get install xboxdrv ros-kinetic-joy ros-kinetic-joystick-drivers ros-kinetic-teleop-twist-joy
```
Connect XBOX 360 joystick to the PC with wireless adapter or USB cable, and launch teleoperation packages for XBOX 360 joystick.

```bash
$ sudo xboxdrv --silent
$ export ROS_NAMESPACE=/open_manipulator
$ roslaunch teleop_twist_joy teleop.launch
$ roslaunch open_manipulator_teleop open_manipulator_teleop_joystick.launch
```
