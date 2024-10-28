
Follow the given instruction to operate your robot.

### [Run roscore](#run-roscore)

Run roscore to use ROS 1.  
**[Remote PC]**  
```bash
$ roscore
```

### [Run Bringup](#bringup)

1. Run Bringup node for TurtleBot3, and start rosserial and LDS sensor using following command.  
**[TurtleBot3 SBC]**  
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

2. Run Bringup node for OpenMANIPULATOR on TurtleBot3  
**[Remote PC]**  
```bash
$ roslaunch turtlebot3_manipulation_bringup turtlebot3_manipulation_bringup.launch
```

### [Run move_group Node](#run-move-group-node)  
**[Remote PC]**  
```bash
$ roslaunch turtlebot3_manipulation_moveit_config move_group.launch
```

### [Run RViz](#run-rviz)

Run RViz to visualize data and to use the interactive marker.  
**[Remote PC]**  
```bash
$ roslaunch turtlebot3_manipulation_moveit_config moveit_rviz.launch
```

### [Run ROBOTIS GUI Controller](#run-robotis-gui-controller)

OpenMANIPULATOR can be controlled with using ROBOTIS GUI controller instead of RViz tool.  
**[Remote PC]**  
```bash
$ roslaunch turtlebot3_manipulation_gui turtlebot3_manipulation_gui.launch
```
