<!-- ### [Extrinsic Camera Calibration](#extrinsic-camera-calibration) -->

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

3. Use the command on `Remote PC`.
```bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Run the extrinsic camera calibration launch file on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=calibration
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
```

5. Execute rqt on `Remote PC`.
```
$ rqt
```

6. Click **plugins** > **visualization** > **Image view**; Multiple windows will be present.

7. Select `/camera/image_extrinsic_calib/compressed` and `/camera/image_projected_compensated` topics on each monitors.

- One of two screens will show an image with a red rectangle box. The other one shows the ground projected view (Bird's eye view).

  ![](/assets/images/platform/turtlebot3/autonomous_driving/camera_image_extrinsic_calib_compressed.png)

  > `/camera/image_extrinsic_calib/compressed` topic

  ![](/assets/images/platform/turtlebot3/autonomous_driving/camera_image_projected_compensated.png)

  > `/camera/image_projected_compensated` topic

6. Excute rqt_reconfigure on `Remote PC`.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

7. Adjust parameters in `/camera/image_projection` and `/camera/image_compensation_projection`.

- Change `/camera/image_projection` parameter value. It affects `/camera/image_extrinsic_calib/compressed` topic.
- Intrinsic camera calibration will transform the image surrounded by the red rectangle, and will show the image that looks from over the lane.

  ![](/assets/images/platform/turtlebot3/autonomous_driving/camera_image_projection_compensation_projection.png)

  > rqt_reconfigure

  ![](/assets/images/platform/turtlebot3/autonomous_driving/modify_image_projection_image_extrinsic_calib.png)

  > Result from parameter modification.
