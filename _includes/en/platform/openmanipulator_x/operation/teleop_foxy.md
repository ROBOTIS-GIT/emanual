
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
$ ros2 run open_manipulator_x_teleop teleop_keyboard
```

2. If the node is successfully launched, the following instruction will appear in the terminal window.  

  ```
  Control Your OpenManipulator!
---------------------------
Task Space Control:
         (Forward, X+)
              W                   Q (Upward, Z+)
(Left, Y+) A     D (Right, Y-)    Z (Downward, Z-)
              X 
        (Backward, X-)

Joint Space Control:
- Joint1 : Increase (Y), Decrease (H)
- Joint2 : Increase (U), Decrease (J)
- Joint3 : Increase (I), Decrease (K)
- Joint4 : Increase (O), Decrease (L)
- Gripper: Increase (F), Decrease (G) | Fully Open (V), Fully Close (B)

INIT : (1)
HOME : (2)

CTRL-C to quit

Joint Angle(Rad): [0.000, 0.000, 0.000, 0.000, 0.000]
Kinematics Pose(Pose X, Y, Z | Orientation W, X, Y, Z): 0.000, 0.000, 0.000 | 0.000, 0.000, 0.000, 0.000
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