
**Initial Pose Estimation** must be performed before running Navigation as this process initializes the AMCL parameters that are critical for successful Navigation. The TurtleBot3 has to be correctly located on the map with the LDS sensor data overlapping the displayed map.

1. Click the `2D Pose Estimate` button in the RViz menu.  
  ![](/assets/images/platform/turtlebot3/navigation/2d_pose_button.png)
2. Click on the map where the actual robot is located and drag the large green arrow toward the direction where the robot is facing.
3. Repeat step 1 and 2 until the LDS sensor data is overlayed on the saved map. 
4. Launch keyboard teleoperation node to precisely locate the robot on the map.  
**[Remote PC]**  
  ```bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
  ```
5. Move the robot back and forth a bit to collect the surrounding environment information and narrow down the estimated location of the TurtleBot3 on the map (displayed with tiny green arrows).  
![](/assets/images/platform/turtlebot3/navigation/tb3_amcl_particle_01.png)
![](/assets/images/platform/turtlebot3/navigation/tb3_amcl_particle_02.png)
6. Terminate the keyboard teleoperation node with `Ctrl` + `C` in order to prevent different **cmd_vel** values being published from multiple nodes during Navigation.
