
**WARNING**: Make sure to run the [Bringup][bringup] instruction before performing this examples, and be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**:

- This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be running on the remote PC. Follow the instruction on your **Remote PC**.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Xg1pKFQY5p4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

## [Move using Interactive Markers](#move-using-interactive-markers)

The TurtleBot3 can be moved by [Interactive Markers][interactive_markers] on RViz. You can move the TurtleBot3 to rotate or linear using Interactive Markers.

**[Remote PC]** Open a new terminal and launch the remote file.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`,` waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
```

**[Remote PC]** launch the interactive markers file.

```bash
$ roslaunch turtlebot3_example interactive_markers.launch
```

**[Remote PC]** Visualize the model in 3D with RViz.

```bash
$ rosrun rviz rviz -d `rospack find turtlebot3_example`/rviz/turtlebot3_interactive.rviz
```

## [Obstacle Detection](#obstacle-detection)

The TurtleBot3 can be moved or stopped by LDS data. When the TurtleBot3 moves, it stops when it detects an obstacle ahead.

**[Remote PC]** Launch the obstacle file.

```bash
$ roslaunch turtlebot3_example turtlebot3_obstacle.launch
```

## [Point Operation](#point-operation)

The TurtleBot3 can be moved by 2D `point (x, y)` and `z-angular`. For example, if you insert (0.5, 0.3, 60), TurtleBot3 moves to point (x = 0.5m, y = 0.3m) and then rotates 60 deg.

**[Remote PC]** launch the pointop file.

```bash
$ roslaunch turtlebot3_example turtlebot3_pointop_key.launch
```

## [Patrol](#patrol)

The TurtleBot3 can be moved by custom routes. There are three routes(rectangle, triangle and circle). This example uses action topic. Action client translates patrol data(mode, area, count) to action server. And then action server translates `cmd_vel` to TurtleBot3. Please refer to the above [tutorial video][tutorial_video] for more detailed usage.

**[Remote PC]** Launch the patrol server file.

```bash
$ rosrun turtlebot3_example turtlebot3_server
```

**[Remote PC]** Launch the patrol client file.

```bash
$ roslaunch turtlebot3_example turtlebot3_client.launch
```

## [TurtleBot Follower Demo](#turtlebot-follower-demo)

{% capture warning_01 %}
In order to try examples in the below, you have to install the [turtlebot3_applications][turtlebot3_applications] and [turtlebot3_applications_msgs][turtlebot3_applications_msgs] packages.

**[Remote PC]** Go to `catkin workspace` directory (/home/(user_name)/catkin_ws/src) and clone the turtlebot3_applications and turtlebot3_applications_msgs repository. Then run the `catkin_make` to build the new packages.

```bash
$ sudo apt-get install ros-kinetic-ar-track-alvar
$ sudo apt-get install ros-kinetic-ar-track-alvar-msgs
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_applications_msgs.git
$ cd ~/catkin_ws && catkin_make
```
{% endcapture %}
<div class="notice--danger">{{ warning_01 | markdownify }}</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/w9YTxZVY6yQ" frameborder="0" allowfullscreen></iframe>

{% capture notice_02 %}
**NOTE**:

- The follower demo was implemented only using a 360 Laser Distance Sensor LDS-01. A classification algorithm is used based on previous fitting with samples of person and obstacles positions to take actions. It follows someone in front of the robot within a 50 centimeter range and 140 degrees.
- Running the follower demo in an area with obstacles may not work well. Therefore, it is recommended to run the demo in an open area without obstacles.
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify }}</div>

1. **[Remote PC]** Install `scikit-learn`, `NumPy` and `ScyPy` packages.
```bash
$ sudo apt-get install python-pip
$ sudo pip install -U scikit-learn numpy scipy
$ sudo pip install --upgrade pip
```

2. **[Remote PC]** When installation is completed, run roscore on the remote pc.
```bash
$ roscore
```

3. **[TurtleBot]** Launch the [Bringup][bringup] package.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

4. **[Remote PC]** Set the enviroment variable for the TurtleBot3 Burger and launch `turtlebot3_follow_filter`.
```bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_follow_filter turtlebot3_follow_filter.launch
```

5. **[Remote PC]** Launch `turtlebot3_follower`.
```bash
$ roslaunch turtlebot3_follower turtlebot3_follower.launch
```

## [TurtleBot Panorama Demo](#turtlebot-panorama-demo)

{% capture notice_03 %}
**NOTE**:

- The `turtlebot3_panorama` demo uses `pano_ros` for taking snapshots and stitching them together to create panoramic image.
- Panorama demo requires to install `raspicam_node` package. Instructions for installing this package can be found at [Gihub Link](https://github.com/UbiquityRobotics/raspicam_node)
- Panorama demo requires to install OpenCV and cvbridge packages. Instructions for installing OpenCV can be found at [OpenCV Tutorial Link](http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html)
{% endcapture %}
<div class="notice--info">{{ notice_03 | markdownify }}</div>

1. **[TurtleBot]** Launch the `turtlebot3_rpicamera` file
```bash
$ roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
```

2. **[Remote PC]** Launch `panorama`.
```bash
$ roslaunch turtlebot3_panorama panorama.launch
```

3. **[Remote PC]** To start the panorama demo, enter the following command.
```bash
$ rosservice call turtlebot3_panorama/take_pano 0 360.0 30.0 0.3
```
  Parameters that can be sent to the rosservice to get a panoramic image are:
  - Mode for taking the pictures.
      - 0 : snap&rotate (i.e. rotate, stop, snapshot, rotate, stop, snapshot, ...)
      - 1 : continuous (i.e. keep rotating while taking snapshots)
      - 2 : stop taking pictures and create panoramic image
  - Total angle of panoramic image, in degrees
  - Angle interval (in degrees) when creating the panoramic image in snap&rotate mode, time interval (in seconds) otherwise
  - Rotating velocity (in radians/s)

4. **[Remote PC]** To view the result image, enter the following command.
```bash
$ rqt_image_view image:=/turtlebot3_panorama/panorama
```
  ![](/assets/images/platform/turtlebot3/application/panorama_view.png)

## [Automatic Parking](#automatic-parking)

<iframe width="560" height="315" src="https://www.youtube.com/embed/IRtdxoPo8Y8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

{% capture notice_04 %}
**NOTE**:

- The `turtlebot3_automatic_parking` demo was using a 360 laser Distance Sensor LDS-01 and a reflective tape. The LaserScan topic has intensity and distance data from LDS. The TurtleBot3 uses this to locate the reflective tape.
- The `turtlebot3_automatic_parking` demo requires `NumPy` package.
{% endcapture %}
<div class="notice--info">{{ notice_04 | markdownify }}</div>

1. **[Remote PC]** Install `NumPy` package with below commands. If you already installed numpy, you can **skip** below commands.
```bash
$ sudo apt-get install python-pip
$ sudo pip install -U numpy
$ sudo pip install --upgrade pip
```

2. **[Remote PC]** Run roscore.
```bash
$ roscore
```

3. **[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

4. **[Remote PC]** If you use TurtleBot3 Burger, set the model of TurtleBot3 like command below.
```bash
$ export TURTLEBOT3_MODEL=burger
```

    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

5. **[Remote PC]** Run RViz.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
$ rosrun rviz rviz -d `rospack find turtlebot3_automatic_parking`/rviz/turtlebot3_automatic_parking.rviz
```

6. **[Remote PC]** Launch the automatic parking file.
```bash
$ roslaunch turtlebot3_automatic_parking turtlebot3_automatic_parking.launch
```
    - You can select LaserScan topic in RViz.

    - `/scan`

    ![](/assets/images/platform/turtlebot3/application/scan.png)

    - `/scan_spot`

    ![](/assets/images/platform/turtlebot3/application/scan_spot.png)

## [Automatic Parking Vision](#automatic-parking-vision)

{% capture notice_05 %}
**NOTE**:

- The `turtlebot3_automatic_parking_vision` uses raspberry pi camera and so the robot which is a default platform used for this demo is TurtleBot3 Waffle Pi. Since it parks from finding out AR marker on some wall, printed AR marker should be prepared. Whole process uses the image get from the camera, so if the process is not well being done, configure the parameters, such as brightness, contrast, etc.
- The `turtlebot3_automatic_parking_vision` uses rectified image based on `image_proc` nodes. To get rectified image, the robot should get optic calibration data for raspberry pi camera. (Every downloaded turtlebot3 packages already have the camera calibration data as raspberry pi camera v2 default.)
- The `turtlebot3_automatic_parking_vision` package requires `ar_track_alvar` package.
{% endcapture %}
<div class="notice--info">{{ notice_05 | markdownify }}</div>

1. **[Remote PC]** Run roscore.
```bash
$ roscore
```

2. **[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

3. **[TurtleBot]** Start the raspberry pi camera nodes.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
```

4. **[Remote PC]** Raspberry pi package will publish compressed type image for fast communication. However, what will be needed in image rectification in `image_proc` node is raw type image. Hence, compressed image should be transform to raw image.
```bash
$ rosrun image_transport republish compressed in:=raspicam_node/image raw out:=raspicam_node/image
```

5. **[Remote PC]** Then, the image rectification should be carried out.
```bash
$ ROS_NAMESPACE=raspicam_node rosrun image_proc image_proc image_raw:=image _approximate_s=true _queue_size:=20
```

6. **[Remote PC]** Now should start the AR marker detection. Before running related launch file, the model of what will be used by this example code should be exported. After running the launch file, RViz will be automatically run under preset environments.
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_automatic_parking_vision turtlebot3_automatic_parking_vision.launch
```

    <iframe width="560" height="315" src="https://www.youtube.com/embed/dvpWdrD3bVs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    > TurtleBot3 Automatic Parking Vision

## [Load Multiple TurtleBot3s](#load-multiple-turtlebot3s)

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
