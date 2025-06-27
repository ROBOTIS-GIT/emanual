- **Description**  
<div style="margin-left: 2em;">
[video]  
`Undocking module` is used in the charge station, pickup, and place missions.  
It performs a simple straight backward movement to a specific position based on AMCL localization.This node does not perform alignment. It simply undocks the robot by reversing.  
</div>

- **Running Module**
<div style="margin-left: 2em;">

1. Run the undocking_node.  
``` bash
$ ros2 run turtlebot3_autorace_mission undocking_node
```

2. Set the node configure and activate.  
``` bash
$ ros2 lifecycle set /alley_mission_node configure
$ ros2 lifecycle set /alley_mission_node activate
```

3. Send the target goal position via a service. Either the x or y coordinate must be exactly 0.0. This node performs backward movement toward the target based on either the x or y coordinate.  
``` bash
$ ros2 service call /undocking_target turtlebot3_autorace_msgs/srv/UndockingTarget "{target_x: 0.5, target_y: 0.0}"
```
</div>
