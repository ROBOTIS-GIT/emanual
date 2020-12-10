
**NOTE**: Be sure to install `turtlebot3` and `open_manipulator` packages, before installation of `open_manipulator_with_tb3` packages.
{: .notice--info}

- Install dependent packages for the OpenMANIPULATOR with TurtleBot3.

**[TurtleBot3]**

1. Open a terminal on **TurtleBot3**. 
2. Install dependent packages using the following commands.
  ```bash
  $ cd ~/turtlebot3_ws/src/
  $ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
  $ cd ~/turtlebot3_ws && colcon build --symlink-install
  ```

**[Remote PC]**

1. Open a terminal on **Remote PC**. 
2. Install dependent packages using the following commands.
  ```bash
  $ cd ~/robotis_ws/src/
  $ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
  $ cd ~/robotis_ws && colcon build --symlink-install
  ```
  - If `colcon build` command is complete without any errors, go to the step 3.  
  
3. Load TurtleBot3 Waffle (or Waffle Pi) with OpenMANIPULATOR on RViz.
    - Open a terminal on **Remote PC**.
    - Execute RViz using the following command. 
      ```bash
      $ ros2 launch turtlebot3_manipulation_description turtlebot3_manipulation_rviz.launch.py
      ```

      ![](/assets/images/platform/turtlebot3/manipulation/TurtleBot3_with_Open_Manipulator.png)
