This manual describes how to set up and run the TurtleBot3 example on ROS 2 Humble. The Action Client sends patrol parameters (e.g., shape, area, or iteration count) to the Action Server, which then translates these parameters into `cmd_vel` commands to move the TurtleBot3. Please refer to the above [tutorial video][tutorial_video] for more detailed usage.


**Understanding the Overall Flow**

In this setup, different nodes work together to accomplish the patrol behavior:

- **TurtleBot3 Patrol Client (`turtlebot3_patrol_client`)**
  - Accepts user input (such as the selected patrol shape and number of iterations).
  - Sends the patrol parameters to the **Action Server**.
  - Receives feedback on the progress of the patrol and displays status messages.

- **TurtleBot3 Patrol Server (`turtlebot3_patrol_server`)**
  - Receives patrol instructions from the **Action Client**.
  - Converts the instructions into motion commands (`cmd_vel`) for the TurtleBot3.
  - Sends back feedback (such as completion status) to the client.

- **TurtleBot3 Node (`turtlebot3_node`)**
  - Executes movements based on `cmd_vel` messages.
  - Publishes sensor data (e.g., IMU, battery state, LIDAR scans) and transformation data (`tf`).
  - Interfaces with hardware drivers so that the robot can perform physical movements.


**Running the Example**

**1. Bringup**

**[TurtleBot3 SBC]** Before running the patrol example, you must launch the basic TurtleBot3 bringup to start essential nodes for controlling and monitoring the robot:

```bash
ros2 launch turtlebot3_bringup robot.launch.py
```

Wait until the bringup process finishes and the TurtleBot3 is ready before proceeding.

**2. Start the Patrol Server**

**[Remote PC]** Run the patrol server node.

```bash
ros2 run turtlebot3_example turtlebot3_patrol_server
```

**3. Start the Patrol Client**

**[Remote PC]** Run the patrol client node.

```bash
ros2 run turtlebot3_example turtlebot3_patrol_client
```

When the client starts, you will be prompted to select the patrol shape (square or triangle) and enter any required parameters (such as side length or number of iterations). Type in the desired values and press Enter.
The client sends the provided information to the server, and the TurtleBot3 begins its patrol accordingly.

To further explore the functionality of the system, it is recommended to experiment with different patrol parameters, such as varying the side length of the patrol shape, adjusting the number of repetitions, or modifying the patrol speed. These adjustments will allow you to observe how the patrol behavior changes and deepen your understanding of how the action client-server framework coordinates movement. By systematically testing different configurations, you can refine your usage of the patrol system and optimize it for specific applications.
