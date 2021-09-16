<!-- ### [Intrinsic Camera Calibration](#intrinsic-camera-calibration) -->

Print a checkerboard on A4 size paper. The checkerboard is used for Intrinsic Camera Calibration.

- The checkerboard is stored at **turtlebot3_autorace_camera/data/checkerboard_for_calibration.pdf**
- Modify value of parameters in **turtlebot3_autorace_camera/launch/turtlebot3_autorace_intrinsic_camera_calibration.launch**
- For detailed information on the camera calibration, see [Camera Calibration manual](http://wiki.ros.org/camera_calibration) from ROS Wiki.

  ![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_checkerboard.png)

  > Checkerboard

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Trigger the camera on `SBC`.
```bash
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_camera_pi.launch
```

    **WARNING**: Be sure to specify `${Autorace_Misson}` (i.e, **roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_camera_pi.launch**)
    {: .notice--warning}

3. Run a intrinsic camera calibration launch file on `Remote PC`.
```bash
$ export AUTO_IN_CALIB=calibration
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Use the checkerboard to calibrate the camera, and click **CALIBRATE**.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/intrinsic_camera_calibration_test.png)

5. Click **Save** to save the intrinsic calibration data.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/intrinsic_camera_calibration_capture.png)

6. **calibrationdata.tar.gz** folder will be created at **/tmp** folder.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/camera_320_240_saved_path_01.png)

7. Extract **calibrationdata.tar.gz** folder, and open **ost.yaml**.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/open_ost_yaml.png)

   > ost.yaml

   ![](/assets/images/platform/turtlebot3/autonomous_driving/ost_yaml.png)

   > Intrinsic Calibration Data in ost.yaml

8. Copy and paste the data from **ost.yaml** to **camerav2_320x240_30fps.yaml**.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/open_320_240_30fps.png)

   > camerav2_320x240_30fps.yaml

   ![](/assets/images/platform/turtlebot3/autonomous_driving/camerav2_320_240_30fps.png)

   > Intrinsic Calibration Data in camerav2_320x240_30fps.yaml
