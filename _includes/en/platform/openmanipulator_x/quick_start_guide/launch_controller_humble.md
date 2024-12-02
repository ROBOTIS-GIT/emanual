
After running this section, software controller that controls the OpenMANIPULAOTR-X will be launched and each joint of the OpenMANIPULATOR-X will be locked (Torque On).  

- When operating with `U2D2`  
Close all terminal and enter the command below in each new terminal.
```bash
$ ros2 launch open_manipulator_x_bringup hardware.launch.py
$ ros2 launch open_manipulator_x_moveit_config servo.launch.py
```

- When operating with `OpenCR`  
Close all terminal and enter the command below in the new terminal.
```bash
$ ros2 launch open_manipulator_x_bringup hardware.launch.py port_name:=/dev/ttyACM0
$ ros2 launch open_manipulator_x_moveit_config servo.launch.py
```

{% capture warning_01 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. If joints are set inappropriately, OpenMANIPULATOR-X might not start operating.
The picture of OpenMANIPULATOR-X below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque is not enabled.    
        
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

Launch result on the terminal will look like below.  
```bash
$ ros2 launch open_manipulator_x_bringup hardware.launch.py
```

```
[INFO] [launch]: All log files can be found below /home/omx/.ros/log/2024-11-28-15-39-21-377604-omx-21792
[INFO] [launch]: Default logging verbosity is set to INFO
[INFO] [ros2_control_node-1]: process started with pid [21795]
[INFO] [robot_state_publisher-2]: process started with pid [21797]
[INFO] [spawner-3]: process started with pid [21799]
[ros2_control_node-1] [WARN] [1732775961.647409323] [controller_manager]: [Deprecated] Passing the robot description parameter directly to the control_manager node is deprecated. Use '~/robot_description' topic from 'robot_state_publisher' instead.
[ros2_control_node-1] [INFO] [1732775961.647732674] [resource_manager]: Loading hardware 'OpenManipulatorXSystem' 
[ros2_control_node-1] [INFO] [1732775961.650387218] [resource_manager]: Initialize hardware 'OpenManipulatorXSystem' 
[ros2_control_node-1] transmission_to_joint_matrix_ 
[ros2_control_node-1] [0][0] 1.000000, [0][1] 0.000000, [0][2] 0.000000, [0][3] 0.000000, [0][4] 0.000000, 
[ros2_control_node-1] [1][0] 0.000000, [1][1] 1.000000, [1][2] 0.000000, [1][3] 0.000000, [1][4] 0.000000, 
[ros2_control_node-1] [2][0] 0.000000, [2][1] 0.000000, [2][2] 1.000000, [2][3] 0.000000, [2][4] 0.000000, 
[ros2_control_node-1] [3][0] 0.000000, [3][1] 0.000000, [3][2] 0.000000, [3][3] 1.000000, [3][4] 0.000000, 
[ros2_control_node-1] [4][0] 0.000000, [4][1] 0.000000, [4][2] 0.000000, [4][3] 0.000000, [4][4] 1.000000, 
[ros2_control_node-1] joint_to_transmission_matrix_ 
[ros2_control_node-1] [0][0] 1.000000, [0][1] 0.000000, [0][2] 0.000000, [0][3] 0.000000, [0][4] 0.000000, 
[ros2_control_node-1] [1][0] 0.000000, [1][1] 1.000000, [1][2] 0.000000, [1][3] 0.000000, [1][4] 0.000000, 
[ros2_control_node-1] [2][0] 0.000000, [2][1] 0.000000, [2][2] 1.000000, [2][3] 0.000000, [2][4] 0.000000, 
[ros2_control_node-1] [3][0] 0.000000, [3][1] 0.000000, [3][2] 0.000000, [3][3] 1.000000, [3][4] 0.000000, 
[ros2_control_node-1] [4][0] 0.000000, [4][1] 0.000000, [4][2] 0.000000, [4][3] 0.000000, [4][4] 1.000000, 
[ros2_control_node-1] [INFO] [1732775961.650702017] [dynamixel_hardware_interface]: port_name /dev/ttyUSB0 / baudrate 1000000
[ros2_control_node-1] Dynamixel Information File List.
[ros2_control_node-1] num: 1000, name: xh430_w350.model
[ros2_control_node-1] num: 1020, name: xm430_w350.model
[ros2_control_node-1] num: 1060, name: xl430_w250.model
[ros2_control_node-1] num: 1080, name: xc430_w240.model
[ros2_control_node-1] num: 1100, name: xh540_w270.model
[ros2_control_node-1] num: 1160, name: 2xc430_w250.model
[ros2_control_node-1] num: 4000, name: ym070_210_m001.model
[ros2_control_node-1] num: 4020, name: ym070_210_r051.model
[ros2_control_node-1] num: 4030, name: ym070_210_r099.model
[ros2_control_node-1] num: 4120, name: ym080_230_m001.model
[ros2_control_node-1] num: 4140, name: ym080_230_r051.model
[ros2_control_node-1] num: 4150, name: ym080_230_r099.model
[ros2_control_node-1] num: 35074, name: rh_p12_rn.model
[ros2_control_node-1] [INFO] [1732775961.650972390] [dynamixel_hardware_interface]: $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
[ros2_control_node-1] [INFO] [1732775961.650978848] [dynamixel_hardware_interface]: $$$$$ Init Dxl Comm Port
[ros2_control_node-1] Succeeded to open the port!
[ros2_control_node-1] Succeeded to change the [1000000] baudrate!
[ros2_control_node-1] [ID:011] Request ping	 - Ping succeeded. Dynamixel model number : 1020
[robot_state_publisher-2] [INFO] [1732775961.654714921] [robot_state_publisher]: got segment dummy_mimic_fix
[robot_state_publisher-2] [INFO] [1732775961.654781535] [robot_state_publisher]: got segment end_effector_link
[robot_state_publisher-2] [INFO] [1732775961.654786706] [robot_state_publisher]: got segment gripper_left_link
[robot_state_publisher-2] [INFO] [1732775961.654789648] [robot_state_publisher]: got segment gripper_right_link
[robot_state_publisher-2] [INFO] [1732775961.654792365] [robot_state_publisher]: got segment link1
[robot_state_publisher-2] [INFO] [1732775961.654794901] [robot_state_publisher]: got segment link2
[robot_state_publisher-2] [INFO] [1732775961.654797487] [robot_state_publisher]: got segment link3
[robot_state_publisher-2] [INFO] [1732775961.654799877] [robot_state_publisher]: got segment link4
[robot_state_publisher-2] [INFO] [1732775961.654802152] [robot_state_publisher]: got segment link5
[robot_state_publisher-2] [INFO] [1732775961.654804416] [robot_state_publisher]: got segment world
[ros2_control_node-1] [ID:012] Request ping	 - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [ID:013] Request ping	 - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [ID:014] Request ping	 - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [ID:015] Request ping	 - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [INFO] [1732775961.663020717] [dynamixel_hardware_interface]: Trying to connect to the communication port...
[ros2_control_node-1] [INFO] [1732775961.663086277] [dynamixel_hardware_interface]: $$$$$ Init Dxl Items
[ros2_control_node-1] [INFO] [1732775961.665305846] [dynamixel_hardware_interface]: [ID:11] item_name:Drive Mode	data:0
[ros2_control_node-1] [INFO] [1732775961.667285868] [dynamixel_hardware_interface]: [ID:12] item_name:Drive Mode	data:0
[ros2_control_node-1] [INFO] [1732775961.669291131] [dynamixel_hardware_interface]: [ID:13] item_name:Drive Mode	data:0
[ros2_control_node-1] [INFO] [1732775961.671288654] [dynamixel_hardware_interface]: [ID:14] item_name:Drive Mode	data:0
[ros2_control_node-1] [INFO] [1732775961.671336766] [dynamixel_hardware_interface]: $$$$$ Init Dxl Read Items
[ros2_control_node-1] Dynamixel Read Type : sync read
[ros2_control_node-1] ID : 11, 12, 13, 14, 15, 
[ros2_control_node-1] Read items : 	Present Position	Present Velocity	Present Current	Torque Enable	Present Input Voltage
[ros2_control_node-1] set sync read (indirect addr) : addr 224, size 13
[ros2_control_node-1] Success to set SyncRead handler using indirect address
[ros2_control_node-1] [INFO] [1732775961.802404044] [dynamixel_hardware_interface]: $$$$$ Init Dxl Write Items
[ros2_control_node-1] Dynamixel Write Type : sync write
[ros2_control_node-1] ID : 11, 12, 13, 14, 15, 
[ros2_control_node-1] Write items : 	Goal Position
[ros2_control_node-1] set sync write (indirect addr) : addr 634, size 4
[ros2_control_node-1] Success to set SyncWrite handler using indirect address
[ros2_control_node-1] [INFO] [1732775961.848599813] [resource_manager]: Successful initialization of hardware 'OpenManipulatorXSystem'
[ros2_control_node-1] [INFO] [1732775961.848643868] [dynamixel_hardware_interface]: ros_update rate is 200hz
[ros2_control_node-1] [INFO] [1732775961.848933885] [resource_manager]: 'configure' hardware 'OpenManipulatorXSystem' 
[ros2_control_node-1] [INFO] [1732775961.848950710] [resource_manager]: Successful 'configure' of hardware 'OpenManipulatorXSystem'
[ros2_control_node-1] [INFO] [1732775961.848969965] [resource_manager]: 'activate' hardware 'OpenManipulatorXSystem' 
[spawner-3] [INFO] [1732775961.853098097] [spawner_joint_state_broadcaster]: waiting for service /controller_manager/list_controllers to become available...
[ros2_control_node-1] [INFO] [1732775961.855413362] [dynamixel_hardware_interface]: Sync joint state to command (position, 2.19834 <- position, 2.19834
[ros2_control_node-1] [INFO] [1732775961.855483775] [dynamixel_hardware_interface]: Sync joint state to command (position, 3.95701 <- position, 3.95701
[ros2_control_node-1] [INFO] [1732775961.855512837] [dynamixel_hardware_interface]: Sync joint state to command (position, 16.0039 <- position, 16.0039
[ros2_control_node-1] [INFO] [1732775961.855537887] [dynamixel_hardware_interface]: Sync joint state to command (position, 66.4778 <- position, 66.4778
[ros2_control_node-1] [INFO] [1732775961.855562669] [dynamixel_hardware_interface]: Sync joint state to command (position, 50.7377 <- position, 50.7377
[ros2_control_node-1] [ID:011] Torque ON
[ros2_control_node-1] [ID:012] Torque ON
[ros2_control_node-1] [ID:013] Torque ON
[ros2_control_node-1] [ID:014] Torque ON
[ros2_control_node-1] [ID:015] Torque ON
[ros2_control_node-1] [INFO] [1732775962.365291262] [dynamixel_hardware_interface]: Dynamixel Hardware Start!
[ros2_control_node-1] [INFO] [1732775962.365471552] [resource_manager]: Successful 'activate' of hardware 'OpenManipulatorXSystem'
[ros2_control_node-1] [INFO] [1732775962.372136019] [controller_manager]: update rate is 1000 Hz
[ros2_control_node-1] [WARN] [1732775962.372436132] [controller_manager]: No real-time kernel detected on this system. See [https://control.ros.org/master/doc/ros2_control/controller_manager/doc/userdoc.html] for details on how to enable realtime scheduling.
[ros2_control_node-1] [INFO] [1732775962.608221107] [controller_manager]: Loading controller 'joint_state_broadcaster'
[spawner-3] [INFO] [1732775962.619721516] [spawner_joint_state_broadcaster]: Loaded joint_state_broadcaster
[ros2_control_node-1] [INFO] [1732775962.620824998] [controller_manager]: Configuring controller 'joint_state_broadcaster'
[ros2_control_node-1] [INFO] [1732775962.620980973] [joint_state_broadcaster]: 'joints' or 'interfaces' parameter is empty. All available state interfaces will be published
[spawner-3] [INFO] [1732775962.641741456] [spawner_joint_state_broadcaster]: Configured and activated joint_state_broadcaster
[INFO] [spawner-3]: process has finished cleanly [pid 21799]
[INFO] [spawner-4]: process started with pid [21844]
[INFO] [spawner-5]: process started with pid [21846]
[ros2_control_node-1] [INFO] [1732775962.982777514] [controller_manager]: Loading controller 'arm_controller'
[ros2_control_node-1] [WARN] [1732775962.991831509] [arm_controller]: [Deprecated]: "allow_nonzero_velocity_at_trajectory_end" is set to true. The default behavior will change to false.
[ros2_control_node-1] [INFO] [1732775962.998816098] [controller_manager]: Loading controller 'gripper_controller'
[spawner-5] [INFO] [1732775963.006563977] [spawner_arm_controller]: Loaded arm_controller
[ros2_control_node-1] [INFO] [1732775963.007177493] [controller_manager]: Configuring controller 'arm_controller'
[ros2_control_node-1] [INFO] [1732775963.007319562] [arm_controller]: No specific joint names are used for command interfaces. Using 'joints' parameter.
[ros2_control_node-1] [INFO] [1732775963.007338708] [arm_controller]: Command interfaces are [position] and state interfaces are [position velocity].
[ros2_control_node-1] [INFO] [1732775963.007385182] [arm_controller]: Using 'splines' interpolation method.
[ros2_control_node-1] [INFO] [1732775963.007861186] [arm_controller]: Controller state will be published at 200.00 Hz.
[ros2_control_node-1] [INFO] [1732775963.008528831] [arm_controller]: Action status changes will be monitored at 20.00 Hz.
[spawner-4] [INFO] [1732775963.018263910] [spawner_gripper_controller]: Loaded gripper_controller
[ros2_control_node-1] [INFO] [1732775963.026574485] [controller_manager]: Configuring controller 'gripper_controller'
[ros2_control_node-1] [INFO] [1732775963.026671830] [gripper_controller]: Action status changes will be monitored at 20Hz.
[spawner-5] [INFO] [1732775963.027360522] [spawner_arm_controller]: Configured and activated arm_controller
[spawner-4] [INFO] [1732775963.130766130] [spawner_gripper_controller]: Configured and activated gripper_controller
[INFO] [spawner-5]: process has finished cleanly [pid 21846]
[INFO] [spawner-4]: process has finished cleanly [pid 21844]
```

```bash
$ ros2 launch open_manipulator_x_moveit_config servo.launch.py 
```
```
[INFO] [launch]: All log files can be found below /home/omx/.ros/log/2024-11-28-15-51-38-138154-omx-22594
[INFO] [launch]: Default logging verbosity is set to INFO
[INFO] [servo_node_main-1]: process started with pid [22595]
[servo_node_main-1] [WARN] [1732776698.266193749] [moveit_servo.servo_node]: Intra-process communication is disabled, consider enabling it by adding: 
[servo_node_main-1] extra_arguments=[{'use_intra_process_comms' : True}]
[servo_node_main-1] to the Servo composable node in the launch file
[servo_node_main-1] [INFO] [1732776698.270341102] [moveit_rdf_loader.rdf_loader]: Loaded robot model in 0.00252236 seconds
[servo_node_main-1] [INFO] [1732776698.270367397] [moveit_robot_model.robot_model]: Loading robot model 'open_manipulator_x'...
[servo_node_main-1] [WARN] [1732776698.329940951] [moveit_robot_model.robot_model]: Link end_effector_link has visual geometry but no collision geometry. Collision geometry will be left empty. Fix your URDF file by explicitly specifying collision geometry.
[servo_node_main-1] [INFO] [1732776698.542474436] [moveit_ros.current_state_monitor]: Listening to joint states on topic '/joint_states'
[servo_node_main-1] [INFO] [1732776698.544878602] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Listening to '/attached_collision_object' for attached collision objects
[servo_node_main-1] [INFO] [1732776698.544895196] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Starting planning scene monitor
[servo_node_main-1] [INFO] [1732776698.545435210] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Listening to '/planning_scene'
[servo_node_main-1] [INFO] [1732776698.545607100] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Publishing maintained planning scene on '/servo_node/publish_planning_scene'
```

{% capture notice_01 %}
**TIP**:
- If you can't load DYNAMIXEL, please check firmware to use ROBOTIS software ([DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-update))
<!-- - If you would like to change DYNAMIXEL ID, please check [`open_manipulator_x.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/ros2/open_manipulator_x_libs/src/open_manipulator_x.cpp#L40) in the open_manipulator_lib folder. The default ID is **11, 12, 13, 14** for joints and **15** for the gripper -->
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>
