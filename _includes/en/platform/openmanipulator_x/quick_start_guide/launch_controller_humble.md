
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
[INFO] [launch]: All log files can be found below /home/omx/.ros/log/2024-12-10-16-13-03-846807-omx-3063
[INFO] [launch]: Default logging verbosity is set to INFO
[INFO] [ros2_control_node-1]: process started with pid [3066]
[INFO] [robot_state_publisher-2]: process started with pid [3068]
[INFO] [spawner-3]: process started with pid [3070]
[robot_state_publisher-2] [INFO] [1733814784.140348781] [robot_state_publisher]: got segment dummy_mimic_fix
[robot_state_publisher-2] [INFO] [1733814784.140441706] [robot_state_publisher]: got segment end_effector_link
[robot_state_publisher-2] [INFO] [1733814784.140450447] [robot_state_publisher]: got segment gripper_left_link
[robot_state_publisher-2] [INFO] [1733814784.140455005] [robot_state_publisher]: got segment gripper_right_link
[robot_state_publisher-2] [INFO] [1733814784.140459339] [robot_state_publisher]: got segment link1
[robot_state_publisher-2] [INFO] [1733814784.140463495] [robot_state_publisher]: got segment link2
[robot_state_publisher-2] [INFO] [1733814784.140467530] [robot_state_publisher]: got segment link3
[robot_state_publisher-2] [INFO] [1733814784.140471673] [robot_state_publisher]: got segment link4
[robot_state_publisher-2] [INFO] [1733814784.140475662] [robot_state_publisher]: got segment link5
[robot_state_publisher-2] [INFO] [1733814784.140479440] [robot_state_publisher]: got segment world
[ros2_control_node-1] [WARN] [1733814784.150297704] [controller_manager]: [Deprecated] Passing the robot description parameter directly to the control_manager node is deprecated. Use '~/robot_description' topic from 'robot_state_publisher' instead.
[ros2_control_node-1] [INFO] [1733814784.150762238] [resource_manager]: Loading hardware 'OpenManipulatorXSystem' 
[ros2_control_node-1] [INFO] [1733814784.163256190] [resource_manager]: Initialize hardware 'OpenManipulatorXSystem' 
[ros2_control_node-1] transmission_to_joint_matrix_ 
[ros2_control_node-1] [0][0] 1.000000, [0][1] 0.000000, [0][2] 0.000000, [0][3] 0.000000, [0][4] 0.000000, 
[ros2_control_node-1] [1][0] 0.000000, [1][1] 1.000000, [1][2] 0.000000, [1][3] 0.000000, [1][4] 0.000000, 
[ros2_control_node-1] [2][0] 0.000000, [2][1] 0.000000, [2][2] 1.000000, [2][3] 0.000000, [2][4] 0.000000, 
[ros2_control_node-1] [3][0] 0.000000, [3][1] 0.000000, [3][2] 0.000000, [3][3] 1.000000, [3][4] 0.000000, 
[ros2_control_node-1] [4][0] 0.000000, [4][1] 0.000000, [4][2] 0.000000, [4][3] 0.000000, [4][4] 1.000000, 
[ros2_control_node-1] [5][0] 0.000000, [5][1] 0.000000, [5][2] 0.000000, [5][3] 0.000000, [5][4] 0.000000, 
[ros2_control_node-1] joint_to_transmission_matrix_ 
[ros2_control_node-1] [0][0] 1.000000, [0][1] 0.000000, [0][2] 0.000000, [0][3] 0.000000, [0][4] 0.000000, [0][5] 0.000000, 
[ros2_control_node-1] [1][0] 0.000000, [1][1] 1.000000, [1][2] 0.000000, [1][3] 0.000000, [1][4] 0.000000, [1][5] 0.000000, 
[ros2_control_node-1] [2][0] 0.000000, [2][1] 0.000000, [2][2] 1.000000, [2][3] 0.000000, [2][4] 0.000000, [2][5] 0.000000, 
[ros2_control_node-1] [3][0] 0.000000, [3][1] 0.000000, [3][2] 0.000000, [3][3] 1.000000, [3][4] 0.000000, [3][5] 0.000000, 
[ros2_control_node-1] [4][0] 0.000000, [4][1] 0.000000, [4][2] 0.000000, [4][3] 0.000000, [4][4] 1.000000, [4][5] 0.000000, 
[ros2_control_node-1] [INFO] [1733814784.164000125] [dynamixel_hardware_interface]: port_name /dev/ttyUSB0 / baudrate 1000000
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
[ros2_control_node-1] num: 4050, name: ym070_210_a099.model
[ros2_control_node-1] num: 4120, name: ym080_230_m001.model
[ros2_control_node-1] num: 4140, name: ym080_230_r051.model
[ros2_control_node-1] num: 4150, name: ym080_230_r099.model
[ros2_control_node-1] num: 4170, name: ym080_230_a099.model
[ros2_control_node-1] num: 35074, name: rh_p12_rn.model
[ros2_control_node-1] [INFO] [1733814784.165060244] [dynamixel_hardware_interface]: $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
[ros2_control_node-1] [INFO] [1733814784.165085781] [dynamixel_hardware_interface]: $$$$$ Init Dxl Comm Port
[ros2_control_node-1] [INFO] [1733814784.165119953] [dynamixel_hardware_interface]: Revolute to Prismatic gripper conversion enabled.
[ros2_control_node-1] Succeeded to open the port!
[ros2_control_node-1] Succeeded to change the [1000000] baudrate!
[ros2_control_node-1] [ID:011] Request ping	 - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [ID:012] Request ping	 - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [ID:013] Request ping	 - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [ID:014] Request ping	 - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [ID:015] Request ping	 - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [INFO] [1733814784.172855510] [dynamixel_hardware_interface]: Trying to connect to the communication port...
[ros2_control_node-1] [INFO] [1733814784.172904554] [dynamixel_hardware_interface]: $$$$$ Init Dxl Items
[ros2_control_node-1] [INFO] [1733814784.174263837] [dynamixel_hardware_interface]: [ID:11] item_name:Drive Mode	data:0
[ros2_control_node-1] [INFO] [1733814784.175202777] [dynamixel_hardware_interface]: [ID:11] item_name:Position D Gain	data:100
[ros2_control_node-1] [INFO] [1733814784.176189566] [dynamixel_hardware_interface]: [ID:11] item_name:Position I Gain	data:100
[ros2_control_node-1] [INFO] [1733814784.177218657] [dynamixel_hardware_interface]: [ID:11] item_name:Position P Gain	data:800
[ros2_control_node-1] [INFO] [1733814784.178201814] [dynamixel_hardware_interface]: [ID:12] item_name:Drive Mode	data:0
[ros2_control_node-1] [INFO] [1733814784.179188157] [dynamixel_hardware_interface]: [ID:12] item_name:Position D Gain	data:100
[ros2_control_node-1] [INFO] [1733814784.180215312] [dynamixel_hardware_interface]: [ID:12] item_name:Position I Gain	data:100
[ros2_control_node-1] [INFO] [1733814784.181209639] [dynamixel_hardware_interface]: [ID:12] item_name:Position P Gain	data:800
[ros2_control_node-1] [INFO] [1733814784.182195348] [dynamixel_hardware_interface]: [ID:13] item_name:Drive Mode	data:0
[ros2_control_node-1] [INFO] [1733814784.183204690] [dynamixel_hardware_interface]: [ID:13] item_name:Position D Gain	data:100
[ros2_control_node-1] [INFO] [1733814784.184192489] [dynamixel_hardware_interface]: [ID:13] item_name:Position I Gain	data:100
[ros2_control_node-1] [INFO] [1733814784.185186500] [dynamixel_hardware_interface]: [ID:13] item_name:Position P Gain	data:800
[ros2_control_node-1] [INFO] [1733814784.186251591] [dynamixel_hardware_interface]: [ID:14] item_name:Drive Mode	data:0
[ros2_control_node-1] [INFO] [1733814784.187186969] [dynamixel_hardware_interface]: [ID:14] item_name:Position D Gain	data:100
[ros2_control_node-1] [INFO] [1733814784.188187523] [dynamixel_hardware_interface]: [ID:14] item_name:Position I Gain	data:100
[ros2_control_node-1] [INFO] [1733814784.189248186] [dynamixel_hardware_interface]: [ID:14] item_name:Position P Gain	data:800
[ros2_control_node-1] [INFO] [1733814784.189281693] [dynamixel_hardware_interface]: $$$$$ Init Dxl Read Items
[ros2_control_node-1] Dynamixel Read Type : sync read
[ros2_control_node-1] ID : 11, 12, 13, 14, 15, 
[ros2_control_node-1] Read items : 	Present Position	Present VelocityPresent Current	Torque Enable	Present Input Voltage
[ros2_control_node-1] set sync read (indirect addr) : addr 224, size 13
[ros2_control_node-1] Success to set SyncRead handler using indirect address
[ros2_control_node-1] [INFO] [1733814784.255333410] [dynamixel_hardware_interface]: $$$$$ Init Dxl Write Items
[ros2_control_node-1] Dynamixel Write Type : sync write
[ros2_control_node-1] ID : 11, 12, 13, 14, 15, 
[ros2_control_node-1] Write items : 	Goal Position
[ros2_control_node-1] set sync write (indirect addr) : addr 634, size 4
[ros2_control_node-1] Success to set SyncWrite handler using indirect address
[ros2_control_node-1] [INFO] [1733814784.285087764] [resource_manager]: Successful initialization of hardware 'OpenManipulatorXSystem'
[ros2_control_node-1] [INFO] [1733814784.285623329] [resource_manager]: 'configure' hardware 'OpenManipulatorXSystem' 
[ros2_control_node-1] [INFO] [1733814784.285649762] [resource_manager]: Successful 'configure' of hardware 'OpenManipulatorXSystem'
[ros2_control_node-1] [INFO] [1733814784.285677277] [resource_manager]: 'activate' hardware 'OpenManipulatorXSystem' 
[ros2_control_node-1] [INFO] [1733814784.288399302] [dynamixel_hardware_interface]: Sync joint state to command (position, 3.25354 <- position, 3.25354
[ros2_control_node-1] [INFO] [1733814784.288484144] [dynamixel_hardware_interface]: Sync joint state to command (position, -22.5879 <- position, -22.5879
[ros2_control_node-1] [INFO] [1733814784.288522542] [dynamixel_hardware_interface]: Sync joint state to command (position, 48.5393 <- position, 48.5393
[ros2_control_node-1] [INFO] [1733814784.288556311] [dynamixel_hardware_interface]: Sync joint state to command (position, 59.4431 <- position, 59.4431
[ros2_control_node-1] [INFO] [1733814784.288587808] [dynamixel_hardware_interface]: Sync joint state to command (position, 1.08561 <- position, 1.08561
[ros2_control_node-1] [INFO] [1733814784.288619773] [dynamixel_hardware_interface]: Sync joint state to command (position, 0 <- position, 0
[spawner-3] [INFO] [1733814784.344387122] [spawner_joint_state_broadcaster]: waiting for service /controller_manager/list_controllers to become available...
[ros2_control_node-1] [ID:011] Torque ON
[ros2_control_node-1] [ID:012] Torque ON
[ros2_control_node-1] [ID:013] Torque ON
[ros2_control_node-1] [ID:014] Torque ON
[ros2_control_node-1] [ID:015] Torque ON
[ros2_control_node-1] [INFO] [1733814784.794363518] [dynamixel_hardware_interface]: Dynamixel Hardware Start!
[ros2_control_node-1] [INFO] [1733814784.794583503] [resource_manager]: Successful 'activate' of hardware 'OpenManipulatorXSystem'
[ros2_control_node-1] [INFO] [1733814784.844187956] [controller_manager]: update rate is 1000 Hz
[ros2_control_node-1] [INFO] [1733814784.844239126] [controller_manager]: Spawning controller_manager RT thread with scheduler priority: 50
[ros2_control_node-1] [WARN] [1733814784.847602761] [controller_manager]: No real-time kernel detected on this system. See [https://control.ros.org/master/doc/ros2_control/controller_manager/doc/userdoc.html] for details on how to enable realtime scheduling.
[ros2_control_node-1] [INFO] [1733814784.864748196] [controller_manager]: Loading controller 'joint_state_broadcaster'
[spawner-3] [INFO] [1733814784.872066996] [spawner_joint_state_broadcaster]: Loaded joint_state_broadcaster
[ros2_control_node-1] [INFO] [1733814784.872576377] [controller_manager]: Configuring controller 'joint_state_broadcaster'
[ros2_control_node-1] [INFO] [1733814784.872671446] [joint_state_broadcaster]: 'joints' or 'interfaces' parameter is empty. All available state interfaces will be published
[spawner-3] [INFO] [1733814784.890559256] [spawner_joint_state_broadcaster]: Configured and activated joint_state_broadcaster
[INFO] [spawner-3]: process has finished cleanly [pid 3070]
[INFO] [spawner-4]: process started with pid [3114]
[INFO] [spawner-5]: process started with pid [3116]
[ros2_control_node-1] [INFO] [1733814785.561511632] [controller_manager]: Loading controller 'arm_controller'
[ros2_control_node-1] [WARN] [1733814785.574916138] [arm_controller]: [Deprecated]: "allow_nonzero_velocity_at_trajectory_end" is set to true. The default behavior will change to false.
[ros2_control_node-1] [INFO] [1733814785.576633589] [controller_manager]: Loading controller 'gripper_controller'
[spawner-5] [INFO] [1733814785.598697696] [spawner_arm_controller]: Loaded arm_controller
[ros2_control_node-1] [INFO] [1733814785.599380288] [controller_manager]: Configuring controller 'arm_controller'
[ros2_control_node-1] [INFO] [1733814785.599545696] [arm_controller]: No specific joint names are used for command interfaces. Using 'joints' parameter.
[ros2_control_node-1] [INFO] [1733814785.599572347] [arm_controller]: Command interfaces are [position] and state interfaces are [position velocity].
[ros2_control_node-1] [INFO] [1733814785.599598355] [arm_controller]: Using 'splines' interpolation method.
[spawner-4] [INFO] [1733814785.600233495] [spawner_gripper_controller]: Loaded gripper_controller
[ros2_control_node-1] [INFO] [1733814785.600325312] [arm_controller]: Controller state will be published at 200.00 Hz.
[ros2_control_node-1] [INFO] [1733814785.605748626] [arm_controller]: Action status changes will be monitored at 20.00 Hz.
[ros2_control_node-1] [INFO] [1733814785.609463352] [controller_manager]: Configuring controller 'gripper_controller'
[ros2_control_node-1] [INFO] [1733814785.609542143] [gripper_controller]: Action status changes will be monitored at 20Hz.
[spawner-5] [INFO] [1733814785.619695267] [spawner_arm_controller]: Configured and activated arm_controller
[spawner-4] [INFO] [1733814785.626031382] [spawner_gripper_controller]: Configured and activated gripper_controller
[INFO] [spawner-4]: process has finished cleanly [pid 3114]
[INFO] [spawner-5]: process has finished cleanly [pid 3116]
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
