
**NOTE**: Be sure that the OpenCR port is properly assigned in the [turtlebot3_core.launch][turtlebot3_core] bringup file.
{: .notice--info}

### [Run roscore](#run-roscore)

Run roscore to start ROS.  
**[Remote PC]**  
```bash
$ roscore
```

### [Define TurtleBot3 Model](#define-turtlebot3-model)

Export your TurtleBot3 model (`waffle` or `waffle_pi`) if the **TURTLEBOT3_MODEL** is not defined in your `.bashrc` file.  
**[TurtleBot3 SBC]**  
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
```

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

Run the Bringup node for TurtleBot3, and start rosserial and LDS sensor using the following command.  
**[TurtleBot3 SBC]**  
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

<!--
```bash
$ ROS_NAMESPACE=om_with_tb3 roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
```
-->

<!-- [Simulate TurtleBot3 with OpenMANIPULATOR Using Gazebo](#simulate-turtlebot3-with-openmanipulator-using-gazebo) -->
