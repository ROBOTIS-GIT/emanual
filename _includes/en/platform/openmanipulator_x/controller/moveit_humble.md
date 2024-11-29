MoveIt! is a set of packages for your robot to manipulate for Motion Planning, Manipulation, Inverse Kinematics, Control, 3D Perception and Collision Checking. 

#### [Launch MoveIt!](#launch-moveit) 

Before launching MoveIt, ensure that the `hardware.launch.py` from [Launch Controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) is running in a separate terminal.  
Then launch **MoveIt!** with the following command.  
```bash
$ ros2 launch open_manipulator_x_moveit_config moveit_core.launch.py
```
  ![](/assets/images/platform/openmanipulator_x/moveit_launch.png)  

#### [Using MoveIt! with Gazebo](#using-moveit-with-gazebo)
Gazebo is a tool to simulate and test your robot in a virtual enviroment, without an actual robot.  

Also, you can use MoveIt feature using your virtual robot in the Gazebo enviroment with the following command.

For more information on Gazebo, See [Simulation](/docs/en/platform/openmanipulator_x/ros_simulation/)

Close all terminals and then launch the Gazebo simulator and RViz visualization tool.
```bash
$ ros2 launch open_manipulator_x_moveit_config moveit_gazebo.launch.py
```
