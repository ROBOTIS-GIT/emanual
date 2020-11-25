
## [Standalone Gazebo Plugin](#standalone-gazebo-plugin)

**NOTE**: This tutorial is developed only for user who want to simulate TurtleBot3 without `ROS`. However we highly recommend to simulate robots with `ROS`.
{: .notice--info}

### [How to use Gazebo Plugin](#how-to-use-gazebo-plugin)

#### 1) Install Library for Gazebo7

```bash
$ sudo apt-get install libgazebo7-dev
```

#### 2) Download Source Code from Github

```bash
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_gazebo_plugin
```

#### 3) Add Gazebo Plugin Path in `.bashrc` File

```bash
$ nano ~/.bashrc
```

**TIP**: turtlebot3_gazebo_plugin path = ~/turtlebot3_gazebo_plugin
{: .notice--info}

```bash
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:${turtlebot3_gazebo_plugin path}/build
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:${turtlebot3_gazebo_plugin path}/models
```

#### 4) Make and Build

```bash
$ cd ${turtlebot3_gazebo_plugin path}
$ mkdir build
$ cd build
$ cmake ..
$ make
```

#### 5) Excute Plugin

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

```bash
$ cd ${turtlebot3_gazebo_plugin}
$ gazebo worlds/turtlebot3_${TB3_MODEL}.world
```

![](/assets/images/platform/turtlebot3/simulation/gazebo_waffle_pi.png)

![](/assets/images/platform/turtlebot3/simulation/gazebo_burger.png)

#### 6) Teleoperation by Keyboard

```bash
w - set linear velocity up
x - set linear velocity down
d - set angular velocity up
a - set angular velocity down
s - set all velocity to zero
```

#### 7) Topic Subscribe Command

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

#### 8) Excute listener

```bash
$ cd ${turtlebot3_gazebo_plugin}/build
$ ./lidar_listener ${TB3_MODEL}
```

Open a new terminal window and enter below command.

```bash
$ cd ${turtlebot3_gazebo_plugin}/build
$ ./image_listener ${TB3_MODEL}
```

#### Reference

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
[simulation]: /docs/en/platform/turtlebot3/simulation/
[navigation]: /docs/en/platform/turtlebot3/navigation/#navigation
