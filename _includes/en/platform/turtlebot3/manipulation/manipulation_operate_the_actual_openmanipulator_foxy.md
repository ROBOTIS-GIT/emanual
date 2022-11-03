Please be aware that the acutual hardware operation requires [Bringup](#bringup) from the TurtleBot3 SBC.

**[Remote PC]** Enter the command below to launch the MoveIt on RViz.

```bash
$ ros2 launch turtlebot3_manipulation_moveit_config moveit_core.launch.py
```

To operate the robot with the keyboard teleoperation node, the RViz must be terminated.  
Then launch the servo server node and teleoperation nodes on a separate terminal window.

```bash
$ ros2 launch turtlebot3_manipulation_moveit_config servo.launch.py
```

```bash
$ ros2 run turtlebot3_manipulation_teleop turtlebot3_manipulation_teleop
```
