<div class="notice--danger">

In order to follow along with the examples below, you have to install the [turtlebot3_applications][turtlebot3_applications] packages.  
Also it uses the navigation2 package, make sure that the `Navigation2` package and `turtlebot3_simulation` are properly installed by following the Quick Start Guide.  

Go to your `turtlebot3_ws` directory and clone the `turtlebot3_applications` and `turtlebot3_applications_msgs` repository. Then build the new packages.  
**[Remote PC]**
```bash
$ sudo apt install ros-humble-navigation2
$ cd ~/turtlebot3_ws/src
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install
```
</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/YXF3FeRNSeE" frameborder="0" allowfullscreen></iframe>

### Description
  - **What is Follower example?**
    - This example demonstrates a robot following the one in front of it.
    - When the leading robot is controlled via teleoperation, the remaining robots follow the one in front of them in sequence.
    - This example uses odometry and the Nav2 local planner.
<div class="notice--info">

**NOTE**:
- Odometry drift can accumulate over time, making it less accurate.
</div>

### Follower in Gazebo
1. Modify the [Multi Robot Launch](#modifing-multi-robot-launch-in-gazebo) file according to your intended purpose.  
   <div class="notice--info">
   In the demo video and manual, it was used as shown below.  
   `number_of_robot` = 5  
   `pose` = [[-0.8,-0.5], [-1.0,-0.5], [-1.2,-0.5], [-1.4,-0.5], [-1.6,-0.5]]  
   `world` = 'turtlebot3_world.world'  
   </div>
2. Launch the Gazebo with five turtlebot3s.  
**[Remote PC]**  
```bash
$ export TURTLEBOT3_MODEL=burger
$ ros2 launch turtlebot3_gazebo multi_robot.launch.py
```  
![](/assets/images/platform/turtlebot3/basic_examples/follower/gazebo.png)  

3. Modify the `turtlebot3_follower.launch.py` in `turtlebot3_follower package`.  
Set the variable `number_of_follower`. In the demo, we used 5 robots in total, so we set it to 4.  
![](/assets/images/platform/turtlebot3/basic_examples/follower/follower_launch.png)

4. Launch the follower node.  
**[Remote PC]**
```bash
$ ros2 launch turtlebot3_follower turtlebot3_follower.launch.py use_sim_time:=true
```

5. Open the Rviz2 and click `file` → `Open Config` → `follower.rviz` in `turtlebot3_follower_package`.  
**[Remote PC]**
```bash
$ rviz2
```
![](/assets/images/platform/turtlebot3/basic_examples/follower/rviz_gazebo.png)  

6. Teleop leader robot.  
**[Remote PC]**  
```bash
$ ros2 run turtlebot3_teleop teleop_keyboard --ros-args -r __ns:=/TB3_1
```
![](/assets/images/platform/turtlebot3/basic_examples/follower/rviz_gazebo2.png)  

### Follower in real robot

1. Align the TurtleBot3s in a straight line and place them close together like below picture.  
![](/assets/images/platform/turtlebot3/basic_examples/follower/real_robot.png)  

2. Bringup leader turtlebot3 with namespace `TB3_1`.  
**[TurtleBot3 SBC]**  
```bash
$ ros2 launch turtlebot3_bringup robot.launch.py namespace:=TB3_1
```

3. Bringup follower turtlebot3 with namespace `TB3_2`,`TB3_3`...etc  
**[TurtleBot3 SBC]**  
```bash
$ ros2 launch turtlebot3_bringup robot.launch.py namespace:=TB3_2 # TB3_3, TB3_4 ...etc
```

4. Set the variable `number_of_follower` and launch the follower node.  
**[Remote PC]**  
```bash
$ ros2 launch turtlebot3_follower turtlebot3_follower.launch.py
```
5. Open the Rviz2 and click `file` → `Open Config` → `follower.rviz` in `turtlebot3_follower_package`.  
**[Remote PC]**  
```bash
$ rviz2
```
![](/assets/images/platform/turtlebot3/basic_examples/follower/rivz_reality_robot.png)

6. Teleop leader robot.  
**[Remote PC]**
```bash
$ ros2 run turtlebot3_teleop teleop_keyboard --ros-args -r __ns:=/TB3_1
```
