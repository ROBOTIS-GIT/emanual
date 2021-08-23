
After running this section, software controller that controls the OpenMANIPULAOTR-X will be launched and each joint of the OpenMANIPULATOR-X will be locked (Torque On).  

- When operating with `U2D2`  
Close all terminal and enter the command below in the new terminal.
```bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch
```

- When operating with `OpenCR`  
Close all terminal and enter the command below in the new terminal.
```bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch usb_port:=/dev/ttyACM0 baud_rate:=1000000
```

{% capture warning_01 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. If joints are set inappropriately, OpenMANIPULATOR-X might not start operating.
The picture of OpenMANIPULATOR-X below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque is not enabled.    
        
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

Launch result on the terminal will look like below.  
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
