<!-- ### [Intrinsic Camera Calibration](#intrinsic-camera-calibration) -->

Print a checkerboard on A4 size paper. The checkerboard is used for Intrinsic Camera Calibration.

- The checkerboard is stored at **turtlebot3_autorace_camera/data/checkerboard_for_calibration.pdf**
- Modify value of parameters in **turtlebot3_autorace_camera/launch/intrinsic_camera_calibration.launch**
- For detailed information on the camera calibration, see [Camera Calibration manual](http://wiki.ros.org/camera_calibration) from ROS Wiki.

  ![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_checkerboard.png)

  > Checkerboard

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Trigger the camera on `SBC`.
```bash
$ roslaunch turtlebot3_autorace_camera raspberry_pi_camera_publish.launch
```

3. Run a intrinsic camera calibration launch file on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch mode:=calibration
```

4. Use the checkerboard to calibrate the camera, and click **CALIBRATE**.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_before_intrinsic_calibration.png)

5. Click **Save** to save the intrinsic calibration data.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_after_intrinsic_calibration.png)

6. **calibrationdata.tar.gz** folder will be created at **/tmp** folder.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_calibration_data_tar_gz.png)

7. Extract **calibrationdata.tar.gz** folder, and open **ost.yaml**.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_ost_yaml_file.png)

   > ost.yaml

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_ost_yaml.png)

   > Intrinsic Calibration Data in ost.yaml

8. Copy and paste the data from **ost.yaml** to **camerav2_320x240_30fps.yaml**.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_camerav2_yaml.png)

   > camerav2_320x240_30fps.yaml

   ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_camerav2_320x240.png)

   > Intrinsic Calibration Data in camerav2_320x240_30fps.yaml
