## [Bringup](#bringup)

### [Run roscore](#run-roscore)

Run roscore from either PC or SBC.

```bash
> roscore
```

### [Bringup TurtleBot3](#bringup-turtlebot3)

Bring up basic packages from TurtleBot3 SBC to start TurtleBot3 applications.
  ```bash
> roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **Read more about launching RViz**
{: .notice--success}
</summary>
### [Load TurtleBot3 on Rviz](#load-turtlebot3-on-rviz)

1. Bring up basic packages to start TurtleBot3 applications. Replace the `${TB3_MODEL}` parameter with your model name such as `burger`, `waffle`, `waffle_pi`.  
  ```bash
> set TURTLEBOT3_MODEL=${TB3_MODEL}
> roslaunch turtlebot3_bringup turtlebot3_remote.launch
  ```

2. Open a new ROS command window and enter the below command.  
  ```bash
> rosrun rviz rviz -d "<full path to turtlebot3_description>/rviz/model.rviz"
  ```  
  ![](/assets/images/platform/turtlebot3/bringup/run_rviz.jpg)

</details>
