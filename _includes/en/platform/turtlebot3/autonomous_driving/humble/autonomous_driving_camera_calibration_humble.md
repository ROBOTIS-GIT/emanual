## [Camera Calibration](#camera-calibration)

Camera calibration is crucial for autonomous driving as it ensures the camera provides accurate data about the robot's environment. Although Gazebo simulation simplifies some calibration steps, understanding the calibration process is important for transitioning to a real-world robot. 
Camera calibration typically consists of two steps: **intrinsic calibration**, which deals with the internal camera properties, and **extrinsic calibration**, which aligns the camera’s view with the robot’s coordinate system. In Gazebo, these steps are not required because the simulation uses predefined camera parameters, but these instructions will help you understand the overall process for real hardware deployment.

### [Camera Imaging Calibration](#camera-imaging-calibration)

In Gazebo simulation, camera imaging calibration is unnecessary because the simulated camera does not have lens distortion. 

To begin, launch the Gazebo simulation on the Remote PC by running the following command:

```bash
ros2 launch turtlebot3_gazebo turtlebot3_autorace_2020.launch.py
```

### [Intrinsic Camera Calibration](#intrinsic-camera-calibration)

Intrinsic calibration focuses on correcting lens distortion and determining the camera’s internal properties, such as focal length and optical center.
In real robots, this process is essential, but in Gazebo simulation, intrinsic calibration is not required because the simulated camera is already distortion-free and provides an ideal image. However, this step is included to help users understand the process for real hardware deployment.

To execute the intrinsic calibration process as it would run on real hardware, launch:
```bash
ros2 launch turtlebot3_autorace_camera intrinsic_camera_calibration.launch.py
```
This step will not modify the image output but ensures that the correct topics (`/camera/image_rect` or `/camera/image_rect_color/compressed`) are available for subsequent processing.

### [Extrinsic Camera Calibration](#extrinsic-camera-calibration)

Extrinsic calibration aligns the camera’s perspective with the robot’s coordinate system, ensuring that objects detected in the camera’s view correspond to their actual positions in the robot's environment. In real robots, this process is crucial, but in Gazebo simulation, the calibration is performed for consistency and to familiarize users with the real-world workflow.

Once the simulation is running, launch the extrinsic calibration process:
```bash
ros2 launch turtlebot3_autorace_camera extrinsic_camera_calibration.launch.py calibration_mode:=True
```
This will activate the nodes responsible for camera-to-ground projection and compensation.

**Visualization and Parameter Adjustment**

1. Execute rqt on `Remote PC`.
```bash
rqt
```

2. Navigate **Plugins** > **Visualization** > **Image view**. Create two image view windows.

3. Select `/camera/image_extrinsic_calib/compressed` topic on one window and `/camera/image_projected` on the other.
   - The first topic shows an image with a red trapezoidal shape and the latter shows the ground projected view (Bird's eye view).

      ![](/assets/images/platform/turtlebot3/autonomous_driving/humble_extrinsic_calibration.png)
      > `/camera/image_extrinsic_calib/compressed` (Left) and `/camera/image_projected` (Right)

4. Navigate **Plugins** > **Configuration** > **Dynamic Reconfigure**.

5. Adjust parameters in `/camera/image_projection` and `/camera/image_compensation`.
   - Change `/camera/image_projection` parameter value. It affects `/camera/image_extrinsic_calib/compressed` topic.
   - Intrinsic camera calibration modifies the perspective of the image in the red trapezoid.
   - Adjust parameters in `/camera/image_compensation` to fine-tune the bird’s-eye view.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/humble_extrinsic_calibration_reconfigure.png)
      > rqt_reconfigure

**Saving Calibration Data**

Once the best projection settings are found, the calibration data must be saved to ensure that the parameters persist across sessions. One way to save the extrinsic calibration data is by manually editing the YAML configuration files.

1. Navigate to the directory where the calibration files are stored:
```bash
cd ~/turtlebot3_ws/src/turtlebot3_autorace_2020/turtlebot3_autorace_camera/calibration/extrinsic_calibration/
```
1. Open the relevant YAML file (e.g., `projection.yaml`) in a text editor:
```bash
gedit projection.yaml
```

1. Modify the projection parameters based on the values obtained from dynamic reconfiguration.

This method ensures that the extrinsic calibration parameters are correctly loaded in future runs.

<p align="center">
  <img src="/assets/images/platform/turtlebot3/autonomous_driving/humble_projection_yaml.png" width="700"/>
  <img src="/assets/images/platform/turtlebot3/autonomous_driving/humble_compensation_yaml.png" width="700"/>
</p>

<p align="center">
  <em>turtlebot3_autorace_camera/calibration/extrinsic_calibration/ <code>projection.yaml</code> (Left) &nbsp; | &nbsp; 
  turtlebot3_autorace_camera/calibration/extrinsic_calibration/ <code>compensation.yaml</code> (Right)</em>
</p>

### [Check Calibration Result](#check-calibration-result)

After completing calibrations, run the step-by-step instructions below on `Remote PC` to check the calibration result.

1. Close all of the terminals.

2. Open a new terminal and launch Autorace Gazebo simulation. 
```bash
ros2 launch turtlebot3_gazebo turtlebot3_autorace_2020.launch.py
```

3. Open a new terminal and launch the intrinsic calibration node.
```bash
ros2 launch turtlebot3_autorace_camera intrinsic_camera_calibration.launch.py
```

4. Open a new terminal and launch the extrinsic calibration node.
```bash
ros2 launch turtlebot3_autorace_camera extrinsic_camera_calibration.launch.py
```

5. Execute rqt and navigate **Plugins** > **Visualization** > **Image view**.
```bash
rqt
```

6. With successful calibration settings, the bird-eye view image should appear as below when the `/camera/image_projected` topic is selected.
![](/assets/images/platform/turtlebot3/autonomous_driving/humble_camera_calibration_rqt_image_view.png)
