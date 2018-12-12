---
layout: archive
lang: en
ref: dynamixelworkbench
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_workbench/
sidebar:
  title: DYNAMIXEL Workbench
  nav: "dynamixel_workbench"
---

# [Introduction](#introduction)

![](/assets/images/sw/dynamixel/dynamixel_workbench/DYNAMIXEL_WORKBENCH_LOGO.png)

The purpose of Dynamixel-Workbench is **to use more simple and easy to use any Dynamixels**. This library is based on [DynamixelSDK] and supports ROS, Linux, macOS and Arduino. However, this library is not magic stick to operate Dynamixels with any setup. It has some restriction compared with DynamixelSDK but we are continue to upgrade this library for almost everyone loves Dynamixels.

If have any questions or issues, please get a ticket in [github issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

# [Supported Dynamixels](#supported-dynamixels)

| Dynamixel Series |               |                   |                   |                     |               |
| ---------------- | ------------- | ----------------- | ----------------- | ------------------- | ------------- |
| **AX**           | AX-12W        | AX-12+/12A        | AX-18F/18A        |
| **RX**           | RX-10         | RX-24F            | RX-28             | RX-64               |
| **EX**           | EX-106+       |
| **MX**           | MX-12W        | MX-28, MX-28(2.0) | MX-64, MX-64(2.0) | MX-106, MX-106(2.0) |
| **XL**           | XL320         | XL430-W250        |
| **XM**           | XM430-210     | XM430-W350        | XM540-W210        | XM540-W270          |
| **XH**           | XH430-W210    | XH430-W350        | XH430-V210        | XH430-V350          |
| **PRO-L**        | L42-10-S300-R | L54-30-S500-R     | L54-30-S400-R     | L54-50-S500-R       | L54-50-S290-R |
| **PRO-M**        | M42-10-S260-R | M54-40-S250-R     | M54-60-S250-R     |
| **PRO-H**        | H42-20-S300-R | H54-100-S500-R    | H54-200-S500-R    |
| **PRO+**         | H42P-020-S300-R | H54P-100-S500-R    | H54P-100-S500-R    |



The **Dynamixel Workbench** metapackage contains four packages: **Single Manager**, **Controllers**, **Operators**, and **Toolbox**. The ***Single Manager*** package provides a program that can manage the entire Dynamixel series, including Dynamixel, Dynamixel X, and Dynamixel PRO, using the ***Toolbox*** library developed on the basis of [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). These packages not only show the status of Dynamixel, but also allow you to change Control Table address values via command line or GUI interface. The ***Controllers*** package introduces how to employ the Dynamixel on different operating mode with Dynamixel Workbench library(***Toolbox***).  In addition, the ***Operators*** demonstrates some straightforward examples by operating ***Controllers***.

[ROS WIKI](http://wiki.ros.org/dynamixel_workbench)

# [Downloads](#downloads)

## [ROS](#ros)

### Install ROS on PC

![](/assets/images/platform/turtlebot3/logo_ros.png)

The following script will allow you to simplify the ROS installation procedure. Run the following command in a terminal window. The terminal application can be found with the Ubuntu search icon on the top left corner of the screen, or you can use shortcut key for terminal is `Ctrl`+`Alt`+`T`. After install ROS, please reboot PC.

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_kinetic.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}

If you prefer manual installation, please following the link below.

- [Manual installation of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)

### Downloads ROS Packages

**Main packages**

``` bash
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git
```

**Dependent packages**

``` bash
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ sudo apt-get install ros-kinetic-moveit-core ros-kinetic-moveit-ros-planning ros-kinetic-moveit-ros-planning-interface
```

## [OpenCR and OpenCM](#opencr-and-opencm)

### Downloads Arduino IDE

- Downloads [Arduino IDE](http://emanual.robotis.com/docs/en/software/arduino_ide/) for uploding firmware to OpenCR and OpenCM

#### OpenCR Arduino IDE
![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_arduino_setup.png)

#### OpenCM Arduino IDE
![](/assets/images/sw/dynamixel/dynamixel_workbench/opencm_arduino_setup.png)

## [Linux and macOS](#linux-and-macos)

**NOTE**: We don't have a plan to release for `Windows OS` . But we are happy to merge someone contribute it.
{: .notice--info}

### Downloads Library

``` bash
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
```
### Setup DynamixelSDK library 

- [LINUX](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/library_setup/cpp_linux/#cpp-linux)  
- [macOS](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/library_setup/cpp_macos/#cpp-macos)  

### Setup Dynamixel-Workbench library

``` bash
$ cd ~/dynamixel-workbench/dynamixel_workbench_toolbox/examples
$ mkdir -p build && cd build
$ cmake ..
$ make
```

# [Device Setup](#device-setup)

**WARNING**: You should **over and over** double check a device setup before you use library. Please once check again **power input** and **usb port**
{: .notice--warning}

## [U2D2](#u2d2)

### How to Setup

[How to Setup](/docs/en/parts/interface/u2d2/)

### Copy rules file

```
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/dynamixel-workbench/master/99-dynamixel-workbench-cdc.rules
$ sudo cp ./99-dynamixel-workbench-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

### Check usb port

```
$ ls /dev/tty*
```

Then you can find `/dev/ttyUSB0` (The number of port may be different depending on setup)


{% capture notice_01 %}
**NOTE**: 
- Please run roscore before rosrun, because rosrun can't operate without roscore. The rosrun and roscore should be run in each other terminal.
- This run file make usb latency timer **1 ms**. If you want to check this setting, Run the following command in a terminal window.  
`cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer`
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [OpenCR](#opencr)

### Connect power(12v) and TTL or RS485

![](/assets/images/parts/controller/opencr10/opencr_pinout.png)

**TIP**: 
If you want to use OpenCR as U2D2, please upload `usb_to_dxl` firmware (`File` -> `Examples` -> `OpenCR` -> `10.Etc` -> `usb_to_dxl`)
Then you can use `/dev/ttyACM0` port (The number of port may be different depending on setup).
{: .notice--success}

## [OpenCM](#opencm)

### Connect power(12v) and TTL(4 pin)or RS485(8 pin)  

**TIP**: Please follow a [link](/docs/en/parts/controller/opencm485exp/) for getting more information about pin
{: .notice--success}

![](/assets/images/parts/controller/opencm904/opencm485exp_01.jpg)

# [Tutorials](#tutorials)

- [ROS](/docs/en/software/dynamixel/dynamixel_workbench/#ros-tutorials)
    - [Find Dynamixels](/docs/en/software/dynamixel/dynamixel_workbench/#find-dynamixels)
    - [Single Manager](/docs/en/software/dynamixel/dynamixel_workbench/#single-manager)
    - [Single Manager GUI](/docs/en/software/dynamixel/dynamixel_workbench/#single-manager-gui)
    - [Controllers](/docs/en/software/dynamixel/dynamixel_workbench/#controllers)
    - [Operators](/docs/en/software/dynamixel/dynamixel_workbench/#operators)
    - [MoveIt! Bridge](/docs/en/software/dynamixel/dynamixel_workbench/#moveit-bridge)

- [OpenCR and OpenCM](/docs/en/software/dynamixel/dynamixel_workbench/#opencr-and-opencm-tutorials)
    - [o_Find_Dynamixel](/docs/en/software/dynamixel/dynamixel_workbench/#o_find_dynamixel)
    - [p_Monitor](/docs/en/software/dynamixel/dynamixel_workbench/#p_monitor)

- [Linux and macOS](/docs/en/software/dynamixel/dynamixel_workbench/#linux-and-macos)
    - [Examples](/docs/en/software/dynamixel/dynamixel_workbench/#examples)
    - [position](/docs/en/software/dynamixel/dynamixel_workbench/#position)
    - [bulk_read_write](/docs/en/software/dynamixel/dynamixel_workbench/#bulk_read_write)

## [ROS Tutorials](#ros-tutorials)

### Find Dynamixels

This nodes scan all ID with each Baudrate(9600, 57600, 115200, 1000000, 2000000, 3000000, 4000000) and shows how many dynamixels is connected

Run find_dynamixel

```
$ rosrun dynamixel_workbench_controllers find_dynamixel /dev/ttyUSB0
```

Then you can show below texts

```
[ INFO] [1544589715.841211668]: Succeed to init(9600)
[ INFO] [1544589715.841236741]: Wait for scanning...
[ INFO] [1544589737.539083688]: Find 0 Dynamixels
[ INFO] [1544589737.539526809]: Succeed to init(57600)
[ INFO] [1544589737.539570059]: Wait for scanning...
[ INFO] [1544589755.441019922]: Find 2 Dynamixels
[ INFO] [1544589755.441086482]: id : 1, model name : XM430-W350
[ INFO] [1544589755.441109032]: id : 2, model name : XM430-W350
[ INFO] [1544589755.441504892]: Succeed to init(115200)
[ INFO] [1544589755.441548969]: Wait for scanning...
[ INFO] [1544589773.031677244]: Find 0 Dynamixels
[ INFO] [1544589773.032153380]: Succeed to init(1000000)
[ INFO] [1544589773.032178580]: Wait for scanning...
[ INFO] [1544589790.291943770]: Find 0 Dynamixels
[ INFO] [1544589790.292404604]: Succeed to init(2000000)
[ INFO] [1544589790.292418207]: Wait for scanning...
[ INFO] [1544589807.530702991]: Find 0 Dynamixels
[ INFO] [1544589807.531286252]: Succeed to init(3000000)
[ INFO] [1544589807.531331656]: Wait for scanning...
[ INFO] [1544589824.762803705]: Find 0 Dynamixels
[ INFO] [1544589824.763461821]: Succeed to init(4000000)
[ INFO] [1544589824.763506935]: Wait for scanning...
[ INFO] [1544589841.990120553]: Find 0 Dynamixels
```

**TIP**: If you can't find any Dynamixels, please check usb port, power. Even if it can't find anything, please check firmware to use ROBOTIS software ([R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/) or [R+ Manager 1.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/))
{: .notice--success}

### Single Manager

**WARNING**: This package is only for `SINGLE` Dynamixel. Please connect `SINGLE` Dynamixel on your device.
If you connect multiple Dynamixels, manager would catch the ID of the **fastest ID** among connected Dynamixels.
{: .notice--warning}

This package is to check Dynamixel status and access Dynamixel's control table

Let the shows the `single_manager.launch` file

```
<launch>
  <arg name="use_ping"         default="false"/>
  <arg name="id"               default="1"/>

  <arg name="device_name"      default="/dev/ttyUSB0"/>
  <arg name="baud_rate"        default="57600"/>

  <arg name="scan_range"       default="10"/>

  <param name="ping"             value="$(arg use_ping)"  type="bool"/>
  <param name="ping_id"          value="$(arg id)"/>

  <param name="device_name"      value="$(arg device_name)"/>
  <param name="baud_rate"        value="$(arg baud_rate)"/>

  <param name="scan_range"        value="$(arg scan_range)"/>

  <node name="single_dynamixel_monitor" pkg="dynamixel_workbench_single_manager"
        type="single_dynamixel_monitor" required="true" output="screen"/>

  <node name="single_dynamixel_controller" pkg="dynamixel_workbench_single_manager"
        type="single_dynamixel_controller" required="true" output="screen"/>
</launch>
```

Launch single_manager

```
$ cd ~/catkin_ws && catkin_make
$ roslaunch dynamixel_workbench_single_manager single_manager.launch
```

If manager find a Dynamixel, you can watch a below text

```
Succeed to init(57600)
[ID] 1, [Model Name] XM430-W350, [BAUD RATE] 57600 [VERSION] 2.0
dynamixel_workbench_single_manager : Init Success!
```

If you press the **ENTER KEY**, you can watch below

```
----------------------------------------------------------------------
Single Manager supports GUI (dynamixel_workbench_single_manager_gui)  
----------------------------------------------------------------------
Command list :
[help|h|?]...............: help
[info]...................: information of a Dynamixel
[table]..................: check a control table of a Dynamixel
[torque_on]..............: torque on Dynamixel
[torque_off].............: torque off Dynamixel
[joint] [data]...........: set data to goal position address
[wheel] [data]...........: set data to goal position address
[id] [new id]............: change id
[baud] [new baud]........: change baud rate
[version] [new version]..: change protocol version
[reboot].................: reboot a Dynamixel(only protocol version 2.0)
[reset]..................: command for all data back to factory settings values
[address name] [data]....: change address value of a Dynamixel
[exit]...................: shutdown
----------------------------------------------------------------------
Press Enter Key To Command A Dynamixel
[CMD]
``` 

**WARNING**: BEFORE YOU COMMAND, YOU NEED TO PRESS ENTER KEY
{: .notice--warning}

**NOTE**: If user wants to specific information about control table of a Dynamixel, please follow the link [E-MANUAL](http://emanual.robotis.com/#control-table). 
{: .notice--info}

**Parameters List** :
- `use_ping`    
If you set this True, manager would be ping `id` parameters  

- `id`  
This parameters is valid when `use_ping` is True  

- `device_name`  
Device name you connected

- `baud_rate`  
Baud rate of Dynamixel  

- `scan_range`  
This parameters is valid when `use_ping` it False

**Topic List** :
- `/dynamixel/(model_name)`  
Provides states of connected Dynamixel

**Service List** :  
- `/dynamixel/info`([dynamixel_workbench_msgs/DynamixelInfo]{: .popup})  
Provides information about connected Dynamixel  

- `/dynamixel/command`([dynamixel_workbench_msgs/DynamixelCommand]{: .popup})  
Receives command to control Dynamixel  

### Single Manager GUI

**WARNING**: Before you run this package, please launch [single_manager](/docs/en/software/dynamixel/dynamixel_workbench/#single-manager) first
{: .notice--warning}

This package is to check Dynamixel status and access Dynamixel's Control Table addresses via **GUI**.

Run single_manager_gui

```
$ rosrun dynamixel_workbench_single_manager_gui dynamixel_workbench_single_manager_gui
```

Then the GUI is openned

![](/assets/images/sw/dynamixel/dynamixel_workbench/single_manager_gui.jpg)

Let's operate the Dynamixel using GUI. We easily change a ID, Operating Mode and Baudrate by seperated widget and access all address using combobox widget.   

If you want to change motor position, first push a **Torque Enable** button.  

![](/assets/images/sw/dynamixel/dynamixel_workbench/gui_torque_enable.jpg)

Second, select **Goal_Position** in combobox and turn dial, type value on line edit or push **Position ZERO** button.

![](/assets/images/sw/dynamixel/dynamixel_workbench/gui_goal_position.jpg)

**Topic List** :
- `/dynamixel/(model_name)`  
Provides states of connected Dynamixel

**Service List** :  
- `/dynamixel/info`([dynamixel_workbench_msgs/DynamixelInfo]{: .popup})  
Provides information about connected Dynamixel  

- `/dynamixel/command`([dynamixel_workbench_msgs/DynamixelCommand]{: .popup})  
Receives command to control Dynamixel

### Controllers

This package is to control Dynamixels by ROS API. You can load your Dynamixels to simply make yaml file.  

The configuration of the yaml file is as follows. [name] is become joint name of /joint_states topic and point which Dynamixel is.
When controller is initialization, load Dynamixel information to use the [id] and write [value] right side of [Control_Table_Item].

```
[name]:
  ID: [id]
  [Control_Table_Item]: [value]
  [Control_Table_Item]: [value]
  .
  .
  .
[name]:
  ID: [id]
  [Control_Table_Item]: [value]
  [Control_Table_Item]: [value]
  [Control_Table_Item]: [value]
  .
  .
  .
```

Let the shows the `joint_2_0.yaml` file. This file indicates load 2 Dynamixels. First Dynamixel has name 'pan' and id is '1', Second Dynamixel has name 'tilt' and id is '2'. Both Dynamixels will be set [Return_Delay_time](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/#return-delay-time9) is zero and [Operating_Mode](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/#operating-mode11) is Position Control Mode

```
pan:
  ID: 1
  Return_Delay_Time: 0
  Operating_Mode: 3
  Profile_Acceleration: 0
  Profile_Velocity: 0
tilt:
  ID: 2
  Return_Delay_Time: 0
  Operating_Mode: 3
  Profile_Acceleration: 0
  Profile_Velocity: 0
```

**WARNING**: 
You can find control table of Dynamixel on [emanual](http://emanual.robotis.com/#control-table)  
Control table item has to be set Camel_Case and not included whitespace  
You are supposed to set at least Dynamixel ID
{: .notice--warning}

Let the shows the `dynamixel_controller.launch` file

```
<launch>
  <arg name="usb_port"                default="/dev/ttyUSB0"/>
  <arg name="dxl_baud_rate"           default="57600"/>
  <arg name="namespace"               default="dynamixel_workbench"/>

  <param name="dynamixel_info"          value="$(find dynamixel_workbench_controllers)/config/basic.yaml"/>

  <node name="$(arg namespace)" pkg="dynamixel_workbench_controllers" type="dynamixel_workbench_controllers"
        required="true" output="screen" args="$(arg usb_port) $(arg dxl_baud_rate)">
    <rosparam>
      publish_period: 0.010
      dxl_read_period: 0.010
      dxl_write_period: 0.010
      use_moveit: false
      use_joint_states_topic: true
      use_cmd_vel_topic: false
      mobile_robot_config:                <!--this values will be set when 'use_cmd_vel_topic' is true-->
        seperation_between_wheels: 0.160  <!--default value is set by reference of TB3-->
        radius_of_wheel: 0.033            <!--default value is set by reference of TB3-->
    </rosparam>
  </node>
</launch>
```

Launch dynamixel_controller

```
$ cd ~/catkin_ws && catkin_make
$ roslaunch dynamixel_workbench_controllers dynamixel_controllers.launch 
```

If controller load your Dynamixel, you can watch below texts

```
[ INFO] [1544595828.276238724]: Name : pan, ID : 1, Model Number : 1020
[ INFO] [1544595828.316198852]: Name : tilt, ID : 2, Model Number : 1020
```

**Parameters List** :
- `usb_port`  
USB port name you used

- `dxl_baud_rate`  
Baud Rate of Dynamixels

- `namespace`  
Namespace of this package

- `dynamixel_info`  
YAML file path

- `publish_period`  
Period of publishing topic (msec)

- `dxl_read_period`  
Period of reading information of Dynamixel (msec)

- `dxl_write_period`  
Period of writing value to Dynamixel (msec)

- `use_moveit`  
If you use joint trajectory from calculated by MoveIt!, please set True

- `use_joint_states_topic`  
If you want publish /joint_states, please set True

- `use_cmd_vel_topic`  
If you want subscribe /cmd_vel, please set True

- `seperation_between_wheels`  
This parameters is valid when `use_cmd_vel_topic` it True

- `radius_of_wheel`  
This parameters is valid when `use_cmd_vel_topic` it True

**Topic List** :
- `/dynamixel_state`([dynamixel_workbench_msgs/DynamixelStateList]{: .popup})  
Provides states of connected Dynamixels
 
- `/joint_states`([sensor_msgs/JointState](http://docs.ros.org/melodic/api/sensor_msgs/html/msg/JointState.html))   
Provides joint information about connected Dynamixels  

- `/joint_trajectory`([trajectory_msgs/JointTrajectory](http://docs.ros.org/melodic/api/trajectory_msgs/html/msg/JointTrajectory.html))  
Receives joint trajectory to control Dynamixels

**Service List** : 
- `/dynamixel_command`([dynamixel_workbench_msgs/DynamixelCommand]{: .popup})    
Receives command to control Dynamixel

### Operators

#### Joint Operators

This package is to make ROS message and publish it to controllers

The configuration of the yaml file is as follows. First, you register joint name when you load from `controllers`. Seconds, you register motion name. Each motion name has step and time from start. The step size should be same as joint name.

```
joint:
  names: [[name1], [name2]]
motion:
  names: [[motion_name1], [motion_name2]]
  [motion_name1]:
    step: [[position1], [position2]]
    time_from_start: [time]
  [motion_name2]:
    step: [[position1], [position2]]
    time_from_start: [time]
  .
  .
  .
```

Let the shows the `motion.yaml` file. This file indicates load 2 Dynamixels. First Dynamixel has name 'pan' and second Dynamixel has name 'tilt'. In this file, three motion was registered.

```
joint:
  names: [pan, tilt]
motion:
  names: [right, zero, left]
  right:
    step: [-3.14, -3.14]  # radian
    time_from_start: 2.0  # sec
  zero:
    step: [0.0, 0.0]
    time_from_start: 3.0
  left:
    step: [3.14, 3.14]
    time_from_start: 6.0
```

Launch controller and joint_operator.  


**WARNING**: The controller should be set **joint_2_0.yaml** or **joint_1_0.yaml**.
{: .notice--warning}

```
$ cd ~/catkin_ws && catkin_make
$ roslaunch dynamixel_workbench_controllers dynamixel_controllers.launch 
$ roslaunch dynamixel_workbench_operators joint_operator.launch
```

If controller load your Dynamixel, you can watch below texts

```
[ INFO] [1544595828.276238724]: Name : pan, ID : 1, Model Number : 1020
[ INFO] [1544595828.316198852]: Name : tilt, ID : 2, Model Number : 1020
```

If operator launch succeeded, you can watch below texts

```
[ INFO] [1544598264.311365515]: motion_name : right, step : -3.140000
[ INFO] [1544598264.311399654]: motion_name : right, step : -3.140000
[ INFO] [1544598264.311414820]: time_from_start : 2.000000
[ INFO] [1544598264.311453292]: motion_name : zero, step : 0.000000
[ INFO] [1544598264.311466789]: motion_name : zero, step : 0.000000
[ INFO] [1544598264.311478179]: time_from_start : 3.000000
[ INFO] [1544598264.311498720]: motion_name : left, step : 3.140000
[ INFO] [1544598264.311524562]: motion_name : left, step : 3.140000
[ INFO] [1544598264.311534826]: time_from_start : 6.000000
[ INFO] [1544598264.313085881]: For now, you can use publish joint trajectory msgs by triggering service(/execution)
```

When you execute command by ROS service, the Dynamixel will rotate.

```
$ rosservice call /dynamixel_workbench/execution "{}" 
```

**NOTE**: If you want to repeat motion, you can set True to `is_loop` argument.  
`$ roslaunch dynamixel_workbench_operators joint_operator.launch is_loop:=true`
{: .notice--info}

**Parameters List** :
- `namespace`  
Namespace of this node

- `trajectory_info`  
Trajectory information file path

**Topic List** :
- `/joint_trajectory`([trajectory_msgs/JointTrajectory](http://docs.ros.org/melodic/api/trajectory_msgs/html/msg/JointTrajectory.html))  
Send joint trajectory to control Dynamixels

**Service List** : 
- `/execution`([std_srvs/Trigger](http://docs.ros.org/melodic/api/std_srvs/html/srv/Trigger.html))    
Send command to excute following joint trajectory

#### Wheel Operators

This package is to make ROS message and publish it to controllers 

Launch controller and joint_operator.   


**WARNING**: The controller should be set **wheel_2_0.yaml** or **wheel_1_0.yaml** and set true to `use_cmd_vel_topic` parameter.
{: .notice--warning}

```
$ cd ~/catkin_ws && catkin_make
$ roslaunch dynamixel_workbench_controllers dynamixel_controllers.launch 
$ roslaunch dynamixel_workbench_operators joint_operator.launch
```

If controller load your Dynamixel, you can watch below texts

```
[ INFO] [1544595828.276238724]: Name : pan, ID : 1, Model Number : 1020
[ INFO] [1544595828.316198852]: Name : tilt, ID : 2, Model Number : 1020
```

If operator launch succeeded, you can watch below texts

```
[ INFO] [1544600281.020523635]: You can set '-lin_vel_step' and  '-ang_vel_step' arguments (default is 0.01 and 0.1)
[ INFO] [1544600281.021060063]: 
  Control Your Mobile Robot! 
  --------------------------- 
  Moving around:
          w
     a    s    d
          x
  
  w/x : increase/decrease linear velocity
  a/d : increase/decrease angular velocity
  
  s : force stop
  
  CTRL-C to quit
```

**Parameters List** :
- `namespace`  
Namespace of this node

**Topic List** :
- `/cmd_vel`([geometry_msgs/Twist](http://docs.ros.org/melodic/api/geometry_msgs/html/msg/Twist.html))  
Send command velocity to control Dynamixels

### MoveIt! Bridge

This package is to receive joint trajectory from MoveIt! and send it to controllers. The purpose of this package is to provide bridge between MoveIt! and Dynamixels.

Let the shows the `moveit_bridge.launch` file. First, you should set **planning_group** argument when you make MoveIt! configuration packages. ([Setup Assistant Tutorials](https://ros-planning.github.io/moveit_tutorials/doc/setup_assistant/setup_assistant_tutorial.html#step-4-add-planning-groups)) Second, you have to remap /joint_trajectory topic name when you set on **dynamixel_controllers.launch** file.

```
<launch>
  <arg name="robot_name"       default="open_manipulator"/>
  <arg name="planning_group"   default="arm"/>

  <node name="$(arg planning_group)" pkg="dynamixel_workbench_moveit_bridge" type="moveit_bridge" output="screen">
    <param name="planning_group"      value="$(arg planning_group)"/>
    <remap from="$(arg planning_group)/joint_trajectory" to="$(arg robot_name)/joint_trajectory"/>
  </node>
</launch>
```

I will give you an example to show how to use moveit_bridge.

1. Downloads [OpenManipulator](/docs/en/platform/openmanipulator/) packages  

1. Modify `joint_2_0.yaml` file  

    ```
    joint1:
      ID: 11
      Return_Delay_Time: 0
      Operating_Mode: 3
    joint2:
      ID: 12
      Return_Delay_Time: 0
      Operating_Mode: 3
    joint3:
      ID: 13
      Return_Delay_Time: 0
      Operating_Mode: 3
    joint4:
      ID: 14
      Return_Delay_Time: 0
      Operating_Mode: 3
    gripper:
      ID: 15
      Return_Delay_Time: 0
      Operating_Mode: 5
    ```   
    
1. Modify `dynamixel_controllers.launch` file  

    ```
    <launch>
    <arg name="usb_port"                default="/dev/ttyUSB0"/>
    <arg name="dxl_baud_rate"           default="1000000"/>
    <arg name="namespace"               default="open_manipulator"/>

    <param name="dynamixel_info"          value="$(find dynamixel_workbench_controllers)/config/joint_2_0.yaml"/>

    <node name="$(arg namespace)" pkg="dynamixel_workbench_controllers" type="dynamixel_workbench_controllers"
            required="true" output="screen" args="$(arg usb_port) $(arg dxl_baud_rate)">
        <rosparam>
        publish_period: 0.010
        dxl_read_period: 0.010
        dxl_write_period: 0.010
        use_moveit: true
        use_joint_states_topic: true
        use_cmd_vel_topic: false
        mobile_robot_config:                <!--this values will be set when 'use_cmd_vel_topic' is true-->
            seperation_between_wheels: 0.160  <!--default value is set by reference of TB3-->
            radius_of_wheel: 0.033            <!--default value is set by reference of TB3-->
        </rosparam>
    </node>
    </launch>
    ```  
    **WARNING**: The controller should be set **joint_2_0.yaml** and set True to `use_moveit` parameter.
    {: .notice--warning}  

1. Launch dynamixel_controller

    ```
    $ roslaunch dynamixel_workbench_controllers dynamixel_controllers.launch
    ```

    If launch file is success to load Dynamixels, you can watch below

    ```
    [ INFO] [1544603367.568390712]: Name : gripper, ID : 15, Model Number : 1020
    [ INFO] [1544603367.603361288]: Name : joint1, ID : 11, Model Number : 1020
    [ INFO] [1544603367.638365961]: Name : joint2, ID : 12, Model Number : 1020
    [ INFO] [1544603367.673359371]: Name : joint3, ID : 13, Model Number : 1020
    [ INFO] [1544603367.708354294]: Name : joint4, ID : 14, Model Number : 1020
    ```

1. Launch open_manipulator_moveit

    ```
    $ roslaunch open_manipulator_controller open_manipulator_moveit.launch sample_duration:=0.030
    ```

    If launch file is success to MoveIt!, Rviz is openned and you can watch a manipulator 

    **TIP**: [How to set Industrial filter into joint trajectory]{: .popup}
    {: .notice--success}

1. Launch moveit_bridge

    ```
    $ roslaunch dynamixel_workbench_moveit_bridge moveit_bridge.launch robot_name:=open_manipulator
    ```

    If launch file is success to load moveit_bridge, you can watch below

    ```
    [ INFO] [1544603508.733061360]: Loading robot model 'open_manipulator'...
    [ INFO] [1544603508.733104674]: No root/virtual joint specified in SRDF. Assuming fixed joint
    [ INFO] [1544603508.854923512]: Loading robot model 'open_manipulator'...
    [ INFO] [1544603508.854944540]: No root/virtual joint specified in SRDF. Assuming fixed joint
    [ INFO] [1544603510.023867011]: Ready to take commands for planning group arm.
    ```

1. Drag interative marker and push `Plan and Excute` button. Then the Dynamixels will rotate.  

**Parameters List** :
- `robot_name`  
Robot name should be set namespace argument when you set dynamixel_controller.launch file

- `planning_group`  
Planning group when you make MoveIt! configuration packages  

**Topic List** :
- `/joint_trajectory`([trajectory_msgs/JointTrajectory](http://docs.ros.org/melodic/api/trajectory_msgs/html/msg/JointTrajectory.html))  
Sends joint trajectory to control Dynamixels

- `/move_group/display_planned_path`([moveit_msgs/DisplayTrajectory](http://docs.ros.org/melodic/api/moveit_msgs/html/msg/DisplayTrajectory.html))  
Receives planned path by move_group

**Service List** :
- `moveit/get_joint_position`([open_manipulator_msgs/GetJointPosition]{: .popup})  
The user can use this service to receives a joint position which is calculated by move_group.

- `moveit/get_kinematics_pose`([open_manipulator_msgs/GetKinematicsPose]{: .popup})  
The user can use this service to receives a kinematics pose which is calculated by move_group.

- `moveit/set_joint_position`([open_manipulator_msgs/SetJointPosition]{: .popup})   
The user can use this service to create a trajectory in the [joint space]{: .popup} by move_group. The user inputs the angle of the target joint and the total time of the trajectory.

- `moveit/set_kinematics_pose`([open_manipulator_msgs/SetKinematicsPose]{: .popup})   
The user can use this service to create a trajectory in the [task space]{: .popup} by move_group. The user inputs the kinematics pose(orientation only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

## [OpenCR and OpenCM Tutorials](#opencr-and-opencm-tutorials)

Dynamixel-Workbench firmware in OpenCR and OpenCM is completely same. You can select any example what you want and upload it.

**WARNING**: There are some examples that needs to be openned `Serial Monitor` before it is running. If this code (`while(!Serial);`) is activated, please open `Serial Monitor`.
{: .notice--warning}

### o_Find_Dynamixel

1. Open `o_Find_Dynamixel`

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_1.png)  

1. Select Port

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_2.png)  

1. Push `Upload` button or `CTRL+U`

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_3.png)  

1. You can show if the firmware upload successfully

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_4.png)  

1. Push `Serial Monitor` button

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_5.png)  

1. Serial monitor starts to scan and find Dynamixels

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_6.png)  

### p_Monitor

1. Open `p_Monitor`

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_arduino_setup.png)  

1. Select Port

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_2.png)  

1. Push `Upload` button or `CTRL+U`

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_3.png)  

1. You can show if the firmware upload successfully

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_4.png)  

1. Push `Serial Monitor` button

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_5.png)  

1. Serial monitor shows dynamixel monitor

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_7.png)  

1. Type `begin 57600`

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_8.png)  

1. Type `scan 10`

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_9.png)  

1. Type `torque_on 1` and `torque_on 2`

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_10.png)  

1. Type `sync_write_handler 1 Goal_Position`

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_11.png)  

1. Type `sync_write 1 2 0 2048 2048` then the Dynamixels will rotate

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_12.png)  

## [Linux and macOS Tutorials](#linux-and-macos-tutorials)

You can select any example what you want and excute it.

### Examples

1. model_scan
1. ping
1. id_change
1. bps_change
1. mode_change
1. reboot
1. reset
1. position
1. velocity
1. current_based_position
1. read_write
1. sync_write
1. sync_read_write
1. bulk_read_write
1. find_dynamixel
1. monitor

**TIP**: USB port name is different depend on OS. For example, `/dev/ttyUSB0`, `/dev/ttyACM0` in Linux and `/dev/cu.usbmodem1411` in macOS
{: .notice--success}

### position

1. Open terminal and go to Dynamixel-Workbench build folder

    ```
    $ cd ~/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build
    ```

1. Excute position (arguments : -port_name -baud_rate -dynamixel_id)

    ```
    $ ./position /dev/ttyUSB0 57600 1
    ```

1. You can watch below texts and a Dynamixel will rotate 3 times

    ```
    Succeed to init(57600)
    Succeed to ping
    id : 1, model_number : 1020
    Succeed to change joint mode
    Dynamixel is moving...
    ```

### bulk_read_write

1. Open terminal and go to Dynamixel-Workbench build folder

    ```
    $ cd ~/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build
    ```

1. Excute bulk_read_write (arguments : -port_name -baud_rate -dynamixel_id_1 -dynamixel_id_2)

    ```
    $ ./bulk_read_write /dev/ttyUSB0 57600 1 2
    ```

1. You can watch below texts and a Dynamixel(dynamixel_id_1) will change rotate direction and another Dynamixel(dynamixel_id_2) will change LED status

    ```
    Succeed to init(57600)
    Succeeded to ping
    id : 1, model_number : 1020
    Succeed to change joint mode
    Succeeded to ping
    id : 2, model_number : 1020
    Succeed to change joint mode
    [DynamixelDriver] Succeeded to init groupBulkWrite!
    [DynamixelDriver] Succeeded to init groupBulkRead!
    [DynamixelDriver] Succeeded to add param for bulk read!
    [DynamixelDriver] Succeeded to add param for bulk read!
    [DynamixelDriver] Succeeded to add param for bulk write!
    [DynamixelDriver] Succeeded to add param for bulk write!
    ```

# [API References](#api-references)

- [Github Repo](https://github.com/ROBOTIS-GIT/dynamixel-workbench)

We have a plan to publish Doxygen. It will be updated soon.

[dynamixel_workbench_msgs/DynamixelInfo]: /docs/en/popup/dynamixel_workbench_msgs_DynamixelInfo/
[dynamixel_workbench_msgs/DynamixelCommand]: /docs/en/popup/dynamixel_workbench_msgs_DynamixelCommand/
[dynamixel_workbench_msgs/DynamixelStateList]: /docs/en/popup/dynamixel_workbench_msgs_DynamixelStateList/

[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/

[How to set Industrial filter into joint trajectory]: /docs/en/popup/how_to_set_smoothing_filter/


[DynamixelSDK]: http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/