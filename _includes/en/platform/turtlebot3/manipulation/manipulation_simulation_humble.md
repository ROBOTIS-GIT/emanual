
Simulate the TurtleBot3 Manipulation using Gazebo by following the instructions below.

### [How to Run Gazebo](#how-to-run-gazebo)

Bringup the TurtleBot3 with OpenMANIPULATOR-X in Gazebo world with the following command.

**[Remote PC]** 

```bash
$ ros2 launch turtlebot3_manipulation_bringup gazebo.launch.py
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_manipulation_ros2_gazebo.png)



{% capture tip_01 %}
**TIP**

In order to run with RViz, append the `start_rviz` parameter as below.  
**[Remote PC]**  
```bash
$ ros2 launch turtlebot3_manipulation_bringup gazebo.launch.py start_rviz:=true
```
{% endcapture %}
<div class="notice--info">{{ tip_01 | markdownify }}</div>

To control the TurtleBot3 in the Gazebo simulation, the servo server node of MoveIt must be launched first.  
**[Remote PC]**  
```bash
$ ros2 launch turtlebot3_manipulation_moveit_config servo.launch.py
```

Launch the keyboard teleoperation node.  
**[Remote PC]**  
```bash
$ ros2 run turtlebot3_manipulation_teleop turtlebot3_manipulation_teleop
```

{% capture tip_02 %}
**TIP**

Following keys are used to control the TurtleBot3.  
```
Use o|k|l|; keys to move turtlebot base and use 'space' key to stop the base
Use s|x|z|c|a|d|f|v keys to Cartesian jog
Use 1|2|3|4|q|w|e|r keys to joint jog.
'ESC' to quit.
```
{% endcapture %}
<div class="notice--info">{{ tip_02 | markdownify }}</div>

### [Simulation with MoveIt](#simulation-with-moveit)

In order to use MoveIt to operate the OpenMANIPULATOR-X in Gazebo, terminate other Gazebo and RViz tools first.  
Enter the below command to launch RViz with MoveIt configuration.

**[Remote PC]** 

```bash
$ ros2 launch turtlebot3_manipulation_moveit_config moveit_gazebo.launch.py
```

The MoveIt Interface on RViz will be launched along with the Gazebo simulator.

![](/assets/images/platform/turtlebot3/manipulation/tb3_manipulation_ros2_rviz.png)
