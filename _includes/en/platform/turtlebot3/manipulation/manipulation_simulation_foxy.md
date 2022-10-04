
Simulate the TurtleBot3 Manipulation using Gazebo by following the instructions below.

### [How to Run Gazebo](#how-to-run-gazebo)

**[Remote PC]** Bringup the TurtleBot3 with OpenMANIPULATOR-X into Gazebo world with the following command.

```bash
$ ros2 launch turtlebot3_manipulation_bringup gazebo.launch.py
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_manipulation_ros2_gazebo.png)

In order to run with RViz, append the `start_rviz` parameter as below.

```bash
$ ros2 launch turtlebot3_manipulation_bringup gazebo.launch.py start_rviz:=true
```

### [How to Run MoveIt](#how-to-run-moveit)

**[Remote PC]** In order to use MoveIt to operate the OpenMANIPULATOR-X, terminate other Gazebo and RViz tools first.  
Enter the below command to launch RViz with MoveIt configuration.

```bash
$ ros2 launch turtlebot3_manipulation_moveit_config moveit_gazebo.launch.py start_rviz:=true
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_manipulation_ros2_rviz.png)
