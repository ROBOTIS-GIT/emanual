
{% capture warning_01 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. The manipulator will not operate if any joint is out of operable range.  
The following image describes the recommended pose of OpenMANIPULATOR-X at start up. Please adjust the pose before the torque is turned on by the controller.
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

Run **the controller of slave OpenManipulator**. Open the other terminal window and enter the following command in the terminal.      
`dynamixel_usb_port` is a parameter to set use port to connected with Dynamixel of slave OpenManipulator. It should be set **/dev/ttyUSB@** and it is different from use port of master OpenManipulator.

``` bash
$ ros2 launch open_manipulator_x_controller open_manipulator_x_controller.launch.py  
```



And Open the other terminal window and enter the following command in the terminal. This command is to run **the controller of master OpenManipulator**.     
`usb_port` is a parameter to set use port to connected with Dynamixel of master OpenManipulator. It should be set **/dev/ttyUSB@** and it is different from use port of slave OpenManipulator.

If the master OpenManipulator-X controller has been launched successfully, the terminal will show the following message.

```
port_name and baud_rate are set to /dev/ttyUSB0, 1000000 
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[INFO] Succeeded to Initialise OpenManipulator-X Controller
```

And Open the other terminal window and enter the following command in the terminal. This command is to run **the controller of master OpenManipulator**.     
`usb_port` is a parameter to set use port to connected with DYNAMIXEL of master OpenManipulator. It should be set **/dev/ttyUSB@** and it is different from use port of slave OpenManipulator.

``` bash
$ ros2 run open_manipulator_x_master_slave open_manipulator_x_master_slave
```

If the slave OpenManipulator-X controller has been launched successfully, the terminal will show the following message.

```
port_name and baud_rate are set to /dev/ttyUSB1, 1000000 
Joint Dynamixel ID : 1, Model Name : XM430-W350
Joint Dynamixel ID : 2, Model Name : XM430-W350
Joint Dynamixel ID : 3, Model Name : XM430-W350
Joint Dynamixel ID : 4, Model Name : XM430-W350
Gripper Dynamixel ID : 5, Model Name :XM430-W350
```

So, you can see the following message in the terminal window. You can check the current control mode and robot status(joint angle, tool position).

```
-----------------------------
Control Your OpenManipulator!
-----------------------------
Present Control Mode
Master - Slave Mode
-----------------------------
1 : Master - Slave Mode
2 : Start Recording Trajectory
3 : Stop Recording Trajectory
4 : Play Recorded Trajectory
-----------------------------
Present Joint Angle J1: -0.170 J2: 0.367 J3: -0.046 J4: 0.959
Present Tool Position: 0.000
-----------------------------
```
There are four control modes. Please enter that number in the terminal.

1. Master-Slave Mode: Master robot and slave robot move synchronously.
2. Start Recording Trajectory: Master robot and slave robot move synchronously and the controller records the moving trajectory.
3. Stop Recording Trajectory: Ends the recording.
4. Play Recorded Trajectory: The trajectory recorded in the 2nd mode is reproduced only by the slave robot.
