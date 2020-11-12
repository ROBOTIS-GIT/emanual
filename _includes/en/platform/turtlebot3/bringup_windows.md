## [Bringup](#bringup)

### [Run roscore](#run-roscore)

Run roscore from PC.

```bash
$ roscore
```

### [Bringup TurtleBot3](#bringup-turtlebot3)

1. Open a new ROS command window from PC and connect to Raspberry Pi with its IP address.  
  The default password is **turtlebot**.  
  ```bash
$ ssh pi@{IP_ADDRESS_OF_RASPBERRY_PI}
  ```

2. Bring up basic packages to start TurtleBot3 applications.
  ```bash
> set TURTLEBOT3_MODEL=${TB3_MODEL}
> roslaunch turtlebot3_bringup turtlebot3_remote.launch
  ```

3. Open a new ROS command window and enter the below command.  
  ```bash
> rosrun rviz rviz -d "<full path to turtlebot3_description>/rviz/model.rviz"
  ```  
  ![](/assets/images/platform/turtlebot3/bringup/run_rviz.jpg)
