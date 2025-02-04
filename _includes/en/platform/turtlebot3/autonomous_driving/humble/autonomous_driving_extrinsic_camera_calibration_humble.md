<!-- #### [Extrinsic Camera Calibration](#extrinsic-camera-calibration) -->

1. Open a new terminal on `Remote PC` and launch Gazebo.
```bash
$ ros2 launch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

2. Open a new terminal and launch the intrinsic camera calibration node.
```bash
$ ros2 launch turtlebot3_autorace_camera intrinsic_camera_calibration.launch
```

3. Open a new terminal and launch the extrinsic camera calibration node.
```bash
$ ros2 launch turtlebot3_autorace_camera extrinsic_camera_calibration.launch mode:=calibration
```

4. Execute rqt on `Remote PC`.
```bash
$ rqt
```

5. Select **plugins** > **visualization** > **Image view**. Create two image view windows.

6. Select `/camera/image_extrinsic_calib/compressed` topic on one window and `/camera/image_projected_compensated` on the other.
   - The first topic shows an image with a red trapezoidal shape and the latter shows the ground projected view (Bird's eye view).

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_extrinsic_calibration.png)
      > `/camera/image_extrinsic_calib/compressed` (Left) and `/camera/image_projected_compensated` (Right)

7. Excute rqt_reconfigure on `Remote PC`.
```bash
$ ros2 run rqt_reconfigure rqt_reconfigure
```

8. Adjust parameters in `/camera/image_projection` and `/camera/image_compensation_projection`.
   - Change `/camera/image_projection` parameter value. It affects `/camera/image_extrinsic_calib/compressed` topic.
   - Intrinsic camera calibration modifies the perspective of the image in the red trapezoid.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_extrinsic_calibration_reconfigure.png)
      > rqt_reconfigure

9. After that, overwrite each values on to the yaml files in **turtlebot3_autorace_camera/calibration/extrinsic_calibration/.** This will save the current calibration parameters so that they can be loaded later.  

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_compensation_yaml.png)
      > turtlebot3_autorace_camera/calibration/extrinsic_calibration/`compensation.yaml`

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_projection_yaml.png)  
      > turtlebot3_autorace_camera/calibration/extrinsic_calibration/`projection.yaml`
