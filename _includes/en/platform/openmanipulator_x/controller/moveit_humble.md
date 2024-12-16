MoveIt 2! is a set of packages for your robot to manipulate for Motion Planning, Manipulation, Inverse Kinematics, Control, 3D Perception and Collision Checking. 

#### [Launch MoveIt 2 with Hardware](#launch-moveit) 

Before launching MoveIt 2, ensure that the `hardware.launch.py` from [Launch Controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) is running in a separate terminal.  
Then launch **MoveIt!** with the following command.  
```bash
$ ros2 launch open_manipulator_x_moveit_config moveit_core.launch.py
```
  ![](/assets/images/platform/openmanipulator_x/moveit2_example.png)  
  
**Simple Instructions for Using MOVEIT 2:**

1. You can move the robot to your desired pose using the **Interactive Marker** visible in RViz.  
2. Use the **Plan** option in the Commands column to simulate the motion of the robotic arm.  
3. Click **Execute** to move the robot according to the simulated motion.  
4. Set the **Planning Group** to `arm` and use the **Goal State** options `init` or `home` to move the robot to predefined poses.  
5. Change the **Planning Group** to `gripper` and use **Goal State** options such as `close` or `open` to open and close the gripper.  

#### [Using MoveIt! with Gazebo](#using-moveit-with-gazebo)
Gazebo is a tool to simulate and test your robot in a virtual enviroment, without an actual robot.  

Also, you can use MoveIt feature using your virtual robot in the Gazebo enviroment with the following command.

For more information on Gazebo, See [Simulation](/docs/en/platform/openmanipulator_x/ros_simulation/)

Close all terminals and then launch the Gazebo simulator and RViz visualization tool.
```bash
$ ros2 launch open_manipulator_x_moveit_config moveit_gazebo.launch.py
```
