---
layout: archive
lang: en
ref: common_op3_robot_operating_system
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/common/op3_robot_operating_system/
sidebar:
  title: Common
  nav: "common"
---

# [OP3 Robot Operating System](#op3-robot-operating-system)

## Overview
This chapter explains installation and configuration of Robot Operating System(ROS) for ROBOTIS-OP3. Also, common ROS Packages and developed ROS Packages will be introduced.  



## [What is ROS?]

![](/assets/images/platform/op3/ros_image.png)


## How to install ROS
 - version : Kinetic  
 - Installation(Desktop-Full)  
   > Reference : [ROS Installation - WIKI]  
     - For Linux Mint user  
     - If you want to install ROS in Linux mint, you should type 
      ```
      sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list'
      ```
      instead of
      ```
      sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
      ```
      in the step of [`Setup your sources.list`]


## SetUp
### ROS Environment Setting
> Reference : [http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment]

### ROS Network Setup
> Reference : [ROS Network Setup]  

### Example Setting
  1. Open the bash file with an editor to apply configuration.  
     ```
     $ xed ~/.bashrc
     ```

  2. Append below contents at the end of the `.bashrc` file.  
     ```bash    
      Set ROS Kinetic
     source /opt/ros/kinetic/setup.bash
     source ~/catkin_ws/devel/setup.bash

     #### Set ROS Network ####
      ROS Master(localhost)
     export ROS_MASTER_URI=http://10.41.0.1:11311

      local ROS IP
     export ROS_IP=10.41.0.1
     ```

     > Reference : In order to operate ROS in a network with multiple PCs, addresses of the ROS_MASTER_URI and the ROS_IP have to be replaced with the `core` PC's IP address and the remote PC's IP address respectively.  

     > Reference : If Hotspot is configured, use "10.42.0.1". Otherwise, use "localhost" instead of IP address.
       - ROS_MASTER_URI=http://localhost:11311
       - ROS_IP=localhost

  3. Use below command to apply modified configuration or open a new terminal window to reload configuration.  
     ```
     $ source ~/.bashrc
     ```

## ROBOTIS ROS Packages for ROBOTIS-OP3  
 1. [DynamixelSDK] : SDK for Dynamixel  
 2. [ROBOTIS-Framerowk] : The packages to use ROS (Robot Operating System) for robots assembled with ROBOTIS products.  
 3. [ROBOTIS-Framerowk-msgs] : Messages used in the ROBOTIS-Framework.  
 4. [ROBOTIS-Math] : Basic calculation related to transformation and trajectory functions.  
 5. [ROBOTIS-OP3] : ROS Packages running in the ROBOTIS-OP3.
 6. [ROBOTIS-OP3-Common]
 7. [ROBOTIS-OP3-Demo]  
 8. [ROBOTIS-OP3-msgs]  
 9. [ROBOTIS-OP3-Tools]  
 10. ROBOTIS-Utility


## Additional ROS Package
 1. face_detection  
    - This ROS Package detects faces.  
    - Link : [https://github.com/ROBOTIS-GIT/face_detection]  
    - Message  
       - Name : `FaceCoord`  
       - Type : [std_msgs/Int32MultiArray]{: .popup}
       - Data : [fps, faces num, image width, image height, face id, tracking count, x, y, face_width, face_height, ...]  

 2. robot_upstart  
    - This ROS Package is used to automatically execute ROS on startup.  
    - Link : [http://wiki.ros.org/robot_upstart]
    - [How to setup auto start]  

 3. usb_cam  
    - USB Camera  
    - Link : [http://wiki.ros.org/usb_cam]  
    - Additional Installation : The following package must be manually installed in order to modify camera parameters.  
      ```
      $ sudo apt install v4l-utils
      ```  
[std_msgs/Int32MultiArray]: /docs/en/popup/std_msgs_Int32MultiArray_msg/


[https://github.com/ROBOTIS-GIT/face_detection]: https://github.com/ROBOTIS-GIT/face_detection
[What is ROS?]: http://www.ros.org/about-ros/
[ROS Installation - WIKI]: http://wiki.ros.org/kinetic/Installation/Ubuntu
[`Setup your sources.list`]: http://wiki.ros.org/kinetic/Installation/Ubuntu#Installation.2BAC8-Ubuntu.2BAC8-Sources.Setup_your_sources.list
[http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment]: http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment
[ROS Network Setup]: http://wiki.ros.org/ROS/NetworkSetup
[DynamixelSDK]: /docs/en/platform/software/robotis_framework_packages/#dynamixelsdk
[ROBOTIS-Framerowk]: /docs/en/platform/software/robotis_framework_packages/#robotis-framework
[ROBOTIS-Framerowk-msgs]: /docs/en/platform/software/robotis_framework_packages/#robotis-framework-msgs
[ROBOTIS-Math]: /docs/en/platform/common/robotis_math/#robotis-math
[ROBOTIS-OP3]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3
[ROBOTIS-OP3-Demo]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-demo
[ROBOTIS-OP3-msgs]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-msgs
[ROBOTIS-OP3-Tools]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-tools
[ROBOTIS-OP3-Common]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-common
[http://wiki.ros.org/robot_upstart]: http://wiki.ros.org/robot_upstart
[How to setup auto start]: OP3-How-to-kill-the-demo-program#31-start-demo-program-on-start
[http://wiki.ros.org/usb_cam]: http://wiki.ros.org/usb_cam
