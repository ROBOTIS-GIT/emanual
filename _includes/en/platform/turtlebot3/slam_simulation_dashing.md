
#### [SLAM Simulation](#slam-simulation)

For virtual SLAM in Gazebo, instead of running the actual robot, you can select the various environments and robot models mentioned above, and the SLAM-related commands will use the ROS packages used in the [SLAM][slam] section.

##### Virtual SLAM Execution Procedure

The following commands are examples of using the TurtleBot3 Waffle Pi model and the turtlebot3_world environment.

- Launch Gazebo

```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

- Launch SLAM

```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
```

- Remotely Control TurtleBot3

```bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

- Save the Map

```bash
$ rosrun map_server map_saver -f ~/map
```

When you run the dependent packages and move the robot in virtual space and create a map as shown below, you can create a map as shown in figure below.

![](/assets/images/platform/turtlebot3/simulation/virtual_slam.png)

![](/assets/images/platform/turtlebot3/simulation/map.png)

#### [Virtual Navigation with TurtleBot3](#virtual-navigation-with-turtlebot3)

For virtual Navigation in Gazebo, instead of running the actual robot, you can select the various environments and robot models mentioned above, and the Navigation-related commands will use the ROS packages used in the [Navigation][navigation] section.

##### Virtual Navigation Execution Procedure

Terminate all applications that were executed during the virtual SLAM practice and execute
related packages in the following instruction, the robot will appear on the previously generated map. After setting the initial position of the robot on the map, set the destination to run the navigation as shown in figure below. The initial position only needs to be set once.

- Execute Gazebo

```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

- Execute Navigation

```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map.yaml
```

![](/assets/images/platform/turtlebot3/simulation/virtual_navigation.png)

#### [Virtual SLAM by Multiple TurtleBot3s](#virtual-slam-by-multiple-turtlebot3s)

##### 1) Call Three TurtleBot3s in TurtleBot3 House

```bash
$ roslaunch turtlebot3_gazebo multi_turtlebot3.launch
```

These loaded turtlebot3s are set initial position and orientation

##### 2) Excute SLAM

```bash
$ ROS_NAMESPACE=tb3_0 roslaunch turtlebot3_slam turtlebot3_gmapping.launch set_base_frame:=tb3_0/base_footprint set_odom_frame:=tb3_0/odom set_map_frame:=tb3_0/map
$ ROS_NAMESPACE=tb3_1 roslaunch turtlebot3_slam turtlebot3_gmapping.launch set_base_frame:=tb3_1/base_footprint set_odom_frame:=tb3_1/odom set_map_frame:=tb3_1/map
$ ROS_NAMESPACE=tb3_2 roslaunch turtlebot3_slam turtlebot3_gmapping.launch set_base_frame:=tb3_2/base_footprint set_odom_frame:=tb3_2/odom set_map_frame:=tb3_2/map

```

##### 3) Merge Map Data from each TurtleBot3's Map Data

Before launch this nodes, please make sure arguments for position and orientation of turtlebot3s

```bash
$ sudo apt-get install ros-kinetic-multirobot-map-merge
$ roslaunch turtlebot3_gazebo multi_map_merge.launch
```

##### 4) Excute RViz

```bash
$ rosrun rviz rviz -d `rospack find turtlebot3_gazebo`/rviz/multi_turtlebot3_slam.rviz
```

##### 5) Teleoperation

```bash
$ ROS_NAMESPACE=tb3_0 rosrun turtlebot3_teleop turtlebot3_teleop_key
$ ROS_NAMESPACE=tb3_1 rosrun turtlebot3_teleop turtlebot3_teleop_key
$ ROS_NAMESPACE=tb3_2 rosrun turtlebot3_teleop turtlebot3_teleop_key
```

##### 6) Save the Map

```bash
$ rosrun map_server map_saver -f ~/map
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_house_slam.png)

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_house_slam1.png)

#### [TurtleBot3 AutoRace with Gazebo](#turtlebot3-autorace-with-gazebo)

Go to [AutoRace with Gazebo](/docs/en/platform/turtlebot3/autonomous_driving/#autorace-with-gazebo).

#### [Turtlebot3 with OpenMANIPULATOR](#turtlebot3-with-openmanipulator)

Go to [OpenMANIPULATOR with Gazebo](/docs/en/platform/turtlebot3/manipulation/#simulation)






## [TurtleBot3 Simulation using Fake Node](#turtlebot3-simulation-using-fake-node)

<iframe width="640" height="360" src="https://www.youtube.com/embed/iHXZSLBJHMg" frameborder="0" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

To use `turtlebot3_fake_node`, you need the `turtlebot3_simulation` metapackage. Install the package as shown in the following command.

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

**NOTE**: The `turtlebot3_simulation` metapackage requires `turtlebot3` metapackage and `turtlebot3_msgs` package as a prerequisite. If you didn't install it in the [Install Dependent ROS Packages of PC Setup][pc_setup] section, install it first.
{: .notice--info}

```bash
$ cd ~/catkin_ws/src/
$ git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
$ cd ~/catkin_ws && catkin_make
```

To launch the virtual robot, execute the `turtlebot3_fake.launch` file in the `turtlebot3_fake` package as shown below. The `turtlebot3_fake` is a very simple simulation node that can be run without having an actual robot. You can even control the virtual TurtleBot3 in RViz with a teleoperation node.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_fake turtlebot3_fake.launch
```

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```



### [Standalone Gazebo Plugin](#standalone-gazebo-plugin)

**NOTE**: This tutorial is developed only for user who want to simulate TurtleBot3 without `ROS`. However we highly recommend to simulate robots with `ROS`.
{: .notice--info}

#### [How to use Gazebo Plugin](#how-to-use-gazebo-plugin)

##### 1) Install Library for Gazebo7

```bash
$ sudo apt-get install libgazebo7-dev
```

##### 2) Download Source Code from Github

```bash
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_gazebo_plugin
```

##### 3) Add Gazebo Plugin Path in `.bashrc` File

```bash
$ nano ~/.bashrc
```

**TIP**: turtlebot3_gazebo_plugin path = ~/turtlebot3_gazebo_plugin
{: .notice--info}

```bash
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:${turtlebot3_gazebo_plugin path}/build
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:${turtlebot3_gazebo_plugin path}/models
```

##### 4) Make and Build

```bash
$ cd ${turtlebot3_gazebo_plugin path}
$ mkdir build
$ cd build
$ cmake ..
$ make
```

##### 5) Excute Plugin

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

```bash
$ cd ${turtlebot3_gazebo_plugin}
$ gazebo worlds/turtlebot3_${TB3_MODEL}.world
```

![](/assets/images/platform/turtlebot3/simulation/gazebo_waffle_pi.png)

![](/assets/images/platform/turtlebot3/simulation/gazebo_burger.png)

##### 6) Teleoperation by Keyboard

```bash
w - set linear velocity up
x - set linear velocity down
d - set angular velocity up
a - set angular velocity down
s - set all velocity to zero
```

##### 7) Topic Subscribe Command

- Show all topic

```bash
$ gz topic -l
```

- Subscribe scan data

```bash
$ gz topic -e /gazebo/default/user/turtlebot3_${TB3_MODEL}/lidar/hls_lfcd_lds/scan
```

- Subscribe image data

**Waffle**

```bash
$ gz topic -e /gazebo/default/user/turtlebot3_waffle/image/intel_realsense_r200/image
```

**Waffle Pi**

```bash
$ gz topic -e /gazebo/default/user/turtlebot3_waffle_pi/image/raspberry_pi_cam/image
```

##### 8) Excute listener

```bash
$ cd ${turtlebot3_gazebo_plugin}/build
$ ./lidar_listener ${TB3_MODEL}
```

Open a new terminal window and enter below command.

```bash
$ cd ${turtlebot3_gazebo_plugin}/build
$ ./image_listener ${TB3_MODEL}
```

##### Reference

- [Gazebo API](http://osrf-distributions.s3.amazonaws.com/gazebo/api/dev/index.html)
- [How to contribute model](http://gazebosim.org/tutorials?tut=model_contrib&cat=build_robot)
- [How to make model](http://gazebosim.org/tutorials?tut=build_model&cat=build_robot)
- [Tutorial for making Hello World plugin](http://gazebosim.org/tutorials?tut=plugins_hello_world&cat=write_plugin)
- [Tutorial for making model plugin](http://gazebosim.org/tutorials?cat=guided_i&tut=guided_i5)
- [Tutorial for making sensor plugin](http://gazebosim.org/tutorials?tut=contact_sensor)
- [Tutorial for topic subscription](http://gazebosim.org/tutorials?tut=topics_subscribed)

[pc_setup]: /docs/en/platform/turtlebot3/pc_setup/#install-dependent-ros-packages
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
[slam]: /docs/en/platform/turtlebot3/slam/#slam
[navigation]: /docs/en/platform/turtlebot3/navigation/#navigation
