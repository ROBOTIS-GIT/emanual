
**NOTE**: Before you install `open_manipulator_with_tb3` packages, please make sure `turtlebot3` and `open_manipulator` packages have been installed previously in RemotePC and setup [Raspberry Pi 3](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/#raspberry-pi-3-setup).
{: .notice--info}

1. **[RemotePC]** Download and build the package using the following commands in order to use assembled OpenMANIPULATOR-X.

```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_manipulation.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_manipulation_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_dependencies.git
$ sudo apt install ros-kinetic-ros-control* && ros-kinetic-control* && ros-kinetic-moveit*
$ cd ~/catkin_ws && catkin_make
```

<!--
```bash
$ cd ~/catkin_ws && catkin_make
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_perceptions.git
$ sudo apt-get install ros-kinetic-smach* ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs
$ cd ~/catkin_ws && catkin_make
```

- If `catkin_make` command is completed without any errors, the preparation for OpenMANIPULATOR is done. Then load a TurtleBot3 Waffle or Waffle Pi with OpenMANIPULATOR on RViz. -->

<!-- **TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

**[RemotePC]**
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_rviz.launch
```

![](/assets/images/platform/turtlebot3/manipulation/TurtleBot3_with_Open_Manipulator.png)
-->
