---
layout: archive
lang: en
ref: op2_ros_package
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op2/ros_package/
sidebar:
  title: ROBOTIS OP2
  nav: "op2"
---

# [ROS Tutorials](#ros-tutorials)

## OS Install    

ROBOTIS-OP2 is installed with Lubuntu 12.04 by default.
The ROS that can be installed on Lubuntu 12.04 (Precise Pangolin) is the "Hydro Medusa" version.
Currently, the main version of ROS is "Kinetic Kame" version supporting Ubuntu 16.04 (Xenial Xerus) and "Melodic Morenia" version supporting Ubuntu 18.04 (Bionic Beaver).
Therefore, it is necessary to change OS version to the latest version as much as possible.
Ubuntu 16.04 and 18.04 are difficult to install due to the problem of graphic driver.  
As a result of testing, Linux Mint 17.3 (Rosa) based on Ubuntu 14.04 (Trusty Tahr) was the most reliable installation.  
Please refer to the link below for how to install Linux Mint:
> Reference : [Linux Mint Installation Guide]  

**CAUTION** : DO NOT upgrade the kernel after installation. Upgrading the kernel can cause graphic driver problem.
{: .notice--warning}


## ROS Installation  

Please refer to the link below for how to install ROS (Indigo Igloo):  
> Reference : [Install of ROS Indigo]  


## ROS packages for ROBOTIS-OP2

Some ROS packages of ROBOTIS-OP3 can be used as it is, and some packages that need to be modified.
The packages modified for ROBOTIS-OP2 have been uploaded to a separate repository.
Download the following packages:
```
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Math
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP2
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP2-Common
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-msgs
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools
```


### ROBOTIS-OP2 repository  

1. cm_740_module : Moved from the ROBOTIS-OP3 repository.
2. op2_gui_demo : Some configuration files and launch file have been modified to run op3_gui_demo for ROBOTIS-OP2.
3. op2_kinematics_dynamics : Only some values such as the joint direction used in the op2_walking_module modified according to ROBOTIS-OP2.
4. op2_manager : Applied some modified motion module and applied the configuration file for ROBOTIS-OP2. Unlike OpenCR of ROBOTIS-OP3, CM-740 of ROBOTIS-OP2 has Dynamixel Power OFF as default setting. Therefore, adding code to handle this problem.
5. op2_walking_module : Modified part of code for ROBOTIS-OP2 (joint direction, balance gain, etc.)

### ROBOTIS-OP2-Common repository  

1. robotis_op2_description : ROBOTIS-OP2 URDF model
2. robotis_op2_gazebo : ROBOTIS-OP2 gazebo simulation

### How to run GUI program

Build source  
```
$ cd ~/catkin_ws
$ catkin_make
```

Execute op2_manager  
```
$ roslaunch op2_manager op2_manager.launch
```

When the op2_manager is launched, all the joints are torque on and move to the standing pose and move to the sitting pose.  

Connect VNC viewer or monitor to ROBOTIS-OP2 and execute GUI demo program
```
$ roslaunch op2_gui_demo op2_demo.launch
```

### How to use GUI program

The basic operating test is described below on the OP3 tutorial page:  
> Reference : http://emanual.robotis.com/docs/en/platform/op3/tutorials/#description-2

`Mode Control`, `Walking`, `Head Control`, `Motion` tab is available.  
`Demo`, `Online Walking` tab is NOT available.


[Linux Mint Installation Guide]: https://linuxmint-installation-guide.readthedocs.io/en/latest/  
[Install of ROS Indigo]: http://wiki.ros.org/indigo/Installation/Ubuntu
