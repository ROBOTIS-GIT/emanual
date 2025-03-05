## [Lane Detection](#lane-detection)

<iframe width="560" height="315" src="https://www.youtube.com/embed/IqV4huXGBEk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Lane detection allows TurtleBot3 to recognize lane markings and follow them autonomously. The system processes camera images from either a real TurtleBot3 or Gazebo simulation, applies color filtering, and identifies lane boundaries.

This section explains how to launch the lane detection system, visualize the detected lane markings, and calibrate the parameters to ensure accurate tracking.
<br>

**Launching Lane Detection in Simulation**

To begin, start the Gazebo simulation with a pre-defined lane-tracking course:
``` bash
$ ros2 launch turtlebot3_gazebo turtlebot3_autorace_2020.launch.py
```  
Next, run the camera calibration processes, which ensure that the detected lanes are accurately mapped to the robot’s perspective:
``` bash
$ ros2 launch turtlebot3_autorace_camera intrinsic_camera_calibration.launch.py
```  
``` bash
$ ros2 launch turtlebot3_autorace_camera extrinsic_camera_calibration.launch.py
```  
These steps activate intrinsic and extrinsic calibration to correct any distortions in the camera feed.

Finally, launch the lane detection node in calibration mode to begin detecting lanes:
``` bash
$ ros2 launch turtlebot3_autorace_camera detect_lane.launch.py calibration_mode:=True
```  
<br>

**Visualizing Lane Detection Output**

To inspect the detected lanes, open rqt on `Remote PC`:
``` bash
$ rqt
```  
Then navigate to **Plugins** > **Visualization** > **Image View** and open three image viewers to display different lane detection results:
  - `/detect/image_lane/compressed`  
  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_image_lane.png)
  - `/detect/image_yellow_lane_marker/compressed` : a yellow range color filtered image.  
  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_yellow_lane.png)
  - `/detect/image_white_lane_marker/compressed` : a white range color filtered image.  
  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_white_lane.png)

These visualizations help confirm that the lane detection algorithm is correctly identifying lane boundaries.
<br><br>

**Calibrating Lane Detection Parameters**

For better accuracy, tuning detection parameters is necessary. Adjusting these parameters ensures the robot properly identifies lanes under different lighting and environmental conditions.

1. Open **lane.yaml** file located in **turtlebot3_autorace_detect/param/lane/**. You need to write modified values to the file. This will make the camera set its parameters as you set here from next launching. 
    ``` bash
    $ cd ~/turtlebot3_ws/src/turtlebot3_autorace/turtlebot3_autorace_detect/param/lane
    $ gedit lane.yaml
    ```  
    ![](/assets/images/platform/turtlebot3/autonomous_driving/humble_lane_yaml.png)
    > Modified lane.yaml file

<br>

**Running Lane Tracking Operation**

Once calibration is complete, restart the lane detection node without the calibration option:
```bash
$ ros2 launch turtlebot3_autorace_detect detect_lane.launch.py
```

Then, launch the lane following control node, which enables TurtleBot3 to automatically follow the detected lanes:
```bash
$ ros2 launch turtlebot3_autorace_driving control_lane.launch.py
```