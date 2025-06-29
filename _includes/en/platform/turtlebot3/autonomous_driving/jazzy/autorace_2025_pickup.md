In the Pick Up mission, the goal is to accurately park in front of a basket of ordered food and hook the basket onto the robot arm.  
- **Pick Up process**  
<div style="margin-left: 2em;">
1. Visits each pickup location in turn and uses object detection to determine if it's the right place.
2. Once you're in the right place, use `aruco_tracker.py` to track the ArUco marker.
3. Use `aruco_parking.py` to park in front of the ArUco marker.
4. After parking, hang the basket using a simple arm in 1 DOF.  

**NOTE**: The Pick Up process is based on the [Autonomous Parking Vision](/docs/en/platform/turtlebot3/basic_examples/#automatic-parking-vision) example and [ArUco Tracker](/docs/en/platform/turtlebot3/basic_examples/#aruco-tracker) example.
{: .notice}
</div>

- **Run Pick Up Node**  
<div style="margin-left: 2em;">
1. Open a new terminal and run the ArUco tracker node.
```bash
$ ros2 run turtlebot3_autorace_detect aruco_tracker
```
2. Activate the life cycle node.
```bash
$ ros2 lifecycle set /aruco_tracker configure
$ ros2 lifecycle set /aruco_tracker activate
```
3. Open a new terminal and run the ArUco parking node.
```bash
$ ros2 run turtlebot3_autorace_mission aruco_parking.py
```
4. Activate the life cycle node.
```bash
$ ros2 lifecycle set /aruco_parking configure
$ ros2 lifecycle set /aruco_parking activate
```
5. **(optional)** You can verify the TF conversion with RViz2.
```bash
$ ros2 launch turtlebot3_bringup rviz2.launch.py
```
   ![](/assets/images/platform/turtlebot3/autorace_2025/autorace_aruco_tracker_rviz.png)
</div>

- **Feature enhancement tips**
<div style="margin-left: 2em;">

Parking that relies solely on ArUco markers **can be inaccurate if the ArUco marker tracking is noisy**.  
To improve the accuracy of your pakring, you can try the methods below:
1. Collect the position values of the markers for a few frames and filter them to try to get a stable TF transformation.
2. Once parked, use LiDAR or a camera to verify that the basket is centered on the robot before hooking it up.
3. After you hang the basket, use the camera to check that it's hooked up properly.

These attempts will allow us to develop a more accurate and robust Pick Up feature.
</div>
