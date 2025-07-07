
{% capture notice_01 %}
**NOTE**:

- This instructions were tested on `Ubuntu 22.04` and `ROS2 Humble Hawksbill`.
- For more information, see [OpenMANIPULATOR e-Manual](/docs/en/platform/openmanipulator/) and [[ROS 2] Turtlebot3 Manipulation](/docs/en/platform/turtlebot3/manipulation)
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/turtlebot3/mainpulation/home_service_challenge/kinetic/hsc_stadium_2.png)

> Home Service Challenge Stadium and Objects

<iframe width="560" height="315" src="https://www.youtube.com/embed/1rkN_F6ODo4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Getting Started](#getting-started)

{% capture HSC_Note %}
**NOTE**: Be sure to complete the following instructions before installing Home Service Challenge packages in the pc.
- [TurtleBot3 PC Set up](/docs/en/platform/turtlebot3/quick-start/#pc-setup)
- [TurtleBot3 SBC Set up](/docs/en/platform/turtlebot3/sbc_setup/#sbc-setup)
- [TB3 & OpenMANIPULATOR-X](/docs/en/platform/turtlebot3/manipulation/#software-setup) packages  

**Prerequisites**:
- ROS 2 Humble installed Laptop or desktop PC.
- This instruction is based on Gazebo simulation.
{% endcapture %}
<div class="notice">{{ HSC_Note | markdownify }}</div>  
<br>

**Remote PC Setup**  
Install Home Service Challenge packages.  
**[Remote PC]**  
```bash
$ cd ~/turtlebot3_ws/src/
$ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_home_service_challenge.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install
```

### [Simulation](#simulation)
Simulate TurtleBot3 with OpenMANIPULATOR-X in Gazebo.  
**[Remote PC]**  
1. Run the Gazebo Simulation.  
```bash
$ ros2 launch turtlebot3_manipulation_gazebo turtlebot3_home_service_challenge.launch.py
```

    ![gazebo_simulation](/assets/images/platform/turtlebot3/mainpulation/home_service_challenge/humble/gazebo_simulation.png)

2. Run a Nav2 for Gazebo and set `2D Pose Estimate` in Rviz.  
```bash
$ ros2 launch turtlebot3_home_service_challenge_tools navigation2.launch.py
```

    ![simulation_rviz](/assets/images/platform/turtlebot3/mainpulation/home_service_challenge/humble/navigation2_rviz.png)

3. Run the core package used to carry out Home Service Challenge's mission.  
```bash
$ ros2 launch turtlebot3_home_service_challenge_core core_node.launch.py
```
    **NOTE**: core_node contains nodes for ArUco marker detection, parking, and manipulator control, which core_node uses to perform scenario integration control. The core_node performs and controls the behavior in the scenario sequence. After running core_node, we can see the TF of the ArUco marker in rviz and we can run the scenario. See [Missions](#missions) for more detailed descriptions and to run the scenario.
    {: .notice}

### [Actual robot](#actual-robot)

**Ready for actual robot**  
- If you want to run the scenario with TurtleBot3 with OpenMANIPULATOR-X, check the below lists.  
  - Create a custom map, then create and save the map with [SLAM](/docs/en/platform/turtlebot3/manipulation/#slam).
  - Set up the [Rpi-camera](/docs/en/platform/turtlebot3/sbc_setup/#raspberry-pi-camera).  
<br>

**Run Home Service Challenge with actual robot**  
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

3. Run a Nav2 and set 2D Pose Estimate in Rviz. If you want to use a custom map, run it with the launch argument.  
**[Remote PC]**
```bash
$ ros2 launch turtlebot3_home_service_challenge_tools navigation2.launch.py map_yaml_file:=$HOME/map.yaml
```

4. Run the core package used to carry out Home Service Challenge's mission. Specify the launch mode and ArUco marker size with the launch argument.  
**[Remote PC]**
```bash
$ ros2 launch turtlebot3_home_service_challenge_core core_node.launch.py launch_mode:='actual' marker_size:=0.04
```  
<br>

**Arguments**  
`launch_mode`
- default: simulation
- describtion: Select whether you want to run the Home Service Challenge as a simulation or as an actual robot.

`marker_size`
- default: 0.088
- describtion: Specifies the size of the ArUco markers used in the custom map.  

  **NOTE**: core_node contains nodes for ArUco marker detection, parking, and manipulator control, which core_node uses to perform scenario integration control. The core_node performs and controls the behavior in the scenario sequence. After running core_node, we can see the TF of the ArUco marker in rviz and we can run the scenario. See [Missions](#missions) for more detailed descriptions and to run the scenario.
  {: .notice}

### [Missions](#missions)

#### [Commands](#commands)  

Use the following commands during Home Service Challenge.  
**[Remote PC]**  
**Individual actions**
- Park in front of the ArUco marker: Put the marker's ID for integer to `$MARKER_ID`.
  ```bash
  $ ros2 topic pub -1 /target_marker_id std_msgs/msg/Int32 "{data: $MARKER_ID}"
  ```

    **NOTE**: When using this command, be sure to include one of the ArUco marker's ID from a `scenario.yaml` file. In the provided map, IDs 0 through 7 exist. For detailed information on the scenario, see [Configuration](#configuration) description below at this section.
    {: .notice}

- Control Manipulator : Use the Manipulator to pick up or place objects.
```bash
$  ros2 topic pub -1 /manipulator_control std_msgs/msg/String "{data: 'pick_target'}"
$  ros2 topic pub -1 /manipulator_control std_msgs/msg/String "{data: 'place_target'}"
```  
<br>

**Run scenario**  
TurtleBot3 will perform **individual actions** for `$SCENARIO_NAME` based on the scenario written.
```bash
$ ros2 topic pub -1 /scenario_selection std_msgs/msg/String "{data: '$SCENARIO_NAME'}"
```

  **NOTE**: When using this command, be sure to include one of the scenario name from a `scenario.yaml` file. The provided scenario file contains `room1` through `room4`. For detailed information on the scenario, see [Details](#details-about-the-home-service-mission) description below at this section.
  {: .notice}


#### [Configuration](#configuration)

Modify data in configuration files according to the given environment.  
**[Remote PC]**  
- `scenario.yaml` : This file contains a scenario's data. In the simulation, there are initially markers on the front of the TurtleBot with ID 0 through 3, which are assigned as target_marker_id. And in each room, there are markers with ID 4 through 7.
  - File Path : **/turtlebot3_home_service_challenge/turtlebot3_home_service_challenge_core/config/scenario.yaml**
  - Script
    ```yaml
    scenario:
      room1:  # SCENARIO_NAME
        target_marker_id: 0  # ArUco Marker's ID
        goal_pose: [0.9, 0.5, 0.0, 0.0, 0.0, 0.7071, 0.7071]  # The coordinates and orientation of the room where the goal marker is located.
        goal_marker_id: 4  # ArUco Marker's ID
        end_pose: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0]  # Coordinates and orientation of the location to return to.
    ```  
<br>
- `turtlebot3_hsc_manipulation.srdf` : This configuration file contains manipulator's position data. By changing the joint values or adding new `group_state`, you can specify the tmanipulator's pose.
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

The goal of the Home Service Challenge is to move four different objects from a living room to a specific place with given rules, and to return to the starting point. (Used topic for run demo : `/scenario_selection`)

Using the demo package, the process of moving objects in Home Service Challenge is as follows.

1. Approaching the target.
  - For the approach to the target with precise, TurtleBot3 wheels are directly controlled by computing target's location from AR marker. (Used Topic : `/target_maker_id`, `/cmd_vel`) Try twice for reliable performance.
    
    ![demo1](/assets/images/platform/turtlebot3/mainpulation/home_service_challenge/humble/demo1.png)

2. Picking the target with OpenMANIPULATOR-X's gripper.
  - Use the MoveIt package to perform joint space control, workspace control, and gripper control to pick the target object. (Used Topic : `/manipulator_control`)

    ![manipulation_diagram](/assets/images/platform/turtlebot3/mainpulation/home_service_challenge/kinetic/manipulation_diagram.png)
    > MoveIt Diagram

3. Navigating to the next room where the object will be placed.
   -Reach the next room saved in a yaml file using the Nav2 package.
    
    ![demo2](/assets/images/platform/turtlebot3/mainpulation/home_service_challenge/humble/demo2.png)

4. Approaching the target.

5. Placing the object using the gripper.

6. Returning to the starting point using the Nav2 package.

   ![demo3](/assets/images/platform/turtlebot3/mainpulation/home_service_challenge/humble/demo3.png)
