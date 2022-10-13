
Use SLAM feature to update an unknown map with TurtleBot3 and OpenMANIPULATOR

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_slam.png);

### [Run roscore](#run-roscore)

**[Remote PC]** Run roscore to use ROS 1.

```bash
$ roscore
```

### [Run Bringup](#run-bringup)

**[TurtleBot3 SBC]** Run Bringup node for TurtleBot3, and start rosserial and LDS sensor using following command.

```bash
roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**NOTE**: As OpenMANIPULATOR on TurtleBot3 is not neccessory for SLAM, **move_group** and **bringup** nodes, which are the parameters to control OpenMANIPULATOR, are not important to use
{: .notice}

### [Run SLAM Node](#run-slam-node)

**[Remote PC]** Run SLAM node for updating an unknown map with TurtleBot3. This node utilizes gmapping package.

```bash
$ roslaunch turtlebot3_manipulation_slam slam.launch
```

### [Run turtlebot3_teleop_key Node](#run-turtlebot3-teleop-key-node)

1. **[Remote PC]** Update the map where TurtleBot3 will navigate using turtlebot3_teleop_key node.

```bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

2. **[Remote PC]** Once the map is completely updated, run the map_saver node to save the updated map.

```bash
$ rosrun map_server map_saver -f ~/map
```
