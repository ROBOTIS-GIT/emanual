
1. Click the `2D Nav Goal` button in the RViz menu.
  ![](/assets/images/platform/turtlebot3/navigation/2d_nav_goal_button.png)
2. Click on the map to set the destination of the robot and drag the green arrow toward the direction where the robot will be facing. 
  - This green arrow is a marker that can specify the destination of the robot. 
  - The root of the arrow is `x`, `y` coordinate of the destination, and the angle `θ` is determined by the orientation of the arrow.
  - As soon as x, y, &theta; are set, TurtleBot3 will start moving to the destination immediately.
  ![](/assets/images/platform/turtlebot3/navigation/2d_nav_goal.png)

<iframe width="640" height="360" src="https://www.youtube.com/embed/VYlMywwYALU" frameborder="0" allowfullscreen></iframe>

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read more about **Navigation**
{: .notice--success}
</summary>
- The robot will create a path to reach to the Navigation Goal based on the global path planner. Then, the robot moves along the path. If an obstacle is placed in the path, the Navigation will use local path planner to avoid the obstacle.

- Setting a Navigation Goal might fail if the path to the Navigation Goal cannot be created. If you wish to stop the robot before it reaches to the goal position, set the current position of TurtleBot3 as a Navigation Goal.

- [Official ROS Navigation Wiki][navigation]
</details>
