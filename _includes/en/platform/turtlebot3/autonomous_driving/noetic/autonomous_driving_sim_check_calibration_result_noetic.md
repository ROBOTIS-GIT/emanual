
<!-- #### [Check Calibration Result](#check-calibration-result) -->

After completing calibrations, run the step by step instructions below on `Remote PC` to check the calibration result.

1. Close all of terminal.

2. Open a new terminal and launch Autorace Gazebo simulation. The `roscore` will be automatically launched with the **roslaunch** command.
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

5. Open a new terminal and launch the rqt image viewer.
```bash
$ rqt_image_view
```

6. With successful calibration settings, the bird eye view image should appear as below when the `/camera/image_projected_compensated` topic is selected.
![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_camera_calibration_rqt_image_view.png)

<details>
<summary>
![](/assets/images/icon_unfold.png) **Click to expand : Extrinsic Camera Calibration for use of actual TurtleBot3**
</summary>
<!-- ### [Check Calibration Result](#check-calibration-result) -->

When you complete all the camera calibration (Camera Imaging Calibration, Intrinsic Calibration, Extrinsic Calibration), be sure that the calibration is successfully applied to the camera.  
The following instruction describes settings for recognition.

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
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch mode:=action
```

4. Open terminal and use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera extrinsic_camera_calibration.launch mode:=action
```

5. Execute rqt on `Remote PC`.
```
$ rqt
```

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_rpi_extrinsic_calibration_rqt.png)

    > rqt_reconfigure 


From now, the following descriptions will mainly adjust `feature detector / color filter` for object recognition. Every adjustment after here is independent to each other's process. However, if you want to adjust each parameters in series, complete every adjustment perfectly, then continue to next.

</details>
