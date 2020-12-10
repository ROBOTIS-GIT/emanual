Be sure to read [SLAM](http://emanual.robotis.com/docs/en/platform/turtlebot3/ros2_slam/#slam) manual before use of the following instruction.
{: .notice--warning}

### [Run SLAM Nodes](#run_slam_nodes)

**[Remote PC]** 

1. Open a terminal on **Remote PC**. 
2. Launch **slam node** using the following command.
```bash
$ ros2 launch turtlebot3_cartographer cartographer.launch.py
```

### [Run Teleoperation Nodes](#run_teleoperation_nodes)

**[Remote PC]** 

1. Open a terminal on **Remote PC**. 
2. Launch **teleop node** using the following command.
```bash
$ ros2 run turtlebot3_manipulation_teleop turtlebot3_manipulation_teleop_keyboard
```

3. Manipulate OpenMANIPULATOR-X on TurtleBot3 using the virtual controller. Simply type the keys without using an **Enter** key. 
    
    ```bash
    ---------------------------
    Control TurtleBot3 + OpenManipulatorX
    ---------------------------
    8 : increase linear velocity
    2 : decrease linear velocity
    4 : increase angular velocity
    6 : decrease angular velocity
    5 : base stop

    w : increase x axis in task space
    s : decrease x axis in task space
    a : increase y axis in task space
    d : decrease y axis in task space
    z : increase z axis in task space
    x : decrease z axis in task space

    y : increase joint 1 angle
    h : decrease joint 1 angle
    u : increase joint 2 angle
    j : decrease joint 2 angle
    i : increase joint 3 angle
    k : decrease joint 3 angle
    o : increase joint 4 angle
    l : decrease joint 4 angle

    g : gripper open
    f : gripper close
           
    0 : init pose
    1 : home pose
           
    q to quit
    ---------------------------
    Present Linear Velocity: 0.000, Angular Velocity: 0.000
    Present Joint Angle J1: 0.000 J2: 0.000 J3: 0.000 J4: 0.000
    Present Kinematics Position X: 0.000 Y: 0.000 Z: 0.000
    ---------------------------
    ```
    
### [Save the Map](#save_the_map)

**[Remote PC]** 

1. Open a terminal on **Remote PC**. 
2. Launch **map_saver node** using the following command.
```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```

    ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_slam.png)
