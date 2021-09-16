<!-- ### [Check Calibration Result](#check-calibration-result) -->

When you complete all the camera calibration (Camera Imaging Calibration, Intrinsic Calibration, Extrinsic Calibration), be sure that the calibration is successfully applied to the camera.  
The following instruction describes settings for recognition.

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
$ export AUTO_IN_CALIB=action
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Open terminal and use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
```

    From now, the following descriptions will mainly adjust `feature detector / color filter` for object recognition. Every adjustment after here is independent to each other's process. However, if you want to adjust each parameters in series, complete every adjustment perfectly, then continue to next.
