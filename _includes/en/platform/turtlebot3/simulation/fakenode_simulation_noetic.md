
<iframe width="640" height="360" src="https://www.youtube.com/embed/iHXZSLBJHMg" frameborder="0" allowfullscreen></iframe>

The contents of the e-Manual are subject to change without prior notice. Video content may differ from the content in the e-Manual.
{: .notice--warning}

To use `turtlebot3_fake_node`, you need the `turtlebot3_simulation` metapackage. Install the package as shown in the following command.

**NOTE**: The `turtlebot3_simulation` metapackage requires `turtlebot3` metapackage and `turtlebot3_msgs` package as a prerequisite. If you didn't install it in the [Install Dependent ROS Packages of PC Setup][pc_setup] section, install it now.
{: .notice--info}  
**[Remote PC]**  
```bash
$ cd ~/catkin_ws/src/
$ git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
$ cd ~/catkin_ws && catkin_make
```

To launch the virtual robot, execute the `turtlebot3_fake.launch` file in the `turtlebot3_fake` package as shown below. The `turtlebot3_fake` is a very simple simulation node that can be run without having an actual robot. You can even control the virtual TurtleBot3 in RViz with a teleoperation node.

**[Remote PC]**  
```bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_fake turtlebot3_fake.launch
```  
**[Remote PC]**  
```bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```


[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model

[pc_setup]: /docs/en/platform/turtlebot3/quick-start/#install-dependent-ros-1-packages-1
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
[slam]: /docs/en/platform/turtlebot3/slam/#slam
[simulation]: /docs/en/platform/turtlebot3/simulation/
[navigation]: /docs/en/platform/turtlebot3/navigation/#navigation
