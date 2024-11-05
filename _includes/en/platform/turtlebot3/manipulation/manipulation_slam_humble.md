Be sure to read [SLAM](http://emanual.robotis.com/docs/en/platform/turtlebot3/slam/#slam) manual before use of the following instruction.
{: .notice--warning}

### TurtleBot3 Bringup


Bring up the TurtleBot3 Manipulation `Actual` or `Simulation` using the following command.  
`Actual` **[TurtleBot3 SBC]**  
  ```bash
  $ ros2 launch turtlebot3_manipulation_bringup hardware.launch.py
  ```
OR  
`Simulation` **[Remote PC]**  
  ```bash
  $ ros2 launch turtlebot3_manipulation_bringup gazebo.launch.py
  ```

### [Run SLAM Nodes](#run_slam_nodes)

Launch **slam node** using the following command.  
**[Remote PC]**   
  ```bash
$ ros2 launch turtlebot3_manipulation_cartographer cartographer.launch.py
  ```

### [Run Teleoperation Nodes](#run_teleoperation_nodes)  


1. Launch the servo server node.  
**[Remote PC]**
  ```bash
$ ros2 launch turtlebot3_manipulation_moveit_config servo.launch.py
  ```  

2. Launch **teleop node** using the following command.  
**[Remote PC]**
  ```bash
$ ros2 run turtlebot3_manipulation_teleop turtlebot3_manipulation_teleop
  ```

3. Use `O`, `K`, `L`, `;` keys to drive the TurtleBot3 platform.

### [Save the Map](#save_the_map)

1. Open a terminal on **Remote PC**. 
2. Run the nav2_map_server to save the current map on RViz.  
**[Remote PC]**  
```bash
$ ros2 run nav2_map_server map_saver_cli -f ~/map
```

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_slam.png)
