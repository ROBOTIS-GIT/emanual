
**NOTE**: Be sure that OpenCR port is properly assigned on PC. See [turtlebot3_core.launch][turtlebot3_core].
{: .notice--info}

<!--
**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success} -->

<!--
1. **[Remote PC]** Run roscore to use ROS 1.
```bash
$ roscore
```

2. **[TurtleBot3 SBC]** Export TurtleBot3 model (Waffle PI) to `.bashrc` file with the following command.
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
```



-->

### [Run roscore](#run-roscore)

**[Remote PC]** Run roscore to use ROS 1.

```bash
$ roscore
```

### [Define TurtleBot3 Model](#define-turtlebot3-model)

**[TurtleBot3 SBC]** Export TurtleBot3 model (Waffle PI) to `.bashrc` file using the following command.

```bash
$ export TURTLEBOT3_MODEL=waffle_pi
```

**NOTE**: TurtleBot3 Model may differ from the hardware configuration of TurtleBot3 such as `burger` or `waffle`.
{: .notice--info}

<!--
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ROS_NAMESPACE=om_with_tb3 roslaunch turtlebot3_bringup turtlebot3_robot.launch multi_robot_name:=om_with_tb3 set_lidar_frame_id:=om_with_tb3/base_scan
```
-->

<!-- 3. **[TurtleBot3 SBC]** Run Bringup node with the following command. This node starts rosserial and LDS sensor.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```
-->

### [Run Bringup](#run-bringup)

**[TurtleBot3 SBC]** Run Bringup node for TurtleBot3, and start rosserial and LDS sensor using following command.

```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

<!--
```bash
$ ROS_NAMESPACE=om_with_tb3 roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
```
-->

<!-- [Simulate TurtleBot3 with OpenMANIPULATOR Using Gazebo](#simulate-turtlebot3-with-openmanipulator-using-gazebo) -->
