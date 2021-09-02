<!-- ### [Camera Imaging Calibration](#camera-imaging-calibration) -->

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

3. Execute rqt_image_view on `Remote PC`.
```bash
$ rqt_image_view
```

4. Select **/camera/image/compressed** (or **/camera/image/**) topic on the check box.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/tb3_click_compressed.png)

5. Excute rqt_reconfigure on `Remote PC`.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

6. Click **camera**, and modify parameter value in order to see clear images from the camera.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_reconfigure_camera_yaml_edit_01.png)

7. Open **camera.yaml** file located in **turtlebot3*autorace*[Autorace Misson]\_camera/calibration/camera_calibration** folder.

8. Write modified values to the file.

   ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_reconfigure_camera_yaml_edit_02.png)
