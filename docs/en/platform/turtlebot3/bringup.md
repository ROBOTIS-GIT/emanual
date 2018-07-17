---
layout: archive
lang: en
ref: bringup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/bringup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 6"></div>

# [Bringup](#bringup)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

{% capture notice_01 %}
**WARNING**: 
1. This instruction is intended to be run on the remote PC. If you are following the instruction on **TurtleBot**, please do **NOT** run *roscore* command on TurtleBot PC.
2. Make sure that IP address on each device is set correctly.
3. When the battery voltage is lower than 11V, the buzzer alarm will continuously sound and actuators will be disabled. The battery must be recharged when the buzzer alarm sounds.
{% endcapture %}
<div class="notice--warning">{{ notice_01 | markdownify }}</div>

**NOTE**: This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

## [Run roscore](#run-roscore)

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--info}

**[Remote PC]** Run roscore.

``` bash
$ roscore
```

## [Bringup a TurtleBot3](#bringup-a-turtlebot3)

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

If model of TurtleBot3 is `burger`, the terminal will represent below messages.

```
SUMMARY
========

PARAMETERS
 * /rosdistro: kinetic
 * /rosversion: 1.12.13
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

{% capture bringup_tip_01 %}
**TIP**: If you want to launch Lidar sensor, Raspberry Pi Camera, Intel® RealSense™ R200 or core separately, please use below commands.
  - $ roslaunch turtlebot3_bringup turtlebot3_lidar.launch
  - $ roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
  - $ roslaunch turtlebot3_bringup turtlebot3_realsense.launch
  - $ roslaunch turtlebot3_bringup turtlebot3_core.launch
{% endcapture %}

<div class="notice--info">{{ bringup_tip_01 | markdownify }}</div>

**NOTE**: If `lost sync with device` error message is displayed on the terminal window, the sensor device of TurtleBot3 might not be securely connected.
{: .notice--info}

## [Load a TurtleBot3 on Rviz](#load-a-turtlebot3-on-rviz)

**[Remote PC]** Launch robot state publisher and Run RViz.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
$ rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz
```

![](/assets/images/platform/turtlebot3/bringup/run_rviz.jpg)

In the next chapter, you will be able to test TurtleBot3 with various teleoperation methods and run various applications.

[intel_realsense]: /docs/en/platform/turtlebot3/appendix_realsense/#installation
[raspberry_pi_camera]: /docs/en/platform/turtlebot3/appendix_raspi_cam/#installation
[raspbian]: /docs/en/platform/turtlebot3/raspberry_pi_3_setup/#install-linux-based-on-raspbian
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model