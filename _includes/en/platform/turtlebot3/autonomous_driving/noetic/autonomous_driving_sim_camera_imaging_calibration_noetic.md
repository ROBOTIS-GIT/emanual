<!-- #### [Camera Imaging Calibration](#camera-imaging-calibration) -->

Camera image calibration is not required in Gazebo Simulation.

<details>
<summary>
![](/assets/images/icon_unfold.png) **Click to expand : Camera Imaging Calibration with an actual TurtleBot3**
</summary>

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Trigger the camera on `SBC`.
```bash
$ roslaunch turtlebot3_autorace_camera raspberry_pi_camera_publish.launch
```

3. Execute rqt_image_view on `Remote PC`.
```bash
$ rqt_image_view
```

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_rqt_image_view.png)

      > rqt_image view

</details>
