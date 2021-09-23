
Send TurtleBot3 with OpenMANIPULATOR to the desired position in the map using Navigation node.

### [Run roscore](#run-roscore)

**[Remote PC]** Run roscore to use ROS 1.

```bash
$ roscore
```

### [Run Bringup](#run-bringup)

**[TurtleBot3 SBC]** Run Bringup node for TurtleBot3, and start rosserial and LDS sensor using following command.

```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

### [Run Navigation Node](#run-navigation-node)

**[Remote PC]** Run Navigation node with the following command, which will call Unified Robot Description Format (urdf) and configuration data of RViz to set GUI enviroment, parmeters for Navigation and updated map.

```bash
$ roslaunch turtlebot3_manipulation_navigation navigation.launch
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_omx_nav.png)

### [How to Control OpenMANIPULATOR with Navigation](#how-to-control-openmanipulator-with-navigation)

You can run this node to control OpenMANIPULATOR on TurtleBot3 when TurtleBot3 is approaching to a goal position when Navigation node is running.
However, when TurtleBot3 is in motion, the movement of OpenMANIPULATOR will be unstable by external influences, such as center of gravity, or vibration; so that it is recommended for the manipulator to be used when TurtleBot3 is not driving.

#### [Run Bringup node for OpenMANIPULATOR](#run-bringup-for-openmanipulator)

**[Remote PC]** Run **turtlebot3_manipulation_bringup** node just as use of single OpenMANIPULATOR. This node contains **arm_controller** and **gripper_controller**.

```bash
$ roslaunch turtlebot3_manipulation_bringup turtlebot3_manipulation_bringup.launch
```

#### [Run move_group Node](#run-move-group-node)

**move_group** node supports two interfaces to control OpenMANIPULATOR; **Moveit!** and **ROBOTIS GUI**. Choose either of them according to your preference. In this section, GUI Controller is introduced only.

```bash
$ roslaunch turtlebot3_manipulation_moveit_config move_group.launch
```

**NOTE**: Please refer to [MoveIt!](https://moveit.ros.org/) for more details.
{: .notice--info}

### [Run GUI Controller](#run-gui-controller)

Using this interface, you can control OpenMANIPULATOR on TurtleBot3
**[Remote PC]**

```bash
$ roslaunch turtlebot3_manipulation_gui turtlebot3_manipulation_gui.launch
```

[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
[manipulator_id]: https://github.com/ROBOTIS-GIT/OpenCR/blob/ef4e71be84dd899b03e359703be93c5000c5954a/arduino/opencr_arduino/opencr/libraries/turtlebot3/examples/turtlebot3_with_open_manipulator/turtlebot3_with_open_manipulator_core/open_manipulator_driver.h#L27
[turtlebot3_core]: https://github.com/ROBOTIS-GIT/turtlebot3/blob/467c76bc4fa2e34162f57107388839d82d3bcc0e/turtlebot3_bringup/launch/turtlebot3_core.launch#L5
[smach]: http://wiki.ros.org/smach
