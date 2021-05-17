
1. Click the `Navigation2 Goal` button in the RViz2 menu.
2. Click on the map to set the destination of the robot and drag the green arrow toward the direction where the robot will be facing. 
  - This green arrow is a marker that can specify the destination of the robot. 
  - The root of the arrow is `x`, `y` coordinate of the destination, and the angle `θ` is determined by the orientation of the arrow.
  - As soon as x, y, &theta; are set, TurtleBot3 will start moving to the destination immediately.
  ![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_02.png)

<iframe width="560" height="315" src="https://www.youtube.com/embed/VtyqUuuZAFA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<details>
<summary>
![](/assets/images/icon_unfold.png) Read more about **Navigation2**
</summary>
- The robot will create a path to reach to the Navigation2 Goal based on the global path planner. Then, the robot moves along the path. If an obstacle is placed in the path, the Navigation2 will use local path planner to avoid the obstacle.

- Setting a Navigation2 Goal might fail if the path to the Navigation2 Goal cannot be created. If you wish to stop the robot before it reaches to the goal position, set the current position of TurtleBot3 as a Navigation2 Goal.

- [Official ROS2 Navigation2 Wiki][nav2]
</details>
