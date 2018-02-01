---
layout: archive
lang: kr
ref: thormang3_getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/kr/platform/thormang3/getting_started/
sidebar:
  title: THORMANG3
  nav: "thormang3"
---

# [Introduction](#introduction)

Congratulations on purchasing THORMANG.  
THORMANG will lead you to the robot world with virtually unlimited research possibilities and opportunities.  
Read this guide thouroughly before getting with THORMANG.
 
![](/assets/images/platform/thormang3/thormang3.png)

- THORMANG3 3D files
  - `Download ZIP` [thormang3_stp.zip](http://support.robotis.com/en/baggage_files/thormang3/thormang3_stp.zip)
  - `Download ZIP` [sim_for_thormang3_stl.zip](http://support.robotis.com/en/baggage_files/thormang3/sim_for_thormang3_stl.zip)

## [What is THORMANG3?](#what-is-thormang3)

THOR (Tactical Hazardous Operations Robot) is an affordable, full size humanoid robot platform with advanced
computational power, sophisticated sensors, high payload capacity, and dynamic motion abilities to enable many exciting researches and educational activities.

## [Package Contents](#package-contents)

1. THORMANG3(fully-assembled) × 1
2. Battery packs(in robot) × 1
3. Battery charger × 1
4. Wrench set × 1
5. Screwdrivers × 2
6. Spare cables
7. Spare bolts and nuts
8. USB ×1
9. Carrying Case × 1
10. Carabiner and rope × 2
11. Lift × 1
12. Wireless (D-Link DIR-806A) × 1

![](/assets/images/platform/thormang3/thormang3_001.jpg)

## [Layout](#layout)

![](/assets/images/platform/thormang3/thormang3_002.jpg)

![](/assets/images/platform/thormang3/thormang3_003.jpg)

![](/assets/images/platform/thormang3/thormang3_004.jpg)

## [Specifications](#specifications)

![](/assets/images/platform/thormang3/thormang3_005.jpg)

### Hardware

|Feature|Description|
|:---:|:---:|
|DOF|29|
|Actuator|200W x 10 / 100W x 11 / 20W x 8|
|Computer|Intel® NUC with Intel® Core™ i5 Processor<br />(DDR4 RAM 8GB / M.2 SSD 128GB) x2|
|Wireless router|Dlink DIR-806A x 1|
|Sensor|Logitech C920 HD Camera x 1<br />Intel Realsense(Option) x 1<br />Hokuyo UTM-30LX-EW(Option) x 1<br />F/T: ATi Mini58-SI-2800-120 x 2<br />IMU: MicroSrain 3DM-GX4-25 x 1|
|Battery|22V, 22000mA x 1<br />18.5V, 11000mA x 1|
|Height|137.5cm|
|Weight|42Kg|
 
### Software

The followings are source code development environments.
- OS : Linux (Ubuntu LTS 64-bit) with ROS (Robot Operating System)
- Compiler : GNU project C and C++ Compiler
- Programming Language : C++

## [Safety Information](#safety-information)

ROBOTIS is not responsible for any damages or losses resulting from any accidents caused by user’s negligence.
- Read the instructions carefully before getting started.
- Parental guide is necessary for users under 15 years old.
- Do not use tools other than those provided in the kit.
- Keep away from the action radius of the robot when the robot is moving.
- Prevent from getting your fingers stuck in any moving parts.
- Do not keep the robot near water, heat, or fire.
- Do not use batteries or chargers other than provided in the kit.
- Gears must be replaced after long excessive use.

# [Quick Start](#quick-start)

## [Unpacking](#unpacking)

1. Open the case and remove the sponge. **Red dot** Direction of the robot’s head

    ![](/assets/images/platform/thormang3/thormang3_006.jpg)

2. Take out shock absorption sponge, Charger supply, Consumables box.

    ![](/assets/images/platform/thormang3/thormang3_007.jpg)

3. Close the case. The head should face up. **Red dot** Direction of the robot’s head

    ![](/assets/images/platform/thormang3/thormang3_008.jpg)

4. Open the box and hang the carabiners on the lift

    ![](/assets/images/platform/thormang3/thormang3_009.jpg)
    
    ![](/assets/images/platform/thormang3/thormang3_010.jpg)
 
5. Hang the i-bolt on the carabiners. Drag the upper body out of the case. **Yellow dot** Location of the i-bolt

    ![](/assets/images/platform/thormang3/thormang3_011.jpg)

6. The robot will come out naturally via the lift. Please use your hands to take out the robot’s legs.

    ![](/assets/images/platform/thormang3/thormang3_012.jpg)

7. Raise the lift and take out the battery charger box. **Yellow square** is the Battery charger box

    ![](/assets/images/platform/thormang3/thormang3_013.jpg)
    
    ![](/assets/images/platform/thormang3/thormang3_014.jpg)

## [Power On](#power-on)

1. Hang THORMANG on the lift. Raise THORMANG’s feet off the ground.

    ![](/assets/images/platform/thormang3/thormang3_015.jpg)
 
2. (Using power supply) Plug into the power supply(18V, over 10A) to provide power to pc cable.  
  Plug into the power supply(24V, over 30A) to provide power to body cable(Using Battery Pack instead of the power supply)  
  You can select either the power supply or battery pack to supply power on THORMANG.  
  If you want to use the battery pack, please follow the steps below.  
  - Ensure the battery packs are fully charged.
  - Open the battery compartment door (unscrew the thumbscrew) and insert the battery packs. Close and secure the compartment (screw the thumbscrew).
  - Connect battery connectors with two battery power connectors.

    ![](/assets/images/platform/thormang3/thormang3_016.jpg)
 
3. First, witch on three switches on the power board, and then turn on the MPC and PPC.

    ![](/assets/images/platform/thormang3/thormang3_017.jpg)
 
4. Release the E-stop button. If the E-stop button is pressed, the system is inactive.

    ![](/assets/images/platform/thormang3/thormang3_018.jpg)

## [Connect to THORMANG3](#connect-to-thormang3)

Open the network setting page of your computer and set the IP address of your computer to be in the same network with THROMANG3(Example: 10.17.3.xxx)
 
- Connection Information
  - MPC (Motion PC) IP Address : `10.17.3.30`
  - PPC (Perception PC) IP Address : `10.17.3.35`
  - MPC & PPC user name : `robotis`
  - MPC & PPC password : `111111`

### Example with SSH Client (Windows)
- Execute SSH client program (ex: PuTTY)
- Input THOR-MANG 3 MPC’s IP address : `10.17.3.30`
- Select SSH as a connection type and then open the connection.
- Input THOR-MANG 3 MPC’s user name : `robotis`

![](/assets/images/platform/thormang3/thormang3_019.jpg)

Input THOR-MANG 3 MPC’s password : `111111`
ROBOTIS recommends users to connect with THROMANG3 via SSH client.
 
### Example: SSH Client (Ubuntu)
- Open the terminal window.
- Type the following SSH command with the MPC’s user name and IP address : `$ ssh –l robotis 10.17.3.30`
- Input the MPC’s password : `111111`

![](/assets/images/platform/thormang3/thormang3_020.jpg)
 
### Example: VNC client (Windows)
- Execute VNC client program (e.g. Ultra VNC Viewer)
- Input the MPC’s IP address : `10.17.3.30`
- Input the MPC’s password : `111111`

![](/assets/images/platform/thormang3/thormang3_021.jpg)

## [Basic Operation](#basic-operation)

### Basic Manipulation Demo

1. Connect to the PPC with SSH client program (IP: 10.17.3.35)

    ```
    $ ssh 10.17.3.35 -l robotis (password: 111111)
    ```

2. The following command will execute the manipulation demo.

    ```
    $ rosrun thormang3_manipulation_demo thormang3_manipulation_demo
    ```

3. 5 commands are programmed and can be executed from  the terminal window.
  - demo 1 : go to initial pose (from base module)

    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "ini_pose"
    ```

  - demo 2 : set manipulation module
    
    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "set_mode"
    ```

  - demo 3 : go to manipulation base pose - Joint Space Control
    
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
 
### Basic Walking Simple Demo

1. Connect to the PPC with SSH client program (IP: 10.17.3.35).

    ```
    $ ssh 10.17.3.35 -l robotis(password: 111111)   
    ```

2. The following command will execute the walking demo.

    ```
    $ rosrun thormang3_walking_demo thormang3_walking_demo   
    ```

3. 5 commands are programmed and can be executed from the terminal window.
  - demo 1 : go to initial pose (from base module)

    ```
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "ini_pose"
    ```

  - demo 2 : set manipulation module

    ```
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "set_mode"
    ```

  - demo 3 : enable/disable balance algorithm – Balance ON / OFF

    ```
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String “balance_on”  
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String “balance_off”
    ```

  - demo 4 : walk forward – One step forward walking (balance should be turned on)

    ```
    $rostopic pub -1 /robotis/walking_demo/command std_msgs/String “forward”
    ```

  - demo 5 : walk backward – One step backward walking (balance should be turned on)

    ```
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String “backward”
    ```

## [Power Off](#power-off)

1. Hang THORMANG on the lift

    ![](/assets/images/platform/thormang3/thormang3_022.jpg)

2. Press the E-Stop button(Turn off the DXL power)

    ![](/assets/images/platform/thormang3/thormang3_023.jpg)
 
3. After both PCs are turned off, switch off three switches on the power board.

    ![](/assets/images/platform/thormang3/thormang3_024.jpg)

## [Battery Charge](#battery-charge)

1. Connect all battery sockets in to the battery charger sockets.
  - Channel 1 connect the yellow jack
  - Channel 2 has a white terminal  
      - Connect the DC power supply to the battery charger.
      - Insert the AC plug of the DC power supply into the power socket.

      ![](/assets/images/platform/thormang3/thormang3_025.jpg)
 
2. Power on and check the settings. See the below images. The different settings to match the settings by pressing the button.
 
    ![](/assets/images/platform/thormang3/thormang3_026.jpg)
 
3. Connect the white male charging connector to the female connector of the battery. Connect the battery’s white balance connector to the cell balance connector(6 pin connector).

    ![](/assets/images/platform/thormang3/thormang3_027.jpg)
 
4. Connect the yellow male charging connector to the female connector of the battery.  
  Connect the battery’s white balance connector to the cell balance connector(7 pin connector).

      ![](/assets/images/platform/thormang3/thormang3_028.jpg)
 
5. Select channel A. Then, press and hold the START button when the cursor is on the “Charge” option. When the screen changes, press ENTER to start charging battery if configuration is fine.

    ![](/assets/images/platform/thormang3/thormang3_029.jpg)
 
6. Select channel A. Then, press and hold the START button when the cursor is on the “Charge” option. When the screen changes, press ENTER to start charging battery if configuration is fine.

    ![](/assets/images/platform/thormang3/thormang3_030.jpg)
 
7. Melody is played (when the battery is fully charged), press the ESC button and unplug all connectors.

  `Note` Each 4 channels can be charged independently.
  {: .notice}

## [Repacking](#repacking)

1. Put the battery charger box into the case.

    ![](/assets/images/platform/thormang3/thormang3_031.jpg)

2. Pack the robot by placing its feet first. Please be careful with the handling to prevent damage to the robot’s arm.

    ![](/assets/images/platform/thormang3/thormang3_032.jpg)

3. Bend the robot’s head forward. If the lift doesn’t go down, separate the lift and carabiners

    ![](/assets/images/platform/thormang3/thormang3_033.jpg)

4. Refer to the pictures: Put the sponge for arm and head protection.

    ![](/assets/images/platform/thormang3/thormang3_034.jpg)

5. Refer to the pictures for robot arm arrangement. Put the sponge for upper body and knee protection.

    ![](/assets/images/platform/thormang3/thormang3_035.jpg)

6. Cover the case with the sponge and close the lid.

    ![](/assets/images/platform/thormang3/thormang3_036.jpg)

# [Getting Started](#getting-started)

## [OS Install](#os-install)

Ubuntu 16.04 LTS is installed on PCs in the THORMANG3 and the PC for Remote Control Version.

`Note` [Install Ubuntu Desktop]
{: .notice}


## [Network Setting](#network-setting)

This section explains how to configure the network for MPC(Motion PC) and PPC(Perception PC) of the robot, as well as the Wi-Fi switch and the OPC(Operating PC).

![](/assets/images/platform/thormang3/THORMANG3_network_map.png)

### [Access Point Setting](#access-point-setting)

#### Access Point(AP) Information

- Model : D-Link DIR-806A
- Account
  - user : admin
  - password : admin

    `Reference` [DIR-806A Product Manual]
    {: .notice}

#### AP Server

- Router Mode(Orange light)
- IP Address : 10.17.3.1
- WiFi Name (2.4G) : THORMANG-Sxx (xx : number)
- WiFi Name (5G) : THORMANG-Sxx-5G (xx : number)
- WiFi Password : 11111111

#### AP in THORMANG3
- Repeater Mode(Green light)


### [PC Setting](#pc-setting)

#### MPC (Motion PC)
- IP Address : 10.17.3.30
- Netmask : 255.255.255.0
- Gateway : 10.17.3.1

#### PPC (Perception PC)
- IP Address : 10.17.3.35
- Netmask : 255.255.255.0
- Gateway : 10.17.3.1

#### OPC (Operating PC)
- IP Address : 10.17.3.100
- Netmask : 255.255.255.0
- Gateway : 10.17.3.1


## [ROS Install](#ros-install)

ROS(Robot Operating System) is required in order to control THORMANG3. Currently THORMANG3 is developed and tested with Kinetic Kame version of ROS.

`Note` [Install ROS]
{: .notice}

## [ROS Environment Setting](#ros-environment-setting)

`Note` [Environment Setting Reference]
{: .notice}

`Note` [ROS Network Setup Reference]
{: .notice}

### [Network Setting Example](#network-setting-example)

Above configuration has to be repeatedly done whenever a new terminal window is created. The following method will load configuration file when creating a terminal window. ROS Network setup is also performed when the configuration file is loaded.

#### System configuration

- PPC(Perception PC) : core PC
  - IP : 10.17.3.35
- MPC(Motion PC)
  - IP : 10.17.3.30
- OPC(Operation PC)
  - IP : 10.17.3.100

#### Example setting for PPC

1. Open the bash file with an editor to apply configuration.
    ```
    $ gedit ~/.bashrc
    ```

2. Append below contents at the end of the .bashrc file.
    ```
    # Set ROS Kinetic
    source /opt/ros/kinetic/setup.bash
    source ~/catkin_ws/devel/setup.bash

    ##### Set ROS Network ####
    # PPC CORE(10.17.3.35)
    export ROS_MASTER_URI=http://10.17.3.35:11311

    # local ROS IP
    export ROS_IP=10.17.3.35
    ```

3. Use below command to apply modified configuration or open a new terminal window.
    ```
    $ source ~/.bashrc
    ```

#### Example setting for MPC

1. Open the bash file with an editor to apply configuration.
    ```
    $ gedit ~/.bashrc
    ```

2. Append below contents at the end of the .bashrc file.
    ```
    # Set ROS Kinetic
    source /opt/ros/kinetic/setup.bash
    source ~/catkin_ws/devel/setup.bash

    ##### Set ROS Network ####
    # PPC CORE(10.17.3.35)
    export ROS_MASTER_URI=http://10.17.3.35:11311

    # local ROS IP
    export ROS_IP=10.17.3.30
    ```

3. Use below command to apply modified configuration or open a new terminal window.
    ```
    $ source ~/.bashrc
    ```

#### Example setting for OPC

1. Open the bash file with an editor to apply configuration.
    ```
    $ gedit ~/.bashrc
    ```

2. Append below contents at the end of the .bashrc file.
    ```
    # Set ROS Kinetic
    source /opt/ros/kinetic/setup.bash
    source ~/catkin_ws/devel/setup.bash

    ##### Set ROS Network ####
    # PPC CORE(10.17.3.35)
    export ROS_MASTER_URI=http://10.17.3.35:11311

    # local ROS IP
    export ROS_IP=10.17.3.100
    ```

3. Use below command to apply modified configuration or open a new terminal window.
    ```
    $ source ~/.bashrc
    ```

### [Time Synchronization](#time-synchronization)

In order to run the ROS on multiple PCs, each PC clock has to be synchronized. The following script file comes in handy for this synchronization procedure. PPC time becomes the reference for synchronization, and perform below procedures only for MPC and OPC.

1. Create the script file with an editor.
    ```
    $ gedit ~/timesync
    ```

2. Copy and paste below contents to the script file
    ```
    #! /bin/sh
    sudo date --set='-2 secs'
    sudo ntpdate 10.17.3.35
    sudo hwclock -w
    PPC(10.17.3.35)
    ```

3. Modify the script file permission(Add execute permission)
    ```
    $ sudo chmod +x timesync
    ```

4. Run the script file to sync time for PPC, MPC and OPC.
    ```
    $ ~/timesync
    ```

  - If NTP socket is running, Stop the ntp service and sync time.
      ```
      $ sudo service ntp stop
      $ ~/timesync
      ```

## [ROBOTIS ROS Package Install](#robotis-ros-package-install)

This section introduces how to install the ROBOTIS ROS Package for THORMANG3.

- ROBOTIS-Framework : DXL SDK based Framework for ROBOTIS platforms
- ROBOTIS-Framework-msgs : ROS Messages used in the ROBOTIS-Framework
- ROBOTIS-THORMANG-MPC : ROS Packages for the Motion PC of THORMANG3
- ROBOTIS-THORMANG-PPC : ROS Packages for the Perception PC of THORMANG3
- ROBOTIS-THORMANG-OPC : ROS Packages for the Operating PC of THORMANG3
- ROBOTIS-THORMANG-Common : Common ROS Packages for THORMANG3
- ROBOTIS-THORMANG-msgs : ROS Messages used in the ROBOTIS THORMANG3 packages
- ROBOTIS-THORMANG-Too

### [MPC Installation](#mpc-installation)

Install the ROBOTIS ROS Package from the MPC. The ROS Package is installed by default.

1. Download Packages from GitHub to the source folder in the catkin workspace.
    ```
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Math.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-Common.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-msgs.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-Tools.git
    ```

2. After installing all dependent packages, go to the workspace and build. Use j1 option when building for the first time.
    ```
    $ cd ~/catkin_ws
    $ catkin_make -j1
    ```

3. Find *ft_calibration_data.yaml* and *ft_data.yaml* from provided USB and copy them to `thormang3_manager/config/`.

### [PPC Installation](#ppc-installation)

Install the ROBOTIS ROS Package from the PPC. The ROS Package is installed by default.

1. Download Packages from GitHub to the source folder in the catkin workspace.
    ```
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-msgs.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-PPC.git
    ```

2. After installing all dependent packages, go to the workspace and build. Use j1 option when building for the first time.
    ```
    $ cd ~/catkin_ws
    $ catkin_make -j1
    ```

### [OPC Installation](#opc-installation)

Install the ROBOTIS ROS Package from the OPC.

1. Download Packages from GitHub to the source folder in the catkin workspace.
    ```
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-OPC.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-msgs.git
    $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-Common.git
    ```

2. After installing all dependent packages, go to the workspace and build. Use j1 option when building for the first time.

    `Note` Dependencies : qt-ros, map_server, nav_msgs, humanoid_nav_msgs, sbpl, octomap-ros
    {: .notice}

    `Note` sbpl needs to be installed manually. Please follow the [sbpl install instruction].
    {: .notice}

    ```
    $ sudo apt install ros-kinetic-map-server
    $ sudo apt install ros-kinetic-humanoid-nav-msgs
    $ sudo apt install ros-kinetic-octomap ros-kinetic-octomap-msgs ros-kinetic-octomap-ros ros-kinetic-octomap-server
    $ sudo apt install ros-kinetic-qt-ros
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/AravindaDP/humanoid_navigation.git
    $ cd ~/catkin_ws
    $ catkin_make -j1
    ```

3. Troubling Shot for `libGL` in 64bit Ubuntu

    `Reference` : [Link]
    {: .notice}


### [Update](#update)

When the source is modified, update & build is necessary.

1. Go to the folder where source is copied and run the pull command.(ex : ROBOTIS-THORMANG-OPC)
    ```
    $ cd ~/catkin_ws/src/ROBOTIS-THORMANG-OPC
    $ git pull
    ```

2. Build
    ```
    $ cd ~/catkin_ws
    $ catkin_make
    ```

## [Additional ROS Package Install](#additional-ros-package-install)

The followings are required ROS Packages for THORMANG3 when installing desktop-full.

### [ROS Packages for MPC](#ros-packages-for-mpc)

Install below ROS Packages from the MPC. The Package is installed by default.

#### urg_node : ROS Package for Lidar
```
$ cd ~/catkin_ws/src
$ git clone https://github.com/ros-drivers/urg_node
$ git clone https://github.com/ros-drivers/urg_c
$ git clone https://github.com/ros-perception/laser_proc
```

`Reference` : http://wiki.ros.org/urg_node
{: .notice}

### [ROS Packages for PPC](#ros-packages-for-ppc)
Install the below ROS Package from the PPC. The Package is installed by default.

#### uvc_camera : ROS Package for USB camera
```
$ sudo apt install libv4l-dev
$ cd ~/catkin_ws/src
$ git clone https://github.com/ktossell/camera_umd
```

`Reference` : http://wiki.ros.org/uvc_camera
{: .notice}

#### realsense
`Reference` : http://wiki.ros.org/RealSense
{: .notice}


[Install Ubuntu Desktop]: http://www.ubuntu.com/download/desktop/install-ubuntu-desktop
[DIR-806A Product Manual]: ftp://ftp.dlink.ru/pub/Router/DIR-806A/Data_sh/
[Install ROS]: http://wiki.ros.org/kinetic/Installation/Ubuntu
[Environment Setting Reference]: http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment
[ROS Network Setup Reference]: http://wiki.ros.org/ROS/NetworkSetup
[sbpl install instruction]: https://github.com/sbpl/sbpl
[Link]: http://techtidings.blogspot.kr/2012/01/problem-with-libglso-on-64-bit-ubuntu.html
