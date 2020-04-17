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

The purpose of DYNAMIXEL Workbench is **to use more simple and easy to use any DYNAMIXEL**. This library is based on [DYNAMIXEL SDK] and supports ROS, Linux, macOS and Arduino. However, this library is not magic stick to operate DYNAMIXEL with any setup. It has some restriction compared with DYNAMIXEL SDK but we are continue to upgrade this library for almost everyone loves DYNAMIXEL.

If have any questions or issues, please get a ticket in [github issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

**CAUTION** : DYNAMIXEL Workbench is designed to control DYNAMIXEL in ROS with limited features. For setting up and testing the DYNAMIXEL, please use [DYNAMIXEL Wizard 2.0] or [DYNAMIXEL SDK].
{: .notice--warning}

# [Supported DYNAMIXEL](#supported-dynamixel)

| DYNAMIXEL Series |                                |                                |                                |                                |                 |
|:-----------------|:-------------------------------|:-------------------------------|:-------------------------------|:-------------------------------|:----------------|
| **AX**           | [AX-12W]                       | [AX-12+/12A]                   | [AX-18F/18A]                   |                                |                 |
| **EX**           | [EX-106+]                      |                                |                                |                                |                 |
| **RX**           | [RX-10]                        | [RX-24F]                       | [RX-28]                        | [RX-64]                        |                 |
| **MX**           | [MX-12W]                       | [MX-28], [MX-28(2.0)]          | [MX-64], [MX-64(2.0)]          | [MX-106], [MX-106(2.0)]        |                 |
| **XL**           | [XL320]                        | [XL430-W250]                   | [2XL430-W250]                  |                                |                 |
| **XC**           | [XC430-W150]                   | [XC430-W240]                   |                                |                                |                 |
| **XM**           | [XM430-W210]                   | [XM430-W350]                   | [XM540-W150]                   | [XM540-W270]                   |                 |
| **XH**           | [XH430-W210]<br/> [XH430-W350] | [XH430-V210]<br/> [XH430-V350] | [XH540-W150]<br/> [XH540-W270] | [XH540-V150]<br/> [XH540-V270] |                 |
| **PRO L**        | [L42-10-S300-R]                | [L54-30-S500-R]                | [L54-30-S400-R]                | [L54-50-S500-R]                | [L54-50-S290-R] |
| **PRO M**        | [M42-10-S260-R]                | [M54-40-S250-R]                | [M54-60-S250-R]                |                                |                 |
| **PRO H**        | [H42-20-S300-R]                | [H54-100-S500-R]               | [H54-200-S500-R]               |                                |                 |
| **PRO M(A)**     | [M42-10-S260-R(A)]             | [M54-40-S250-R(A)]             | [M54-60-S250-R(A)]             |                                |                 |
| **PRO H(A)**     | [H42-20-S300-R(A)]             | [H54-100-S500-R(A)]            | [H54-200-S500-R(A)]            |                                |                 |
| **PM**           | [PM54-060-S250-R]              | [PM54-040-S250-R]              | [PM42-010-S260-R]              |                                |                 |
| **PH**           | [PH42-020-S300-R]              | [PH54-100-S500-R]              | [PH54-200-S500-R]              |                                |                 |


**DYNMAIXEL Workbench** metapackage contains 3 packages:  **Controllers**, **Operators**, and **Toolbox**. The **Controllers** package introduces how to employ DYNAMIXEL on different operating mode with DYNMAIXEL Workbench library(Toolbox).  In addition, the Operators demonstrates some straightforward examples by operating Controllers.

- [ROS WIKI](http://wiki.ros.org/dynamixel_workbench)

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
```

## [OpenCR and OpenCM](#opencr-and-opencm)

### Downloads Arduino IDE

- Downloads [Arduino IDE](http://emanual.robotis.com/docs/en/software/arduino_ide/) for uploding firmware to OpenCR and OpenCM

#### OpenCR Arduino IDE

![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_arduino_setup.png)

In order to use Exameples for OpenCM 9.04 in Arduino, Porting OpenCM9.04 Board to Arduino IDE is required.  

- [Porting the OpenCR1.0 board to the Arduino IDE](/docs/en/parts/controller/opencr10/#porting-to-arduino-idelinux)

#### OpenCM Arduino IDE

![](/assets/images/sw/dynamixel/dynamixel_workbench/opencm_arduino_setup.png)

In order to use Exameples for OpenCM 9.04 in Arduino, Porting OpenCM9.04 Board to Arduino IDE is required.  

- [Porting the OpenCM9.04 board to the Arduino IDE](docs/en/parts/controller/opencm904/#porting-the-opencm904-board-to-the-arduino-ide)

## [Linux and macOS](#linux-and-macos)

**NOTE**: We don't have a plan to release for `Windows OS`. But we will happily merge any contributions regarding Windows environment.
{: .notice--info}

### Downloads Library

``` bash
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
```
### Setup DYNAMIXEL SDK library

- [Linux](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/library_setup/cpp_linux/#cpp-linux)  
- [macOS](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/library_setup/cpp_macos/#cpp-macos)  

### Setup DYNAMIXEL Workbench library

``` bash
$ cd ~/dynamixel-workbench/dynamixel_workbench_toolbox/examples
$ mkdir -p build && cd build
$ cmake ..
$ make
```

# [Device Setup](#device-setup)

**WARNING**: You should check the device setup **over and over again** before you use the library.  
Please check **power input** and **usb port** once again.
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
- Please run roscore before rosrun, because rosrun can't operate without roscore. The rosrun and roscore should be running in separate terminal windows.
- This run file configures the usb latency timer to **1 ms**. If you want to check this setting, run the following command in a terminal window.  
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
    - [Controllers](/docs/en/software/dynamixel/dynamixel_workbench/#controllers)
    - [Operators](/docs/en/software/dynamixel/dynamixel_workbench/#operators)

    - [OpenCR and OpenCM](/docs/en/software/dynamixel/dynamixel_workbench/#opencr-and-opencm-tutorials)
    - [o_Find_Dynamixel](/docs/en/software/dynamixel/dynamixel_workbench/#o_find_dynamixel)
    - [p_Monitor](/docs/en/software/dynamixel/dynamixel_workbench/#p_monitor)

- [Linux and macOS](/docs/en/software/dynamixel/dynamixel_workbench/#linux-and-macos)
    - [Examples](/docs/en/software/dynamixel/dynamixel_workbench/#examples)
    - [position](/docs/en/software/dynamixel/dynamixel_workbench/#position)
    - [bulk_read_write](/docs/en/software/dynamixel/dynamixel_workbench/#bulk_read_write)

## [ROS Tutorials](#ros-tutorials)

### [Find Dynamixels](#find-dynamixels)

This node scans all ID with each Baudrate(9600, 57600, 115200, 1000000, 2000000, 3000000, 4000000) and shows how many dynamixels are connected.

Run find_dynamixel

```
$ rosrun dynamixel_workbench_controllers find_dynamixel /dev/ttyUSB0
```

Then you can see below texts.

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

**TIP**: If you can't find any DYNAMIXEL, please check usb port, power. Even if it can't find anything, please check firmware to use ROBOTIS software ([R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/) or [R+ Manager 1.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/))
{: .notice--success}

### [Controllers](#controllers)

This package is to control DYNAMIXEL by ROS API. You can load your DYNAMIXEL by simply creating yaml file.  

The configuration of the yaml file is as follows. `name` is used for joint name of /joint_states topic as well as identifing DYNAMIXEL.  
When controller is initialized, DYNAMIXEL information is loaded from the file and configures each `Control_Table_Item` with the `value` for each DYNAMIXEL based on `id`.

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

Let's take a look at the `joint_2_0.yaml` file. This file indicates configuration for 2 DYNAMIXEL. The first DYNAMIXEL has the name of 'pan' and id is '1' whereas the second DYNAMIXEL has the name of 'tilt' and id is '2'. Both DYNAMIXEL will be set [Return_Delay_time](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/#return-delay-time9) to zero(0) and [Operating_Mode](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/#operating-mode11) to Position Control Mode(3).

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
{% capture notice_02 %}
**WARNING**: Be sure to keep the following for right use of the package.  
-`Torque Enable`, which is the data of [Control Table](/docs/en/faq/faq_dynamixel/) of DYNAMIXEL, is not supposed to be set by users, but it's enabled by itself during initialization.  
- Control Table item has to follow [Camel_Case](https://en.wikipedia.org/wiki/Camel_case) without a blank.    
- Be sure to set DYNAMIXEL ID before use of this package. Use 
- 2XL430-W250 does not support this package (**Controllers**). By using this package with 2XL430-W250, one of Torque Enable (64) of a detected ID from two axles of 2XL430-W250 is automatically set as '1' (Torque on).  
In this case, EEPROM of the other axle is deactivated, and the package can not access to the EEPROM field, which cause a connection error when you use the package.
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify }}</div>

Let's take a look at the `dynamixel_controller.launch` file

```
<launch>
  <arg name="usb_port"                default="/dev/ttyUSB0"/>
  <arg name="dxl_baud_rate"           default="57600"/>
  <arg name="namespace"               default="dynamixel_workbench"/>

  <arg name="use_moveit"              default="false"/>
  <arg name="use_joint_state"         default="true"/>
  <arg name="use_cmd_vel"             default="false"/>

  <param name="dynamixel_info"          value="$(find dynamixel_workbench_controllers)/config/basic.yaml"/>

  <node name="$(arg namespace)" pkg="dynamixel_workbench_controllers" type="dynamixel_workbench_controllers"
        required="true" output="screen" args="$(arg usb_port) $(arg dxl_baud_rate)">
    <param name="use_moveit"              value="$(arg use_moveit)"/>
    <param name="use_joint_states_topic"  value="$(arg use_joint_state)"/>
    <param name="use_cmd_vel_topic"       value="$(arg use_cmd_vel)"/>
    <rosparam>
      publish_period: 0.010
      dxl_read_period: 0.010
      dxl_write_period: 0.010
      mobile_robot_config:                <!--this values will be set when 'use_cmd_vel' is true-->
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

If controller load your DYNAMIXEL, you can watch below texts

```
[ INFO] [1544595828.276238724]: Name : pan, ID : 1, Model Number : 1020
[ INFO] [1544595828.316198852]: Name : tilt, ID : 2, Model Number : 1020
```

After initialization, DYNAMIXEL will be torque on. If you want to write value to DYNAMIXEL, you can use ROS service(`/dynamixel_command`).

Open rqt and `Plugins` -> `Services` -> `Service Caller`

![](/assets/images/sw/dynamixel/dynamixel_workbench/controller_service_call.png)

Or use command line

```
$ rosservice call /dynamixel_workbench/dynamixel_command "command: ''
id: 1
addr_name: 'Goal_Position'
value: 2048"
```

**Parameters List** :
- `usb_port`  
USB port name you used

- `dxl_baud_rate`  
Baud Rate of DYNAMIXEL

- `namespace`  
Namespace of this package

- `dynamixel_info`  
YAML file path

- `publish_period`  
Period of publishing topic (msec)

- `dxl_read_period`  
Period of reading information of DYNAMIXEL (msec)

- `dxl_write_period`  
Period of writing value to DYNAMIXEL (msec)

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
Provides states of connected DYNAMIXEL

- `/joint_states`([sensor_msgs/JointState](http://docs.ros.org/melodic/api/sensor_msgs/html/msg/JointState.html))   
Provides joint information about connected DYNAMIXEL  

- `/joint_trajectory`([trajectory_msgs/JointTrajectory](http://docs.ros.org/melodic/api/trajectory_msgs/html/msg/JointTrajectory.html))  
Receives joint trajectory to control DYNAMIXEL

**Service List** :
- `/dynamixel_command`([dynamixel_workbench_msgs/DynamixelCommand]{: .popup})    
Receives command to control DYNAMIXEL

### [Operators](#operators)

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

Let's take a look at the `motion.yaml` file. This file indicates load 2 DYNAMIXEL. First DYNAMIXEL has name 'pan' and second DYNAMIXEL has name 'tilt'. In this file, three motion was registered.

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

If controller load your DYNAMIXEL, you can watch below texts

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

When you execute command by ROS service, DYNAMIXEL will rotate.

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
Send joint trajectory to control DYNAMIXEL

**Service List** :
- `/execution`([std_srvs/Trigger](http://docs.ros.org/melodic/api/std_srvs/html/srv/Trigger.html))    
Send command to excute following joint trajectory

#### Wheel Operators

This package is to make ROS message and publish it to controllers

Launch controller and joint_operator.   


**WARNING**: The controller should be set **wheel_2_0.yaml** or **wheel_1_0.yaml** and set true to `use_cmd_vel` parameter.
{: .notice--warning}

```
$ cd ~/catkin_ws && catkin_make
$ roslaunch dynamixel_workbench_operators wheel_operator.launch
$ roslaunch dynamixel_workbench_controllers dynamixel_controllers.launch use_cmd_vel:=true
```

If controller load your DYNAMIXEL, you can watch below texts

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
Send command velocity to control DYNAMIXEL
 
## [OpenCR and OpenCM Tutorials](#opencr-and-opencm-tutorials)

DYNAMIXEL Workbench firmware in OpenCR and OpenCM is completely same. You can select any example what you want and upload it.

**WARNING**: There are some examples that needs to be openned `Serial Monitor` before it is running. If this code (`while(!Serial)
`) is activated, please open `Serial Monitor`.
{: .notice--warning}

### [o_Find_Dynamixel](#o_find_dynamixel)

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

1. Serial monitor starts to scan and find DYNAMIXEL

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_6.png)  

### [p_Monitor](#p_monitor)

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

1. Type `sync_write 1 2 0 2048 2048` then DYNAMIXEL will rotate

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

### [position](#position)

1. Open terminal and go to DYNAMIXEL Workbench build folder

    ```
    $ cd ~/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build
    ```

1. Excute position (arguments : -port_name -baud_rate -dynamixel_id)

    ```
    $ ./position /dev/ttyUSB0 57600 1
    ```

1. You can watch below texts and DYNAMIXEL will rotate 3 times

    ```
    Succeed to init(57600)
    Succeed to ping
    id : 1, model_number : 1020
    Succeed to change joint mode
    Dynamixel is moving...
    ```

### [bulk_read_write](#bulk_read_write)

1. Open terminal and go to DYNAMIXEL Workbench build folder

    ```
    $ cd ~/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build
    ```

1. Excute bulk_read_write (arguments : -port_name -baud_rate -dynamixel_id_1 -dynamixel_id_2)

    ```
    $ ./bulk_read_write /dev/ttyUSB0 57600 1 2
    ```

1. You can watch below texts and DYNAMIXEL(dynamixel_id_1) will change rotate direction and another DYNAMIXEL(dynamixel_id_2) will change LED status

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

**NOTE**: We have a plan to publish Doxygen. It will be updated soon.
{: .notice--info}

## [Function List](#function-list)

```c++
bool init(const char* device_name = "/dev/ttyUSB0",
        uint32_t baud_rate = 57600,
        const char **log = NULL);

bool begin(const char* device_name = "/dev/ttyUSB0",
        uint32_t baud_rate = 57600,
        const char **log = NULL);

bool setPortHandler(const char *device_name, const char **log = NULL);
bool setBaudrate(uint32_t baud_rate, const char **log = NULL);
bool setPacketHandler(float protocol_version, const char **log = NULL);

float getProtocolVersion(void);
uint32_t getBaudrate(void);

const char * getModelName(uint8_t id, const char **log = NULL);
uint16_t getModelNumber(uint8_t id, const char **log = NULL);
const ControlItem *getControlTable(uint8_t id, const char **log = NULL);
const ControlItem *getItemInfo(uint8_t id, const char *item_name, const char **log = NULL);
uint8_t getTheNumberOfControlItem(uint8_t id, const char **log = NULL);
const ModelInfo* getModelInfo(uint8_t id, const char **log = NULL);

uint8_t getTheNumberOfSyncWriteHandler(void);
uint8_t getTheNumberOfSyncReadHandler(void);
uint8_t getTheNumberOfBulkReadParam(void);

bool scan(uint8_t *get_id,
        uint8_t *get_the_number_of_id,
        uint8_t range = 253,
        const char **log = NULL);

bool scan(uint8_t *get_id,
        uint8_t *get_the_number_of_id,
        uint8_t start_number,
        uint8_t end_number,
        const char **log = NULL);

bool ping(uint8_t id,
        uint16_t *get_model_number,
        const char **log = NULL);

bool ping(uint8_t id,
        const char **log = NULL);

bool clearMultiTurn(uint8_t id, const char **log = NULL);

bool reboot(uint8_t id, const char **log = NULL);
bool reset(uint8_t id, const char **log = NULL);

bool writeRegister(uint8_t id, uint16_t address, uint16_t length, uint8_t* data, const char **log = NULL);
bool writeRegister(uint8_t id, const char *item_name, int32_t data, const char **log = NULL);

bool writeOnlyRegister(uint8_t id, uint16_t address, uint16_t length, uint8_t *data, const char **log = NULL);
bool writeOnlyRegister(uint8_t id, const char *item_name, int32_t data, const char **log = NULL);

bool readRegister(uint8_t id, uint16_t address, uint16_t length, uint32_t *data, const char **log = NULL);
bool readRegister(uint8_t id, const char *item_name, int32_t *data, const char **log = NULL);

void getParam(int32_t data, uint8_t *param);

bool addSyncWriteHandler(uint16_t address, uint16_t length, const char **log = NULL);
bool addSyncWriteHandler(uint8_t id, const char *item_name, const char **log = NULL);

bool syncWrite(uint8_t index, int32_t *data, const char **log = NULL);
bool syncWrite(uint8_t index, uint8_t *id, uint8_t id_num, int32_t *data, uint8_t data_num_for_each_id, const char **log = NULL);

bool addSyncReadHandler(uint16_t address, uint16_t length, const char **log = NULL);
bool addSyncReadHandler(uint8_t id, const char *item_name, const char **log = NULL);

bool syncRead(uint8_t index, const char **log = NULL);
bool syncRead(uint8_t index, uint8_t *id, uint8_t id_num, const char **log = NULL);

bool getSyncReadData(uint8_t index, int32_t *data, const char **log = NULL);
bool getSyncReadData(uint8_t index, uint8_t *id, uint8_t id_num, int32_t *data, const char **log = NULL);
bool getSyncReadData(uint8_t index, uint8_t *id, uint8_t id_num, uint16_t address, uint16_t length, int32_t *data, const char **log = NULL);

bool initBulkWrite(const char **log = NULL);

bool addBulkWriteParam(uint8_t id, uint16_t address, uint16_t length, int32_t data, const char **log = NULL);
bool addBulkWriteParam(uint8_t id, const char *item_name, int32_t data, const char **log = NULL);

bool bulkWrite(const char **log = NULL);

bool initBulkRead(const char **log = NULL);

bool addBulkReadParam(uint8_t id, uint16_t address, uint16_t length, const char **log = NULL);
bool addBulkReadParam(uint8_t id, const char *item_name, const char **log = NULL);

bool bulkRead(const char **log = NULL);

bool getBulkReadData(int32_t *data, const char **log = NULL);
bool getBulkReadData(uint8_t *id, uint8_t id_num, uint16_t *address, uint16_t *length, int32_t *data, const char **log = NULL);

bool clearBulkReadParam(void);
```  

```c++
bool torque(uint8_t id, bool onoff, const char **log = NULL);
bool torqueOn(uint8_t id, const char **log = NULL);
bool torqueOff(uint8_t id, const char **log = NULL);

bool changeID(uint8_t id, uint8_t new_id, const char **log = NULL);
bool changeBaudrate(uint8_t id, uint32_t new_baudrate, const char **log = NULL);
bool changeProtocolVersion(uint8_t id, uint8_t version, const char **log = NULL);

bool itemWrite(uint8_t id, const char *item_name, int32_t data, const char **log = NULL);
bool itemRead(uint8_t id, const char *item_name, int32_t *data, const char **log = NULL);

bool led(uint8_t id, bool onoff, const char **log = NULL);
bool ledOn(uint8_t id, const char **log = NULL);
bool ledOff(uint8_t id, const char **log = NULL);

bool setNormalDirection(uint8_t id, const char **log = NULL);
bool setReverseDirection(uint8_t id, const char **log = NULL);

bool setVelocityBasedProfile(uint8_t id, const char **log = NULL);
bool setTimeBasedProfile(uint8_t id, const char **log = NULL);

bool setSecondaryID(uint8_t id, uint8_t secondary_id, const char **log = NULL);

bool setCurrentControlMode(uint8_t id, const char **log = NULL);
bool setTorqueControlMode(uint8_t id, const char **log = NULL);
bool setVelocityControlMode(uint8_t id, const char **log = NULL);  
bool setPositionControlMode(uint8_t id, const char **log = NULL);  
bool setExtendedPositionControlMode(uint8_t id, const char **log = NULL);
bool setMultiTurnControlMode(uint8_t id, const char **log = NULL);
bool setCurrentBasedPositionControlMode(uint8_t id, const char **log = NULL);
bool setPWMControlMode(uint8_t id, const char **log = NULL);

bool setOperatingMode(uint8_t id, uint8_t index, const char **log = NULL);

bool jointMode(uint8_t id, int32_t velocity = 0, int32_t acceleration = 0, const char **log = NULL);
bool wheelMode(uint8_t id, int32_t acceleration = 0, const char **log = NULL);
bool currentBasedPositionMode(uint8_t id, int32_t current = 0, const char **log = NULL);

bool goalPosition(uint8_t id, int32_t value, const char **log = NULL);
bool goalPosition(uint8_t id, float radian, const char **log = NULL);

bool goalVelocity(uint8_t id, int32_t value, const char **log = NULL);
bool goalVelocity(uint8_t id, float velocity, const char **log = NULL);

bool getPresentPositionData(uint8_t id, int32_t* data, const char **log = NULL);
bool getRadian(uint8_t id, float* radian, const char **log = NULL);

bool getPresentVelocityData(uint8_t id, int32_t* data, const char **log = NULL);
bool getVelocity(uint8_t id, float* velocity, const char **log = NULL);

int32_t convertRadian2Value(uint8_t id, float radian);
float convertValue2Radian(uint8_t id, int32_t value);

int32_t convertRadian2Value(float radian, int32_t max_position, int32_t min_position, float max_radian, float min_radian);
float convertValue2Radian(int32_t value, int32_t max_position, int32_t min_position, float max_radian, float min_radian);

int32_t convertVelocity2Value(uint8_t id, float velocity);
float convertValue2Velocity(uint8_t id, int32_t value);

int16_t convertCurrent2Value(float current);
float convertValue2Current(int16_t value);

float convertValue2Load(int16_t value);
```  

## [Function Reference](#function-reference)

### bool init(const char* device_name = "/dev/ttyUSB0", uint32_t baud_rate = 57600, const char **log = NULL)  

**説明文**  
portHandlerの初期化を行います。

**引数**  
1. `device_name` : USBポート名を設定します。  
2. `baud_rate` : DYNAMIXELのボーレートを設定します。 

**戻り値**  
すべての引数が正常に設定されていれば、trueを返します。そうでない場合はfalseを返します。

### bool begin(const char* device_name = "/dev/ttyUSB0", uint32_t baud_rate = 57600, const char **log = NULL)  

**説明文**  
portHandlerの初期化を行います。

**引数**  
1. `device_name` : USBポート名を設定します。  
2. `baud_rate` : DYNAMIXELのボーレートを設定します。 

**戻り値**  
すべての引数が正常に設定されていれば、trueを返します。そうでない場合はfalseを返します。

### bool setPortHandler(const char *device_name, const char **log = NULL)
**説明文**  
PortHandlerの設定をします。

**引数**  
1. `device_name` : USBポート名を設定します。  

**戻り値**  
すべての引数が正常に設定されていれば、trueを返します。そうでない場合はfalseを返します。  

### bool setBaudrate(uint32_t baud_rate, const char **log = NULL)
**説明文**  
DYNAMIXELのボーレートを設定します。  

**引数**  
1. `baud_rate` : DYNAMIXELのボーレートを設定します。 

**戻り値**  
すべての引数が正常に設定されていれば、trueを返します。そうでない場合はfalseを返します。 


### bool setPacketHandler(float protocol_version, const char **log = NULL)
**説明文**  
PacketHandlerの設定を行います。  

**引数**  
1. `protocol_version` : DYNAMIXELのプロトコルバージョンを設定します。  

**戻り値**  
すべての引数が正常に設定されていれば、trueを返します。そうでない場合はfalseを返します。  

### float getProtocolVersion(void)
**説明文**  
PacketHandlerのプロトコルバージョンを取得します。  

**引数**  

**戻り値**  
PacketHandlerのプロトコルバージョンを返します。  

### uint32_t getBaudrate(void)
**説明文**  
PortHandlerのボーレートを取得します。  

**引数**  
**戻り値**  
PortHandlerのボーレートを返します。

### const char * getModelName(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのモデル名を取得します。  

**引数**  
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  。
型番を返します。  

### uint16_t getModelNumber(uint8_t id, const char **log = NULL)
**Description**  
DYNAMIXELの型番を取得します。  

**Input**  
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  
型番を返します。  

### const ControlItem *getControlTable(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのコントロールテーブル(ID、ボーレート、目標位置、...を含む)を取得します。
 

**引数**
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  
コントロールテーブルを返します。

### const ControlItem *getItemInfo(uint8_t id, const char *item_name, const char **log = NULL)
**説明文**  
DYNAMIXELのコントロールテーブルのアイテム情報を取得します。

**引数**  
1. `id` : DYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名です。

**戻り値**  
項目情報を返します。  

### uint8_t getTheNumberOfControlItem(uint8_t id, const char **log = NULL)
**説明文**  
制御項目の数を取得します。  

**引数**  
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  
制御項目の数を返します。  

### const ModelInfo* getModelInfo(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのモデル情報（RPM、最小/最大位置など）を取得します。

**引数**  
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  
モデル情報を返します。   

### uint8_t getTheNumberOfSyncWriteHandler(void)
**説明文**  
同期書き込みハンドラの数を取得します。  

**引数**  
**戻り値**  
同期書き込みハンドラの数を返します。   

### uint8_t getTheNumberOfSyncReadHandler(void)
**説明文**  
同期書き込みハンドラの数を取得します。  

**引数**    
**戻り値**   
同期書き込みハンドラの数を返します。    

### uint8_t getTheNumberOfBulkReadParam(void)
**説明文**  
bulk readパラメーターの数を取得します。  

**引数**   
**戻り値**  
bulk readパラメーターの数を返します。  

### bool scan(uint8_t *get_id, uint8_t *get_the_number_of_id, uint8_t range = 253, const char **log = NULL)
**説明文**  
指定範囲のDYNAMIXELへPingを送ります。 Pingが成功した場合、DYNAMIXELの全ての情報が保存されます。

**引数**  
1. `get_id` : 検出したIDを取得します。
1. `get_the_number_of_id` : 検出したIDの数を取得します。
1. `range` : スキャン範囲を設定します。（0から始まる）  

**戻り値**  
ping命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。 

### bool scan(uint8_t *get_id, uint8_t *get_the_number_of_id, uint8_t start_number, uint8_t end_number, const char **log = NULL)
**説明文**  
特定の範囲間でDYNAMIXELをPingします。Pingが成功した場合、DYNAMIXELの全ての情報が保存されます。

**引数**  
1. `get_id` : 検出したIDを取得します。
1. `get_the_number_of_id` : 検出したIDの数を取得します。
1. `start_number` : pingの開始番号を設定します。
1. `end_number` : pingの終了番号を設定します。  

**戻り値**  
ping命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。

### bool ping(uint8_t id, uint16_t *get_model_number, const char **log = NULL)
**説明文**  
DYNAMIXELへPingを送ります。Pingが成功すると、DYNAMIXELのすべての情報が保存されます。  

**引数**  
1. `id` : IDを設定する。
1. `get_model_number` : pingされたDYNAMIXELの型番を取得します。  

**戻り値**  
ping命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。

### bool ping(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELへPingを送ります。Pingが成功すると、DYNAMIXELのすべての情報が保存されます。  

**引数**  
1. `id` : IDを設定する。  

**戻り値**  
ping命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。  

### bool clearMultiTurn(uint8_t id, const char **log = NULL)
**説明文**  
マルチターンのクリア命令を送信します。

**引数**  
1. `id` : IDを設定します。  

**戻り値**  
マルチターンのクリアが正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。  

### bool reboot(uint8_t id, const char **log = NULL)
**説明文**  
再起動命令を送信します。  

**引数**  
1. `id` : IDを設定します。  

**戻り値**  
再起動命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。  

### bool reset(uint8_t id, const char **log = NULL)
**説明文**  
リセット命令を送信します。  

**引数**  
1. `id` : IDを設定します。  

**戻り値**  
リセット命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。  

### bool writeRegister(uint8_t id, uint16_t address, uint16_t length, uint8_t* data, const char **log = NULL)
**Description**  
DYNAMIXELにデータを書き込み、書き込み完了信号を待ちます。  

**引数**  
1. `id` : IDを設定します。
1. `address` : コントロールテーブル項目のアドレスを設定する。
1. `length` : コントロールテーブル項目の長さを設定する。
1. `data` : データを設定する。  

**戻り値**  
writeTxRx命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。

### bool writeRegister(uint8_t id, const char *item_name, int32_t data, const char **log = NULL)
**Description**  
DYNAMIXELにデータを書き込み、書き込み完了信号を待ちます。  

**引数**  
1. `id` : IDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定する。（例：目標位置、目標速度、...)
1. `data` : データを設定する。  

**戻り値**  
writeTxRx命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。  

### bool writeOnlyRegister(uint8_t id, uint16_t address, uint16_t length, uint8_t *data, const char **log = NULL)
**説明文**  
DYNAMIXELにデータを書き込むだけです。他の信号を待ちません。

**引数**  
1. `id` : IDを設定します。
1. `address` : コントロールテーブル項目のアドレスを設定する。
1. `length` : コントロールテーブル項目の長さを設定する。
1. `data` : データを設定する。  

**戻り値**  
writeTxOnly命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool writeOnlyRegister(uint8_t id, const char *item_name, int32_t data, const char **log = NULL)
**説明文**  
DYNAMIXELにデータを書き込むだけです。他の信号を待ちません。  

**引数**  
1. `id` : IDを設定する。
1. `item_name` : コントロールテーブルの項目名を設定する。（例：目標位置、目標速度、...)
1. `data` : データを設定する。  

**戻り値**  
writeTxOnly命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool readRegister(uint8_t id, uint16_t address, uint16_t length, uint32_t *data, const char **log = NULL)
**説明文**  
DYNAMIXELからデータを読み出します。  

**引数**  
1. `id` : IDを設定します。
1. `address` : コントロールテーブルの項目名を設定する。
1. `length` : コントロールテーブル項目の長さを設定する。
1. `data` : データを取得する。  

**戻り値**  
readTxRx命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool readRegister(uint8_t id, const char *item_name, int32_t *data, const char **log = NULL)
**説明文**  
DYNAMIXELからデータを読み出します。  

**引数**  
1. `id` : IDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定する（例：目標位置、目標速度、...）
1. `data` : データを取得する。  

**戻り値**  
readTxRx命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### void getParam(int32_t data, uint8_t *param)
**説明文**  
32ビットデータを8ビットパラメーターに変換します。

**引数**  
1. `data` : 32ビットのデータを設定する。
1. `param` : 8ビットのパラメーターを取得する。  

**戻り値**  

### bool addSyncWriteHandler(uint16_t address, uint16_t length, const char **log = NULL)
**説明文**   
syncWriteハンドラを追加します。

**引数**  
1. `address` : コントロールテーブル項目のアドレスを設定する。
1. `length` : コントロールテーブル項目の長さを設定する。  

**戻り値**  
syncWriteハンドラを最大値（デフォルトは5）を超えて追加しようとした場合はfalseを返します。そうでない場合にはtrueを返します。  

### bool addSyncWriteHandler(uint8_t id, const char *item_name, const char **log = NULL)
**説明文**  
syncWriteハンドラを追加します。  

**引数**  
1. `id` : コントロールテーブルを参照するためのDYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定する（例；目標位置、目標速度、...）  

**戻り値**  
syncWriteハンドラを最大値（デフォルトは5）を超えて追加しようとした場合はfalseを返す、もしくは項目名が見つからなくなります。そうでない場合にはtrueを返します。  

### bool syncWrite(uint8_t index, int32_t *data, const char **log = NULL)
**説明文**  
全てのpingされたDYNAMIXELに同期書き込みを実行します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定する。
1. `data` : データを設定する。  

**戻り値**  
addパラメーターまたはtxtパケット命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  
　
### bool syncWrite(uint8_t index, uint8_t *id, uint8_t id_num, int32_t *data, uint8_t data_num_for_each_id, const char **log = NULL)
**説明文**  
いくつかのDYNAMIXELへの同期書き込みを実行します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定する。
1. `id` : IDを設定する。
1. `id_num` : IDの数を設定する。
1. `data` : データを設定する。
1. `data_num_for_each_id` : 各IDのデータ数を設定する。  

**戻り値**  
addパラメーターまたはtxtパケット命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool addSyncReadHandler(uint16_t address, uint16_t length, const char **log = NULL)
**説明文**  
syncReadハンドラを追加します。  

**引数**  
1. `address` : コントロールテーブル項目のアドレスを設定する。
1. `length` : コントロールテーブル項目の長さを設定する  

**戻り値**  
syncWriteハンドラを最大値（デフォルトは5）を超えて追加しようとした場合はfalseを返す、もしくは項目名が見つからなくなります。そうでない場合にはtrueを返します。  

### bool addSyncReadHandler(uint8_t id, const char *item_name, const char **log = NULL)
**説明文**  
syncReadハンドラを追加します。  

**引数**  
1. `id` : コントロールテーブルを参照するためのDYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定する（例：目標位置、目標速度、...）  

**戻り値**  
syncWriteハンドラを最大値（デフォルトは5）を超えて追加しようとした場合はfalseを返す、もしくは項目名が見つからなくなります。そうでない場合にはtrueを返します。  

### bool syncRead(uint8_t index, const char **log = NULL)
**説明文**  
全てのpingされたDYNAMIXELからの同期読み出しを実行します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定します。  

**戻り値**  
addパラメーターまたはtxtパケット命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool syncRead(uint8_t index, uint8_t *id, uint8_t id_num, const char **log = NULL)
**説明文**  
いくつかのDYNAMIXELからの同期読み出しを実行します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定する。
1. `id` : IDを設定する。
1. `id_num` : IDの数を設定する。  

**戻り値**  
addパラメーターまたはtxtパケット命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool getSyncReadData(uint8_t index, int32_t *data, const char **log = NULL)
**説明文**    
全てのpingされたDYNAMIXELに同期書き込みを実行します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定する。
1. `data` : データを取得する。  

**Output**  
isAvailable命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getSyncReadData(uint8_t index, uint8_t *id, uint8_t id_num, int32_t *data, const char **log = NULL)
**説明文**    
いくつかのDYNAMIXELからsyncRead関数で読み込んだデータを取得します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定する。
1. `id` : IDを設定する。
1. `id_num` : IDの数を設定する。
1. `data` : データを取得する。  

**戻り値**  
isAvailable命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool getSyncReadData(uint8_t index, uint8_t *id, uint8_t id_num, uint16_t address, uint16_t length, int32_t *data, const char **log = NULL)
**説明文**  
いくつかのDYNAMIXELからsyncRead関数で読み込んだデータを取得します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定する。
1. `id` : IDを設定する。
1. `id_num` : IDの数を設定する。
1. `address` : コントロールテーブル項目のアドレスを設定する。
1. `length` : コントロールテーブル項目の長さを設定する・
1. `data` : データを取得する。  

**戻り値**  
isAvailable命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool initBulkWrite(const char **log = NULL)
**説明文**  
bulkWriteハンドラを初期化します。  

**引数**    
**戻り値**  
ポートハンドラとパケットハンドラが正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool addBulkWriteParam(uint8_t id, uint16_t address, uint16_t length, int32_t data, const char **log = NULL)
**説明文**  
bulkWrite用のパラメーターを追加します。  

**引数**  
1. `id` : IDを設定する。
1. `address` : コントロールテーブル項目のアドレスを設定する。
1. `length` : コントロールテーブル項目の長さを設定する。
1. `data` : データを設定する。  

**戻り値**  
addParam命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool addBulkWriteParam(uint8_t id, const char *item_name, int32_t data, const char **log = NULL)
**説明文**  
bulkWrite用のパラメーターを追加します。  

**引数**  
1. `id` : コントロールテーブルを参照するためのDYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定する（例：目標位置、目標速度、...）
1. `data` : データを設定する。  

**戻り値**  
addParam命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool bulkWrite(const char **log = NULL)
**説明文**  
bulkWriteを実行します。  

**引数**    
**戻り値**  
txパケット命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool initBulkRead(const char **log = NULL)
**説明文**  
bulkReadハンドラを初期化します。  

**引数**    
**戻り値**  
ポートハンドラとパケットハンドラが正常にロードされた場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool addBulkReadParam(uint8_t id, uint16_t address, uint16_t length, const char **log = NULL)
**説明文**  
bulkRead用のパラメーターを追加します。  

**引数**  
1. `id` : IDを設定する。
1. `address` : コントロールテーブル項目のアドレスを設定する。
1. `length` : コントロールテーブル項目の長さを設定する。
1. `data` : データを設定する。  

**戻り値**  
addParam命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。   

### bool addBulkReadParam(uint8_t id, const char *item_name, const char **log = NULL)
**説明文**  
bulkRead用のパラメーターを追加します。  

**引数**  
1. `id` : コントロールテーブルを参照するためのDYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定する（例：目標位置、目標速度、...）
1. `data` : データを設定する。  

**戻り値**  
addParam命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。   

### bool bulkRead(const char **log = NULL)
**説明文**  
bulkReadを実行します。  

**引数**    
**戻り値**  
txパケット命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getBulkReadData(int32_t *data, const char **log = NULL)
**説明文**  
pingされた全てのDYNAMIXELからbulkRead関数で読み込んだデータを取得します。  

**引数**  
1. `data` : データを設定する。  

**戻り値**    
isAvailable命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool getBulkReadData(uint8_t *id, uint8_t id_num, uint16_t *address, uint16_t *length, int32_t *data, const char **log = NULL)
**説明文**  
いくつかのDYNAMIXELからbulkRead関数で読み込んだデータを取得します。  

**Input**  
1. `id` : IDを設定する。
1. `id_num` : IDの数を設定する。
1. `address` : コントロールテーブル項目のアドレスを設定する。
1. `length` : コントロールテーブル項目の長さを設定する。
1. `data` : データを取得する。  

**戻り値**   
isAvailable命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool clearBulkReadParam(void)
**説明文**  
bulkRead用の全てのパラメーターをクリアします。  

**引数**    
**戻り値**  
パラメーターのクリア命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool torque(uint8_t id, bool onoff, const char **log = NULL)
**説明文**  
DYNAMIXELにトルクを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `onoff` : trueかfalseかを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool torqueOn(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELにトルクをかけます。

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool torqueOff(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELにかかっているトルクをオフに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool changeID(uint8_t id, uint8_t new_id, const char **log = NULL)
**説明文**  
DYNAMIXELのIDを変更します。

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `new_id` : DYNAMIXELの新しいIDを設定する。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool changeBaudrate(uint8_t id, uint32_t new_baudrate, const char **log = NULL)
**説明文**  
DYNAMIXELのボーレートを変更します。

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `new_baudrate` : DYNAMIXELの新しいボーレートを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool changeProtocolVersion(uint8_t id, uint8_t version, const char **log = NULL)
**説明文**  
DYNAMIXELのプロトコルバージョンを変更します。

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `version` : DYNAMIXELのプロトコルバージョンを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool itemWrite(uint8_t id, const char *item_name, int32_t data, const char **log = NULL)
**説明文**  
コントロールテーブルの項目にデータを書き込みます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `item_name` : コントロールテーブルの項目名を設定する（例：目標位置、目標速度、...）  
1. `data` : データを設定する。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool itemRead(uint8_t id, const char *item_name, int32_t *data, const char **log = NULL)
**説明文**  
コントロールテーブルの項目へデータを読み込みます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `item_name` : コントロールテーブルの項目名を設定する（例：目標位置、目標速度、...）  
1. `data` : データを取得する。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool led(uint8_t id, bool onoff, const char **log = NULL)
**説明文**  
DYNAMIXELのLEDをオンもしくはオフに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `onoff` : trueもしくはfalseかを設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool ledOn(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのLEDをオンに設定します。

**引数**    
1. `id` : DYNAMIXELのIDを設定する。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool ledOff(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのLEDをオンもしくはオフに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `onoff` : trueもしくはfalseかを設定する。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setNormalDirection(uint8_t id, const char **log = NULL)
**Description**  
DYNAMIXELを通常の方向（反時計回り）に回転するように設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setReverseDirection(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELを逆回転（時計回り）するように設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setVelocityBasedProfile(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELを設定すると、速度ベースのプロファイルが作成されます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setTimeBasedProfile(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELを設定すると、時間ベースのプロファイルが作成されます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setSecondaryID(uint8_t id, uint8_t secondary_id, const char **log = NULL)
**説明文**  
セカンダリIDを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `secondary_id` : DYNAMIXELのセカンダリIDを設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setCurrentControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELに電流制御モードを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setTorqueControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELにトルク制御モードを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setVelocityControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELに速度制御モードを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setPositionControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELに位置制御モードを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setExtendedPositionControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELに拡張位置制御モードに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setMultiTurnControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELにマルチターン制御モードを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setCurrentBasedPositionControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELに電流による位置制御モードを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setPWMControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELにPWM制御モードを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setOperatingMode(uint8_t id, uint8_t index, const char **log = NULL)
**説明文**  
DYNAMIXELに動作モードを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `index` : 設定したい動作モードを選択する。

- インデックス一覧
```c++
static const uint8_t CURRENT_CONTROL_MODE                  = 0;
static const uint8_t VELOCITY_CONTROL_MODE                 = 1;
static const uint8_t POSITION_CONTROL_MODE                 = 3;
static const uint8_t EXTENDED_POSITION_CONTROL_MODE        = 4;
static const uint8_t CURRENT_BASED_POSITION_CONTROL_MODE   = 5;
static const uint8_t PWM_CONTROL_MODE                      = 16;
static const uint8_t TORQUE_CONTROL_MODE                   = 100;
static const uint8_t MULTI_TURN_MODE                       = 101;
```

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool jointMode(uint8_t id, int32_t velocity = 0, int32_t acceleration = 0, const char **log = NULL)
**説明文**  
DYNAMIXELにジョイントモードを設定します。任意のDYNAMIXELにジョイントモードを簡単に設定することができます。ジョイントモードが正常に設定されると、トルクがオンになります。
速度と加速度のパラメーターは、プロファイルを作成する際の引数として使用されます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `velocity` : プロファイル速度を設定する、
1. `acceleration` : プロファイルの加速度を設定する。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool wheelMode(uint8_t id, int32_t acceleration = 0, const char **log = NULL)
**説明文**  
DYNAMIXELに車輪モードを設定します。任意のDYNAMIXELに車輪モードを簡単に設定することができます。車輪モードが正常に設定されると、トルクがオンになります。
加速度のパラメーターは、プロファイルを作成する際の引数として使用されます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `acceleration` : プロファイルの加速度を設定する。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool currentBasedPositionMode(uint8_t id, int32_t current = 0, const char **log = NULL)
**説明文**  
DYNAMIXELに電流による位置制御モードを設定します。DYNAMIXEL-Xシリーズに電流によって制御されるジョイントモードを簡単に設定することができます。モードが正常に設定されると、トルクがオンになります。
プロファイルを作成する際には、電流のパラメーターが引数として使用されます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `current` : 電流の制限を設定する。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool goalPosition(uint8_t id, int32_t value, const char **log = NULL)
**説明文**  
DYNAMIXELに位置を設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `value` : 32ビットのraw値を設定する。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool goalPosition(uint8_t id, float radian, const char **log = NULL)
**説明文**  
DYNAMIXELに位置を設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `radian` : 位置を設定する。単位はラジアン  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool goalVelocity(uint8_t id, int32_t value, const char **log = NULL)
**説明文**  
DYNAMIXELに速度を設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `value` : 3232ビットのraw値を設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool goalVelocity(uint8_t id, float velocity, const char **log = NULL)
**説明文**  
DYNAMIXELに速度を設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `velocity` : 速度を設定する。単位はm/s  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getPresentPositionData(uint8_t id, int32_t* data, const char **log = NULL)
**説明文**  
DYNAMIXELから現在の位置を取得します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `data` : 32ビットのraw値を取得する。  

**戻り**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getRadian(uint8_t id, float* radian, const char **log = NULL)
**説明文**  
DYNAMIXELから現在の位置を取得します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `radian` : 位置を設定する。単位はラジアン  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getPresentVelocityData(uint8_t id, int32_t* data, const char **log = NULL)
**説明文**  
DYNAMIXELから現在の位置を取得します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `data` : 32ビットのraw値を取得する。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getVelocity(uint8_t id, float* velocity, const char **log = NULL)
**説明文**  
DYNAMIXELから現在の位置を取得します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。
1. `velocity` : 速度を設定する。単位はm/s  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### int32_t convertRadian2Value(uint8_t id, float radian)
**Description**  
Convert radian to 32-bit raw data

**Input**    
1. `id` : Set DYNAMIXEL ID
1. `radian` : Set position. Unit is radian

**Output**  
Return 32-bit raw data for DYNAMIXEL

### float convertValue2Radian(uint8_t id, int32_t value)
**Description**  
Convert 32-bit raw data to radian

**Input**    
1. `id` : Set DYNAMIXEL ID
1. `value` : Get 32-bit raw data

**Output**  
Return position. Unit is radian

### int32_t convertRadian2Value(float radian, int32_t max_position, int32_t min_position, float max_radian, float min_radian)
**Description**  
Convert radian to 32-bit raw data

**Input**    
1. `radian` : Set position. Unit is radian
1. `max_position` : Set max position. Unit is 32-bit raw data
1. `min_position` : Set min position. Unit is 32-bit raw data
1. `max_radian` : Set max radian
1. `min_radian` : Set min radian

**Output**  
Return 32-bit raw data for DYNAMIXEL

### float convertValue2Radian(int32_t value, int32_t max_position, int32_t min_position, float max_radian, float min_radian)
**Description**  
Convert 32-bit raw data to radian

**Input**    
1. `value` : Set 32-bit raw data
1. `max_position` : Set max position. Unit is 32-bit raw data
1. `min_position` : Set min position. Unit is 32-bit raw data
1. `max_radian` : Set max radian
1. `min_radian` : Set min radian

**Output**  
Return position. Unit is radian

### int32_t convertVelocity2Value(uint8_t id, float velocity)
**Description**  
Convert velocity to 32-bit raw data

**Input**    
1. `id` : Set DYNAMIXEL ID
1. `velocity` : Set velocity. Unit is m/s

**Output**  
Return 32-bit raw data

### float convertValue2Velocity(uint8_t id, int32_t value)
**Description**  
Convert 32-bit raw data to velocity

**Input**    
1. `id` : Set DYNAMIXEL ID
1. `value` : Set 32-bit raw data

**Output**  
Return velocity. Unit is m/s

### int16_t convertCurrent2Value(float current)
**Description**  
Convert current to 16-bit raw data.

**Input**    
1. `current` : Set current. Unit is m/A

**Output**  
Return 16-bit raw data

### float convertValue2Current(int16_t value)
**Description**  
Convert 16-bit raw data to current

**Input**    
1. `value` : Set 16-bit raw data

**Output**  
Return current. Unit is m/A

### float convertValue2Load(int16_t value)
**Description**  
Convert 16-bit raw data to load

**Input**    
1. `value` : Set 16-bit raw data

**Output**  
Return load. Unit is %

[dynamixel_workbench_msgs/DynamixelInfo]: /docs/en/popup/dynamixel_workbench_msgs_DynamixelInfo/
[dynamixel_workbench_msgs/DynamixelCommand]: /docs/en/popup/dynamixel_workbench_msgs_DynamixelCommand/
[dynamixel_workbench_msgs/DynamixelStateList]: /docs/en/popup/dynamixel_workbench_msgs_DynamixelStateList/
[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[How to set Industrial filter into joint trajectory]: /docs/en/popup/how_to_set_smoothing_filter/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[DYNAMIXEL Wizard 2.0]: /docs/en/software/dynamixel/dynamixel_wizard2/
[R+ Manager 2.0]: /docs/en/software/rplus2/manager/
[AX-12W]: /docs/en/dxl/ax/ax-12w/
[AX-12+/12A]: /docs/en/dxl/ax/ax-12a/
[AX-18F/18A]: /docs/en/dxl/ax/ax-18a/
[EX-106+]: /docs/en/dxl/ex/ex-106+/   
[RX-10]: /docs/en/dxl/rx/rx-10/
[RX-24F]: /docs/en/dxl/rx/rx-24f/
[RX-28]: /docs/en/dxl/rx/rx-28/
[RX-64]: /docs/en/dxl/rx/rx-64/
[MX-12W]: /docs/en/dxl/mx/mx-12w/
[MX-28]: /docs/en/dxl/mx/mx-28/
[MX-28(2.0)]: /docs/en/dxl/mx/mx-28-2/
[MX-64]: /docs/en/dxl/mx/mx-64/
[MX-64(2.0)]: /docs/en/dxl/mx/mx-64-2/
[MX-106]: /docs/en/dxl/mx/mx-106/
[MX-106(2.0)]: /docs/en/dxl/mx/mx-106-2/
[XL320]: /docs/en/dxl/x/xl320/
[XL430-W250]: /docs/en/dxl/x/xl430-w250/
[2XL430-W250]: /docs/en/dxl/x/2xl430-w250/
[XC430-W150]: /docs/en/dxl/x/xc430-w150/
[XC430-W240]: /docs/en/dxl/x/xc430-w240/
[XM430-W210]: /docs/en/dxl/x/xm430-w210/
[XM430-W350]: /docs/en/dxl/x/xm430-w350/
[XH430-W210]: /docs/en/dxl/x/xh430-w210/
[XM540-W150]: /docs/en/dxl/x/xm540-w150/
[XM540-W270]: /docs/en/dxl/x/xm540-w270/
[XH430-W350]: /docs/en/dxl/x/xh430-w350/
[XH430-V210]: /docs/en/dxl/x/xh430-v210/
[XH430-V350]: /docs/en/dxl/x/xh430-v350/
[XH540-W150]: /docs/en/dxl/x/xh540-w150/
[XH540-W270]: /docs/en/dxl/x/xh540-w270/
[XH540-V150]: /docs/en/dxl/x/xh540-v150/
[XH540-V270]: /docs/en/dxl/x/xh540-v270/
[H54-200-S500-R]: /docs/en/dxl/pro/h54-200-s500-r/
[H54-100-S500-R]: /docs/en/dxl/pro/h54-100-s500-r/
[H42-20-S300-R]: /docs/en/dxl/pro/h42-20-s300-r/
[M54-60-S250-R]: /docs/en/dxl/pro/m54-60-s250-r/
[M54-40-S250-R]: /docs/en/dxl/pro/m54-40-s250-r/
[M42-10-S260-R]: /docs/en/dxl/pro/m42-10-s260-r/
[H54-200-S500-R(A)]: /docs/en/dxl/pro/h54-200-s500-ra/
[H54-100-S500-R(A)]: /docs/en/dxl/pro/h54-100-s500-ra/
[H42-20-S300-R(A)]: /docs/en/dxl/pro/h42-20-s300-ra/
[M54-60-S250-R(A)]: /docs/en/dxl/pro/m54-60-s250-ra/
[M54-40-S250-R(A)]: /docs/en/dxl/pro/m54-40-s250-ra/
[M42-10-S260-R(A)]: /docs/en/dxl/pro/m42-10-s260-ra/
[L54-50-S500-R]: /docs/en/dxl/pro/l54-50-s500-r/
[L54-50-S290-R]: /docs/en/dxl/pro/l54-50-s290-r/
[L54-30-S500-R]: /docs/en/dxl/pro/l54-30-s500-r/
[L54-30-S400-R]: /docs/en/dxl/pro/l54-30-s400-r/
[L42-10-S300-R]: /docs/en/dxl/pro/l42-10-s300-r/
[PH42-020-S300-R]: /docs/en/dxl/p/ph42-020-s300-r/
[PH54-100-S500-R]: /docs/en/dxl/p/ph54-100-s500-r/
[PH54-200-S500-R]: /docs/en/dxl/p/ph54-200-s500-r/
[PM54-060-S250-R]: /docs/en/dxl/p/pm54-060-s250-r/
[PM54-040-S250-R]: /docs/en/dxl/p/pm54-040-s250-r/
[PM42-010-S260-R]: /docs/en/dxl/p/pm42-010-s260-r/
