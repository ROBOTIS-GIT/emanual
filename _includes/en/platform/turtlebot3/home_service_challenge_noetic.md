
{% capture notice_01 %}
**NOTE**:

- This instructions were tested on `Ubuntu 20.04` and `ROS1 Noetic Ninjemys`.
- For more informationn, see [OpenMANIPULATOR e-Manual](/docs/en/platform/openmanipulator/) and [[ROS 1] Turtlebot3 Manipulation](/docs/en/platform/turtlebot3/manipulation)
- Home Service Challenge noetic package is mainly tested under the **Gazebo simulation**. 
- The actual robot will also be tested and updated.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/turtlebot3/home_service_challenge/kinetic/hsc_stadium_2.png)

> Home Service Challenge Stadium and Objects

<iframe width="560" height="315" src="https://www.youtube.com/embed/3aZXpVsEi0c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Getting Started](#getting-started)

{% capture HSC_Note %}
**NOTE**: Be sure to complete the following instructions before installing Home Service Challenge packages in the pc.

- [TurtleBot3 PC Set up](/docs/en/platform/turtlebot3/quick-start/#pc-setup)
- [TurtleBot3 SBC Set up](/docs/en/platform/turtlebot3/sbc_setup/#sbc-setup)
- [OpenMANIPULATOR-X](/docs/en/platform/openmanipulator_x/quick_start_guide/#install-ros-packages) packages
{% endcapture %}
<div class="notice">{{ HSC_Note | markdownify }}</div>

#### [Prerequisites](#Prerequisites)
`Remote PC`

- ROS 1 Noetic installed Laptop or desktop PC.
- This instruction is based on Gazebo simulation, but can be ported to the actual robot later.

#### [Remote PC Setup](#remote-pc-setup)

1. **[Remote PC]** Install Home Service Challenge packages.
```bash
$ cd ~/catkin_ws/src/
$ git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_home_service_challenge.git
$ git clone -b noetic-devel https://github.com/machinekoder/ar_track_alvar
$ cd ~/catkin_ws && catkin_make
```

2. **[Remote PC]** Load the TurtleBot3 Waffle (or Waffle Pi) with OpenMANIPULATOR on RViz.
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_manipulation_description turtlebot3_manipulation_view.launch use_gui:=true
```
    **NOTE**: Specify `${TB3_MODEL}`: `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice}

    ![turtlebot3_manipulation_view](/assets/images/platform/turtlebot3/home_service_challenge/noetic/TurtleBot3_with_Open_Manipulator.png)

    > Rviz View. Specify ${TB3_MODEL} : waffle_pi

### [Camera Calibration](#camera-calibration)
{% capture notice_01 %}
**NOTE**: This chapter is for actual robots only. Gazebo does not proceed.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

### [SLAM](#slam)
{% capture notice_01 %}
**NOTE**: This chapter is for actual robots only. Gazebo does not proceed.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

### [Missions](#missions)

#### [Run a Demo and Manager Pacakge](#run-a-demo-and-manager-package)

1. **[Remote PC]** Run the Gazebo Simulation.
```bash
$ roslaunch turtlebot3_home_service_challenge_simulation competition.launch
```

2. **[Remote PC]** Run a simulation demo for Gazebo.
```bash
$ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_home_service_challenge_demo_simulation.launch
```

    ![simulation_rviz](/assets/images/platform/turtlebot3/home_service_challenge/noetic/simulation_rviz.png)

2. **[Remote PC]** Run the manager package used to carry out Home Service Challenge's mission.
```bash
$ roslaunch turtlebot3_home_service_challenge_manager manager.launch
```

#### [Commands](#commands)

**[Remote PC]** Use the following commands during Home Service Challenge.

- **Ready** : TurtleBot3 will prepare to start a mission.
  ```bash
  $ rostopic pub -1 /tb3_hsc/command std_msgs/String ready_mission
  ```

- **Start** : TurtleBot3 will start a mission.
```bash
$ rostopic pub -1 /tb3_hsc/command std_msgs/String start_mission
```

- **Stop** : TurtleBot3 will stop running a mission.
```bash
$ rostopic pub -1 /tb3_hsc/command std_msgs/String stop_mission
```

- **Restart** : TurtleBot3 will restart a mission by a given scenario.
```bash
$ rostopic pub -1 /tb3_hsc/command std_msgs/String restart_mission:SCENARIO_NAME
```

    **NOTE**: When using this command, be sure to include one of the senario name from a `scenario.yaml` file. For detailed information on the scenario, see [Configuration](#configuration) description below at this section.
    {: .notice}

#### [Operation Test](#operation-test)

**[Remote PC]** Publish the following topics to test a navigation or manipulation feature.

- Navigation
```bash
$ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_start
```
   <img src="/assets/images/platform/turtlebot3/home_service_challenge/noetic/mission_start.gif" width="640px" height="360px" >


  ```bash
  $ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_ar_marker_0
  ```
   <img src="/assets/images/platform/turtlebot3/home_service_challenge/noetic/mission_0.gif" width="640px" height="360px" >

  ```bash
  $ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_ar_marker_1
  ```
   <img src="/assets/images/platform/turtlebot3/home_service_challenge/noetic/mission_1.gif" width="640px" height="360px" >

  ```bash
  $ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_ar_marker_2
  ```
   <img src="/assets/images/platform/turtlebot3/home_service_challenge/noetic/mission_2.gif" width="640px" height="360px" >

  ```bash
  $ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_ar_marker_3
  ```
   <img src="/assets/images/platform/turtlebot3/home_service_challenge/noetic/mission_3.gif" width="640px" height="360px" >


- Manipulation
```bash
$ rostopic pub -1 /tb3_hsc/command std_msgs/String arm_home
```
   <img src="/assets/images/platform/turtlebot3/home_service_challenge/noetic/hsc_arm_home.gif" width="640px" height="360px" >

  ```bash
  $ rostopic pub -1 /tb3_hsc/command std_msgs/String arm_joint
  ```
   <img src="/assets/images/platform/turtlebot3/home_service_challenge/noetic/hsc_arm_joint.gif" width="640px" height="360px" >

  ```bash
  $ rostopic pub -1 /tb3_hsc/command std_msgs/String arm_task
  ```
   <img src="/assets/images/platform/turtlebot3/home_service_challenge/noetic/hsc_arm_task.gif" width="640px" height="360px" >

  ```bash
  $ rostopic pub -1 /tb3_hsc/command std_msgs/String open_gripper
  ```
   <img src="/assets/images/platform/turtlebot3/home_service_challenge/noetic/hsc_open_gripper.gif" width="640px" height="360px" >

  ```bash
  $ rostopic pub -1 /tb3_hsc/command std_msgs/String close_gripper
  ```
   <img src="/assets/images/platform/turtlebot3/home_service_challenge/noetic/hsc_close_gripper.gif" width="640px" height="360px" >


#### [Configuration](#configuration)

**[Remote PC]** Modify data in configuration files according to the given environment.

- `scenario.yaml` : This file contains a scenario's data.
  - File Path : **/turtlebot3_home_service_challenge_manager/script/scenario.yaml**
  - Script
    ```yaml
    SCENARIO_NAME: # start - scenario - finish
      task: TASK_NAME
      args: [0, 1, 2]
      timeout: 10 #sec, 0 : no time out
      next_scenario: find_object
      scenario_on_failure: standby
      retry_times: 0 #times, 0 : no retry
    ```
- `room.yaml` : This file contains data of the Home Service Challenge's stadium.
  - File Path : **/turtlebot3_home_service_challenge_manager/config/room.yaml**
  - Script
    ```yaml
    room_1:
      name: toilet
      object:
        marker: ar_marker_0
        position: [0.25, 0, 0.15]
      target:
        marker: ar_marker_4
        position: [0.25, 0, 0.15]
      x: [1.5, 0.6]
      y: [1.5, 0.2]
    ```
- `config.yaml` : This configuration file contains manager package's data.
  - File Path : **/turtlebot3_home_service_challenge_manager/config/config.yaml**

#### [Details about the Home Service Mission](#details-about-the-home-service-mission)

The goal of the Home Service Challenge is to move four different objects from a living room to a specific place with given rules, and to return to the starting point.

Using the demo package, the process of moving objects in Home Service Challenge is as follows.

1. Navigating to a target in the living room.

- Find a target, and reach it using a Navigation package.  
  ![demo_1](/assets/images/platform/turtlebot3/home_service_challenge/noetic/demo_1.PNG)

2. Approaching the target.

- For the approach to the target with precise, TurtleBot3 wheels are directly controlled by computing target's location from AR marker. (Used Topic : `/tb3_hsc/cmd_vel`). To produce a reliable performance, Closed-loop and control system can be used for the specified number of times.
  ![demo_2](/assets/images/platform/turtlebot3/home_service_challenge/noetic/demo_2.PNG)

3. Picking the target with OpenMANIPULATOR-X's gripper.

- Pick the target object using the moveit package (Joint space control, Task space control and Gripper control)

  ![manipulation_diagram](/assets/images/platform/turtlebot3/home_service_challenge/kinetic/manipulation_diagram.png)

  > MoveIt Diagram

4. Leaving for the next room to place the object (Used Topic : `/tb3_hsc/cmd_vel`)

   - When moving back from the target, the wheels are directly controlled by the manager program using `/tb3_hsc/cmd_vel` topic.

5. Navigating to the place where the object will be placed.

- Find a next target, and reach it using a Navigation package.

  ![demo_3](/assets/images/platform/turtlebot3/home_service_challenge/noetic/demo_3.PNG)

6. Approaching the target.

7. Placing the object using the gripper.

8. Returning to the starting point using the navigation package.

   ![demo_4](/assets/images/platform/turtlebot3/home_service_challenge/noetic/demo_4.PNG)



### [Simulation](#simulation)

Simulate TurtleBot3 with OpenMANIPULATOR-X in Gazebo.

1. **[Remote PC]** Run Gazebo.
```bash
$ roslaunch turtlebot3_home_service_challenge_simulation competition.launch
```

   ![gazebo](/assets/images/platform/turtlebot3/home_service_challenge/noetic/simulation_gazebo.png)

2. **[Remote PC]** Run a simulation demo for Gazebo.
```bash
$ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_home_service_challenge_demo_simulation.launch
```

   ![simulation_rviz](/assets/images/platform/turtlebot3/home_service_challenge/noetic/simulation_rviz.png)

3. **[Remote PC]** Run Home Service Manager.
```bash
$ roslaunch turtlebot3_home_service_challenge_manager manager.launch
```

4. Use the Home Service Challenge commands, See [Commands](#commands)
