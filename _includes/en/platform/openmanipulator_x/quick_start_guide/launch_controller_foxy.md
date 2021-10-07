
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

{% capture warning_01 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. If joints are set inappropriately, OpenMANIPULATOR-X might not start operating.
The picture of OpenMANIPULATOR-X below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque is not enabled.    
        
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

Launch result on the terminal will look like below.  
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
- If you would like to change DYNAMIXEL ID, please check [`open_manipulator_x.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/ros2/open_manipulator_x_libs/src/open_manipulator_x.cpp#L40) in the open_manipulator_lib folder. The default ID is **11, 12, 13, 14** for joints and **15** for the gripper
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>
