Please be aware that the actual hardware operation requires [Bringup](#bringup) from the TurtleBot3 SBC.



Bring up the TurtleBot3 Manipulation using the following command.  
**[TurtleBot3 SBC]**  
  ```bash
  $ ros2 launch turtlebot3_manipulation_bringup hardware.launch.py
  ```


Enter the command below to launch the MoveIt on RViz.  
**[Remote PC]**  
```bash
$ ros2 launch turtlebot3_manipulation_moveit_config moveit_core.launch.py
```

To operate the robot with the keyboard teleoperation node, the RViz must be terminated.  
Then launch the servo server node and teleoperation nodes on a separate terminal window.  
**[Remote PC]**  
```bash
$ ros2 launch turtlebot3_manipulation_moveit_config servo.launch.py
```  
**[Remote PC]**  
```bash
$ ros2 run turtlebot3_manipulation_teleop turtlebot3_manipulation_teleop
```
