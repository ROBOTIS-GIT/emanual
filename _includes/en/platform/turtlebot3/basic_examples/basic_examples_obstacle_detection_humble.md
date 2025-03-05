**Understanding the Overall Flow**

To successfully detect obstacles and prevent collisions, several key components must be launched. The interaction between these components enables real-time obstacle detection and autonomous stopping of the robot when an obstacle is detected within a certain distance.

- **TurtleBot3 Obstacle Detection Node (`turtlebot3_obstacle_detection node`)**
    - Subscribes to LaserScan messages from the LiDAR sensor (/scan).
    - Analyzes scan data to detect obstacles in a defined stop zone (e.g., within 0.5m distance, -90 to +90 degrees in front).
    - Publishes appropriate `cmd_vel` commands to control the robot’s motion.

- **TurtleBot3 Node (`turtlebot3_node`)**
    - Subscribes to `cmd_vel` to control the actual movement of TurtleBot3.

These components work together to allow real-time obstacle detection and autonomous stopping of TurtleBot3, ensuring safe navigation.

### [**Running the Obstacle Detection Example**](#running-the-obstacle-detection-example)

**1. Bring up TurtleBot3**

Open a new terminal on the remote PC (e.g., your laptop) and connect to the Raspberry Pi via SSH:  
  **[Remote PC]**  
  ```bash
  $ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
  ```  

Once connected, launch the essential TurtleBot3 bringup package:  
**[TurtleBot3 SBC]**  
  ```bash
  $ export TURTLEBOT3_MODEL=burger
  $ ros2 launch turtlebot3_bringup robot.launch.py
  ```

Wait until the bringup process finishes and the TurtleBot3 is ready before proceeding.

**2. Start the Obstacle Detection Node**

To activate the Obstacle Detection system, launch the following node:

**[Remote PC]**  
  ```bash
  $ ros2 run turtlebot3_example turtlebot3_obstacle_detection
  ```
This node subscribes to LaserScan (/scan) and processes LiDAR data to determine whether there are obstacles within the predefined range.

**3. Testing Obstacle Detection**  
Once the system is set up, you can test the obstacle detection functionality to verify its behavior in real-time.

- **Expected Behavior**
    1. The robot moves forward at 0.2 m/s when no obstacles are detected.
    2. When an obstacle is detected within 0.5m in front, the robot will stop immediately.
    3. If the obstacle is removed, the robot will resume moving forward at 0.2 m/s.
    4. The robot does not attempt to avoid the obstacle, it only stops and waits for clearance.


- **How It Works**
    1. The robot constantly receives LaserScan (scan topic) data from the LiDAR sensor.
    2. It monitors the distance to the closest obstacle within the front 180° field of view (-90° to +90°).
    3. If any object is detected within 0.5m, the robot sets linear.x = 0.0, stopping the movement.
    4. If no obstacles are detected, the robot resumes its normal movement (linear.x = 0.2).


