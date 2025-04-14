TurtleBot3 can moves with receiving a certain topic: **/cmd_vel_raw** from obstacle detection node. Using LDS data and detecting obstacles, the robot can stop moving.  

**[Remote PC]**

1. Open a terminal on **Remote PC**.

2. Run the teleoperation keyboard.
  ``` bash
  $ ros2 run turtlebot3_teleop teleop_keyboard /cmd_vel:=/cmd_vel_raw
  ```

3. Launch the obstacle detection.
  ``` bash
  $ ros2 launch turtlebot3_example turtlebot3_obstacle_detection
  ```
