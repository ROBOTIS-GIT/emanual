
**NOTE**: This application must be set firmware version `1.2.1` or higher.
{: .notice--info}

1. **[Remote PC]** Run roscore.
```bash
$ roscore
```

2. Bringup multiple turtlebot3s with different namespace. We recommend the namespace includes common words such as `tb3_0`, `tb3_1` or `my_robot_0`, `my_robot_1`

   - **[TurtleBot(tb3_0)]** Bring up basic packages with `ROS NAMESPACE` for nodes, `multi_robot_name` for tf prefix and `set_lidar_frame_id` for lidar frame id. This parameters must be the same.
   ```bash
   $ ROS_NAMESPACE=tb3_0 roslaunch turtlebot3_bringup turtlebot3_robot.launch multi_robot_name:="tb3_0" set_lidar_frame_id:="tb3_0/base_scan"
   ```

   - **[TurtleBot(tb3_1)]** Bring up basic packages with `ROS NAMESPACE` for nodes, `multi_robot_name` for tf prefix and `set_lidar_frame_id` for lidar frame id. This parameters must be the same but different other robots.
   ```bash
   $ ROS_NAMESPACE=tb3_1 roslaunch turtlebot3_bringup turtlebot3_robot.launch multi_robot_name:="tb3_1" set_lidar_frame_id:="tb3_1/base_scan"
   ```

3. Then the terminal you launched `tb3_0` will represents below messages. You can watch TF messages have prefix `tb3_0`
   ```bash
   SUMMARY
   ========

   PARAMETERS
    * /rosdistro: kinetic
    * /rosversion: 1.12.13
    * /tb3_0/turtlebot3_core/baud: 115200
    * /tb3_0/turtlebot3_core/port: /dev/ttyACM0
    * /tb3_0/turtlebot3_core/tf_prefix: tb3_0
    * /tb3_0/turtlebot3_lds/frame_id: tb3_0/base_scan
    * /tb3_0/turtlebot3_lds/port: /dev/ttyUSB0

   NODES
     /tb3_0/
       turtlebot3_core (rosserial_python/serial_node.py)
       turtlebot3_diagnostics (turtlebot3_bringup/turtlebot3_diagnostics)
       turtlebot3_lds (hls_lfcd_lds_driver/hlds_laser_publisher)

   ROS_MASTER_URI=http://192.168.1.2:11311

   process[tb3_0/turtlebot3_core-1]: started with pid [1903]
   process[tb3_0/turtlebot3_lds-2]: started with pid [1904]
   process[tb3_0/turtlebot3_diagnostics-3]: started with pid [1905]
   [INFO] [1531356275.722408]: ROS Serial Python Node
   [INFO] [1531356275.796070]: Connecting to /dev/ttyACM0 at 115200 baud
   [INFO] [1531356278.300310]: Note: publish buffer size is 1024 bytes
   [INFO] [1531356278.303516]: Setup publisher on sensor_state [turtlebot3_msgs/SensorState]
   [INFO] [1531356278.323360]: Setup publisher on version_info [turtlebot3_msgs/VersionInfo]
   [INFO] [1531356278.392212]: Setup publisher on imu [sensor_msgs/Imu]
   [INFO] [1531356278.414980]: Setup publisher on cmd_vel_rc100 [geometry_msgs/Twist]
   [INFO] [1531356278.449703]: Setup publisher on odom [nav_msgs/Odometry]
   [INFO] [1531356278.466352]: Setup publisher on joint_states [sensor_msgs/JointState]
   [INFO] [1531356278.485605]: Setup publisher on battery_state [sensor_msgs/BatteryState]
   [INFO] [1531356278.500973]: Setup publisher on magnetic_field [sensor_msgs/MagneticField]
   [INFO] [1531356280.545840]: Setup publisher on /tf [tf/tfMessage]
   [INFO] [1531356280.582609]: Note: subscribe buffer size is 1024 bytes
   [INFO] [1531356280.584645]: Setup subscriber on cmd_vel [geometry_msgs/Twist]
   [INFO] [1531356280.620330]: Setup subscriber on sound [turtlebot3_msgs/Sound]
   [INFO] [1531356280.649508]: Setup subscriber on motor_power [std_msgs/Bool]
   [INFO] [1531356280.688276]: Setup subscriber on reset [std_msgs/Empty]
   [INFO] [1531356282.022709]: Setup TF on Odometry [tb3_0/odom]
   [INFO] [1531356282.026863]: Setup TF on IMU [tb3_0/imu_link]
   [INFO] [1531356282.030138]: Setup TF on MagneticField [tb3_0/mag_link]
   [INFO] [1531356282.033628]: Setup TF on JointState [tb3_0/base_link]
   [INFO] [1531356282.041117]: --------------------------
   [INFO] [1531356282.044421]: Connected to OpenCR board!
   [INFO] [1531356282.047700]: This core(v1.2.1) is compatible with TB3 Burger
   [INFO] [1531356282.051355]: --------------------------
   [INFO] [1531356282.054785]: Start Calibration of Gyro
   [INFO] [1531356284.585490]: Calibration End
   ```

4. **[Remote PC]** Launch robot state publisher with same namespace.
- **[TurtleBot(tb3_0)]**
  ```bash
  $ ROS_NAMESPACE=tb3_0 roslaunch turtlebot3_bringup turtlebot3_remote.launch multi_robot_name:=tb3_0
  ```
- **[TurtleBot(tb3_1)]**
  ```bash
  $ ROS_NAMESPACE=tb3_1 roslaunch turtlebot3_bringup turtlebot3_remote.launch multi_robot_name:=tb3_1
  ```

5. Before start another application, check topics and TF tree to open rqt
```bash
$ rqt
```

    ![](/assets/images/platform/turtlebot3/application/multi_turtlebot_rqt.png)

To use this setup, each turtlebot3 makes map using SLAM and these maps are merged simutaneously by [multi_map_merge][multi_map_merge] packages. You can get more information about this to visit [Virtual SLAM by Multiple TurtleBot3s][virtual slam by multiple turtlebot3s] sections


[turtlebot3_applications]: https://github.com/ROBOTIS-GIT/turtlebot3_applications
[turtlebot3_applications_msgs]: https://github.com/ROBOTIS-GIT/turtlebot3_applications_msgs
[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/#teleoperation
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
[ar_track_alvar]: http://wiki.ros.org/ar_track_alvar
[multi_map_merge]: http://wiki.ros.org/multirobot_map_merge
[virtual slam by multiple turtlebot3s]: /docs/en/platform/turtlebot3/simulation/#2-excute-slam


[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[interactive_markers]: http://wiki.ros.org/interactive_markers
[tutorial_video]: https://youtu.be/Xg1pKFQY5p4
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
