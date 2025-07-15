After running this section, software controller that controls the OpenMANIPULATOR-X will be launched and each joint of the OpenMANIPULATOR-X will be locked (Torque On).  

#### Option 1: Using Docker

{% capture notice_01 %}
**NOTE**: 
If you are using the Docker environment, make sure you are inside the container before running these commands.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

```bash
./docker/container.sh enter
```

- When operating with `U2D2`  
Close all terminal and enter the command below in each new terminal.
```bash
$ ros2 launch open_manipulator_bringup omx.launch.py
```

- When operating with `OpenCR`  
Close all terminal and enter the command below in the new terminal.
```bash
$ ros2 launch open_manipulator_bringup omx.launch.py port_name:=/dev/ttyACM0
```

#### Option 2: Host Installation

- When operating with `U2D2`  
Close all terminal and enter the command below in each new terminal.
```bash
$ ros2 launch open_manipulator_bringup omx.launch.py
```

- When operating with `OpenCR`  
Close all terminal and enter the command below in the new terminal.
```bash
$ ros2 launch open_manipulator_bringup omx.launch.py port_name:=/dev/ttyACM0
```

{% capture warning_01 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. If joints are set inappropriately, OpenMANIPULATOR-X might not start operating.
The picture of OpenMANIPULATOR-X below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joint to match the following picture when DYNAMIXEL torque is not enabled.
        
<img src="/assets/images/platform/openmanipulator_x/real_omx_init_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

Launch result on the terminal will look like below.  

```
$ ros2 launch open_manipulator_bringup omx.launch.py

[INFO] [launch]: All log files can be found below
[INFO] [launch]: Default logging verbosity is set to INFO
[INFO] [ros2_control_node-1]: process started with pid [507]
[INFO] [spawner-2]: process started with pid [508]
[INFO] [robot_state_publisher-3]: process started with pid [509]
[robot_state_publisher-3] [INFO] [1751511730.728706299] [robot_state_publisher]: Robot initialized
[ros2_control_node-1] [INFO] [1751511730.747902102] [controller_manager]: Using Steady (Monotonic) clock for triggering controller manager cycles.
[ros2_control_node-1] [INFO] [1751511730.750710518] [controller_manager]: Subscribing to '/robot_description' topic for robot description.
[ros2_control_node-1] [INFO] [1751511730.761789183] [controller_manager]: update rate is 100 Hz
[ros2_control_node-1] [INFO] [1751511730.761860000] [controller_manager]: Spawning controller_manager RT thread with scheduler priority: 50
[ros2_control_node-1] [INFO] [1751511730.761941839] [controller_manager]: Successful set up FIFO RT scheduling policy with priority 50.
[spawner-2] [INFO] [1751511730.877470892] [spawner_arm_controller]: waiting for service /controller_manager/list_controllers to become available...
[ros2_control_node-1] [INFO] [1751511730.884559092] [controller_manager]: Received robot description from topic.
[ros2_control_node-1] [INFO] [1751511730.888920790] [controller_manager]: Loading hardware 'OMXSystem' 
[ros2_control_node-1] [INFO] [1751511730.893746698] [controller_manager]: Loaded hardware 'OMXSystem' from plugin 'dynamixel_hardware_interface/DynamixelHardware'
[ros2_control_node-1] [INFO] [1751511730.893797909] [controller_manager]: Initialize hardware 'OMXSystem' 
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
[ros2_control_node-1] [INFO] [1751511730.893931204] [dynamixel_hardware_interface]: Torque will be disabled during initialization if it is enabled at initialization.
[ros2_control_node-1] [INFO] [1751511730.893939425] [dynamixel_hardware_interface]: port_name /dev/ttyUSB0 / baudrate 1000000
[ros2_control_node-1] Dynamixel Information File List.
[ros2_control_node-1] num: 220, name: omy_hat.model
[ros2_control_node-1] num: 230, name: omy_end.model
[ros2_control_node-1] num: 231, name: omy_end_rh_p12_rn.model
[ros2_control_node-1] num: 350, name: xl320.model
[ros2_control_node-1] num: 536, name: sensorxel_joy.model
[ros2_control_node-1] num: 537, name: ffw_g40_imu.model
[ros2_control_node-1] num: 600, name: sensorxel_joy.model
[ros2_control_node-1] num: 601, name: ffw_g10_led.model
[ros2_control_node-1] num: 602, name: ffw_g10_rcu.model
[ros2_control_node-1] num: 620, name: ffw_sg2_steer_1.model
[ros2_control_node-1] num: 621, name: ffw_sg2_steer_2.model
[ros2_control_node-1] num: 622, name: ffw_sg2_steer_3.model
[ros2_control_node-1] num: 623, name: ffw_sg2_drive_1.model
[ros2_control_node-1] num: 624, name: ffw_sg2_drive_2.model
[ros2_control_node-1] num: 625, name: ffw_sg2_drive_3.model
[ros2_control_node-1] num: 1000, name: xh430_w350.model
[ros2_control_node-1] num: 1001, name: xd430_t350.model
[ros2_control_node-1] num: 1010, name: xh430_w210.model
[ros2_control_node-1] num: 1011, name: xd430_t210.model
[ros2_control_node-1] num: 1020, name: xm430_w350.model
[ros2_control_node-1] num: 1030, name: xm430_w210.model
[ros2_control_node-1] num: 1040, name: xh430_v350.model
[ros2_control_node-1] num: 1050, name: xh430_v210.model
[ros2_control_node-1] num: 1060, name: xl430_w250.model
[ros2_control_node-1] num: 1070, name: xc430_w150.model
[ros2_control_node-1] num: 1070, name: xc430_w150.model
[ros2_control_node-1] num: 1080, name: xc430_w240.model
[ros2_control_node-1] num: 1080, name: xc430_w240.model
[ros2_control_node-1] num: 1090, name: 2xl430_w250.model
[ros2_control_node-1] num: 1100, name: xh540_w270.model
[ros2_control_node-1] num: 1101, name: xd540_t270.model
[ros2_control_node-1] num: 1110, name: xh540_w150.model
[ros2_control_node-1] num: 1111, name: xd540_t150.model
[ros2_control_node-1] num: 1120, name: xm540_w270.model
[ros2_control_node-1] num: 1130, name: xm540_w150.model
[ros2_control_node-1] num: 1140, name: xh540_v270.model
[ros2_control_node-1] num: 1150, name: xh540_v150.model
[ros2_control_node-1] num: 1160, name: 2xc430_w250.model
[ros2_control_node-1] num: 1170, name: xw540_t260.model
[ros2_control_node-1] num: 1180, name: xw540_t140.model
[ros2_control_node-1] num: 1190, name: xl330_m077.model
[ros2_control_node-1] num: 1200, name: xl330_m288.model
[ros2_control_node-1] num: 1210, name: xc330_t181.model
[ros2_control_node-1] num: 1220, name: xc330_t288.model
[ros2_control_node-1] num: 1230, name: xc330_m181.model
[ros2_control_node-1] num: 1240, name: xc330_m288.model
[ros2_control_node-1] num: 1270, name: xw430_t333.model
[ros2_control_node-1] num: 1310, name: xw540_h260.model
[ros2_control_node-1] num: 2000, name: ph42_020_s300.model
[ros2_control_node-1] num: 4000, name: ym070_210_m001.model
[ros2_control_node-1] num: 4020, name: ym070_210_r051.model
[ros2_control_node-1] num: 4030, name: ym070_210_r099.model
[ros2_control_node-1] num: 4050, name: ym070_210_a099.model
[ros2_control_node-1] num: 4120, name: ym080_230_m001.model
[ros2_control_node-1] num: 4130, name: ym080_230_b001.model
[ros2_control_node-1] num: 4140, name: ym080_230_r051.model
[ros2_control_node-1] num: 4150, name: ym080_230_r099.model
[ros2_control_node-1] num: 4170, name: ym080_230_a099.model
[ros2_control_node-1] num: 35074, name: rh_p12_rn.model
[ros2_control_node-1] [INFO] [1751511730.894147174] [dynamixel_hardware_interface]: $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
[ros2_control_node-1] [INFO] [1751511730.894151067] [dynamixel_hardware_interface]: $$$$$ Init Dxl Comm Port
[ros2_control_node-1] [INFO] [1751511730.894153757] [dynamixel_hardware_interface]: Revolute to Prismatic gripper conversion enabled.
[ros2_control_node-1] [INFO] [1751511730.894171984] [dynamixel_hardware_interface]: $$$$$ Init Items for type: controller
[ros2_control_node-1] [INFO] [1751511730.894174743] [dynamixel_hardware_interface]: $$$$$ Init Items for type: virtual_dxl
[ros2_control_node-1] Succeeded to open the port!
[ros2_control_node-1] Succeeded to change the [1000000] baudrate!
[ros2_control_node-1] [ID:011] Request ping      - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [WARN] Model file '/root/ros2_ws/install/dynamixel_hardware_interface/share/dynamixel_hardware_interface/param/dxl_model/xm430_w350.model' doesn't contain torque_constant parameter. Using default value: 1.0
[ros2_control_node-1] [ID:012] Request ping      - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [WARN] Model file '/root/ros2_ws/install/dynamixel_hardware_interface/share/dynamixel_hardware_interface/param/dxl_model/xm430_w350.model' doesn't contain torque_constant parameter. Using default value: 1.0
[ros2_control_node-1] [ID:013] Request ping      - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [WARN] Model file '/root/ros2_ws/install/dynamixel_hardware_interface/share/dynamixel_hardware_interface/param/dxl_model/xm430_w350.model' doesn't contain torque_constant parameter. Using default value: 1.0
[ros2_control_node-1] [ID:014] Request ping      - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [WARN] Model file '/root/ros2_ws/install/dynamixel_hardware_interface/share/dynamixel_hardware_interface/param/dxl_model/xm430_w350.model' doesn't contain torque_constant parameter. Using default value: 1.0
[ros2_control_node-1] [ID:015] Request ping      - Ping succeeded. Dynamixel model number : 1020
[ros2_control_node-1] [WARN] Model file '/root/ros2_ws/install/dynamixel_hardware_interface/share/dynamixel_hardware_interface/param/dxl_model/xm430_w350.model' doesn't contain torque_constant parameter. Using default value: 1.0
[ros2_control_node-1] [INFO] [1751511730.900250607] [dynamixel_hardware_interface]: Trying to connect to the communication port...
[ros2_control_node-1] [InitTorqueStates][ID:011] Current torque state: OFF
[ros2_control_node-1] [InitTorqueStates][ID:012] Current torque state: OFF
[ros2_control_node-1] [InitTorqueStates][ID:013] Current torque state: OFF
[ros2_control_node-1] [InitTorqueStates][ID:014] Current torque state: OFF
[ros2_control_node-1] [InitTorqueStates][ID:015] Current torque state: OFF
[ros2_control_node-1] [INFO] [1751511730.905232373] [dynamixel_hardware_interface]: $$$$$ Init Items for type: dxl
[ros2_control_node-1] [INFO] [1751511730.905347714] [dynamixel_hardware_interface]: [ID:11] item_name:Operating Mode     data:3
[ros2_control_node-1] [INFO] [1751511730.906187489] [dynamixel_hardware_interface]: [ID:11] item_name:Return Delay Time  data:0
[ros2_control_node-1] [INFO] [1751511730.907182981] [dynamixel_hardware_interface]: [ID:11] item_name:Position D Gain    data:100
[ros2_control_node-1] [INFO] [1751511730.908203072] [dynamixel_hardware_interface]: [ID:11] item_name:Position I Gain    data:100
[ros2_control_node-1] [INFO] [1751511730.909194354] [dynamixel_hardware_interface]: [ID:11] item_name:Position P Gain    data:800
[ros2_control_node-1] [INFO] [1751511730.910140678] [dynamixel_hardware_interface]: [ID:11] item_name:Drive Modedata:4
[ros2_control_node-1] [INFO] [1751511730.911139093] [dynamixel_hardware_interface]: [ID:11] item_name:Profile Velocity   data:20
[ros2_control_node-1] [INFO] [1751511730.912117370] [dynamixel_hardware_interface]: [ID:11] item_name:Profile Acceleration       data:10
[ros2_control_node-1] [INFO] [1751511730.913152937] [dynamixel_hardware_interface]: [ID:12] item_name:Operating Mode     data:3
[ros2_control_node-1] [INFO] [1751511730.914154019] [dynamixel_hardware_interface]: [ID:12] item_name:Return Delay Time  data:0
[ros2_control_node-1] [INFO] [1751511730.915441921] [dynamixel_hardware_interface]: [ID:12] item_name:Position D Gain    data:100
[ros2_control_node-1] [INFO] [1751511730.916190531] [dynamixel_hardware_interface]: [ID:12] item_name:Position I Gain    data:100
[ros2_control_node-1] [INFO] [1751511730.917392144] [dynamixel_hardware_interface]: [ID:12] item_name:Position P Gain    data:800
[ros2_control_node-1] [INFO] [1751511730.918170651] [dynamixel_hardware_interface]: [ID:12] item_name:Drive Modedata:4
[ros2_control_node-1] [INFO] [1751511730.919339480] [dynamixel_hardware_interface]: [ID:12] item_name:Profile Velocity   data:20
[ros2_control_node-1] [INFO] [1751511730.920219221] [dynamixel_hardware_interface]: [ID:12] item_name:Profile Acceleration       data:10
[ros2_control_node-1] [INFO] [1751511730.921832480] [dynamixel_hardware_interface]: [ID:13] item_name:Operating Mode     data:3
[ros2_control_node-1] [INFO] [1751511730.923520106] [dynamixel_hardware_interface]: [ID:13] item_name:Return Delay Time  data:0
[ros2_control_node-1] [INFO] [1751511730.924213100] [dynamixel_hardware_interface]: [ID:13] item_name:Position D Gain    data:100
[ros2_control_node-1] [INFO] [1751511730.925160103] [dynamixel_hardware_interface]: [ID:13] item_name:Position I Gain    data:100
[ros2_control_node-1] [INFO] [1751511730.926225284] [dynamixel_hardware_interface]: [ID:13] item_name:Position P Gain    data:800
[ros2_control_node-1] [INFO] [1751511730.927171515] [dynamixel_hardware_interface]: [ID:13] item_name:Drive Modedata:4
[ros2_control_node-1] [INFO] [1751511730.928279270] [dynamixel_hardware_interface]: [ID:13] item_name:Profile Velocity   data:20
[ros2_control_node-1] [INFO] [1751511730.929607782] [dynamixel_hardware_interface]: [ID:13] item_name:Profile Acceleration       data:10
[ros2_control_node-1] [INFO] [1751511730.930252442] [dynamixel_hardware_interface]: [ID:14] item_name:Operating Mode     data:3
[ros2_control_node-1] [INFO] [1751511730.931156296] [dynamixel_hardware_interface]: [ID:14] item_name:Return Delay Time  data:0
[ros2_control_node-1] [INFO] [1751511730.932183611] [dynamixel_hardware_interface]: [ID:14] item_name:Position D Gain    data:100
[ros2_control_node-1] [INFO] [1751511730.933156544] [dynamixel_hardware_interface]: [ID:14] item_name:Position I Gain    data:100
[ros2_control_node-1] [INFO] [1751511730.934184448] [dynamixel_hardware_interface]: [ID:14] item_name:Position P Gain    data:800
[ros2_control_node-1] [INFO] [1751511730.935138086] [dynamixel_hardware_interface]: [ID:14] item_name:Drive Modedata:4
[ros2_control_node-1] [INFO] [1751511730.936149154] [dynamixel_hardware_interface]: [ID:14] item_name:Profile Velocity   data:20
[ros2_control_node-1] [INFO] [1751511730.937148882] [dynamixel_hardware_interface]: [ID:14] item_name:Profile Acceleration       data:10
[ros2_control_node-1] [INFO] [1751511730.938194626] [dynamixel_hardware_interface]: [ID:15] item_name:Operating Mode     data:5
[ros2_control_node-1] [INFO] [1751511730.939251278] [dynamixel_hardware_interface]: [ID:15] item_name:Goal Current       data:200
[ros2_control_node-1] [INFO] [1751511730.940347115] [dynamixel_hardware_interface]: [ID:15] item_name:Return Delay Time  data:0
[ros2_control_node-1] [INFO] [1751511730.941168094] [dynamixel_hardware_interface]: [ID:15] item_name:Drive Modedata:4
[ros2_control_node-1] [INFO] [1751511730.942196843] [dynamixel_hardware_interface]: [ID:15] item_name:Profile Velocity   data:20
[ros2_control_node-1] [INFO] [1751511730.943168462] [dynamixel_hardware_interface]: [ID:15] item_name:Profile Acceleration       data:10
[ros2_control_node-1] [INFO] [1751511730.944137719] [dynamixel_hardware_interface]: $$$$$ Init Items for type: sensor
[ros2_control_node-1] [INFO] [1751511730.944197533] [dynamixel_hardware_interface]: $$$$$ Init Dxl Read Items
[ros2_control_node-1] Dynamixel Read Type : sync read
[ros2_control_node-1] ID : 11, 12, 13, 14, 15, 
[ros2_control_node-1] Read items :      Present Position        Present Velocity        Present Current
[ros2_control_node-1] set fast sync read (indirect addr) : addr 634, size 10
[ros2_control_node-1] FastSyncRead handler set up successfully.
[ros2_control_node-1] Success to set SyncRead handler using indirect address
[ros2_control_node-1] [INFO] [1751511730.995224936] [dynamixel_hardware_interface]: $$$$$ Init Dxl Write Items
[ros2_control_node-1] Dynamixel Write Type : sync write
[ros2_control_node-1] ID : 11, 12, 13, 14, 15, 
[ros2_control_node-1] Write items :     Goal Position
[ros2_control_node-1] set sync write (indirect addr) : addr 224, size 4
[ros2_control_node-1] Success to set SyncWrite handler using indirect address
[ros2_control_node-1] [INFO] [1751511731.020262878] [controller_manager]: Successful initialization of hardware 'OMXSystem'
[ros2_control_node-1] [INFO] [1751511731.020618988] [resource_manager]: 'configure' hardware 'OMXSystem' 
[ros2_control_node-1] [INFO] [1751511731.020631268] [resource_manager]: Successful 'configure' of hardware 'OMXSystem'
[ros2_control_node-1] [INFO] [1751511731.020641833] [resource_manager]: 'activate' hardware 'OMXSystem' 
[ros2_control_node-1] [INFO] [1751511731.022185727] [dynamixel_hardware_interface]: Sync joint state to command (joint: joint1, position, -0.0659612 <- position, -0.0659612
[ros2_control_node-1] [INFO] [1751511731.022225647] [dynamixel_hardware_interface]: Sync joint state to command (joint: joint2, position, -2.0632 <- position, -2.0632
[ros2_control_node-1] [INFO] [1751511731.022240619] [dynamixel_hardware_interface]: Sync joint state to command (joint: joint3, position, 1.48408 <- position, 1.48408
[ros2_control_node-1] [INFO] [1751511731.022253290] [dynamixel_hardware_interface]: Sync joint state to command (joint: joint4, position, 0.658399 <- position, 0.658399
[ros2_control_node-1] [INFO] [1751511731.022265799] [dynamixel_hardware_interface]: Sync joint state to command (joint: gripper_left_joint, position, -0.00975459 <- position, -0.00975459
[ros2_control_node-1] [INFO] [1751511731.022335076] [dynamixel_hardware_interface]: Enabling torque for Dynamixels
[ros2_control_node-1] [ID:011] Torque ON
[ros2_control_node-1] [ID:012] Torque ON
[ros2_control_node-1] [ID:013] Torque ON
[ros2_control_node-1] [ID:014] Torque ON
[ros2_control_node-1] [ID:015] Torque ON
[ros2_control_node-1] [INFO] [1751511731.027148696] [dynamixel_hardware_interface]: Dynamixel Hardware Start!
[ros2_control_node-1] [INFO] [1751511731.027197173] [resource_manager]: Successful 'activate' of hardware 'OMXSystem'
[ros2_control_node-1] [INFO] [1751511731.027289507] [controller_manager]: Resource Manager has been successfully initialized. Starting Controller Manager services...
[ros2_control_node-1] [INFO] [1751511731.131317160] [controller_manager]: Loading controller : 'arm_controller' of type 'joint_trajectory_controller/JointTrajectoryController'
[ros2_control_node-1] [INFO] [1751511731.131411607] [controller_manager]: Loading controller 'arm_controller'
[ros2_control_node-1] [INFO] [1751511731.138269320] [controller_manager]: Controller 'arm_controller' node arguments: --ros-args --params-file /tmp/launch_params_6_4c_95z --params-file /root/ros2_ws/install/open_manipulator_bringup/share/open_manipulator_bringup/config/omx/hardware_controller_manager.yaml 
[spawner-2] [INFO] [1751511731.166336939] [spawner_arm_controller]: Loaded arm_controller
[ros2_control_node-1] [INFO] [1751511731.167789273] [controller_manager]: Configuring controller: 'arm_controller'
[ros2_control_node-1] [INFO] [1751511731.168277922] [arm_controller]: No specific joint names are used for command interfaces. Using 'joints' parameter.
[ros2_control_node-1] [INFO] [1751511731.168374878] [arm_controller]: Command interfaces are [position] and state interfaces are [position velocity].
[ros2_control_node-1] [INFO] [1751511731.168456153] [arm_controller]: Using 'splines' interpolation method.
[ros2_control_node-1] [INFO] [1751511731.177301345] [arm_controller]: Goals with partial set of joints are allowed
[ros2_control_node-1] [INFO] [1751511731.177343642] [arm_controller]: Action status changes will be monitored at 20.00 Hz.
[ros2_control_node-1] [INFO] [1751511731.186044591] [controller_manager]: Activating controllers: [ arm_controller ]
[ros2_control_node-1] [INFO] [1751511731.195066882] [controller_manager]: Successfully switched controllers!
[spawner-2] [INFO] [1751511731.207877250] [spawner_arm_controller]: Configured and activated arm_controller
[ros2_control_node-1] [INFO] [1751511731.209499839] [controller_manager]: Loading controller : 'gripper_controller' of type 'position_controllers/GripperActionController'
[ros2_control_node-1] [INFO] [1751511731.209555286] [controller_manager]: Loading controller 'gripper_controller'
[ros2_control_node-1] [INFO] [1751511731.212216025] [controller_manager]: Controller 'gripper_controller' node arguments: --ros-args --params-file /tmp/launch_params_6_4c_95z --params-file /root/ros2_ws/install/open_manipulator_bringup/share/open_manipulator_bringup/config/omx/hardware_controller_manager.yaml 
[ros2_control_node-1] [WARN] [1751511731.226791266] [gripper_controller]: [Deprecated]: the `position_controllers/GripperActionController` and `effort_controllers::GripperActionController` controllers are replaced by 'parallel_gripper_controllers/GripperActionController' controller
[spawner-2] [INFO] [1751511731.236574535] [spawner_arm_controller]: Loaded gripper_controller
[ros2_control_node-1] [INFO] [1751511731.237004610] [controller_manager]: Configuring controller: 'gripper_controller'
[ros2_control_node-1] [INFO] [1751511731.237095162] [gripper_controller]: Action status changes will be monitored at 20.000000 Hz.
[ros2_control_node-1] [INFO] [1751511731.245319729] [controller_manager]: Activating controllers: [ gripper_controller ]
[ros2_control_node-1] [INFO] [1751511731.259740129] [controller_manager]: Successfully switched controllers!
[spawner-2] [INFO] [1751511731.266792295] [spawner_arm_controller]: Configured and activated gripper_controller
[ros2_control_node-1] [INFO] [1751511731.268632209] [controller_manager]: Loading controller : 'joint_state_broadcaster' of type 'joint_state_broadcaster/JointStateBroadcaster'
[ros2_control_node-1] [INFO] [1751511731.268729088] [controller_manager]: Loading controller 'joint_state_broadcaster'
[ros2_control_node-1] [INFO] [1751511731.272768326] [controller_manager]: Controller 'joint_state_broadcaster' node arguments: --ros-args --params-file /tmp/launch_params_6_4c_95z --params-file /root/ros2_ws/install/open_manipulator_bringup/share/open_manipulator_bringup/config/omx/hardware_controller_manager.yaml 
[spawner-2] [INFO] [1751511731.297833178] [spawner_arm_controller]: Loaded joint_state_broadcaster
[ros2_control_node-1] [INFO] [1751511731.298434771] [controller_manager]: Configuring controller: 'joint_state_broadcaster'
[ros2_control_node-1] [INFO] [1751511731.298554879] [joint_state_broadcaster]: 'joints' or 'interfaces' parameter is empty. All available state interfaces will be published
[ros2_control_node-1] [INFO] [1751511731.316553372] [controller_manager]: Activating controllers: [ joint_state_broadcaster ]
[ros2_control_node-1] [INFO] [1751511731.324710178] [controller_manager]: Successfully switched controllers!
[spawner-2] [INFO] [1751511731.338744310] [spawner_arm_controller]: Configured and activated joint_state_broadcaster
[INFO] [spawner-2]: process has finished cleanly [pid 508]
[INFO] [joint_trajectory_executor-4]: process started with pid [569]
[joint_trajectory_executor-4] [INFO] [1751511731.696890011] [joint_trajectory_executor]: Waiting for action server...
[joint_trajectory_executor-4] [INFO] [1751511731.697313456] [joint_trajectory_executor]: Action server available
[joint_trajectory_executor-4] [INFO] [1751511731.697640734] [joint_trajectory_executor]: Using action topic: /arm_controller/follow_joint_trajectory
[joint_trajectory_executor-4] [INFO] [1751511731.697971862] [joint_trajectory_executor]: Using joint states topic: /joint_states
[joint_trajectory_executor-4] [INFO] [1751511731.698562007] [joint_trajectory_executor]: Moving to step 0 target positions
[joint_trajectory_executor-4] [INFO] [1751511731.700120844] [joint_trajectory_executor]: Sending goal...
[ros2_control_node-1] [INFO] [1751511731.700814287] [arm_controller]: Received new action goal
[ros2_control_node-1] [INFO] [1751511731.700872911] [arm_controller]: Accepted new action goal
[joint_trajectory_executor-4] [INFO] [1751511731.701565531] [joint_trajectory_executor]: Goal accepted :)
[joint_trajectory_executor-4] [INFO] [1751511734.495847960] [joint_trajectory_executor]: 🎯 Step 0 completed!
[joint_trajectory_executor-4] [INFO] [1751511734.504799146] [joint_trajectory_executor]: All steps completed!
[INFO] [joint_trajectory_executor-4]: process has finished cleanly [pid 569]
[ros2_control_node-1] [INFO] [1751511734.694509356] [arm_controller]: Goal reached, success!
```

{% capture notice_01 %}
**TIP**:
- If you can't load DYNAMIXEL, please check firmware to use ROBOTIS software ([DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-update))
<!-- - If you would like to change DYNAMIXEL ID, please check [`open_manipulator_x.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/ros2/open_manipulator_x_libs/src/open_manipulator_x.cpp#L40) in the open_manipulator_lib folder. The default ID is **11, 12, 13, 14** for joints and **15** for the gripper -->
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div> 