MoveIt 2! is a set of packages for your robot to manipulate for Motion Planning, Manipulation, Inverse Kinematics, Control, 3D Perception and Collision Checking.

###  MoveIt! Launch
Enable MoveIt functionality for advanced motion planning in RViz.  
For more information about MoveIt, check out the [official documentation](https://moveit.picknik.ai/main/doc/how_to_guides/how_to_guides.html).
```bash
$ ros2 launch open_manipulator_moveit_config omy_f3m_moveit.launch.py
```
Move interactive markers to position the robotic arm, then click Plan and Execute.  
<img src="/assets/images/platform/omy/moveit2_core.png" width="700"/>

**Simple Instructions for Using MOVEIT 2:**  
1. You can move the robot to your desired pose using the **Interactive Marker** visible in RViz.
2. Use the **Plan** option in the Commands column to simulate the motion of the robotic arm.
3. Click **Execute** to move the robot according to the simulated motion.
4. Set the **Planning Group** to `arm` and use the **Goal State** options `init` or `home` to move the robot to predefined poses.
5. Change the **Planning Group** to **gripper** and use **Goal State** options such as `close` or `open` to open and close the gripper.
