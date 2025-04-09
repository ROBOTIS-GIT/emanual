
**NOTE**: Before installing the `turtlebot3_manipulation` package, ensure that the `turtlebot3` and `open_manipulator` packages are installed on the Remote PC.
{: .notice--info}

1. Download and build the package using the following commands.
**[Remote PC]**  
```bash
$ cd ~/catkin_ws/src/
$ git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_manipulation.git
$ git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_manipulation_simulations.git
$ git clone -b noetic https://github.com/ROBOTIS-GIT/open_manipulator_dependencies.git
$ sudo apt install ros-noetic-ros-control* ros-noetic-control* ros-noetic-moveit* ros-noetic-dwa-local-planner
$ cd ~/catkin_ws && catkin_make
```

- If `catkin_make` completes without any errors, the OpenMANIPULATOR package has successfully been installed. You can then load a TurtleBot3 Waffle or Waffle Pi with an attached OpenMANIPULATOR in RViz. -->
<!--
```bash
$ cd ~/catkin_ws && catkin_make
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_perceptions.git
$ sudo apt-get install ros-melodic-smach* ros-melodic-ar-track-alvar ros-melodic-ar-track-alvar-msgs
$ cd ~/catkin_ws && catkin_make
```


<!-- **TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using (`waffle`, `waffle_pi`). If you want to permanently set this value, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

**[RemotePC]**
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_rviz.launch
```

![](/assets/images/platform/turtlebot3/manipulation/TurtleBot3_with_Open_Manipulator.png)
-->
