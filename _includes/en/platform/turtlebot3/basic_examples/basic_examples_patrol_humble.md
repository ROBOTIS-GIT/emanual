This section explains how to configure and execute the TurtleBot3 patrol function, enabling autonomous movement along predefined and custom routes using ROS 2 Humble. The Action Client sends patrol parameters (e.g., shape, area, or iteration count) to the Action Server, which then translates these parameters into `cmd_vel` commands to move the TurtleBot3. Please refer to the above [tutorial video][tutorial_video] for more detailed usage.


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


### [Running the Patrol Example](#Patrol)

**1. Bringup TurtleBot3**
1. Open a new first terminal on the remote PC with `Ctrl` + `Alt` + `T` and connect to the Raspberry Pi via SSH using its IP address.  
  Enter your `password` of Ubuntu OS in `Raspberry pi` .  
  **[Remote PC]**  
  ```bash
  $ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
  ```  

2. Bring up basic packages to start essential TurtleBot3 applications. You will need to specify your specific TurtleBot3 model.  
**[TurtleBot3 SBC]**  
  ```bash
  $ export TURTLEBOT3_MODEL=burger
  $ ros2 launch turtlebot3_bringup robot.launch.py
  ```

Wait until the bringup process finishes and the TurtleBot3 is ready before proceeding.  

**2. Start the Patrol Server**

Open a new second terminal on the remote PC and run the patrol server node.  
**[TurtleBot3 SBC]**  
  ```bash
  $ ros2 run turtlebot3_example turtlebot3_patrol_server
  ```

**3. Start the Patrol Client**

Open a new third terminal on the remote PC and run the patrol client node.  
**[Remote PC]**  
  ```bash
  $ export TURTLEBOT3_MODEL=burger
  $ ros2 run turtlebot3_example turtlebot3_patrol_client
  ```

When the client starts, you will be prompted to select the patrol shape (square or triangle) and enter any required parameters (such as side length or number of iterations). Type in the desired values and press Enter.
The client sends the provided information to the server, and the TurtleBot3 begins its patrol accordingly.

**4. Visualizing TurtleBot3 in RViz *(Optional)***
To view the TurtleBot3’s movements and visualize the robot in RViz, you can launch the RViz visualization tool.  
**[Remote PC]**  
  ```bash
  $ ros2 launch turtlebot3_bringup rviz2.launch.py
  ```

Once RViz is open, you will be able to see the TurtleBot3 as it performs the patrol according to the parameters you set.

To further explore the functionality of the system, it is recommended to experiment with different patrol parameters, such as varying the side length of the patrol shape, adjusting the number of repetitions, or modifying the patrol speed. These adjustments will allow you to observe how the patrol behavior changes and deepen your understanding of how the action client-server framework coordinates movement. By systematically testing different configurations, you can refine your usage of the patrol system and optimize it for specific applications.
