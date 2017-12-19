---
layout: archive
lang: en
ref: dynamixelworkbench
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_workbench/dynamixel_workbench/
sidebar:
  title: Dynamixel-Workbench
  nav: "dynamixelworkbench"
---

# [Introduction](#introduction)

![](/assets/images/sw/dynamixel/dynamixel_workbench/dynamixel_workbench_intro.jpg)

The **Dynamixel Workbench** metapackage contains four packages: **Single Manager**, **Controllers**, **Operators**, and **Toolbox**. The ***Single Manager*** package provides a program that can manage the entire Dynamixel series, including Dynamixel, Dynamixel X, and Dynamixel PRO, using the ***Toolbox*** library developed on the basis of [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/sdk/). These packages not only show the status of Dynamixel, but also allow you to change Control Table address values via command line or GUI interface. The ***Controllers*** package introduces how to employ the Dynamixel on different operating mode with ***Toolbox*** library.  In addition, the ***Operators*** demonstrates some straightforward examples by operating ***Controllers***.

[ROS WIKI](http://wiki.ros.org/dynamixel_workbench)

# [Installation](#installation)

  **Main package**

  ```
  $ sudo apt-get install ros-kinetic-dynamixel-workbench
  $ sudo apt-get install ros-kinetic-dynamixel-workbench-msgs
  ```
  or

  ```
  $ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
  $ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git
  ```

  **Dependent package**

  ```
  $ sudo apt-get install ros-kinetic-dynamixel-sdk
  $ sudo apt-get install ros-kinetic-qt-build
  ```

# [Supported Dynamixels](#supported-dynamixel)

| Dynamixel Series |                |                |                |               |               |
| ---------------- | -------------- | -------------- | -------------- | ------------- | ------------- |
| **AX**           | AX-12W         | AX-12/12+/12A  | AX-18F/18A     |
| **RX**           | RX-10          | RX-24F         | RX-28          | RX-64         |
| **EX**           | EX-106+        |
| **MX**           | MX-12W         | MX-28T/R/AT/AR | MX-64T/R/AT/AR | MX-106T/R     |
| **XL**           | XL430-W250     |
| **XM**           | XM430-210-T/R  | XM430-W350-T/R |
| **XH**           | XH430-W210-T/R | XH430-W350-T/R | XH430-V210     | XH430-V350    |
| **PRO-L**        | L42-10-S300-R  | L54-30-S500-R  | L54-30-S400-R  | L54-50-S500-R | L54-50-S290-R |
| **PRO-M**        | M42-10-S260-R  | M54-40-S250-R  | M54-60-S250-R  |
| **PRO-H**        | H42-20-S300-R  | H54-100-S500-R | H54-200-S500-R |

# [Package Description](#package-description)

## Single Manager Packages
 * dynamixel_workbench_single_manager - Check Dynamixel status and access Dynamixel's Control Table addresses via **command line**.
 
 1. Nodes

    1. dynamixel_monitor - To show states of a Dynamixel by topic messages
        1. Messages
            * /dynamixel/(model_name) - Provides states of connected Dynamixel

        1. Services
            * /dynamixel/info - Provides information about connected Dynamixel
            * /dynamixel/command - Receive command to control Dynamixel
              
    1. dynamixel_controller - To change the Dynamixel's address value through command line
          1. Messages
            
          1. Services
              * /dynamixel/info - Get information about connected Dynamixel
              * /dynamixel/command - Send command to control Dynamixel
          
 * dynamixel_workbench_single_manager_gui - Check Dynamixel status and access Dynamixel's Control Table addresses via **GUI**.

  ![](/assets/images/sw/dynamixel/dynamixel_workbench/single_manager_gui.jpg)

  * dynamixel_workbench_single_manager_gui is a manager to show states of a Dynamixels and change their address value through GUI

   1. Nodes
   
      1. Messages
          * /dynamixel/(model_name) - Take states of connected Dynamixel

      1. Services
          * /dynamixel/info - Get information about connected Dynamixel
          * /dynamixel/command - Send command to control Dynamixel
          

## Controllers Packages 
 * dynamixel_workbench_controllers - Contains 3 different controllers(Position, Velocity, Torque) and Multi port example that demonstrate how to control the Dynamixels.

## Operators Packages 
 * dynamixel_workbench_operators - Contains **Joint Operator** and **Wheel Operator**. Operators make commands for ***Controllers***.

## Toolbox Packages 
 * dynamixel_workbench_toolbox - Library packages for getting a Dynamixel instances and providing simple function to control Dynamixels.

# [Tutorials](#tutorials)


