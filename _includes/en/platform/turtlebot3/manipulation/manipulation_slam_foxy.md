Be sure to read [SLAM](http://emanual.robotis.com/docs/en/platform/turtlebot3/ros2_slam/#slam) manual before use of the following instruction.
{: .notice--warning}

### [Run SLAM Nodes](#run_slam_nodes)

**[Remote PC]** 

1. Open a terminal on **Remote PC**. 
2. Launch **slam node** using the following command.
```bash
$ ros2 launch turtlebot3_manipulation_cartographer cartographer.launch.py
```

### [Run Teleoperation Nodes](#run_teleoperation_nodes)

**[Remote PC]** 

1. Open a terminal on **Remote PC**. 

2. Launch the servo server node.
```bash
$ ros2 launch turtlebot3_manipulation_moveit_config servo.launch.py
```

3. Launch **teleop node** using the following command.
```bash
$ ros2 run turtlebot3_manipulation_teleop turtlebot3_manipulation_teleop
```

4. Use `O`, `K`, `L`, `;` keys to drive the TurtleBot3 platform.
    
### [Save the Map](#save_the_map)

**[Remote PC]** 

1. Open a terminal on **Remote PC**. 
2. Run the nav2_map_server to save the current map on RViz.
```bash
$ ros2 run nav2_map_server map_saver_cli -f ~/map
```

    ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_slam.png)
