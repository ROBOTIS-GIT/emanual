
{% capture notice_01 %}
**NOTE**:

- This instructions were tested on `Ubuntu 22.04` and `ROS2 Humble Hawksbill`.
- For more informationn, see [OpenMANIPULATOR e-Manual](/docs/en/platform/openmanipulator/) and [[ROS 2] Turtlebot3 Manipulation](/docs/en/platform/turtlebot3/manipulation)
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/turtlebot3/home_service_challenge/kinetic/hsc_stadium_2.png)

> Home Service Challenge Stadium and Objects

<iframe width="560" height="315" src="https://www.youtube.com/embed/lnLHSz7mGIA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Getting Started](#getting-started)

{% capture HSC_Note %}
**NOTE**: Be sure to complete the following instructions before installing Home Service Challenge packages in the pc.

- [TurtleBot3 PC Set up](/docs/en/platform/turtlebot3/quick-start/#pc-setup)
- [TurtleBot3 SBC Set up](/docs/en/platform/turtlebot3/sbc_setup/#sbc-setup)
- [TB3 & OpenMANIPULATOR-X](/docs/en/platform/turtlebot3/manipulation/#software-setup) packages
{% endcapture %}
<div class="notice">{{ HSC_Note | markdownify }}</div>

#### [Prerequisites](#Prerequisites)
`Remote PC`

- ROS 2 Humble installed Laptop or desktop PC.
- This instruction is based on Gazebo simulation.

#### [Remote PC Setup](#remote-pc-setup)

1. Install Home Service Challenge packages.  
**[Remote PC]**  
```bash
$ cd ~/turtlebot3_ws/src/
$ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_home_service_challenge.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install
```

### [Simulation](#simulation)

Simulate TurtleBot3 with OpenMANIPULATOR-X in Gazebo.

1. Run the Gazebo Simulation.  
**[Remote PC]**
```bash
$ ros2 launch turtlebot3_home_service_challenge_simulation competition.launch.py
```

2. Run a Nav2 for Gazebo and set `2D Pose Estimate` in Rviz.  
**[Remote PC]**
```bash
$ ros2 launch turtlebot3_home_service_challenge_tools navigation2.launch.py
```

    ![simulation_rviz](/assets/images/platform/turtlebot3/home_service_challenge/humble/navigation2_rviz.png)

3. Run the core package used to carry out Home Service Challenge's mission.  
**[Remote PC]**
```bash
$ ros2 launch turtlebot3_home_service_challenge_core core_node.launch.py
```

4. Use the Home Service Challenge commands, See [Commands](#commands)

### [Actual robot](#actual-robot)

#### [Ready for actual robot](#ready-for-actual-robot)
If you want to run the scenario with TurtleBot3 with OpenMANIPULATOR-X, check the below lists.  
- Create a custom map, then create and save the map with [SLAM](/docs/en/platform/turtlebot3/manipulation/#slam).
- Set up the [Rpi-camera](/docs/en/platform/turtlebot3/sbc_setup/#rpi-camera).

#### [Run Home Service Challenge with actual robot](#run-home-service-challenge-with-actual-robot)
1. Run hardware bringup.  
**[TurtleBot SBC]**
```bash
$ ros2 launch turtlebot3_manipulation_bringup hardware.launch.py
```

2. Run camera node.  
**[TurtleBot SBC]**
```bash
$ ros2 run camera_ros camera_node --ros-args -p format:='RGB888' -p width:=320 -p height:=240
```

3. Run a Nav2 for Gazebo and set 2D Pose Estimate in Rviz. If you want to use a custom map, run it with the launch argument.  
Ex) `map_yaml_file:=$HOME/map.yaml`  
**[Remote PC]**
```bash
$ ros2 launch turtlebot3_home_service_challenge_tools navigation2.launch.py map_yaml_file:=$HOME/map.yaml
```

4. Run the core package used to carry out Home Service Challenge's mission. Specify the launch mode and ArUco marker size with the launch argument.  
Ex) `launch_mode:='actual'` , `marker_size:=0.04`  
**[Remote PC]**
```bash
$ ros2 launch turtlebot3_home_service_challenge_aruco aruco_node.launch.py launch_mode:='actual' marker_size:=0.04
```

5. Use the Home Service Challenge commands, See [Commands](#commands)

### [Missions](#missions)

#### [Commands](#commands)

Use the following commands during Home Service Challenge.  
**[Remote PC]**
- **Park in front of the ArUco marker**: Put the marker's ID for integer to MARKER_ID.
  ```bash
  $ ros2 topic pub -1 /target_marker_id std_msgs/msg/Int32 "{data: MARKER_ID}"
  ```

- **Manipulator commands** : Use the Manipulator to pick up or put down objects.
```bash
$  ros2 topic pub -1 /manipulator_control std_msgs/msg/String "{data: 'pick_target'}"
$  ros2 topic pub -1 /manipulator_control std_msgs/msg/String "{data: 'place_target'}"
```

- **Run scenario** : TurtleBot3 will start a mission by a given scenario.
```bash
$ ros2 topic pub -1 /scenario_selection std_msgs/msg/String "{data: 'SCENARIO_NAME'}"
```

    **NOTE**: When using this command, be sure to include one of the senario name from a `scenario.yaml` file. For detailed information on the scenario, see [Configuration](#configuration) description below at this section.
    {: .notice}


#### [Configuration](#configuration)

**[Remote PC]** Modify data in configuration files according to the given environment.

- `scenario.yaml` : This file contains a scenario's data.
  - File Path : **/turtlebot3_home_service_challenge/turtlebot3_home_service_challenge_core/config/scenario.yaml**
  - Script
    ```yaml
    scenario:
      room1:  # SCENARIO_NAME
        target_marker_id: 0
        goal_pose: [0.9, 0.5, 0.0, 0.0, 0.0, 0.7071, 0.7071]  # The coordinates and orientation of the room where the goal marker is located.
        goal_marker_id: 4
        end_pose: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0]  # Coordinates and orientation of the location to return to.
    ```
- `turtlebot3_hsc_manipulation.srdf` : This configuration file contains manipulator's position data. By changing the joint values, you can specify the target pose of the manipulator.
  - File Path : **/turtlebot3_home_service_challenge/turtlebot3_home_service_challenge_tools/config/turtlebot3_hsc_manipulation.srdf**
  - Script
    ```bash
    <group_state name="target" group="arm">
        <joint name="joint1" value="0"/>
        <joint name="joint2" value="0.9076"/>
        <joint name="joint3" value="-0.9425"/>
        <joint name="joint4" value="0.0873"/>
    </group_state>
    ```

#### [Details about the Home Service Mission](#details-about-the-home-service-mission)

The goal of the Home Service Challenge is to move four different objects from a living room to a specific place with given rules, and to return to the starting point.

Using the demo package, the process of moving objects in Home Service Challenge is as follows.

1. Approaching the target.
  - For the approach to the target with precise, TurtleBot3 wheels are directly controlled by computing target's location from AR marker. (Used Topic : `/target_maker_id`, `/cmd_vel`). Try twice for reliable performance.
    
    ![demo_2](/assets/images/platform/turtlebot3/home_service_challenge/noetic/demo_2.PNG)

2. Picking the target with OpenMANIPULATOR-X's gripper.
  - Pick the target object using the moveit package (Joint space control, Task space control and Gripper control)

    ![manipulation_diagram](/assets/images/platform/turtlebot3/home_service_challenge/kinetic/manipulation_diagram.png)
    > MoveIt Diagram

3. Navigating to the next room where the object will be placed.
   -Reach the next room saved in a yaml file using the Nav2 package.
    
    ![demo_3](/assets/images/platform/turtlebot3/home_service_challenge/noetic/demo_3.PNG)

4. Approaching the target.

5. Placing the object using the gripper.

6. Returning to the starting point using the Nav2 package.

   ![demo_4](/assets/images/platform/turtlebot3/home_service_challenge/noetic/demo_4.PNG)
