- **Description**  
<div style="margin-left: 2em;">
[video]  
`Alley Mission` involves safely navigating through a narrow 30cm-wide passage.  
We use a wall-following method to complete this mission.  
Wall Following is a common navigation technique, especially in environments with narrow passages or corridors. The basic idea is to have the robot maintain a certain distance from a wall or boundary by continuously sensing its position relative to nearby surfaces.  
In our module, we use five laser scan readings at angles of -30°, -45°, -60°, -75°, and -90° to measure the distance from the wall.  
Additionally, we use three laser scan readings at angles of 0°, 90°, and 180° to determine whether the robot has reached the target destination.  
</div>

- **Running Module**
<div style="margin-left: 2em;">

1. Place the robot at the entrance of the alley.  
2. Run the alley_mission node.  
``` bash
$ ros2 run turtlebot3_autorace_mission alley_mission_node
```

3. Set the node configure and activate.  
``` bash
$ ros2 lifecycle set /alley_mission_node configure
$ ros2 lifecycle set /alley_mission_node activate
```
</div>


