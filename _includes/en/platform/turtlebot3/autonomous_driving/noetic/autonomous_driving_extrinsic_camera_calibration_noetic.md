
<!-- ### [Extrinsic Camera Calibration](#extrinsic-camera-calibration) -->

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Trigger the camera on `SBC`.
```bash
$ roslaunch turtlebot3_autorace_camera raspberry_pi_camera_publish.launch
```

3. Use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch mode:=action
```

4. Run the extrinsic camera calibration launch file on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera extrinsic_camera_calibration.launch mode:=calibration
```

5. Execute rqt on `Remote PC`.
```
$ rqt
```

6. Click **plugins** > **visualization** > **Image view**; Multiple windows will be present.

7. Select `/camera/image_extrinsic_calib/compressed` and `/camera/image_projected_compensated` topics on each monitors.

- One of two screens will show an image with a red rectangle box. The other one shows the ground projected view (Bird's eye view).

  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_before_extrinsic_calibration.png)

  > `/camera/image_extrinsic_calib/compressed` topic `/camera/image_projected_compensated` topic


6. Excute rqt_reconfigure on `Remote PC`.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

7. Adjust parameters in `/camera/image_projection` and `/camera/image_compensation_projection`.

- Change `/camera/image_projection` parameter value. It affects `/camera/image_extrinsic_calib/compressed` topic.
- Intrinsic camera calibration will transform the image surrounded by the red rectangle, and will show the image that looks from over the lane.

  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_extrinsic_calibration_param.png)

  > rqt_reconfigure

  ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_after_extrinsic_calibration.png)

  > Result from parameter modification.
