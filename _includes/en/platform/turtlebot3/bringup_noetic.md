## [Bringup](#bringup)

### [Run roscore](#run-roscore)

Run roscore from PC.

```bash
$ roscore
```

### [Bringup TurtleBot3](#bringup-turtlebot3)

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`.  
{: .notice--success}

1. Open a new terminal from PC with `Ctrl` + `Alt` + `T` and connect to Raspberry Pi with its IP address.  
  The default password is **turtlebot**.  
  ```bash
$ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
  ```

2. Bring up basic packages to start TurtleBot3 applications.
  ```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

3. If the TurtleBot3 model is `burger`, the terminal will print below messages.  
  ```bash
    SUMMARY
    ========

    PARAMETERS
    * /rosdistro: noetic
    * /rosversion: 1.15.8
    * /turtlebot3_core/baud: 115200
    * /turtlebot3_core/port: /dev/ttyACM0
    * /turtlebot3_core/tf_prefix:
    * /turtlebot3_lds/frame_id: base_scan
    * /turtlebot3_lds/port: /dev/ttyUSB0

    NODES
    /
        turtlebot3_core (rosserial_python/serial_node.py)
        turtlebot3_diagnostics (turtlebot3_bringup/turtlebot3_diagnostics)
        turtlebot3_lds (hls_lfcd_lds_driver/hlds_laser_publisher)

    ROS_MASTER_URI=http://192.168.1.2:11311

    process[turtlebot3_core-1]: started with pid [14198]
    process[turtlebot3_lds-2]: started with pid [14199]
    process[turtlebot3_diagnostics-3]: started with pid [14200]
    [INFO] [1531306690.947198]: ROS Serial Python Node
    [INFO] [1531306691.000143]: Connecting to /dev/ttyACM0 at 115200 baud
    [INFO] [1531306693.522019]: Note: publish buffer size is 1024 bytes
    [INFO] [1531306693.525615]: Setup publisher on sensor_state [turtlebot3_msgs/SensorState]
    [INFO] [1531306693.544159]: Setup publisher on version_info [turtlebot3_msgs/VersionInfo]
    [INFO] [1531306693.620722]: Setup publisher on imu [sensor_msgs/Imu]
    [INFO] [1531306693.642319]: Setup publisher on cmd_vel_rc100 [geometry_msgs/Twist]
    [INFO] [1531306693.687786]: Setup publisher on odom [nav_msgs/Odometry]
    [INFO] [1531306693.706260]: Setup publisher on joint_states [sensor_msgs/JointState]
    [INFO] [1531306693.722754]: Setup publisher on battery_state [sensor_msgs/BatteryState]
    [INFO] [1531306693.759059]: Setup publisher on magnetic_field [sensor_msgs/MagneticField]
    [INFO] [1531306695.979057]: Setup publisher on /tf [tf/tfMessage]
    [INFO] [1531306696.007135]: Note: subscribe buffer size is 1024 bytes
    [INFO] [1531306696.009083]: Setup subscriber on cmd_vel [geometry_msgs/Twist]
    [INFO] [1531306696.040047]: Setup subscriber on sound [turtlebot3_msgs/Sound]
    [INFO] [1531306696.069571]: Setup subscriber on motor_power [std_msgs/Bool]
    [INFO] [1531306696.096364]: Setup subscriber on reset [std_msgs/Empty]
    [INFO] [1531306696.390979]: Setup TF on Odometry [odom]
    [INFO] [1531306696.394314]: Setup TF on IMU [imu_link]
    [INFO] [1531306696.397498]: Setup TF on MagneticField [mag_link]
    [INFO] [1531306696.400537]: Setup TF on JointState [base_link]
    [INFO] [1531306696.407813]: --------------------------
    [INFO] [1531306696.411412]: Connected to OpenCR board!
    [INFO] [1531306696.415140]: This core(v1.2.1) is compatible with TB3 Burger
    [INFO] [1531306696.418398]: --------------------------
    [INFO] [1531306696.421749]: Start Calibration of Gyro
    [INFO] [1531306698.953226]: Calibration End
  ```

<details>
<summary>
![](/assets/images/icon_unfold.png) **Read more about launching RViz**
</summary>
### [Load TurtleBot3 on Rviz](#load-turtlebot3-on-rviz)

1. Open a new terminal and launch the robot state publisher.  
  ```bash
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
  ```

2. Open a new terminal and enter the below command to run RViz. To run rviz, you need to specify the model name of TurtleBot3.
  ```bash
$ rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/{burger, waffle_pi}.rviz
  ```  
  ![](/assets/images/platform/turtlebot3/bringup/2022_run_rviz.png)

</details>