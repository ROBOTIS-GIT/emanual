
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
  The `dynamixel_usb_port` is a parameter that sets the port of the slave OpenMANIPULATOR-X.  
  Please check your OS and use the appropriate usb port assigned to the U2D2.  
  ```bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch dynamixel_usb_port:=/dev/ttyUSB0
  ```

2. If the slave OpenMANIPULATOR-X controller is launched successfully, the terminal will print the following message.  

    ```
    SUMMARY
    ========

    PARAMETERS
    * /open_manipulator/control_period: 0.01
    * /open_manipulator/moveit_sample_duration: 0.05
    * /open_manipulator/planning_group_name: arm
    * /open_manipulator/using_moveit: False
    * /open_manipulator/using_platform: True
    * /rosdistro: kinetic
    * /rosversion: 1.12.14

    NODES
      /
        open_manipulator (open_manipulator_controller/open_manipulator_controller)

    ROS_MASTER_URI=http://localhost:11311

    process[open_manipulator-1]: started with pid [23452]
    Joint Dynamixel ID : 11, Model Name : XM430-W350
    Joint Dynamixel ID : 12, Model Name : XM430-W350
    Joint Dynamixel ID : 13, Model Name : XM430-W350
    Joint Dynamixel ID : 14, Model Name : XM430-W350
    Gripper Dynamixel ID : 15, Model Name :XM430-W350
    [ INFO] [1544509070.096942788]: Succeeded to init /open_manipulator
    ```

3. Open another terminal and enter the following command to run the **Master OpenMANIPULATOR-X controller**.  
  The `usb_port` is a parameter that sets the port of the master OpenMANIPULATOR-X.  
  Please check your OS and use the appropriate serial port assigned to the U2D2.  
  ```bash
$ roslaunch open_manipulator_master_slave open_manipulator_master.launch usb_port:=/dev/ttyUSB1
  ```

4. If the master OpenMANIPULATOR-X controller has been launched successfully, the terminal will print the following message.  

    ```
    SUMMARY
    ========

    PARAMETERS
    * /open_manipulator/open_manipulator_master/gripper_id: 25
    * /open_manipulator/open_manipulator_master/joint1_id: 21
    * /open_manipulator/open_manipulator_master/joint2_id: 22
    * /open_manipulator/open_manipulator_master/joint3_id: 23
    * /open_manipulator/open_manipulator_master/joint4_id: 24
    * /open_manipulator/open_manipulator_master/service_call_period: 0.01
    * /rosdistro: kinetic
    * /rosversion: 1.12.14

    NODES
    /open_manipulator/
        open_manipulator_master (open_manipulator_master_slave/open_manipulator_master)

    ROS_MASTER_URI=http://localhost:11311

    process[open_manipulator/open_manipulator_master-1]: started with pid [32026]
    Joint Dynamixel ID : 21, Model Name : XM430-W350
    Joint Dynamixel ID : 22, Model Name : XM430-W350
    Joint Dynamixel ID : 23, Model Name : XM430-W350
    Joint Dynamixel ID : 24, Model Name : XM430-W350
    Gripper Dynamixel ID : 25, Model Name :XM430-W350
    ```

5. The following message will appear in the terminal. Current control mode and robot status(joint angle, tool position) will be updated.

    ```
    -----------------------------
    Control Your OpenMANIPULATOR!
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

6. Four control modes are available. Please select and enter the number in the terminal.

    - `1` : **Master-Slave Mode**
      - Master robot and slave robot move synchronously.
    - `2` : **Start Recording Trajectory**
      - Master robot and slave robot move synchronously and the controller records the moving trajectory.
    - `3` : **Stop Recording Trajectory**
      - Ends the recording.
    - `4` : **Play Recorded Trajectory**
      - The trajectory recorded in the 2nd mode is reproduced only by the slave robot.
