
Follow the given instruction to operate your robot.

### [Run roscore](#run-roscore)

**[Remote PC]** Run roscore to use ROS 1.

```bash
$ roscore
```

### [Run Bringup](#bringup)

1. **[TurtleBot3 SBC]** Run Bringup node for TurtleBot3, and start rosserial and LDS sensor using following command.

```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

2. **[Remote PC]** Run Bringup node for OpenMANIPULATOR on TurtleBot3

```bash
$ roslaunch turtlebot3_manipulation_bringup turtlebot3_manipulation_bringup.launch
```

### [Run move_group Node](#run-move-group-node)

```bash
$ roslaunch turtlebot3_manipulation_moveit_config move_group.launch
```

### [Run RViz](#run-rviz)

**[Remote PC]** Run Rviz to visualize data and to use the interactive marker.

```bash
$ roslaunch turtlebot3_manipulation_moveit_config moveit_rviz.launch
```

### [Run ROBOTIS GUI Controller](#run-robotis-gui-controller)

**[Remote PC]** OpenMANIPULATOR can be controlled with using ROBOTIS GUI controller instead of RVIz tool.

```bash
$ roslaunch turtlebot3_manipulation_gui turtlebot3_manipulation_gui.launch
```
