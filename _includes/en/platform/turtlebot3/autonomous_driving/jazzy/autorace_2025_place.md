- **Description**  
<div style="margin-left: 2em;">
[video]  
`Place Mission` involves safely docking in front of the door and placing the delivery goods in the designated area.  
We use LiDAR data to dock perpendicular to the door. By comparing the distances from the LiDAR at `+10°` and `-10°`, the robot aligns itself so that the distances are equal, and then proceeds to dock until it reaches a specified distance from the door.
</div>

- **Running Module**
<div style="margin-left: 2em;">

1. Place the robot in front of the door.  
2. Run the door_docking node.  
``` bash
$ ros2 run turtlebot3_autorace_mission door_docking_node
```
3. Set the node configure and activate.  
``` bash
$ ros2 lifecycle set /door_docking_node configure
$ ros2 lifecycle set /door_docking_node activate
```
</div>