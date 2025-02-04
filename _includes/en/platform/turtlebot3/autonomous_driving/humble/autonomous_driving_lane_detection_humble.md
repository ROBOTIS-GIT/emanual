## [Lane Detection](#lane-detection)

Lane detection package that runs on the `Remote PC` receives camera images either from TurtleBot3 or Gazebo simulation to detect driving lanes and to drive the Turtlebot3 along them.  
The following instructions describe how to use and calibrate the lane detection feature via rqt.

1. Launch the course in gazebo.
``` bash
$ ros2 launch turtlebot3_gazebo lane_tracking_example.launch.py
```  
2. Launch the instrinsic calibration node.
``` bash
$ ros2 launch turtlebot3_lane_tracking_camera instrinsic_camera_calibration.launch.py
```  

3. Launch the extrinsic calibration node as calibration mode.
``` bash
$ ros2 launch turtlebot3_lane_tracking_camera extinsic_camera_calibration.launch.py
```  

4. Launch the detect lane node  
``` bash
$ ros2 launch turtlebot3_lane_tracking_detect detect_lane.launch.py calibration_mode:=True
```  

5. Open the rqt.
``` bash
$ rqt
```  
Display three topics at each image viewer
  - `/detect/image_lane/compressed`  
  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_image_lane.png)
  - `/detect/image_yellow_lane_marker/compressed` : a yellow range color filtered image.  
  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_yellow_lane.png)
  - `/detect/image_white_lane_marker/compressed` : a white range color filtered image.  
  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_white_lane.png)

6. Apply the parameters you selected to the YAML file.  
  It determines the default parameter values when launching without calibration_mode.  
``` bash
$ cd ~/turtlebot3_ws/src/turtlebot3_example/turtlebot3_lane_tracking_detect/param/lane
$ gedit lane.yaml
```  
![](/assets/images/platform/turtlebot3/lane_tracking/detect_yaml.png)  