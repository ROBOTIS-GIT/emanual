
{% capture warning_01 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X.  
The manipulator will not operate if any joint is out of operable range.  
The following image describes the recommended pose of OpenMANIPULATOR-X at start up.  
Please adjust the pose before the torque is turned on by the controller.
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

1. Open a new terminal and enter the following command to run the controller for the **Slave OpenMANIPULATOR-X**.  
  The `usb_port` is a parameter that sets the port of the slave OpenMANIPULATOR-X.  
  Please check your OS and use the appropriate usb port assigned to the U2D2.  
  ```bash
$ ros2 launch open_manipulator_x_controller open_manipulator_x_controller.launch.py usb_port:=/dev/ttyUSB0
  ```

2. If the slave OpenMANIPULATOR-X controller is launched successfully, the terminal will print the following message.  

    ```
    [INFO] [open_manipulator_x_controller-1]: process started with pid [6698]
    [open_manipulator_x_controller-1] port_name and baud_rate are set to /dev/ttyUSB0, 1000000 
    [open_manipulator_x_controller-1] Joint Dynamixel ID : 11, Model Name : XM430-W350
    [open_manipulator_x_controller-1] Joint Dynamixel ID : 12, Model Name : XM430-W350
    [open_manipulator_x_controller-1] Joint Dynamixel ID : 13, Model Name : XM430-W350
    [open_manipulator_x_controller-1] Joint Dynamixel ID : 14, Model Name : XM430-W350
    [open_manipulator_x_controller-1] Gripper Dynamixel ID : 15, Model Name :XM430-W350
    [open_manipulator_x_controller-1] [INFO] [open_manipulator_x_controller]: Succeeded to Initialise OpenManipulator-X Controller
    ```

3. Open another terminal and enter the following command to run the **Master OpenMANIPULATOR-X controller**.  
  The `usb_port` is a parameter that sets the port of the slave OpenMANIPULATOR-X.  
  Please check your OS and use the appropriate usb port assigned to the U2D2.  
  ```bash
$ ros2 run open_manipulator_x_master_slave open_manipulator_x_master_slave usb_port:=/dev/ttyUSB1
  ```

4. If the master OpenManipulator-X controller has been launched successfully, the terminal will print the following message.

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

5. Four control modes are available. Please select and enter the number in the terminal.

    - `1` : **Master-Slave Mode**
      - Master robot and slave robot move synchronously.
    - `2` : **Start Recording Trajectory**
      - Master robot and slave robot move synchronously and the controller records the moving trajectory.
    - `3` : **Stop Recording Trajectory**
      - Ends the recording.
    - `4` : **Play Recorded Trajectory**
      - The trajectory recorded in the 2nd mode is reproduced only by the slave robot.
