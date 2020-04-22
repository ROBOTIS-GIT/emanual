---
layout: archive
lang: en
ref: ros_2
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_bringup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 31
---

<div style="counter-reset: h1 16"></div>

# [[ROS 2] Bringup](#ros-2-bringup)

## [Bringup TurtleBot3](#bringup-turtlebot3)

**WARNING** :Do not apply this instruction to Remote PC. Use SBC. 
{: .notice--warning}

**[TurtleBot3]**

1. Open a terminal on **TurtleBot3**.

2. Launch a model of your TurtleBot3 including node of `robot_state_publisher` and `turtlebot3_node`.
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_bringup robot.launch.py
```
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

2. The following will appear on the terminal window.
```bash
[INFO] [launch]: All log files can be found below /home/ubuntu/.ros/log/2019-08-19-01-24-19-009803-ubuntu-15310
[INFO] [launch]: Default logging verbosity is set to INFO
urdf_file_name : turtlebot3_burger.urdf
[INFO] [robot_state_publisher-1]: process started with pid [15320]
[INFO] [hlds_laser_publisher-2]: process started with pid [15321]
[INFO] [turtlebot3_ros-3]: process started with pid [15322]
[robot_state_publisher-1] Initialize urdf model from file: /home/ubuntu/turtlebot_ws/install/turtlebot3_description/share/turtlebot3_description/urdf/turtlebot3_burger.urdf
[robot_state_publisher-1] Parsing robot urdf xml string.
[robot_state_publisher-1] Link base_link had 5 children
[robot_state_publisher-1] Link caster_back_link had 0 children
[robot_state_publisher-1] Link imu_link had 0 children
[robot_state_publisher-1] Link base_scan had 0 children
[robot_state_publisher-1] Link wheel_left_link had 0 children
[robot_state_publisher-1] Link wheel_right_link had 0 children
[robot_state_publisher-1] got segment base_footprint
[robot_state_publisher-1] got segment base_link
[robot_state_publisher-1] got segment base_scan
[robot_state_publisher-1] got segment caster_back_link
[robot_state_publisher-1] got segment imu_link
[robot_state_publisher-1] got segment wheel_left_link
[robot_state_publisher-1] got segment wheel_right_link
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Init TurtleBot3 Node Main
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Init DynamixelSDKWrapper
[turtlebot3_ros-3] [INFO] [DynamixelSDKWrapper]: Succeeded to open the port(/dev/ttyACM0)!
[turtlebot3_ros-3] [INFO] [DynamixelSDKWrapper]: Succeeded to change the baudrate!
[robot_state_publisher-1] Adding fixed segment from base_footprint to base_link
[robot_state_publisher-1] Adding fixed segment from base_link to caster_back_link
[robot_state_publisher-1] Adding fixed segment from base_link to imu_link
[robot_state_publisher-1] Adding fixed segment from base_link to base_scan
[robot_state_publisher-1] Adding moving segment from base_link to wheel_left_link
[robot_state_publisher-1] Adding moving segment from base_link to wheel_right_link
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Start Calibration of Gyro
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Calibration End
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Add Motors
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Add Wheels
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Add Sensors
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create battery state publisher
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create imu publisher
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create sensor state publisher
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create joint state publisher
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Add Devices
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create motor power server
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create reset server
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create sound server
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Run!
[turtlebot3_ros-3] [INFO] [diff_drive_controller]: Init Odometry
[turtlebot3_ros-3] [INFO] [diff_drive_controller]: Run!
```

3. After then, you can check topic and service list as shown below  
  **Topic**
  ```bash
  $ ros2 topic list
  /battery_state
  /cmd_vel
  /imu
  /joint_states
  /magnetic_field
  /odom
  /parameter_events
  /robot_description
  /rosout
  /scan
  /sensor_state
  /tf
  /tf_static
  ```
  **Service List**
  ```bash
  $ ros2 service list
  /diff_drive_controller/describe_parameters
  /diff_drive_controller/get_parameter_types
  /diff_drive_controller/get_parameters
  /diff_drive_controller/list_parameters
  /diff_drive_controller/set_parameters
  /diff_drive_controller/set_parameters_atomically
  /hlds_laser_publisher/describe_parameters
  /hlds_laser_publisher/get_parameter_types
  /hlds_laser_publisher/get_parameters
  /hlds_laser_publisher/list_parameters
  /hlds_laser_publisher/set_parameters
  /hlds_laser_publisher/set_parameters_atomically
  /launch_ros/describe_parameters
  /launch_ros/get_parameter_types
  /launch_ros/get_parameters
  /launch_ros/list_parameters
  /launch_ros/set_parameters
  /launch_ros/set_parameters_atomically
  /motor_power
  /reset
  /sound
  /turtlebot3_node/describe_parameters
  /turtlebot3_node/get_parameter_types
  /turtlebot3_node/get_parameters
  /turtlebot3_node/list_parameters
  /turtlebot3_node/set_parameters
  /turtlebot3_node/set_parameters_atomically
  ```

## [Load TurtleBot3 on Rviz2](#load-a-turtlebot3-on-rviz2)

1. [Bring up TurtleBot3](#bringup-turtlebot3)
2. Launch robot state publisher and Run RViz on **Remote PC**.
  ```bash
  $ ros2 launch turtlebot3_bringup rviz2.launch.py
  ```
  ![](/assets/images/platform/turtlebot3/ros2/platform_teleop.png)
