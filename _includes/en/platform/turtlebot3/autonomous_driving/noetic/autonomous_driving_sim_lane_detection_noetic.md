<!-- ### [Lane Detection](#lane-detection) -->

The Lane detection package that runs on the `Remote PC` receives camera images either from TurtleBot3 or Gazebo simulation to detect driving lanes and to drive the Turtlebot3 along them.  
The following instructions describe how to use and calibrate the lane detection feature via rqt.

1. Place the TurtleBot3 between yellow and white lanes.

    **NOTE**: The lane detection filters yellow on the left side and white on the right side. Be sure that the yellow lane is on the left side of the robot.
    {: .notice}

2. Open a new terminal and launch the Autorace Gazebo simulation. Launch `roscore` with the **roslaunch** command.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Open a new terminal and launch the intrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch
```

4. Open a new terminal and launch the extrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera extrinsic_camera_calibration.launch
```

5. Open a new terminal and launch the lane detection calibration node.
```bash
$ roslaunch turtlebot3_autorace_detect detect_lane.launch mode:=calibration
```

6. Open a new terminal and launch the rqt.
```bash
$ rqt
```

7. Launch the rqt image viewer by selecting **Plugins** > **Cisualization** > **Image view**.  
  Multiple rqt plugins can be run.

8. Display three topics at each image viewer
  - `/detect/image_lane/compressed`  
  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_image_lane.png)
  - `/detect/image_yellow_lane_marker/compressed` : a yellow range color filtered image.  
  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_yellow_lane.png)
  - `/detect/image_white_lane_marker/compressed` : a white range color filtered image.  
  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_white_lane.png)

9. Open a new terminal and execute rqt_reconfigure.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

10. Click **detect_lane** then adjust parameters so that yellow and white colors can be filtered properly.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_lane_reconfigure.png)

    **TIP**: Calibration for line color filtering is sometimes difficult due to the surrounding physical environment, such as the luminance of light in the room etc.  
    To get started quickly, use the values from the **lane.yaml** file located in **turtlebot3_auatorace_detect/param/lane/** as the reconfiguration parameters, then start calibration.  
    Calibrate hue low - high value at first. (1) Hue value means the color, and every color, like `yellow` and `white` have their own region of hue values (refer to a hsv map for more information).  
    Then calibrate the saturation low - high value. (2) Every color also has their own field of saturation.  
    Finally, calibrate the lightness low - high value. (3) The provided source code has an auto-adjustment function, so calibrating lightness low value is not required. You can set the lightness high value to 255.  
    Clearly filtered line images will give you clear results for lane tracking.
    {: .notice--success}

11. Open **lane.yaml** file located in **turtlebot3_autorace_detect/param/lane/**. Writing modified values to this file will allow the camera to load the set parameters on future launches.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_lane_yaml.png)

    > Modified lane.yaml file

12. Close the **rqt_reconfigure** and **detect_lane** terminals.

13. Open a new terminal and launch the lane detect node without the calibration option.
```bash
$ roslaunch turtlebot3_autorace_detect detect_lane.launch
```

14. Open a new terminal and launch the node below to start the lane following operation.
```bash
$ roslaunch turtlebot3_autorace_driving turtlebot3_autorace_control_lane.launch
```

<details>
<summary>
![](/assets/images/icon_unfold.png) **Click to expand : How to Perform Lane Detection with Actual TurtleBot3?**
</summary>

Lane detection package allows Turtlebot3 to automatically drive between two lanes without external influence.

The following instructions describe how to use the lane detection feature and to calibrate camera via rqt.

1. Place TurtleBot3 between yellow and white lanes.

   **NOTE**: Be sure that yellow lane is placed left side of the robot and White lane is placed right side of the robot.
   {: .notice}

2. Launch roscore on the `Remote PC`.
```bash
$ roscore
```

3. Trigger the camera on the `SBC`.
```bash
$ roslaunch turtlebot3_autorace_camera raspberry_pi_camera_publish.launch
```

3. Run a intrinsic camera calibration launch file on the `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch mode:=action
```

4. Run a extrinsic camera calibration launch file on the `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera extrinsic_camera_calibration.launch mode:=action
```

5. Run a lane detection launch file on the `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_detect detect_lane.launch mode:=calibration
```

3. Execute rqt on the `Remote PC`.
```
$ rqt
```

4. Click **plugins** > **visualization** > **Image view**; Multiple windows will be present.

5. Select three topics at each image view: `/detect/image_yellow_lane_marker/compressed`, `/detect/image_lane/compressed`, `/detect/image_white_lane_marker/compressed`

   - Left (Yellow line) and Right (White line) screen show a filtered image.  Center screen is the view of the camera from TurtleBot3.
     ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_before_detect_lane.png)
     > Image view of `/detect/image_yellow_lane_marker/compressed` topic , `/detect/image_white_lane_marker/compressed` topic , `/detect/image_lane/compressed` topic


6. Execute rqt_reconfigure on `Remote PC`.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

6. Click **Detect Lane** then adjust parameters to do line color filtering.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_detect_lane_param.png)

   > List of Detect Lane Parameters

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_after_detect_lane.png)

   > Filtered Image after adjusting parameters at rqt_reconfigure

    **TIP**: Calibration for line color filtering is sometimes difficult due to the surrounding physical environment, such as the luminance of light in the room etc.  
    To get started quickly, use the values from the **lane.yaml** file located in **turtlebot3_auatorace_detect/param/lane/** as the reconfiguration parameters, then start calibration.  
    Calibrate hue low - high value at first. (1) Hue value means the color, and every color, like `yellow` and `white` have their own region of hue values (refer to a hsv map for more information).  
    Then calibrate the saturation low - high value. (2) Every color also has their own field of saturation.  
    Finally, calibrate the lightness low - high value. (3) The provided source code has an auto-adjustment function, so calibrating lightness low value is not required. You can set the lightness high value to 255.  
    Clearly filtered line images will give you clear results for lane tracking.
   {: .notice--success}

7. Open **lane.yaml** file located in **turtlebot3_autorace_detect/param/lane/**. Writing modified values to this file will allow the camera to load the set parameters on future launches.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_lane_yaml.png)

8. Close both **rqt_rconfigure** and **turtlebot3_autorace_detect_lane**.

9. Open a terminal and on the`Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_detect detect_lane.launch mode:=action
```

8. Check if the results come out correctly.

   - Open terminal on the`Remote PC`.

   ```bash
   $ roslaunch turtlebot3_autorace_driving turtlebot3_autorace_control_lane.launch
   ```

   - Open terminal on the`Remote PC`.

   ```bash
   $ roslaunch turtlebot3_bringup turtlebot3_robot.launch
   ```

9. After using the commands, TurtleBot3 will start to run.
</details>
