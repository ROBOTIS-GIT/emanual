---
layout: archive
lang: en
ref: home_service_challenge
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/home_service_challenge/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 18
---

<!--[dummy Header 1]>
  <h1 id="dummy"><a href="#dummy">Dummy</a></h1>
<![end dummy Header 1]-->

<div style="counter-reset: h1 7"></div>
<div style="counter-reset: h2 9"></div>

## [TurtleBot3 Home Service Challenge](#turtlebot3-home-service-challenge)

{% capture notice_01 %}
**NOTE**:

- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- For more informationn, see [OpenMANIPULATOR e-Manual](/docs/en/platform/openmanipulator/) and [[ROS 1] Turtlebot3 Manipulation](/docs/en/platform/turtlebot3/manipulation)
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/turtlebot3/home_service_challenge/hsc_stadium_2.png)

> Home Service Challenge Stadium and Objects

<iframe width="560" height="315" src="https://www.youtube.com/embed/3aZXpVsEi0c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [What you need to Join the Home Service Challenge](#what-you-need-to-join-the-home-service-challenge)

`TurtleBot3 Waffle Pi`

- It is the basic model to use Home Service Challenge packages for mobile manipulation.
- Provided source codes, Home Service Challenge Packages, are made based on TurtleBot3 Waffle Pi.

`OpenMANIPULATOR-X`

- OpenMANIPULATOR-X is an official robot platform to use mobile manipulation feature with Turtlebot3 in the Home Service Challenge.

`Remote PC`

- It communicates with an single board computer (SBC) on Turtlebot3.
- Laptop, desktop, or other devices with ROS 1.

### [Getting Started](#getting-started)

{% capture HSC_Note %}
**NOTE**: Be sure to complete the following instructions before installing Home Service Challenge packages in the pc.

- [TurtleBot3 PC Set up](/docs/en/platform/turtlebot3/pc_setup)
- [TurtleBot3 SBC Set up](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/#raspberry-pi-3-setup)
- [OpenMANIPULATOR-X](/docs/en/platform/openmanipulator_x/ros_setup/#install-ros-packages) packages
{% endcapture %}
<div class="notice">{{ HSC_Note | markdownify }}</div>

#### [Remote PC Setup](#remote-pc-setup)

1. **[Remote PC]** Install Home Service Challenge packages.

```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_home_service_challenge.git
$ sudo apt-get install ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs
$ cd ~/catkin_ws && catkin_make
```

2. **[Remote PC]** Load the TurtleBot3 Waffle (or Waffle Pi) with OpenMANIPULATOR on RViz.

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_manipulation_description turtlebot3_manipulation_view.launch use_gui:=true
```

    **NOTE**: Specify `${TB3_MODEL}`: `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice}

    ![turtlebot3_manipulation_view](/assets/images/platform/turtlebot3/manipulation/TurtleBot3_with_Open_Manipulator.png)

    > Rviz View

4. **[Remote PC]** In order to use your PC remotely, you need to make SSH keys. Create a script file to generate SSH key.

```bash
$ nano ~/tb3_ssh_keygen
```

5. **[Remote PC]** Copy and paste the followings to the script, and save it.

   ```bash
   #!/bin/bash
   argc=$#
   args=("$@")

   if [ 0 -eq $argc ]
   then
     echo "need to argument that host ip for ssh connection"
     echo "Usage: $0 [ip address] ..."
     exit 1
   fi

   for((index = 0; index < $#; index++ ))
   do
     ssh-keygen -R ${args[$index]}
     ssh-keyscan ${args[$index]} >> ~/.ssh/known_hosts
   done
   ```

6. **[Remote PC]** Make the file executable.

```
$ chmod +x ~/tb3_ssh_keygen
```

7. **[Remote PC]** Execute the file with TurtleBot3's IP address.

```
$ ~/tb3_ssh_keygen 192.168.1.10
```

    **NOTE**: Be sure **Remote PC** and **TurtleBot3** are connected **under the same IP**.
    {: .notice}

8. Check `~/.ssh/known_hosts` file if SSH is successfully generated.

#### [SBC Setup](#sbc-setup)

1. **[Turtlebot3 SBC]** Using a machine tag, create `env.bash` file located in the **/home/pi**.

```
$ nano ~/env.bash
```

2. **[Turtlebot3 SBC]** Copy and paste the followings to the script, and save it.

   ```bash
   #!/bin/bash

   # check if other turtlebot3_core is already running
   is_running=`ps ax | grep turtlebot3_core`
   IFS=' ' read -ra is_runnings <<< "$is_running"
   process_name=${is_runnings[4]}
   if [ ${process_name} == "python" ]
   then
     echo "other turtlebot3_core is already running."
     exit 1
   fi

   #### ROS ####
   source /opt/ros/kinetic/setup.bash
   source ~/catkin_ws/devel/setup.bash

   #### ROS Network ####
   ip_address=`hostname -I`
   ip_address_trim=${ip_address%% * }
   ip_address_no_space="$(echo -e "${ip_address_trim}" | tr -d '[:space:]')"
   export ROS_HOSTNAME=${ip_address_no_space}

   ##### Set TURTLEBOT3 Model ####
   export TURTLEBOT3_MODEL=waffle_pi

   exec "$@"
   ```

3. Make the file executable.

```
$ chmod +x ~/env.bash
```

#### [Hardware Setup](#hardware-setup)

- See the [Hardware Setup](/docs/en/platform/turtlebot3/manipulation/#hardware-setup)

#### [OpenCR Setup](#opencr-setup)

- See the [OpenCR Setup](/docs/en/platform/turtlebot3/manipulation/#opencr-setup)

### [Camera Calibration](#camera-calibration)

Calibrate a camera to decrease or minimize distortion. Follow the camera calibration process step by step.

#### [Camera Setting](#camera-setting)

1. **[Remote PC]** Use the following command to run a camera remotely. Make sure to type IP address where TurtleBot3 and remote pc are connected together.

```bash
$ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_pi_cam_remote.launch address:=TURTLEBOT_IP
```

**NOTE**: Be sure **Remote PC** and **TurtleBot3** are connected **under the same IP**.
{: .notice}

2. **[Remote PC]** Execute rqt_image_view.

```bash
$ rqt_image_view
```

3. Select **/raspicam_node/image/compressed** (or **/raspicam_node/image/**) topic on the check box.

   ![camera view](/assets/images/platform/turtlebot3/home_service_challenge/camera_setting_01.png)

4. **[Remote PC]** Excute rqt_reconfigure.

```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

5. Click **raspicam_node**, and modify parameter value to see clear images from the camera.

   ![camera setting](/assets/images/platform/turtlebot3/home_service_challenge/camera_setting_02.png)

6. Open **camera.yaml** file located in **turtlebot3_home_service_challenge_tools/config/camera_calibration**.

7. Write modified values to the file.

```
ISO: 400
awb_mode: auto
brightness: 50
contrast: 0
exposureCompensation: 0
exposure_mode: auto
hFlip: false
saturation: 0
sharpness: 0
shutterSpeed: 0
vFlip: false
videoStabilisation: false
zoom: 1.0
```

#### [Intrinsic Camera Calibration](#intrinsic-camera-calibration)

Print a checkerboard on A4 size paper. The checkerboard is used for Intrinsic Camera Calibration.

- Download a checkerboard from [ROS Wiki](http://wiki.ros.org/camera_calibration/Tutorials/StereoCalibration?action=AttachFile&do=view&target=check-108.pdf)
- For detailed information on the camera calibration, see [camera_calibration](http://wiki.ros.org/camera_calibration) from ROS Wiki.

  ![checkerboard](/assets/images/platform/turtlebot3/autonomous_driving/autorace_checkerboard.png)

  > Checkerboard

1. **[Remote PC]** Use the following command to run a camera remotely. Make sure to include IP address when using the command.

```bash
$ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_pi_cam_remote.launch enable_raw:=true address:=TURTLEBOT_IP
```

    **NOTE**: Be sure **Remote PC** and **TurtleBot3** are connected **under the same IP**.
    {: .notice}

2. **[Remote PC]** Run a intrinsic camera calibration.

```bash
$ rosrun camera_calibration cameracalibrator.py --size 8x6 --square 0.024 image:=/raspicam_node/image camera:=/raspicam_node
```

**NOTE**: The size of squres may differ depending on the print paper size A3, A4 or others. In which case, **adjust the value (0.024) of --square option in the given command** according to the square size in the print paper.
{: .notice}

![calibration display](/assets/images/platform/turtlebot3/home_service_challenge/camera_calibration_01.png)

3. Use the checkerboard to calibrate the camera, and click **CALIBRATE**.

   **NOTE**: Move and tilt the checker board around to the left, right, top, bottom and various angles to get `X`,`Y`, `Size` and `Skew` calibration data. As the data is computed enough, `X`,`Y`, `Size` and `Skew` will have a green bar.
   {: .notice}

   ![calibraion](/assets/images/platform/turtlebot3/home_service_challenge/camera_calibration_02.png)

4. Click **Commit** to save the intrinsic calibration data to the default folder.(~/.ros/camera_info)

   ![commit](/assets/images/platform/turtlebot3/home_service_challenge/camera_calibration_04.png)

5. Open `camerav2_1280x720.yaml` file located **~/.ros/camera_info** from `Turtlebot SBC` and check the saved data, which has the form like the script below.

```
image_width: 1280
image_height: 720
camera_name: camerav2_1280x720
 camera_matrix:
 rows: 3
 cols: 3
 data: [1280.628466572832, 0, 658.384219880362, 0, 1277.989132765768, 360.8363923435625, 0, 0, 1]
distortion_model: plumb_bob
distortion_coefficients:
 rows: 1
 cols: 5
 data: [0.2032697817127332, -0.4147569733010375, -0.001420915782245743, 0.003110652248245379, 0]
rectification_matrix:
 rows: 3
 cols: 3
 data: [1, 0, 0, 0, 1, 0, 0, 0, 1]
projection_matrix:
 rows: 3
 cols: 4
 data: [1312.630981445312, 0, 661.4149459665205, 0, 0, 1312.107055664062, 360.0239481801327, 0, 0, 0, 1, 0]
```

### [SLAM](#slam)

SLAM stands for Simultaneous Localization and Mapping. Using this feature, TurtleBot3 can draw a map. More information on this, see [SLAM](/docs/en/platform/turtlebot3/slam/#ros-1-slam)

1. **[Remote PC]** Use the following command to run a camera remotely. Make sure to include IP address when using the command.

```bash
$ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_robot_remote.launch address:=TURTLEBOT_IP
```

**NOTE**: Be sure **Remote PC** and **TurtleBot3** are connected **under the same IP**.
{: .notice}

2. **[Remote PC]** Run slam node.

```bash
$ roslaunch turtlebot3_home_service_challenge_tools slam.launch
```

3. **[Remote PC]** Run keyboard teleoperation node.

```bash
$ roslaunch turtlebot3_home_service_challenge_tools mobile_teleop_key.launch
```

After the node is run, the following controller will be displayed on a terminal window.

````bash
Control Your TurtleBot3!
---------------------------
Moving around:
w
a s d
x

    w/x : increase/decrease linear velocity
    a/d : increase/decrease angular velocity
    space key, s : force stop

    CTRL-C to quit
    ```

4. Update a map with the keyboard controller.

   ![making_map](/assets/images/platform/turtlebot3/home_service_challenge/slam_02.png)

5. **[Remote PC]** Save the map when it is fully updated.

```bash
$ ROS_NAMESPACE=tb3_hsc rosrun map_server map_saver -f tb3_hsc
````

![map](/assets/images/platform/turtlebot3/home_service_challenge/map.png)

### [Starting Missions](#starting-missions)

#### [Run a Demo and Manager Pacakge](#run-a-demo-and-manager-package)

1. **[Remote PC]** Run the demo pacakge. Make sure to include IP address when using the command. This package contains various features: Remote Bringup with a machine tag, Moveit, Navigation, Camera sensing

```bash
$ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_home_service_challenge_demo_remote.launch address:=TURTLEBOT_IP
```

    **NOTE**: Be sure **Remote PC** and **TurtleBot3** are connected **under the same IP**.
    {: .notice}

    ![demo_01](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_01.png)

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
$ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_ar_marker_0
$ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_ar_marker_1
$ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_ar_marker_2
```

- Manipulation

```bash
$ rostopic pub -1 /tb3_hsc/command std_msgs/String arm_home
$ rostopic pub -1 /tb3_hsc/command std_msgs/String arm_joint
$ rostopic pub -1 /tb3_hsc/command std_msgs/String arm_task
$ rostopic pub -1 /tb3_hsc/command std_msgs/String open_gripper
$ rostopic pub -1 /tb3_hsc/command std_msgs/String close_gripper
```

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
  ![demo_02](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_02.png)

2. Approaching the target.

- For the approach to the target with precise, TurtleBot3 wheels are directly controlled by computing target's location from AR marker. (Used Topic : `/tb3_hsc/cmd_vel`). To produce a reliable performance, Closed-loop and control system can be used for the specified number of times.
  ![demo_03](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_03.png)

3. Picking the target with OpenMANIPULATOR-X's gripper.

- Pick the target object using the moveit package (Joint space control, Task space control and Gripper control)

  ![manipulation_diagram](/assets/images/platform/turtlebot3/home_service_challenge/manipulation_diagram.png)

  > MoveIt Diagram

  ![demo_04](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_04.png)

  > Picking a Target Using MoveIt Package.

4. Leaving for the next room to place the object (Used Topic : `/tb3_hsc/cmd_vel`)

   - When moving back from the target, the wheels are directly controlled by the manager program using `/tb3_hsc/cmd_vel` topic.

5. Navigating to the place where the object will be placed.

- Find a next target, and reach it using a Navigation package.

  ![demo_05](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_05.png)

6. Approaching the target.

7. Placing the object using the gripper.

8. Returning to the starting point using the navigation package.

   ![demo_06](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_06.png)

### [Simulation](#simulation)

Simulate TurtleBot3 with OpenMANIPULATOR-X in Gazebo.

1. **[Remote PC]** Run Gazebo.

```
$ roslaunch turtlebot3_home_service_challenge_simulation competition.launch
```

![gazebo](/assets/images/platform/turtlebot3/home_service_challenge/simulation_00.png)

2. **[Remote PC]** Run a simulation demo for Gazebo.

```
$ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_home_service_challenge_demo_simulation.launch
```

![simulation_rviz](/assets/images/platform/turtlebot3/home_service_challenge/simulation_rviz_01.png)

3. **[Remote PC]** Run Home Service Manager.

```bash
$ roslaunch turtlebot3_home_service_challenge_manager manager.launch
```

4. Use the Home Service Challenge commands, See [Commands](#commands)
