---
layout: archive
lang: en
ref: thormang3_operation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/thormang3/thormang3_operation/
sidebar:
  title: THORMANG3
  nav: "thormang3"
---

<div style="counter-reset: h1 4">
</div>

# [THORMANG3 Operation](#thormang3-operation)

## [Preparation](#preparation)

### Time Synchronization (MPC)

> Reference : [ROS network Setup, 5. Timing issues]

1. Connect to the **MPC(Motion PC)**
    - via ssh  
      1. Run below command on the terminal.  
        ```bash
        $ ssh robotis@10.17.3.35
        ```

      2. Input password : `111111`  

    - via VNC  

2. Synchronize time with the **PPC(Perception PC)**  
    - If this is the first synchronization, create the script file.   
      1. Create the script file with an editor.  
        ```bash
        $ gedit ~/timesync
        ```

      2. Copy below contents in the script file.  
        ```bash
        #! /bin/sh
        sudo date --set='-2 secs'
        sudo ntpdate 10.17.3.35
        sudo hwclock -w
        ```

      3. Modify the script file permission(Add execute permission)  
        ```bash
        $ sudo chmod +x timesync
        ```

      4. Execute the script file to synchronize time.  
        ```bash
        $ ~/timesync
        ```

    - If this is not the first synchronization, execute the script file.  
      ```bash
      $ ~/timesync
      ```

### roscore (PPC)
1. Connect to the **PPC**
    - via ssh  
      1. Run below command on the terminal.  
        ```bash
        $ ssh robotis@10.17.3.35
        ```

      2. Input password.  
        `111111`  

    - via VNC  

2. Launch [roscore]  
  Execute below command on the Terminal  
  ```bash
  $ roscore
  ```

    - If `roscore` is terminated while it is running, relaunch `roscore`, `thormang3 sensors` and `thormang3 manager`.

### thormang3 sensors (PPC)
1. Connect to the **PPC**  
2. Execute [thormang3_sensors.launch]{: .popup} file  
  ```
  $ roslaunch thormang3_sensors thormang3_sensors.launch
  ```

  > Reference : [thormang3_sensors]

### THORMANG3 Manager (MPC)
Turn on the actuator power before executing THORMANG3 Manager.  

1. Connect to the **MPC**  
2. Get superuser permission  
  ```bash
  $ sudo bash
  ```

3. Execute [thormang3_manager.launch]{: .popup} file  
  ```bash
  # roslaunch thormang3_manager thormang3_manager.launch
  ```
  > Reference : [thormang3_manager]  

4. If program is loaded, torque of the actuator will be turned on.  

  - How to check thormang3 working
    > Reference 1 : [How to execute Simple Demonstration]  
    > Reference 2 : [How to execute OPC's GUI program]

## [Simple Demo](#simple-demo)

### [Manipulation Simple Demo](#manipulation-simple-demo)

Simple demo of the [thormang3_manipulation_module]  

#### Install & Build

  **NOTE** : Reference : [PPC Installation]
  {: .notice}

#### Usage

1. Connect to the PPC with SSH client program (IP: 10.17.3.35).   

    ```bash
    $ ssh 10.17.3.35 -l robotis   
    ```

2. You can execute simple demo with the following command.   

    ```bash
    $ rosrun thormang3_manipulation_demo thormang3_manipulation_demo   
    ```

3. There are 5 commands for simple demonstration.   

    - demo 1 : go to initial posture (from base module)   
      ```bash
      $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "ini_pose"
      ```

    - demo 2 : set manipulation module
      ```bash
      $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "set_mode"
      ```

    - demo 3 : go to manipulation initial posture - Joint Space Control
      ```bash
      $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "base_pose"
      ```

    - demo 4 : move right arm (without torso) - Task Space Control
      ```bash
      $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "right_arm"
      ```

    - demo 5 : move left arm (with torso) - Task Space Control
      ```bash
      $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "left_arm"
      ```

### [Walking Simple Demo](#walking-simple-demo)

Simple demo of the [thormang3_walking_module]

#### Install & Build

**NOTE** : Reference : [PPC Installation]
{: .notice}

#### Usage

1. Connect to the PPC with SSH client program (IP: 10.17.3.35).   
  ```bash
  $ ssh 10.17.3.35 -l robotis   
  ```

2. You can execute simple demo with the following command.   
  ```bash
  $ rosrun thormang3_walking_demo thormang3_walking_demo_node   
  ```

3. There are 5 commands for simple demonstration.   

    - demo 1 : go to initial posture (from base module)   
      ```bash
      $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "ini_pose"
      ```
    - demo 2 : set manipulation module
      ```bash
      $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "set_mode"
      ```
    - demo 3 : make balance algorithm enable/disable – Balance ON / OFF
      ```bash
      $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "balance_on"  
      $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "balance_off"   
      ```
    - demo 4 : walk forward – One step forward walking (balance should be turned on)
      ```bash
      $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "forward"    
      ```
    - demo 5 : walk backward – One step backward walking (balance should be turned on)
      ```bash
      $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "backward"    
      ```

## [GUI Program](#gui-program)

How to monitor and control THORMANG3 from the remote.

### [What is OPC](#what-is-opc)

![](/assets/images/platform/thormang3/thormang3_046.png)

Operating PC is used to control the robot from the outside.

#### Recommended PC Info  
1. OS  
  - Ubuntu 16.04 LTS  

2. ROS(Robot Operating System)  
  - version : kinetic  
  - installation(Desktop-Full) : [http://wiki.ros.org/kinetic/Installation/Ubuntu]
  - environment setting : [http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment]

3. ROBOTIS ROS Package  
  - `Reference` [OPC Installation]  
  - [ROBOTIS-THORMANG-OPC]
  - [ROBOTIS-THORMANG-Common]

#### OPC Network setting  
- `Reference` [Example Setting for OPC]  

- IP Address : Static IP address is recommended  
  > ex )
  > IP address: 10.17.3.100
  > Netmask : 255.255.255.0
  > Gateway : 10.17.3.1

- ROS network environment setting
  - `Reference` [ROS Network Setup]

1. Open the bash file to configure environment  
  ```bash
  $ gedit ~/.bashrc
  ```

2. Append below contents at the end of the `.bashrc` file  
    ```bash
    # Set ROS Kinetic
    source /opt/ros/kinetic/setup.bash
    source ~/catkin_ws/devel/setup.bash

    ##### Set ROS Network ####
    # PPC CORE(10.17.3.35)
    export ROS_MASTER_URI=http://10.17.3.35:11311

    # local ROS IP
    export ROS_IP=10.17.3.100
    ```
    > ROS_MASTER_URI : PPC(10.17.3.35)  
    > ROS_IP : OPC(10.17.3.100)  

3. Use below command to apply modified configuration or open a new terminal window.  

    ```bash
    $ source ~/.bashrc
    ```

### [Visualized Monitoring](#visualized-monitoring)

#### Related ROS Packages  
1. RViz  
  RViz is a 3D visualization tool for robots. Rviz visualizes robot's posture, camera image, pointcloud and sensor data.  
  > Reference : [http://wiki.ros.org/rviz]

2. Robot Model  
  ROS uses URDF(Unified Robot Description Format) robot model information.  
  > Reference : [http://wiki.ros.org/urdf]  

3. TF  
  TF is generated from Robot model information and each joint data. User can identify Robot's posture and relative position of each frame with TF.  
  > Reference : [http://wiki.ros.org/tf]

4. Other sensor related Packages  
  uvc_camera, urg_node, etc.  

#### Run monitoring THORMANG3  
1. Launch ROS program for THORMANG3  
  > Reference : [How to run THORMANG3's program]

2. Synchronize time with the PPC(Perception PC)  
    - If this is the first synchronization, create the script file.  
      - Create a script file with an editor.  
        ```bash
        $ gedit ~/timesync
        ```
      - Copy below contents in the script file.  
        ```
        #! /bin/sh
        sudo date --set='-2 secs'
        sudo ntpdate 10.17.3.35
        sudo hwclock -w
        ```
        > PPC(10.17.3.35)  
      - Modify the script file permission(Add execute permission)  
        ```bash
        $ sudo chmod +x timesync
        ```
      - Execute the script file to synchronize time.  
        ```bash
        $ ~/timesync
        ```

    - If this is not the first synchronization, execute the script file.  
      ```bash
      $ ~/timesync
      ```

3. Run Visualization Tool  
  User can monitor the robot with below command.  
  ```bash
  $ roslaunch thormang3_description thormang3_opc.launch
  ```

    ![](/assets/images/platform/thormang3/thormang3_047.png)

### [Remote Control(GUI Demo)](#remote-controlgui-demo)
Demo program for remote control is provided.  
Walking, manipulation, head control are provided.  

1. Run thormang3 demo  
  The following command will launch the demo program.  
    ```bash
    $ roslaunch thormand3_demo thormang3_demo.launch
    ```

2. Basic Operations  
3. Switching Modes  
  The framework of THORMANG3 is consisted of multiple modules.  
  Switching mode will decide which module to use.  

4. Move to `Mode` tab  
5. Click the mode at the top to activate  
6. Check all joints are switched to selected mode.  
    ![](/assets/images/platform/thormang3/thormang3_048.png)

7. Initial Posture  
  In order to operate the robot safely, the robot should be operated from the initial posture.  
  Click `Robot Init Pose` button at the top of demo program(Effective regardless of current mode)  

    ![](/assets/images/platform/thormang3/thormang3_049.png)

    ![](/assets/images/platform/thormang3/thormang3_050.png)

### [Calibrate FT Sensors](#calibrate-ft-sensors)

Instructions about how to calibrate FT Sensors on THORMANG3's feet. Balance Algorithm for walking works well when FT Sensors are calibrated.   

#### Install & Build

  **NOTE** : Reference : [OPC Installation]
  {: .notice}

#### Run
> Reference : [How to execute OPC's GUI program]

#### Usage  
1. Move to Robot Init Pose
  - Click `Robot Init Pose` button on the top.  

    ![](/assets/images/platform/thormang3/thormang3_051.jpg)

2. Measure FT Air  
  - After reaching to Robot Init Pose, click `FT Air` button to measure the Force Torque value in the air.
  - **THORMANG3 must be hanging on the lift for this procedure.**

    ![](/assets/images/platform/thormang3/thormang3_052.jpg)

3. Measure FT Ground  
    - After completing previous procedure, click `FT Ground` button to measure the Force Torque on the ground.
    - **THORMANG3 must be standing on the ground for this procedure.**

    ![](/assets/images/platform/thormang3/thormang3_053.jpg)

    - **Measured values are displayed on the left of GUID.**
    - **If measured Fz value on the ground is greater than the measured value in the air by more than around 210N, it is normal.**
    - **If the value is smaller than around 210N, repeat 1~3 procedure from above.**

4. Apply Init FT
  - After completing above procedures, click `Apply Init FT` button.
  - Measured Force Torque values in the air and on the ground are transmitted to [thormang3_feet_ft_module] and FT Sensor calibration is completed.

    ![](/assets/images/platform/thormang3/thormang3_054.jpg)

5. Save FT Calibration
  - If you want to save current calibration, click `Save FT calibration` button.

    ![](/assets/images/platform/thormang3/thormang3_055.jpg)

### [Operate Head Module](#operate-head-module)

Instructions about controlling head of THORMANG3.  
Lidar data(2D) can be assembled to PointCloud(3D) by moving the head with Head Control Mode.   
User can manipulate head joints to move the sensor attached head.  

#### How to operate Head Control module  
- Assemble LaserScan  

  1. Change the Mode  

  2. Assemble  
  Click `Make PointCloud` button in the `Basic Control` of the demo program.  

      ![](/assets/images/platform/thormang3/thormang3_056.png)

  3. Check the pointcloud  
    Assembled pointcloud can be seen on the RViz screen.  

      - Execute Visualization Tool  
      - Add topic  
        - Click `Add` button on the Display window on the left.  
        - Select `By topic` tab on the new window  
        - Select `/robotis/sensor/assembled_scan/PointCloud2`  
      - Check PointCloud on the 3D screen  

        ![](/assets/images/platform/thormang3/thormang3_057.png)

- Head Joint Control  
  1. Change the Mode  

  2. Select `Head Control` tab of the demo program.  

  3. Change the value for specific joint.  

  ![](/assets/images/platform/thormang3/thormang3_058.png)

### [Operate Manipulation Module](#operate-manipulation-module)

Instructions about how to operate the manipulation module on the OPC GUI program.

#### How to operate the Manipulation module
Manipulation Control Mode can control and receive feedback of the upper body.

![](/assets/images/platform/thormang3/thormang3_059.png)

##### Joint Space Control

1. Change the Mode  
  - Click `Manipulation` tab of the demo program.  

2. Manipulation Initial Pose    
  - Click `Manipulation Init Pose` in the `Joint Control`.

3. Update the value of specific joint.    
  - Select desired joint from `Joint Name`.    
  - Write target value in `Joint Value [deg]`.    
  - Click `Set Destination Joint Angle` button.     

4. Obtain current joint value.    
  - Select desired joint from `Joint Name`.    
  - Click `Get Current Joint Angle` button.   

##### Task Space Control    

1. Change the Mode  
  - Click `Manipulation` tab of the demo program.  

2. Manipulation Initial Pose    
  - Click `Manipulation Init Pose` in the `Joint Control`.

3. Write the target value of End effector.  
  - Select a specific group in the `Forward Kinematics` tab.    
  - write target value in the `Inverse Kinematics` tab.    
  - Click `Set Destination Position` button.     

4. Obtain current value of End effector.
  - Select a specific group in the `Forward Kinematics` tab.    
  - Click `Get Current Position` button.   

##### Gripper Control    

1. Change the Mode  
  - Click `Manipulation` tab of the demo program.  

2. Manipulation Initial Pose    
  - Click `Manipulation Init Pose` in the `Joint Control`.

3. Gripper Operation
  - Select a specific group in the `Gripper` tab.    
  - Click `ON` / `OFF` buttons.

### [Operate Walking Module](#operate-walking-module)

#### Walking with [thormang3_demo] and [thormang3_foot_step_generator]
Examples to control walking by using [thormang3_demo] and [thormang3_foot_step_generator].   
Structure looks like the below figure.  

![](/assets/images/platform/thormang3/thormang3_060.jpg)

##### Install & Build

  **NOTE** : Reference : [OPC Installation]
  {: .notice}

##### Run
> Reference : [How to execute OPC's GUI program]


##### Usage
1. Move to Robot Init Pose
  - Click the `Robot Init Pose` button.  

    ![](/assets/images/platform/thormang3/thormang3_061.png)

2. FT Sensor Calibration
  - FT sensor calibration is important for the walking operation.
  - FT Sensor calibration is recommended when there are significant environmental changes such as motor replacement and temperature change.
  - FT Sensor calibration can be done as below.  

    > Reference : [How to calibrate feet ft sensors]

3. Set Mode
  - Click the `Walking Module` button to switch to Walking Mode.

    ![](/assets/images/platform/thormang3/thormang3_062.jpg)

4. Balance On
  - Select the `Walking` tab from the demo program.
  - Click `On` button in the `Balance Control`.

    ![](/assets/images/platform/thormang3/thormang3_063.png)

    - Balance is turned on by configuring [Balance Parameter] with the `/robotis/walking/set_balance_param` service.
    - Balance Parameter is updated with the saved value in the [thormang3_foot_step_generator/data/balance_param.yaml].

    ![](/assets/images/platform/thormang3/thormang3_064.jpg)

5. Walking Control
  - Configure Walking Parameters on the right of the `Direction Walking` panel.
  - After configuring parameters, clicking one of Walking Directions will initiate walking of THORMANG3.

    ![](/assets/images/platform/thormang3/thormang3_065.jpg)

    - The procedure flows as below.

    ![](/assets/images/platform/thormang3/thormang3_066.jpg)


#### Walking with [thormang3_demo] and [footstep_planner]
A walking example that follows StepData using [footstep_planner].

![](/assets/images/platform/thormang3/thormang3_067.jpg)

##### Install & Build

  **NOTE** : Reference : [OPC Installation]
  {: .notice}

##### Run
- Execute [thormang3_demo] as below.

> Reference : [How to execute OPC's GUI program]

- Execute [footstep_planner].

##### Usage
1. Basic Operation
  - Sequentially proceed 1~4 of [Usage] from above "Walking with [thormang3_demo] and [thormang3_foot_step_generator]".   

2. Add Visualization
  - Click the `Add` button on the Rviz window.
  - Select the `By Topic` tab and select the `/demo/foot_step_marker/MarkerArray`, then click `OK`.

    ![](/assets/images/platform/thormang3/thormang3_068.jpg)

3. Interactive Marker
  - Click the `Publish Point` button on the Rviz window.
  - Click one of the THORMANG's feet on the Rviz window.

    ![](/assets/images/platform/thormang3/thormang3_069.jpg)

    - Click `Set Marker` button.
    - The Interactive Marker is activated on the Rviz window as below figure.

    ![](/assets/images/platform/thormang3/thormang3_070.jpg)

4. StepData Planning
  - Move the Interative Marker and click `Publish Pose` button.  
  - `Walking` tab of the [thormang3_demo] GUI should be selected ahead.  

    ![](/assets/images/platform/thormang3/thormang3_071.jpg)

    - After checking "Get Pose for Step" message from the GUI and activated `Plan` button, click `Plan` button.  

    ![](/assets/images/platform/thormang3/thormang3_072.jpg)

    - When planning is completed, planned StepData can be seen on the Rviz GUI window.  

    ![](/assets/images/platform/thormang3/thormang3_073.jpg)

5. Start Walking
  - Confirm planned StepData from the [thormang3_demo] GUI and click `GO!` button.

    ![](/assets/images/platform/thormang3/thormang3_074.jpg)



## [Offset Tuner](#offset-tuner)

Instruction about how to run the Thormang3 offset tuner program.   

### [Execute in MPC](#execute-in-mpc)

Execute the offset tuner server first (thormang3_manager should be terminated to run the offset tuner program).

```
# roslaunch thormang3_offset_tuner_server thormang3_offset_tuner_server.launch
```

### [Execute in OPC](#execute-in-opc)

Execute the offset tuner GUI program.

```
$ rosrun thormang3_offset_tuner_client thormang3_offset_tuner_client
```

### [How to use GUI program](#how-to-use-gui-program)

![](/assets/images/platform/thormang3/thormang3_075.png)


## [Tuner Client](#tuner-client)

Instruction about how to run the Thormang3 gain and offset tuner program.   

### [Execute in MPC](#execute-in-mpc-tuner-client)

This program works with `thormang3_p_manager`. User don't have to run the server for this program.

```
# roslaunch thormang3_p_manager thormang_p_manager.launch  
```

### [Execute in OPC](#execute-in-opc-tuner-client)

Execute the gain and offset tuner GUI program.

```
$ rosrun thormang3_tuner_client thormang3_tuner_client  
```  
![](/assets/images/platform/thormang3/thormang3_tuner_client.png)   

### [How to use GUI program](#how-to-use-gui-program-tuner-client)

![](/assets/images/platform/thormang3/thormang3_tuner_client_01.png)    

{% capture package_warning %}  
![](/assets/images/icon_warning.png)  
**CAUTION** : When you click `initial pose` or change module to the others, THORMANG3 may jump.  
This should be done with THORMANG in the air.  
{% endcapture %}
<div class="notice--warning">{{ package_warning | markdownify }}</div> 
  

1. Go to initial pose : If user click this button, tuning_module in robotis_controller is activated and THORMANG3 goes to initial pose.  
2. Select kinematics group  
3. Load present status : goal position, offset, gain
4. Change offset or gain
5. Save the changed value to config file

- Sensors
  - FT Force : Scaled force value in direction of Z  
  - IMU : Robot orientation(roll, pitch) from IMU
- Pose  
  - How to change pose  
    - select pose name  
    - click `tuning pose`  
  - pose config file : `thormang3_tuning_module/data/tune_pose.yaml`

[PPC Installation]: /docs/en/platform/thormang3/getting_started/#ppc-installation
[OPC Installation]: /docs/en/platform/thormang3/getting_started/#opc-installation

[ROS network Setup, 5. Timing issues]:http://wiki.ros.org/ROS/NetworkSetup#Timing_issues.2C_TF_complaining_about_extrapolation_into_the_future.3F
[roscore]:http://wiki.ros.org/roscore
[thormang3_sensors.launch]: /docs/en/popup/thormang3_sensors.launch
[thormang3_manager.launch]: /docs/en/popup/thormang3_manager.launch

[http://wiki.ros.org/kinetic/Installation/Ubuntu]:http://wiki.ros.org/indigo/Installation/Ubuntu
[http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment]:http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment
[ROS Network Setup]:http://wiki.ros.org/ROS/NetworkSetup  

[How to execute Simple Demonstration]: /docs/en/platform/thormang3/thormang3_operation/#simple-demo

[How to execute OPC's GUI program]: /docs/en/platform/thormang3/thormang3_operation/#gui-program

[Remote Control(GUI Demo)]: /docs/en/platform/thormang3/thormang3_operation/#gui-program
[thormang3_walking_module]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-walking-module

[thormang3_feet_ft_module]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-feet-ft-module
[thormang3_manipulation_module]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-manipulation-module
[Usage]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-walking-module

[http://wiki.ros.org/rviz]:http://wiki.ros.org/rviz
[http://wiki.ros.org/urdf]:http://wiki.ros.org/urdf
[http://wiki.ros.org/tf]:http://wiki.ros.org/tf

[thormang3_sensors]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-sensors/
[thormang3_manager]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-manager/

[ROBOTIS-THORMANG-OPC]: /docs/en/platform/thormang3/thormang3_ros_packages/#opc-packages
[ROBOTIS-THORMANG-Common]: /docs/en/platform/thormang3/thormang3_ros_packages/#common-packages
[Example Setting for OPC]: /docs/en/platform/thormang3/getting_started/#example-setting-for-opc

[How to run THORMANG3's program]: /docs/en/platform/thormang3/thormang3_operation/#thormang3-operation

[thormang3_demo]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-demo
[thormang3_foot_step_generator]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-foot-step-generator
[How to calibrate feet ft sensors]: /docs/en/platform/thormang3/thormang3_operation/#calibrate-ft-sensors
[footstep_planner]: /docs/en/platform/thormang3/thormang3_ros_packages/#footstep-planner
