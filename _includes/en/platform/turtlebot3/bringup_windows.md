## [Bringup](#bringup)

### [Bringup TurtleBot3](#bringup-turtlebot3)

Bring up basic packages from TurtleBot3 to start TurtleBot3 applications.
  ```bash
> roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **Read more about loading TurtleBot3 on RViz**
{: .notice--success}
</summary>
1. Bring up basic packages to start TurtleBot3 applications.  
  Please use the proper keyword among `burger`, `waffle`, `waffle_pi` for the `TURTLEBOT3_MODEL` parameter.  
  ```bash
> set TURTLEBOT3_MODEL=waffle
> roslaunch turtlebot3_bringup turtlebot3_remote.launch
  ```

2. Open a new ROS command window and enter the below command.  
  ```bash
> rosrun rviz rviz -d "<full path to turtlebot3_description>/rviz/model.rviz"
  ```  
  ![](/assets/images/platform/turtlebot3/bringup/run_rviz.jpg)
</details>
