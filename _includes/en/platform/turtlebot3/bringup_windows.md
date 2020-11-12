## [Bringup](#bringup)

### [Run roscore](#run-roscore)

Run roscore from PC.

```bash
$ roscore
```

### [Bringup TurtleBot3](#bringup-turtlebot3)

1. Bring up basic packages to start TurtleBot3 applications from PC.
  ```bash
> set TURTLEBOT3_MODEL=${TB3_MODEL}
> roslaunch turtlebot3_bringup turtlebot3_remote.launch
  ```

2. Open a new ROS command window and enter the below command.  
  ```bash
> rosrun rviz rviz -d "<full path to turtlebot3_description>/rviz/model.rviz"
  ```  
  ![](/assets/images/platform/turtlebot3/bringup/run_rviz.jpg)
