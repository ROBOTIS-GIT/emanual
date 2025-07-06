- **Description**  
<div style="margin-left: 2em;">
**TurtleBot3 Autorace 2025** is an autonomous delivery competition using the TurtleBot3 platform equipped with a 1-DOF arm.  
With the goal of delivering three items accurately and quickly, the robot must recognize delivery orders, navigate to stores while avoiding obstacles, and deliver items to designated locations.  
> Participants will complete three delivery rounds within a 10-minute limit. The final ranking is based on total score and completion time. The competition is designed to be accessible, educational, and exciting for university students and beginners.  
</div>

- **Mission configuration**
  - [`Order Recognition`](/docs/en/platform/turtlebot3/autorace_2025/#order-recognition): Recognizes store signs and door numbers to determine the delivery destination.  
  - [`Alley Path`](/docs/en/platform/turtlebot3/autorace_2025/#alley-path): Navigates through a narrow 30 cm-wide alley.  
  - [`Pick Up`](/docs/en/platform/turtlebot3/autorace_2025/#pick-up): Detects store signs to determine whether the store is the correct pickup location, performs precise parking, and picks up the item accurately.  
  - [`Static Obstacle Path`](/docs/en/platform/turtlebot3/autorace_2025/#static-obstacle-path): Detects static obstacles and safely passes through the path.  
  - [`Delivery`](/docs/en/platform/turtlebot3/autorace_2025/#delivery): Identifies the correct delivery location, docks at the door, and places the item down.  
  - [`Station Docking`](/docs/en/platform/turtlebot3/autorace_2025/#station-docking): Docks at the charging station automatically after completing all missions.  

- **Provided module**  
  - `undocking_node`: A module that performs straight backward movement to a specified coordinate.  
  - `object_detection_node`: A module that detects stores and room numbers and sends the result via a service.  
  - `alley_mission_node`: A module that navigates through the alley mission using wall-following.  
  - `aruco_tracker_node`: A module that detects ArUco markers.  
  - `aruco_parking_node`: A module that estimates position using detected ArUco markers and performs precise parking.  
  - `arm_controller_node`: A module that lifts the 1-DOF Dynamixel arm to pick up the delivery item.  
  - `door_docking_node`: A module that docks perpendicularly in front of a door.  
  - `station_docking_node`: A module that docks at the charging station.  
