After completing all missions, we need to return to the docking station to dock again.  
- **Docking Process**  
<div style="margin-left: 2em;">  
1. Return to the front of docking station.
2. Calculates the average of the LiDAR values that fall within a set ROI(Region of Interest).
3. Attempts to dock along the calculated center.  
</div>

- **Run Docking Node**  
<div style="margin-left: 2em;">  
1. Open a new terminal and run the docking node.
```bash
$ ros2 run turtlebot3_autorace_mission lidar_docking.py
```
2. Activate the life cycle node.
```bash
$ ros2 lifecycle set /lidar_docking configure
$ ros2 lifecycle set /lidar_docking activate
```
3. **(optional)** You can verify the center of points with rqt image view plugin.
```bash
$ rqt
```
- LiDAR points within the ROI are visualized as red dots.
- The average of the LiDAR points within the ROI is visualized as a blue dot.
- The center of the robot is visualized as a white circle.

   ![](/assets/images/platform/turtlebot3/autorace_2025/autorace_docking_rqt.png)
</div>

- **Feature enhancement tips**
<div style="margin-left: 2em;">  

Docking that relies solely on ROI **can be inaccurate if the robot doesn't arrive in front of docking station accurately**.  
To improve the accuracy of your docking, you can try the methods below:
1. Verify that the docking station is exactly within the ROI before attempting to dock.
2. Recognize docking stations using template matching, etc. instead of using ROI.
3. In case the robot doesn't arrive exactly in front of the docking station, circle the neighborhood until it finds it.

These attempts will allow us to develop a more accurate and robust Docking feature.  
</div>
