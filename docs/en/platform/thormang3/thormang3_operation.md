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

> Reference : [ROS network Setup, 5. Timing issues](http://wiki.ros.org/ROS/NetworkSetup#Timing_issues.2C_TF_complaining_about_extrapolation_into_the_future.3F)

1. Connect to the **MPC(Motion PC)**
  - via ssh  
    1. Run below command on the terminal.  
      ```
      ssh robotis@10.17.3.35
      ```

    2. Input password  
      `111111`  
 	
  - via VNC  
   
2. Synchronize time with the **PPC(Perception PC)**  
  - If this is the first synchronization, create the script file.   
    1. Create the script file with an editor.  
      ```
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
      ```
      $ sudo chmod +x timesync
      ```
       
    4. Execute the script file to synchronize time.  
      ```
      $ ~/timesync
      ```
          
  - If this is not the first synchronization, execute the script file.  
    ```
    $ ~/timesync
    ```

### roscore (PPC)
1. Connect to the **PPC**
  - via ssh  
    1. Run below command on the terminal.  
      ```
      ssh robotis@10.17.3.35
      ```

    2. Input password.  
      `111111`  
    
  - via VNC  
   
2. Launch [roscore](http://wiki.ros.org/roscore)  
  Execute below command on the Terminal  
    
  ```
  $ roscore
  ```
    
  - If `roscore` is terminated while it is running, relaunch `roscore`, `thormang3 sensors` and `thormang3 manager`.

### thormang3 sensors (PPC)
1. Connect to the **PPC**  
2. Execute [thormang3_sensors.launch](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-PPC/blob/master/thormang3_sensors/launch/thormang3_sensors.launch) file  
  ```
  $ roslaunch thormang3_sensors thormang3_sensors.launch
  ```
	
  > Reference : [thormang3_sensors]

### THORMANG3 Manager (MPC)
Turn on the actuator power before executing THORMANG3 Manager.  

1. Connect to the **MPC**  
2. Get superuser permission  
  ```
  $ sudo bash
  ```
   
3. Execute [thormang3_manager.launch](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/thormang3_manager/launch/thormang3_manager.launch) file  
  ```
  # roslaunch thormang3_manager thormang3_manager.launch
  ```
	
  > Reference :: [thormang3_manager]  

4. If program is loaded, torque of the actuator will be turned on.  

  - How to check thormang3 working
    > Reference 1 : [How to execute Simple Demonstration]  
    > Reference 2 : [How to execute OPC's GUI program] 


## [Simple Demo](#simple-demo)

### [Manipulation Simple Demo](#manipulation-simple-demo)

Simple demo of the [thormang3_manipulation_module]  

#### Install & Build

  `Note` Reference : [PPC Installation]
  {: .notice}

#### Usage

1. Connect to the PPC with SSH client program (IP: 10.17.3.35).   

  ```
  $ ssh 10.17.3.35 -l robotis   
  ```

2. You can execute simple demo with the following command.   

  ```
  $ rosrun thormang3_manipulation_demo thormang3_manipulation_demo   
  ```

3. There are 5 commands for simple demonstration.   

  - demo 1 : go to initial posture (from base module)   

    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "ini_pose"
    ```
  
  - demo 2 : set manipulation module
  
    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "set_mode"
    ```
  
  - demo 3 : go to manipulation initial posture - Joint Space Control
  
    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "base_pose"
    ```
  
  - demo 4 : move right arm (without torso) - Task Space Control
  
    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "right_arm"
    ```
  
  - demo 5 : move left arm (with torso) - Task Space Control
  
    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "left_arm"
    ```

### [Walking Simple Demo](#walking-simple-demo)

Simple demo of the [thormang3_walking_module]

#### Install & Build

  `Note` Reference : [PPC Installation]
  {: .notice}

#### Usage

1. Connect to the PPC with SSH client program (IP: 10.17.3.35).   

  ```
  $ ssh 10.17.3.35 -l robotis   
  ```

2. You can execute simple demo with the following command.   

  ```
  $ rosrun thormang3_walking_demo thormang3_walking_demo_node   
  ```

3. There are 5 commands for simple demonstration.   

  - demo 1 : go to initial posture (from base module)   
    ```
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "ini_pose"
    ```
  - demo 2 : set manipulation module
    ``` 
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "set_mode"
    ```
  - demo 3 : make balance algorithm enable/disable – Balance ON / OFF
    ``` 
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "balance_on"  
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "balance_off"   
    ```
  - demo 4 : walk forward – One step forward walking (balance should be turned on)
    ``` 
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "forward"    
    ```
  - demo 5 : walk backward – One step backward walking (balance should be turned on)
    ``` 
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
  - installation(Desktop-Full) : [http://wiki.ros.org/kinetic/Installation/Ubuntu](http://wiki.ros.org/indigo/Installation/Ubuntu)  
  - environment setting : [http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment](http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment)  

3. ROBOTIS ROS Package  
  > Reference : [OPC Installation]  

  - [ROBOTIS-THORMANG-OPC]
  - [ROSOTIS-THORMANG-Common]

#### OPC Network setting  
  > Reference : [Example Setting for OPC]  

- IP Address : Static IP address is recommended  
  > ex )  
  > - IP address: 10.17.3.100  
  > - Netmask : 255.255.255.0  
  > - Gateway : 10.17.3.1  

- ROS network environment setting
  > Reference : [ROS Network Setup](http://wiki.ros.org/ROS/NetworkSetup)  

1. Open the bash file to configure environment  
  ```
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
  ```
  $ source ~/.bashrc
  ```

### [Visualized Monitoring](#visualized-monitoring)

#### Related ROS Packages  
1. RViz  
  RViz is a 3D visualization tool for robots. Rviz visualizes robot's posture, camera image, pointcloud and sensor data.  
  > Reference : http://wiki.ros.org/rviz

2. Robot Model  
  ROS uses URDF(Unified Robot Description Format) robot model information.  
  > Reference : http://wiki.ros.org/urdf  

3. TF  
  TF is generated from Robot model information and each joint data. User can identify Robot's posture and relative position of each frame with TF.  
  > Reference : http://wiki.ros.org/tf

4. Other sensor related Packages  
  uvc_camera, urg_node, etc.  

#### Run monitoring THORMANG3  
1. Launch ROS program for THORMANG3  
  > Reference : [How to run THORMANG3's program]

2. Synchronize time with the PPC(Perception PC)  
  - If this is the first synchronization, create the script file.  
    - Create a script file with an editor.  
      ```
      $ gedit ~/timesync
      ```
    
    - Copy below contents in the script file.  
      ```bash
      #! /bin/sh
      sudo date --set='-2 secs'
      sudo ntpdate 10.17.3.35
      sudo hwclock -w
      ```
    
    > PPC(10.17.3.35)  

    - Modify the script file permission(Add execute permission)  
      ```
      $ sudo chmod +x timesync
      ```

    - Execute the script file to synchronize time.  
      ```
      $ ~/timesync
      ```

  - If this is not the first synchronization, execute the script file.  
    ```
    $ ~/timesync
    ```

3. Run Visualization Tool  
  User can monitor the robot with below command.  
  ```
  $ roslaunch thormang3_description thormang3_opc.launch
  ```

![](/assets/images/platform/thormang3/thormang3_047.png)

### [Remote Control(GUI Demo)](#remote-control-gui-demo)
Demo program for remote control is provided.  
Walking, manipulation, head control are provided.  

1. Run thormang3 demo  
  The following command will launch the demo program.  
    ```
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

  `Note` Reference : [OPC Installation]
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

  `Note` Reference : [OPC Installation]
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

  `Note` Reference : [OPC Installation]
  {: .notice}

##### Run 
- Execute [thormang3_demo] as below.

> Reference : [How to execute OPC's GUI program]

- Execute [footstep_planner].

##### Usage
1. Basic Operation
  - Sequentially proceed 1~4 of [Usage] from above "Walking with [thormang3_demo] and [thormang3_foot_step_generator]".   

  [Usage]: /en/platform/thormang3/thormang3_ros_packages/#thormang3_walking_module

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


# [Gazebo Simulation](#gazebo-simulation)

## [Install Gazebo](#install-gazebo)
ROS-Gazebo Package Installation

### Gazebo with ROS
[Gazebo Tutorials](http://gazebosim.org/tutorials?cat=connect_ros)

### Additional Installation
If ros-indigo-desktop-full was used to install, the following packages need to be installed.
```
# apt-get install ros-indigo-ros-control
# apt-get install ros-indigo-ros-controllers
# apt-get install ros-indigo-gazebo-ros-control
```

## [Run Simulation](#run-simulation)

How to set up & execute gazebo simulation

### Recommendation  
If Gazebo is running on the OPC, realtime factor can be decreased, therefore, it is recommended to use a separate PC for Gazebo.

### How to execute  
The command to call THORMANG3 in Gazebo
```
$ roslaunch thormang3_gazebo robotis_world.launch
```

![](/assets/images/platform/thormang3/thormang3_076.png)

### [thormang3_manager] for Gazebo  
- Configure simulation setting in the launch file of the thormang3_manager   
`<param name="gazebo" value="true" type="bool"/>`   
`<param name="gazebo_robot_name" value="thormang3"/>`   

- Launch thormang3_manager   
```
$ roslaunch thormang3_manager thormang3_manager.launch
```

- Please refer to below tutorials for the rest procedures.   
[How to run THORMANG3's program]


# [References](#references)

## [Router Setting](#router-setting)

1. Router Reset  
  To reset the router, press the front button for 10 seconds.  
  Front button is “MODE CHANGE” button.
  - Orange LED : Router Mode
  - Green LED : Repeater Mode
  - Red LED : AP Mode

  ![](/assets/images/platform/thormang3/thormang3_077.jpg)

2. Connect to Router  
  - Default Wi-Fi Name:
    - 2.4G : dlink-806a-z
    - 5G  : dlink-806a 5G-z
  - Administrator Account Setting:
    - Name : admin
    - Password : admin
 
3. Change Language
  - Connect to Router via Wi-Fi or Wired.
  - Open the browser and connect to ‘192.168.1.1’. Insert Administrator Account Info.
  - Click “상세 설정”(Details).
  - Click Menu “도구”(Tools) > “관리자 설정”(Administrator).
  - Select Language “영어(English)” and click “APPLY” button.
  - Select “예” and click “APPLY” button.
  The language has been changed.

  ![](/assets/images/platform/thormang3/thormang3_078.jpg)
       
4. Disable the IPTV Availability.  
  In order to use Port 4, IPTV Availability should be disabled.To use Port 4 must disable IPTV Availability.   
  - “Advanced” > “IPTV/IGMP”
  - “IPTV Availability” > Select “Disable” > Click “APPLY” button
  - Reboot the router.

  ![](/assets/images/platform/thormang3/thormang3_079.jpg)

## [LiDAR IP Setting](#lidar-ip-setting)

- Model : UTM-30LX-EW
 
- Download IP address changing tool  
  https://www.hokuyo-aut.jp/02sensor/07scanner/download/products/utm-30lx-ew/
 
- Reset the IP Setting  
  Pressing the button in the sensor’s body will reset the IP setting.
  
  1. Remove the rubber cap that covers the IP reset button.

  ![](/assets/images/platform/thormang3/thormang3_080.jpg)
 
  2. Press the switch inside the hole for more than 3 seconds, using a thin stick.

  ![](/assets/images/platform/thormang3/thormang3_081.jpg)
 
Restart the sensor when the LED blinks, the IP setting will be completed.  
The following table shows the network settings after the reset.

|Item|Description|
|:---:|:---:|
|IP|192.168.0.10|
|Subnet|255.255.255.0|
|Gateway address|192.168.0.1|
|TCP/IP Port|10940|
 
- Change the IP Setting
  1. Below is the screen shot of IP changer’s screen shot.

    ![](/assets/images/platform/thormang3/thormang3_082.jpg)

  2. Change the IP address and push “Update” button. (The “Update” button can be pushed only when the sensor is connected.)

    ![](/assets/images/platform/thormang3/thormang3_083.jpg)

## [System Block Diagram](#system-block-diagram)

![](/assets/images/platform/thormang3/thormang3_046.png)

## [Technical Specifications](#technical-specifications)

1. PC
  - nuc5i5RYK(http://www.intel.com/content/www/us/en/nuc/products-overview.html)
  - Technical Product Specification(http://www.intel.com/content/www/us/en/support/boards-and-kits/000005545.html)
  
  ![](/assets/images/platform/thormang3/thormang3_084.png)
 
2. Actuators
  - [H54-200-S500-R] x10
  - [H54-100-S500-R] x11
  - [H42-20-S300-R] x8

  ![](/assets/images/platform/thormang3/thormang3_085.jpg)

3. Sensors
  - 6-axis force-torque sensor([ATi Mini58-SI-2800-120](http://www.ati-ia.com/products/ft/ft_models.aspx?id=Mini58))
 
    ![](/assets/images/platform/thormang3/thormang3_086.jpg)
 
  - IMU sensor([MicroSrain 3DM-GX4-25](http://www.microstrain.com/inertial/3dm-gx4-25))
  
    ![](/assets/images/platform/thormang3/thormang3_087.jpg)
 
  - LIDAR([Hokuyo UTM-30LX-EW](https://www.hokuyo-aut.jp/02sensor/07scanner/download/products/utm-30lx-ew/))

    ![](/assets/images/platform/thormang3/thormang3_088.jpg)
 
  - HD Camera([Logitech C920 HD](http://www.logitech.com/en-us/product/hd-pro-webcam-c920))
  
    ![](/assets/images/platform/thormang3/thormang3_089.jpg)
 
  - Depth camera([Intel RealSense R200](https://software.intel.com/en-us/realsense/r200camera))
  
    ![](/assets/images/platform/thormang3/thormang3_090.jpg)
 
4. Batteries
  - LiPo 22.2V, 22000mAh x 1EA(http://www.maxamps.com/proddetail.php?prod=Lipo-22000-222-Pack)  
    xt60 plug

    ![](/assets/images/platform/thormang3/thormang3_091.jpg)
 
  - LiPo 18.5V, 11000mAh x 1EA(http://www.maxamps.com/proddetail.php?prod=Lipo-11000-185-Pack)  
    no plug-12awg

    ![](/assets/images/platform/thormang3/thormang3_092.jpg)
 
- Chargers(hitec smart charger h4, hitec e power box 30a)  
  http://hitecrcd.com/products/chargers/dcdc-chargers/h4-dcdc-four-port-multi-charger/product  
  http://hitecrcd.com/products/chargers/epowerbox-30-amp-power-supply/product
 
  ![](/assets/images/platform/thormang3/thormang3_093.jpg)

## [ID Map](#id-map)

![](/assets/images/platform/thormang3/thormang3_094.jpg)

## [Physical Properties](#physical-properties)

### [Link Measurements](#link-measurements)

![](/assets/images/platform/thormang3/thormang3_095.jpg)

![](/assets/images/platform/thormang3/thormang3_096.jpg)

|body|x|y|z|
|:---:|:---:|:---:|:---:|
|Ground-origin|-|-|807.5|
|origin-27|0|0|170.5|
 
|head|x|y|z|
|:---:|:---:|:---:|:---:|
|27-28|0|0|229|
|28-29|0|-45|39|
|29-cam|68.2|45|56|
|29-lidar|0|45|106.75|
|29-decam|68.9|45|17|
 
|L_Arm|x|y|z|R_Arm|x|y|z|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|27-2|0|152|160|27-1|0|-152|160|
|2-4|57|60|-39|1-3|57|-60|-39|
|4-6|-57|33|-0|3-5|-57|-33|0|
|6-8|30|187|57|5-7|30|-187|57|
|8-10|171|30|-57|7-9|171|-30|-57|
|10-12|39|0|45|9-11|39|0|45|
|12-14|45|-45|-45|11-13|45|45|-45|
|14-30|87.7|-58.3|0|13-31|87.7|-31.7|0|
|30-30_2|0|-26.6|0|31-31_2|0|-26.6|0|
 
|L_Leg|x|y|z|R_Leg|x|y|z|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|base-16|0|93|-18|base-15|0|-93|-18|
|16-18|57|0|-75|15-17|57|0|-75|
|18-20|-57|33|0|17-19|-57|33|0|
|20-22|0|60|-300|19-21|0|-60|-300|
|22-24|0|-60|-300|21-23|0|60|-300|
|24-26|57|-33|0|23-25|57|33|0|
|26-26_2|-57|0|-87|25-25_2|-57|0|-87|

### [Mass & Inertia](#mass-inertia)

#### Whole robot

- Mass = 41.6 kg

![](/assets/images/platform/thormang3/thormang3_096.jpg)
          
#### Body

![](/assets/images/platform/thormang3/thormang3_097.jpg)
 
#### Head

![](/assets/images/platform/thormang3/thormang3_098.jpg)
 
#### Right Arm

![](/assets/images/platform/thormang3/thormang3_099.jpg)

![](/assets/images/platform/thormang3/thormang3_100.jpg)

![](/assets/images/platform/thormang3/thormang3_101.jpg)
  
#### Left Arm

![](/assets/images/platform/thormang3/thormang3_102.jpg)

![](/assets/images/platform/thormang3/thormang3_103.jpg)

![](/assets/images/platform/thormang3/thormang3_104.jpg)
  
#### Right Leg

![](/assets/images/platform/thormang3/thormang3_105.jpg)

![](/assets/images/platform/thormang3/thormang3_106.jpg)
 
![](/assets/images/platform/thormang3/thormang3_107.jpg)
  
#### Left Leg

![](/assets/images/platform/thormang3/thormang3_108.jpg)

![](/assets/images/platform/thormang3/thormang3_109.jpg)
 
![](/assets/images/platform/thormang3/thormang3_110.jpg)
 
### [Joint & Angle Limit](#joint-angle-limit)

![](/assets/images/platform/thormang3/thormang3_111.jpg)

#### Head Joint

![](/assets/images/platform/thormang3/thormang3_112.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|28|head_y(Z)|-90 to 90|
|29|head_p(Y)|-60 to 87|
 
#### Body Joint

![](/assets/images/platform/thormang3/thormang3_113.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|27|torso_y(Z)|-90 to 90|
|15|r_leg_hip_y(Z)|-90 to 40|
|16|l_leg_hip_y(Z)|-40 to 90|
 
#### Right_Arm Joint

![](/assets/images/platform/thormang3/thormang3_114.jpg)

![](/assets/images/platform/thormang3/thormang3_115.jpg)

![](/assets/images/platform/thormang3/thormang3_116.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|1|r_arm_sh_p1(Y)|-150 to 150|
|3|r_arm_sh_r(X)|-90 to 90|
|5|r_arm_sh_p2(Y)|-120 to 30|
|7|r_arm_el_y(Z)|-90 to 45|
|9|r_arm_sh_wr_r(X)|-150 to 150|
|11|r_arm_sh_wr_y(Z)|-90 to 90|
|13|r_arm_sh_wr_p(Y)|-90 to 90|
 
#### Left_Arm Joint

![](/assets/images/platform/thormang3/thormang3_117.jpg)

![](/assets/images/platform/thormang3/thormang3_118.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|2	|l_arm_sh_p1(Y)	|-150 to 150|
|4	|l_arm_sh_r(X)	|-90 to 90|
|6	|l_arm_sh_p2(Y)	|-30 to 120|
|8	|l_arm_el_y(Z)	|-45 to 90|
|10	|l_arm_sh_wr_r(X)	|-150 to 150|
|12	|l_arm_sh_wr_y(Z)	|-90 to 90|
|14|l_arm_sh_wr_p(Y)	|-90 to 90|
 
#### Right_Leg Joint

![](/assets/images/platform/thormang3/thormang3_119.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|17	|r_leg_hip_r(X)	|-30 to 45|
|19	|r_leg_hip_p(Y)	|-40 to 85|
|21	|r_leg_kn_p(Y)	|-166 to 30|
|23	|r_leg_an_p(Y)	|-85 to 40|
|25	|r_leg_an_r(X)	|-35 to 90|
 
#### Left_Leg Joint

![](/assets/images/platform/thormang3/thormang3_120.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|18	|l_leg_hip_r(X)	|-45 to 30|
|20	|l_leg_hip_p(Y)	|-85 to 40|
|22	|l_leg_kn_p(Y)	|-30 to 166|
|24	|l_leg_an_p(Y)	|-40 to 85|
|26	|l_leg_an_r(X)	|-90 to 35|


[H54-200-S500-R]: /en/dxl/pro/h54-200-s500-r/
[H54-100-S500-R]: /en/dxl/pro/h54-100-s500-r/
[H42-20-S300-R]: /en/dxl/pro/h42-20-s300-r/
[MPC Installation]: /en/platform/thormang3/getting_started/#mpc-installation
[PPC Installation]: /en/platform/thormang3/getting_started/#ppc-installation
[OPC Installation]: /en/platform/thormang3/getting_started/#opc-installation
[ROBOTIS-THORMANG-OPC]: /en/platform/thormang3/thormang3_ros_packages/#opc-packages
[ROSOTIS-THORMANG-Common]: /en/platform/thormang3/thormang3_ros_packages/#common-packages
[Example Setting for OPC]: /en/platform/thormang3/getting_started/#ros-environment-setting
[How to execute Simple Demonstration]: /en/platform/thormang3/thormang3_operation/#simple-demo
[How to execute OPC's GUI program]: /en/platform/thormang3/thormang3_operation/#gui-program
[How to run THORMANG3's program]: /en/platform/thormang3/thormang3_operation/#thormang3-operation
[How to calibrate feet ft sensors]: /en/platform/thormang3/thormang3_operation/#calibrate-ft-sensors
[thormang3_sensor]: /en/platform/thormang3/thormang3_ros_packages/#thormang3-sensors
[thormang3_manager]: /en/platform/thormang3/thormang3_ros_packages/#thormang3_manager
[thormang3_manipulation_module]: /en/platform/thormang3/thormang3_ros_packages/#thormang3_manipulation_module
[thormang3_walking_module]: /en/platform/thormang3/thormang3_ros_packages/#thormang3_walking_module
[thormang3_feet_ft_module]: /en/platform/thormang3/thormang3_ros_packages/#thormang3_feet_ft_module
[thormang3_demo]: /en/platform/thormang3/thormang3_ros_packages/#thormang3-demo
[thormang3_foot_step_generator]: /en/platform/thormang3/thormang3_ros_packages/#thormang3-foot-setp-generator
[Balance Parameter]: /en/platform/thormang3/thormang3_ros_packages/#thormang3-walking-module-msgs
[thormang3_foot_step_generator/data/balance_param.yaml]: /en/platform/thormang3/thormang3_ros_packages/#thormang3-foot-setp-generator
[footstep_planner]: /en/platform/thormang3/thormang3_ros_packages/#humanoid-navigation
