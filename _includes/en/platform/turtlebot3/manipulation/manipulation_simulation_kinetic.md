
Simulate TurtleBot3 with OpenMANIPULATOR Using Gazebo by following this section.

### [Run Gazebo](#run-gazebo)

**[Remote PC]** Bring TurtleBot3 with OpenMANIPULATOR into Gazebo world using the following command.

```bash
$ roslaunch turtlebot3_manipulation_gazebo turtlebot3_manipulation_gazebo.launch
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_omx_gazebo.png)

<!-- **[Remote PC]** Bring model into Gazebo.
**[Remote PC]** Launch Launch robot_state_publisher node.
```bash
$ ROS_NAMESPACE=om_with_tb3 roslaunch open_manipulator_with_tb3_tools om_with_tb3_remote.launch
``` -->

### [Run move_group Node](#run-move-group-node)

**[Remote PC]** In order to use Moveit feature, launch **move_group** node. If you press **\[▶]** button in Gazebo to start simulation, use the following command. Later, the following message will be printed: **You can start planning now!**.

```bash
$ roslaunch turtlebot3_manipulation_moveit_config move_group.launch
```

### [Run RViz](#run-rviz)

**[Remote PC]** Use Moveit feature in RViz by reading `moveit.rviz` file where Moveit enviroment data is configured. You can control the mounted manipulator using Interactive Marker, and simulate the motion of goal position, which feature can prevent a pysical crash by simulating the movement in advance.

```bash
$ roslaunch turtlebot3_manipulation_moveit_config moveit_rviz.launch
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_omx_rviz.png)

<!--
**[Remote PC]**
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_tools slam.launch use_platform:=true
```

**[Remote PC]** Launch teleop node
```bash
$ ROS_NAMESPACE=om_with_tb3 roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

**[Remote PC]** Launch map_saver node
```bash
$ ROS_NAMESPACE=om_with_tb3 rosrun map_server map_saver -f ~/map
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_slam.png)
-->

### [Run ROBOTIS GUI Controller](#run-robotis-gui-controller)

**[Remote PC]** You can use ROBOTIS GUI, but not RViz, to control robot arm with Gazebo. The GUI supports **Task Space Control** and **Joint Space Control**. Use one of ways according to your preference.

- `Task Space Control`: It refers to a valid gripping position (a red hexahedron between the gripper in the task space) from the end-effector of the manipulator.
- `Joint Space Control`: It refers to each joint angle.

```bash
$ roslaunch turtlebot3_manipulation_gui turtlebot3_manipulation_gui.launch
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_omx_gui_controller.png)

<!-- ## [Navigation](#navigation)

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_tools navigation.launch use_platform:=true
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_navigation.png) -->
