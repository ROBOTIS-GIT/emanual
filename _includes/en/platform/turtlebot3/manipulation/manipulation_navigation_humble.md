Be sure to read [Navigation](/docs/en/platform/turtlebot3/navigation/#navigation) manual before use of the following instruction.
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
  $ ros2 launch turtlebot3_manipulation_gazebo gazebo.launch.py
  ```

### Run Navigation Nodes  
 **[Remote PC]**  
1. Open a terminal on **Remote PC**. 
2. Launch the navigation file using the following command.
```bash
$ ros2 launch turtlebot3_manipulation_navigation2 navigation2.launch.py map_yaml_file:=$HOME/map.yaml
```

    ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_navigation.png)
