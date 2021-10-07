Open a new terminal and launch the open_manipulator_controller package.

- When operating with `U2D2`
```bash
$ ros2 launch open_manipulator_x_controller open_manipulator_x_controller.launch.py
```

- When operating with `OpenCR`
```bash
$ ros2 launch open_manipulator_x_controller open_manipulator_x_controller.launch.py usb_port:=/dev/ttyACM0
```

{% capture warning_01 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. The manipulator will not operate if any joint is out of operable range.  
The following image describes the recommended pose of OpenMANIPULATOR-X at start up. Please adjust the pose before the torque is turned on by the controller.
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

Follwing message will be shown in the Terminal after the process done successfully with `U2D2`.  

```
[INFO] [launch]: All log files can be found below /home/willson/.ros/log/2021-10-07-17-05-57-688562-willson-XPS-15-9560-112659
[INFO] [launch]: Default logging verbosity is set to INFO
[INFO] [open_manipulator_x_controller-1]: process started with pid [112661]
[open_manipulator_x_controller-1] port_name and baud_rate are set to /dev/ttyUSB0, 1000000 
[open_manipulator_x_controller-1] Joint Dynamixel ID : 11, Model Name : XM430-W350
[open_manipulator_x_controller-1] Joint Dynamixel ID : 12, Model Name : XM430-W350
[open_manipulator_x_controller-1] Joint Dynamixel ID : 13, Model Name : XM430-W350
[open_manipulator_x_controller-1] Joint Dynamixel ID : 14, Model Name : XM430-W350
[open_manipulator_x_controller-1] Gripper Dynamixel ID : 15, Model Name :XM430-W350
[open_manipulator_x_controller-1] [INFO] [1633593958.804918277] [open_manipulator_x_controller]: Succeeded to Initialise OpenManipulator-X Controller
```

{% capture notice_01 %}
**TIP**:
- If you can't load DYNAMIXEL, please check firmware to use ROBOTIS software ([R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/) or [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-update))
- If you would like to change DYNAMIXEL ID, please check [`open_manipulator_x.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/be2859a0506b4e941a19435c0a07562b41768a27/open_manipulator_libs/src/OpenManipulator.cpp#L40) in the open_manipulator_lib folder. The default ID is **11, 12, 13, 14** for joints and **15** for the gripper
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

{% capture notice_02 %}
**NOTE**: OpenMANIPULATOR-X controller is compatible with [Protocol 2.0](/docs/en/dxl/protocol2/) which supports `MX 2.0`, `X` and `Pro` series. [Protocol 1.0](/docs/en/dxl/protocol1/) does not support SyncRead instructions to access to multiple DYNAMIXEL's's simultaneously.  
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify}}</div>
