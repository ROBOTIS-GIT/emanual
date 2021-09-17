<!-- ## [Lane Detection](#lane-detection) -->

Lane detection package allows Turtlebot3 to drive between two lanes without external influence.

The following instructions describe how to use the lane detection feature and to calibrate camera via rqt.

1. Place TurtleBot3 between yellow and white lanes.

   **NOTE**: Be sure that yellow lane is placed left side of the robot and White lane is placed right side of the robot.
   {: .notice}

2. Launch roscore on `Remote PC`.
```bash
$ roscore
```

3. Trigger the camera on `SBC`.
```bash
$ roslaunch turtlebot3_autorace_camera raspberry_pi_camera_publish.launch
```

3. Run a intrinsic camera calibration launch file on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch mode:=action
```

4. Run a extrinsic camera calibration launch file on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera extrinsic_camera_calibration.launch mode:=action
```

5. Run a lane detection launch file on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_detect detect_lane.launch mode:=calibration
```

3. Execute rqt on `Remote PC`.
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

   > Filtered Image resulted from adjusting parameters at rqt_reconfigure

   **TIP**: Calibration process of line color filtering is sometimes difficult due to physical environment, such as the luminance of light in the room and etc. To make everything quickly, put the value of **lane.yaml** file located in **turtlebot3*autorace*_detect/param/lane/** on the reconfiguration parameter, then start calibration. Calibrate hue low - high value at first. (1) Hue value means the color, and every colors, like `yellow`, `white`, have their own region of hue value (refer to hsv map). Then calibrate saturation low - high value. (2) Every colors have also their own field of saturation. Finally, calibrate the lightness low - high value. (3) In the source code, however, have auto-adjustment function, so calibrating lightness low value is meaningless. Just put the lightness high value to 255. Clearly filtered line image will give you clear result of the lane.
   {: .notice--success}

7. Open **lane.yaml** file located in **turtlebot3*_autorace*_detect/param/lane/**. You need to write modified values to the file. This will make the camera set its parameters as you set here from next launching.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_lane_yaml.png)

8. Close both **rqt_rconfigure** and **turtlebot3_autorace_detect_lane**.

9. Open terminal and use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_detect detect_lane.launch mode:=action
```

8. Check if the results come out correctly.

   - Open terminal and use the command on `Remote PC`.

   ```bash
   $ roslaunch turtlebot3_autorace_driving turtlebot3_autorace_control_lane.launch
   ```

   - Open terminal and use the command on `Remote PC`.

   ```bash
   $ roslaunch turtlebot3_bringup turtlebot3_robot.launch
   ```

9. After using the commands, TurtleBot3 will start to run.
