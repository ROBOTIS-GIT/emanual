Please note that this instruction is written for the **ROBOTIS official OpenMANIPULATOR-X package**. If you are operating a home made OpenMANIPULATOR-X, make sure to configure each DYNAMIXEL as below before operating.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_id_baudrate.png)

**WARNING** The gripper module(ID 15) requires `Current based Position Control Mode`. Please make sure your DYNAMIXEL model supports the required [Operating Mode](https://emanual.robotis.com/docs/en/dxl/x/xm430-w350/#operating-mode11).
{: .notice--danger}

{% capture note_01 %}
`FAQ`
- You can configure your DYNAMIXEL using [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/).
- After completing the [Hardware Setup](#hardware-setup) section, use DYNAMIXEL Wizard 2.0 to configure the DYNAMIXEL.
{% endcapture %}
<div class="notice--warning">{{ note_01 | markdownify }}</div>

### Launch Controller

After running this section, software controller that controls the OpenMANIPULAOTR-X will be launched and each joint of the OpenMANIPULATOR-X will be locked (Torque On).  

- When operating with `U2D2`  
Close all terminal and enter the command below in the new terminal.
```bash
$ ros2 launch open_manipulator_x_controller open_manipulator_x_controller.launch.py
```

- When operating with `OpenCR`  
Close all terminal and enter the command below in the new terminal.
```bash
$ ros2 launch open_manipulator_x_controller open_manipulator_x_controller.launch.py usb_port:=/dev/ttyACM0
```

Launch result on the terminal will look like below.  
```
port_name and baud_rate are set to /dev/ttyUSB0, 1000000 
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[INFO] Succeeded to Initialise OpenManipulator-X Controller
```

{% capture note_02 %}
`FAQ`
- If you only see the part of result in the terminal, enter below command before launching the controller.
```bash
$ export RCUTILS_CONSOLE_STDOUT_LINE_BUFFERED=1
```
- Entering the `CTRL` + `C` on the terminal will quit the program.
{% endcapture %}
<div class="notice--warning">{{ note_02 | markdownify }}</div>

### [Optional] 3D Visualization (RViz)

This section an **optional** that you can see the 3D visualization of OpenMANIPULATOR-X.

{% capture kinetic_08 %}
For `Kinetic`  

Open another terminal and enter below command
```bash
$ roslaunch open_manipulator_description open_manipulator_rviz.launch
```
{% endcapture %}
<div class="notice--success">{{ kinetic_08 | markdownify }}</div>

{% capture dashing_08 %}
For `Dashing`  

Open another terminal and enter below command
```bash
$ ros2 launch open_manipulator_x_description open_manipulator_x_rviz.launch.py
```
{% endcapture %}
<div class="notice--danger">{{ dashing_08 | markdownify }}</div>

You will see below RViz window after a successful launch.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_rviz.png)

### Operation

For Kinetic, two operation options are available. Please run only one method at a time.
- Option 1 : [GUI Program](#option-1-gui-program)
- Option 2 : [Keyboard](#option-2-keyboard)

#### [Option 1] GUI Program

{% capture kinetic_09 %}
For `Kinetic`  

Open another terminal and enter below command. Please refer to [GUI Program](/docs/en/platform/openmanipulator_x/ros_operation/#gui-program) section for more details.
```bash
$ roslaunch open_manipulator_control_gui open_manipulator_control_gui.launch
```
{% endcapture %}
<div class="notice--success">{{ kinetic_09 | markdownify }}</div>

{% capture dashing_09 %}
For `Dashing`, GUI Program is **not supported**.
{% endcapture %}
<div class="notice--danger">{{ dashing_09 | markdownify }}</div>

![](/assets/images/platform/openmanipulator_x/OpenManipulator_gui_default.png)

#### [Option 2] Keyboard

{% capture kinetic_10 %}
For `Kinetic`  

Open another terminal and enter below command.  
```bash
$ roslaunch open_manipulator_teleop open_manipulator_teleop_keyboard.launch
```
{% endcapture %}
<div class="notice--success">{{ kinetic_10 | markdownify }}</div>

{% capture dashing_10 %}
For `Dashing`  

Open another terminal and enter below command.  
```bash
$ ros2 run open_manipulator_x_teleop open_manipulator_x_teleop_keyboard
```
{% endcapture %}
<div class="notice--danger">{{ dashing_10 | markdownify }}</div>

You will see below interface on the terminal window after a successful launch.
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

`FAQ` **For any issues with running OpenMANIPULATOR-X, submit an issue ticket on [GitHub Issue page](https://github.com/ROBOTIS-GIT/open_manipulator/issues)**.
{: .notice--warning}
