This section explains how to configure and execute the TurtleBot3 ArUco Tracker function. The camera vision recognizes the ArUco marker and broadcasts it via TF conversion.  
If you want more information, check out the [OpenCV Docs](https://docs.opencv.org/4.x/d5/dae/tutorial_aruco_detection.html).
- **NOTE**:  
  - The `turtlebot3_aruco_tracker` uses the RaspberryPi camera.  
  - If you want to perform Automatic Parking Vision, need to set the TurtleBot3 model to `waffle_pi`.
{: .notice}
<iframe width="560" height="315" src="https://www.youtube.com/embed/3DATI4FJnPw" frameborder="0" allowfullscreen></iframe>

1. **Installation**  
Before running the example, make sure the required packages is installed.  
**[Remote PC]**  
```bash
$ cd ~/turtlebot3_ws/src/
$ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
$ cd ~/turtlebot3_ws/
$ colcon build --symlink-install --packages-select turtlebot3_aruco_tracker
```  
<br>

2. **Setup environment**  
Opencv-contrib-python is a package that contains contributed modules in addition to the usual OpenCV core modules.  
**[Remote PC]**  
```bash
$ pip install opencv-contrib-python
```  
<br>

3. **Prepare an ArUco marker**  
ArUco markers are divided into multiple dictionaries to balance the number of markers, identification reliability, and detection speed. In this example, we used the `DICT_5X5_250` dictionary. Prepare an image of an ArUco marker and measure the size of the marker.  

      ![ArUco marker](/assets/images/platform/turtlebot3/application/aruco_marker.jpg)  
<br>

4. **Bringup TurtleBot3**  
Bring up basic packages to start essential TurtleBot3 applications. You will need to specify your specific TurtleBot3 model.  
**[TurtleBot3 SBC]**  
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ ros2 launch turtlebot3_bringup robot.launch.py
```
<br>

5. **Start the Camera node**  
Run camera_node. To use camera module, you must follow [SBC Setup](/docs/en/platform/turtlebot3/sbc_setup/#raspberry-pi-camera) and camera calibration. If you don't perform the calibration correctly, tracking will not work properly.  
- For `camera-ros`  
**[TurtleBot3 SBC]**  
```bash
$ ros2 launch turtlebot3_bringup camera.launch.py --ros-args -p width:=320 -p height:=240
```
- For `v4l2-camera`  
Adding `-r __ns:=/camera` organizes all topics published by the node under the `/camera` namespace.   
**[TurtleBot3 SBC]**  
```bash
$ ros2 run v4l2_camera v4l2_camera_node --ros-args -p image_size:=[320,240] -r __ns:=/camera
<br>

6. **Visualizing TurtleBot3 and TF of ArUco markers in RViz**  
Launch the RViz to view the TurtleBot3’s movements and visualize TF.  
**[Remote PC]**
```bash
$ ros2 launch turtlebot3_bringup rviz2.launch.py
```
<br>

7. **Tracking ArUco markers**  
**Launch argument**  
`marker_size`
- default: 0.04
- description: An integer value for the size of the marker to use. Unit of meters.  

    **[Remote PC]**
    ```bash
    $ ros2 launch turtlebot3_aruco_tracker turtlebot3_aruco_tracker.launch.py marker_size:=0.04
    ```
    ![ArUco Tracker RViz](/assets/images/platform/turtlebot3/application/aruco_tracker_rviz.png)  
