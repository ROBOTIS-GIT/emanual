This example demonstrates how to control the TurtleBot3 in RViz using Interactive Markers. Interactive Markers allow users to move the robot by manipulating on-screen controls in RViz, enabling both linear movement and rotation without the need for a physical joystick or command-line inputs.
<iframe width="560" height="315" src="https://www.youtube.com/embed/im7HX76zR7U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Understanding the Overall Flow**

To successfully use Interactive Markers to control TurtleBot3, several key components must be launched. The interaction between these components enables real-time manual control of the robot in RViz.

- **TurtleBot3 Interactive Marker (`turtlebot3_interactive_marker node`)**
    - Manages interactive markers that allow users to control the TurtleBot3 within RViz.
    - Publishes updates via `/turtlebot3_interactive_marker/update`.
    - Receives user interactions and provides feedback through `/turtlebot3_interactive_marker/feedback`.
    - Converts interactive marker movements into `cmd_vel` commands, sending them to the TurtleBot3 Node.

- **TurtleBot3 Node (`turtlebot3_node`)**
    - Subscribes to `cmd_vel` to control the actual movement of the TurtleBot3.

- **Differential Drive Controller (`diff_drive_controller`)**
    - Receives odometry data and sends it to `/odom`.
    - Publishes transformations (`/tf`) necessary for maintaining the robot’s coordinate system.
    - Works in conjunction with Robot State Publisher.

- **Robot State Publisher (`robot_state_publisher`)**
    - Publishes the `/robot_description` and maintains the robot's kinematic model in RViz.

These components work together to allow real-time interactive control of the TurtleBot3 directly from RViz, enabling linear movement and rotation through intuitive marker interactions.

### [**Running the Interactive Marker Example**](#running-the-interactive-marker-example)

**1. Bringup TurtleBot3**

1. Open a new terminal on the remote PC with `Ctrl` + `Alt` + `T` and connect to the Raspberry Pi via SSH using its IP address.  
  **[Remote PC]**  
  ```bash
  $ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
  ```  

2. Bring up the basic packages to start essential TurtleBot3 applications. You will need to specify your TurtleBot3 model.  
**[TurtleBot3 SBC]**  
  ```bash
  $ export TURTLEBOT3_MODEL=burger
  $ ros2 launch turtlebot3_bringup robot.launch.py
  ```

Wait until the bringup process finishes and the TurtleBot3 is ready before proceeding.

**2. Start the Interactive Marker Server**

The interactive marker node must be launched to generate the markers in RViz and process user input. Run the following command to start the interactive marker node:

**[Remote PC]**
```bash
$ ros2 run turtlebot3_example turtlebot3_interactive_marker
```
This node initializes the interactive markers in RViz, allowing users to control the robot by dragging the visual markers.

**3. Visualizing TurtleBot3 Model in Rviz**

Before using interactive markers, RViz must be configured properly to visualize the robot model and enable marker-based control. Start RViz2:

**[Remote PC]**
```bash
$ rviz2
```
Once RViz2 opens, follow these steps to configure the display:
- **Add the Robot Model**:
    1. Click the "**Add**" button in the bottom-left corner.
    2. Select "**RobotModel**".
    3. Set the **Topic** to `/robot_description`.
- **Enable Interactive Markers**:
    1. Click the "**Add**" button again.
    2. Navigate to the "**By topic**" tab.
    3. Locate and select "**InteractiveMarkers**.

At this point, the TurtleBot3 should appear in RViz, along with interactive markers that allow you to control its movement.

**4. Controlling TurtleBot3 with Interactive Markers**

With RViz properly set up, you can now control TurtleBot3 using interactive markers:

- **Move Forward/Backward**: Drag the arrow-shaped marker along its axis.
- **Rotate Left/Right**: Click and rotate the circular handle.

These actions generate `cmd_vel` messages, which are sent to TurtleBot3 Node to execute real movement.

In this example, you have set up interactive marker control for TurtleBot3 in RViz, allowing for direct manual operation without predefined commands. This method provides an intuitive way to move the robot and observe its response in real time. Try exploring different interactions to get familiar with controlling TurtleBot3 through RViz.

