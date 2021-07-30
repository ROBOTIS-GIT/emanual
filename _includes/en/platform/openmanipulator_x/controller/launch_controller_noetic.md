Open a new terminal and launch the open_manipulator_controller package.

- When operating with `U2D2`
```bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch
```

- When operating with `OpenCR`
```bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch usb_port:=/dev/ttyACM0 baud_rate:=1000000
```

The `open_manipulator_controller.launch` file has several arguments for launching the controller package. Please see below [Parameter Descriptions](#parameter-descriptions).

{% capture warning_01 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. The manipulator will not operate if any joint is out of operable range.  
The following image describes the recommended pose of OpenMANIPULATOR-X at start up. Please adjust the pose before the torque is turned on by the controller.
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

Follwing message will be shown in the terminal with a successful launch of the controller.  

```
SUMMARY
========

PARAMETERS
 * /open_manipulator_controller/control_period: 0.01
 * /open_manipulator_controller/using_platform: True
 * /rosdistro: noetic
 * /rosversion: 1.15.9

NODES
  /
    open_manipulator_controller (open_manipulator_controller/open_manipulator_controller)

auto-starting new master
process[master]: started with pid [5454]
ROS_MASTER_URI=http://localhost:11311

setting /run_id to da579122-f0fa-11eb-9d7a-0790f3842b2b
process[rosout-1]: started with pid [5464]
started core service [/rosout]
process[open_manipulator_controller-2]: started with pid [5467]
port_name and baud_rate are set to /dev/ttyUSB0, 1000000 
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[INFO] Succeeded to init /open_manipulator_controller
```

{% capture notice_01 %}
**TIP**:
- If you can't load DYNAMIXEL, please check your DYNAMIXEL settings using the following command from DYNAMIXEL Workbench packages.   
  - U2D2 : `$ rosrun dynamixel_workbench_controllers find_dynamixel /dev/ttyUSB0`  
  - OpenCR : `$ rosrun dynamixel_workbench_controllers find_dynamixel /dev/ttyACM0`  
- For easy maintanence and configuration of DYNAMIXEL, it is recommended to use [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/) or [R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/)
- If you would like to use different DYNAMIXEL ID for OpenMANIPULATOR-X, please modify [`open_manipulator.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/be2859a0506b4e941a19435c0a07562b41768a27/open_manipulator_libs/src/OpenManipulator.cpp#L40) in the open_manipulator_lib directory. The default ID is **11, 12, 13, 14** for joints and **15** for the gripper
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

**NOTE**:  
OpenMANIPULATOR-X controller is compatible with [Protocol 2.0](/docs/en/dxl/protocol2/).  
[Protocol 1.0](/docs/en/dxl/protocol1/) does not support SyncRead instructions to access multiple DYNAMIXEL simultaneously.  
Protocol 2.0 is supported in `MX (2.0)`, `X`, `P`, and `Pro` series only.
{: .notice--info}


### [Parameter Descriptions](#parameter-descriptions)

- `usb_port` : Specifies a USB port. The actual port number assigned to the device may vary by system, but usually the number begins with 0 if there isn't other device. `$ ls /dev/tty*` command lists up the ports.
  - Port for U2D2: ***/dev/ttyUSB0***
  - Port for OpenCR: ***/dev/ttyACM0***  
    
- `baud_rate` : Specifies baud rate of DYNAMIXEL. The default baud rate of OpenMANIPULATOR-X is 1000000.
  
- `control_period` : Specifies a communication period (control loop time) between DYNAMIXEL and PC.
 
- `use_platform` : Condition to run the [Simulation](/docs/en/platform/openmanipulator_x/ros_simulation/#ros-simulation). 
  - Set **true** when operating the actual OpenMANIPULATOR. 
  - Set **false** when running a virtual OpenMANIPULATOR in [Gazebo](/docs/en/platform/openmanipulator_x/ros_simulation/#controller-for-gazebo) (3D robotics simulator).
