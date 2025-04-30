This section explains how to configure and execute the TurtleBot3 ArUco Tracker function. The camera vision recognizes the ArUco marker and broadcasts it via TF conversion.  
If you want more information, check out the [OpenCV Docs](https://docs.opencv.org/4.x/d5/dae/tutorial_aruco_detection.html).
- **NOTE**:  
  - The `turtlebot3_aruco_tracker` uses the RaspberryPi camera. To use camera module, you must follow [SBC Setup](/docs/en/platform/turtlebot3/sbc_setup/#rpi-camera).  
  - If you want to perform Automatic Parking Vision, need to set the TurtleBot3 model to `waffle_pi`.
{: .notice}
<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/6ZyaFREFhnk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

1. **Installation**  
Before running the example, make sure the required packages is installed.  
  ```bash
  $ cd ~/turtlebot3_ws/src/
  $ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
  $ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_applications_msgs.git
  $ cd ~/turtlebot3_ws/
  $ colcon build --symlink-install
  $ source ~/.bashrc
  ```  
<br>

2. **Bringup TurtleBot3**  
Bring up basic packages to start essential TurtleBot3 applications. You will need to specify your specific TurtleBot3 model.  
**[TurtleBot3 SBC]**  
  ```bash
  $ export TURTLEBOT3_MODEL=burger
  $ ros2 launch turtlebot3_bringup robot.launch.py
  ```
<br>

3. **Start the Camear node**  
Run camera_node.  
  **[TurtleBot3 SBC]**  
  ```bash
  $ ros2 run camera_ros camera_node --ros-args -p format:='RGB888' -p width:=320 -p height:=240
  ```
<br>

4. **Visualizing TurtleBot3 and TF of ArUco markers in RViz**  
Launch the RViz to view the TurtleBot3’s movements and visualize TF.  
**[Remote PC]**
  ```bash
  $ ros2 launch turtlebot3_bringup rviz2.launch.py
  ```
<br>

5. **Tracking ArUco markers**  
Launch a node that tracks ArUco markers  
**[Remote PC]**
  ```bash
  $ ros2 launch turtlebot3_aruco_tracker turtlebot3_aruco_tracker.launch.py
  ```
