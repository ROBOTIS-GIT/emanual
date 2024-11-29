
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

1. Launch `servo_keyboard_input` node for simple teleoperation test using the keyboard.  
The [OpenMANIPULATOR-X Controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) must be running on another terminal.  
```bash
$ ros2 run open_manipulator_x_teleop open_manipulator_x_teleop
```

2. If the node is successfully launched, the following instruction will appear in the terminal window.  

  ```
[INFO] [1732776371.215661501] [servo_keyboard_input]: SUCCESS TO CONNECT SERVO START SERVER
[INFO] [1732776371.216112752] [servo_keyboard_input]: SUCCESS TO CONNECT SERVO STOP SERVER
[INFO] [1732776371.216172872] [servo_keyboard_input]: call 'moveit_servo' start srv.
[INFO] [1732776371.283417067] [servo_keyboard_input]: SUCCESS to start 'moveit_servo'
Reading from keyboard
---------------------------
Joint Control Keys:
  1/q: Joint1 +/-
  2/w: Joint2 +/-
  3/e: Joint3 +/-
  4/r: Joint4 +/-
Use o|p to open/close the gripper.
'ESC' to quit.
  ```

### [RC-100](#rc-100)

Not supported.
{: .notice--warning}

### [PS4 Joystick](#ps4-joystick)

Not supported.
{: .notice--warning}

### [XBOX 360 Joystick](#xbox-360-joystick)

Not supported.
{: .notice--warning}