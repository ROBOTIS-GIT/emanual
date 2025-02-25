Simulate TurtleBot3 Manipulation using Gazebo by following this section.

### [Run Gazebo](#run-gazebo)

Load the TurtleBot3 with OpenMANIPULATOR-X into Gazebo world with the following command.  
**[Remote PC]**  
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

In order to use the MoveIt feature, launch the **move_group** node.  
With a successful launch, **"You can start planning now!"** message will be printed on the terminal.  
**[Remote PC]**  
```bash
$ roslaunch turtlebot3_manipulation_moveit_config move_group.launch
```

### [Run RViz](#run-rviz)

Use MoveIt in RViz by reading a `moveit.rviz` file where MoveIt environment data is configured.  
You can control the mounted manipulator using an interactive marker, and simulate the motion to a goal position, which helps preventing possible physical contact by simulating the motion in advance.  
**[Remote PC]**  
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

You can also use a GUI to control the OpenMANIPULATOR-X in Gazebo. The GUI supports **Task Space** and **Joint Space** controls.

- `Task Space Control`: Control based on valid gripping positions (represented as a small red cube between the grippers) of the end-effector of the OpenMANIPULATOR-X.
- `Joint Space Control`: Control based on each joint angle.  
**[Remote PC]**  
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
