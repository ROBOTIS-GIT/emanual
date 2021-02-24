---
layout: archive
lang: en
ref: openmanipulator_x_quick_start_guide
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/quick_start_guide/
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 4
---

<div style="counter-reset: h1 3"></div>

# [Quick Start Guide](#quick-start-guide)

This step by step quick start guide for running OpenMANIPULATOR-X on ROS<sup>TM</sup> will guide you to operate the OpenMANIPULATOR-X for the first time.  

In order to run this guide, you should be prepared with below items. 
- [OpenMANIPULATOR-X](http://en.robotis.com/shop_en/item.php?it_id=905-0024-000)
- Communication Interface
  - Option 1 : [DYNAMIXEL Starter Set](http://en.robotis.com/shop_en/list.php?ca_id=302050)
  - Option 2 : [OpenCR1.0](http://en.robotis.com/shop_en/item.php?it_id=903-0257-000)
- Power supply
  - [ROBOTIS SMPS 12V 5A PS-10](http://en.robotis.com/shop_en/list.php?ca_id=3020a0&sort=&sortodr=&page=1) recommended (included in the DYNAMIXEL Starter Set)

**On Ubuntu 16.04 and ROS1 Kinetic Kame, please follow the GREEN Instructions only.**  

{% capture kinetic_00 %}
For `Kinetic` only.  
**These Green instructions are tested with the following environment**  
- Intel NUC
- Ubuntu 16.04
- ROS 1 Kinetic Kame
- Official ROBOTIS OpenMANIPULATOR-X package
{% endcapture %}
<div class="notice--success">{{ kinetic_00 | markdownify }}</div>

**On Ubuntu 18.04 and ROS2 Dashing Diademata, please follow the RED Instructions only.**

{% capture dashing_00 %}
For `Dashing` only.  
**These Red instructions are tested with the following environment**  
- Intel NUC
- Ubuntu 18.04
- ROS 2 Dashing Diademata
- Official ROBOTIS OpenMANIPULATOR-X package
{% endcapture %}
<div class="notice--danger">{{ dashing_00 | markdownify }}</div>

## Install Ubuntu
Install Ubuntu based on your selection of ROS<sup>TM</sup> version.
- ROS 1 Kinetic Kame : Ubuntu 16.04
- ROS 2 Dashing Diademata : Ubuntu 18.04

[See Ubuntu Installation Tutorial](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)

## Install ROS on PC

It is strongly recommended to install ROS with the script provided in the below command.
If you decided to install ROS with the official ROS instruction, refer to the [Manual Setting](#manual-setting) section after installing ROS.

{% capture kinetic_01 %}
For `Kinetic`  
```bash
$ sudo apt update && sudo apt upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh
$ chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```
{% endcapture %}
<div class="notice--success">{{ kinetic_01 | markdownify }}</div>

{% capture dashing_01 %}
For `Dashing`  
```bash
$ sudo apt update && sudo apt upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_dashing.sh
$ chmod 755 ./install_ros2_dashing.sh && bash ./install_ros2_dashing.sh
```
{% endcapture %}
<div class="notice--danger">{{ dashing_01 | markdownify }}</div>

### Manual Configuration
Please do **NOT** enter below commands if you have already installed ROS with above instructions.

{% capture kinetic_02 %}
For `Kinetic`  
```bash
$ sudo apt-get install git
$ mkdir -p ~/catkin_ws/src
$ cd ~/catkin_ws
$ echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
$ echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
$ echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc"
$ source ~/.bashrc
```
{% endcapture %}
<div class="notice--success">{{ kinetic_02 | markdownify }}</div>

{% capture dashing_02 %}
For `Dashing`  
```bash
$ sudo apt install git
$ mkdir -p ~/colcon_ws/src
$ cd ~/colcon_ws
$ colcon build --symlink-install
$ echo "source /opt/ros/dashing/setup.bash" >> ~/.bashrc
$ echo "source ~/colcon_ws/install/local_setup.bash" >> ~/.bashrc
```
{% endcapture %}
<div class="notice--danger">{{ dashing_02 | markdownify }}</div>

## Install OpenMANIPULATOR-X Packages
The following commands will download OpenMANIPULATOR-X package source codes and build them.

{% capture kinetic_03 %}
For `Kinetic`  
```bash
$ source ~/.bashrc
$ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-industrial-core
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git
$ cd ~/catkin_ws && catkin_make
```
{% endcapture %}
<div class="notice--success">{{ kinetic_03 | markdownify }}</div>

{% capture dashing_03 %}
For `Dashing`  
```bash
$ source ~/.bashrc
$ sudo apt install ros-dashing-python* ros-dashing-rqt* ros-dashing-joint-state-publisher
$ cd ~/colcon_ws/src/  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/DynamixelSDK.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/dynamixel-workbench.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_dependencies.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/robotis_manipulator.git  
$ cd ~/robotis_ws && colcon build --symlink-install
```
{% endcapture %}
<div class="notice--danger">{{ dashing_03 | markdownify }}</div>

## Hardware Setup

There are two available hardware setup for OpenMANIPULATOR. Please select one of the below options.  
After completing this section, turn on the power switch and check if all DYNAMIXEL LED blink once.
- Option 1 : [U2D2](#option-1-u2d2-hardware-setup)
- Option 2 : [OpenCR](#option-2-opencr-hardware-setup)

### [Option 1] U2D2 Hardware Setup
![](/assets/images/platform/openmanipulator_x/OpenManipulator_u2d2_setup2.png)

{% capture kinetic_04 %}
For `Kinetic` + `U2D2`  
```bash
$ roscore
```

Open another terminal and run below command

```bash
$ rosrun open_manipulator_controller create_udev_rules
```
{% endcapture %}
<div class="notice--success">{{ kinetic_04 | markdownify }}</div>

{% capture dashing_04 %}
For `Dashing` + `U2D2`  
```bash
$ ros2 run open_manipulator_x_controller create_udev_rules
```
{% endcapture %}
<div class="notice--danger">{{ dashing_04 | markdownify }}</div>

{% capture note_00 %}
`FAQ`
- You can open a new terminal window by pressing `ALT` + `CTRL` + `T`.
{% endcapture %}
<div class="notice--warning">{{ note_00 | markdownify }}</div>

### [Option 2] OpenCR Hardware Setup
![](/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_setup2.png)

{% capture kinetic_05 %}
For `Kinetic` + `OpenCR`  
```bash
$ wget https://github.com/ROBOTIS-Will/OpenCR/raw/master/arduino/opencr_arduino/tools/opencr_tools_1.0.0/opencr_ld
$ wget https://github.com/ROBOTIS-Will/OpenCR/raw/master/arduino/opencr_arduino/tools/opencr_tools_1.0.0/usb_to_dxl.ino.bin
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/99-opencr-cdc.rules
$ sudo cp ./99-opencr-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
$ sudo chmod 775 opencr_ld
$ ./opencr_ld /dev/ttyACM0 115200 usb_to_dxl.ino.bin 1
```
{% endcapture %}
<div class="notice--success">{{ kinetic_05 | markdownify }}</div>

{% capture dashing_05 %}
For `Dashing` + `OpenCR`  
```bash
$ wget https://github.com/ROBOTIS-Will/OpenCR/raw/master/arduino/opencr_arduino/tools/opencr_tools_1.0.0/opencr_ld
$ wget https://github.com/ROBOTIS-Will/OpenCR/raw/master/arduino/opencr_arduino/tools/opencr_tools_1.0.0/usb_to_dxl.ino.bin
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/99-opencr-cdc.rules
$ sudo cp ./99-opencr-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
$ sudo chmod 775 opencr_ld
$ ./opencr_ld /dev/ttyACM0 115200 usb_to_dxl.ino.bin 1
```
{% endcapture %}
<div class="notice--danger">{{ dashing_05 | markdownify }}</div>

{% capture note_03 %}
`FAQ`  
In case of getting below failure, try downloading the firmware again.
```bash
test@Intel-NUC:~$ ./opencr_ld /dev/ttyACM0 115200 usb_to_dxl.ino.bin 1
opencr_ld ver 1.0.4
opencr_ld_main
>>
file name : usb_to_dxl.ino.bin
file size : 111 KB
ser_open: unable to open port: Device or resource busy
Fail to open port 1 : /dev/ttyACM0
Fail to jump to boot
```
{% endcapture %}
<div class="notice--warning">{{ note_03 | markdownify }}</div>

## Operate the OpenMANIPULATOR-X

Please note that this instruction is written for the **ROBOTIS official OpenMANIPULATOR-X package**. If you are operating a home made OpenMANIPULATOR-X, make sure to configure each DYNAMIXEL as below before operating.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_id_baudrate.png)

{% capture note_01 %}
`FAQ`
- You can configure your DYNAMIXEL using [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/).
- After completing the [Hardware Setup](#hardware-setup) section, use DYNAMIXEL Wizard 2.0 to configure the DYNAMIXEL.
{% endcapture %}
<div class="notice--warning">{{ note_01 | markdownify }}</div>

### Launch Controller

After running this section, software controller that controls the OpenMANIPULAOTR-X will be launched and OpenMANIPULATOR-X will become stiff (Torque On).  
Please select proper instruction based on your software and hardware combination.

{% capture kinetic_06 %}
for `Kinetic` + `U2D2`  

Close all terminal window and open a new one.
```bash
$ roscore
```

Open another terminal and enter below command
```bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch
```
{% endcapture %}
<div class="notice--success">{{ kinetic_06 | markdownify }}</div>

{% capture kinetic_07 %}
for `Kinetic` + `OpenCR`

Close all terminal window and open a new one.
```bash
$ roscore
```

Open another terminal and enter below command
```bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch usb_port:=/dev/ttyACM0 baud_rate:=1000000
```
{% endcapture %}
<div class="notice--success">{{ kinetic_07 | markdownify }}</div>

Launch result on the terminal for `Kinetic` will look like below.  
```
SUMMARY
========

PARAMETERS
 * /open_manipulator/control_period: 0.01
 * /open_manipulator/moveit_sample_duration: 0.05
 * /open_manipulator/planning_group_name: arm
 * /open_manipulator/using_moveit: False
 * /open_manipulator/using_platform: True
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator (open_manipulator_controller/open_manipulator_controller)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator-1]: started with pid [23452]
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[ INFO] [1544509070.096942788]: Succeeded to init /open_manipulator
```

{% capture dashing_06 %}
For `Dashing` + `U2D2`  

Close all terminal window and open a new one.
```bash
$ ros2 launch open_manipulator_x_controller open_manipulator_x_controller.launch.py
```
{% endcapture %}
<div class="notice--danger">{{ dashing_06 | markdownify }}</div>

{% capture dashing_07 %}
For `Dashing` + `OpenCR`  

Close all terminal window and open a new one.
```bash
$ ros2 launch open_manipulator_x_controller open_manipulator_x_controller.launch.py usb_port:=/dev/ttyACM0
```
{% endcapture %}
<div class="notice--danger">{{ dashing_07 | markdownify }}</div>

Launch result on the terminal for `Dashing` will look like below.  
```
port_name and baud_rate are set to /dev/ttyUSB0, 1000000 
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[INFO] Succeeded to Initialise OpenManipulator-X Controller
```

{% capture note_02 %}
`FAQ`
- If you only see the part of result on Dashing, enter below command before launching the controller again.
```bash
$ export RCUTILS_CONSOLE_STDOUT_LINE_BUFFERED=1
```
- You can properly quit the program running on a terminal by pressing `CTRL` + `C`.
{% endcapture %}
<div class="notice--warning">{{ note_02 | markdownify }}</div>

### [Optional] 3D Visualization (RViz)

This section an **optional** that you can see the 3D visualization of OpenMANIPULATOR-X.

{% capture kinetic_08 %}
For `Kinetic`  

Open another terminal and enter below command
```bash
$ roslaunch open_manipulator_description open_manipulator_rviz.launch
```
{% endcapture %}
<div class="notice--success">{{ kinetic_08 | markdownify }}</div>

{% capture dashing_08 %}
For `Dashing`  

Open another terminal and enter below command
```bash
$ ros2 launch open_manipulator_x_description open_manipulator_x_rviz.launch.py
```
{% endcapture %}
<div class="notice--danger">{{ dashing_08 | markdownify }}</div>

You will see below RViz window after a successful launch.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_rviz.png)

### Operation

For Kinetic, two operation options are available. Please run only one method at a time.
- Option 1 : [GUI Program](#option-1-gui-program)
- Option 2 : [Keyboard](#option-2-keyboard)

#### [Option 1] GUI Program

{% capture kinetic_09 %}
For `Kinetic`  

Open another terminal and enter below command. Please refer to [GUI Program](/docs/en/platform/openmanipulator_x/ros_operation/#gui-program) section for more details.
```bash
$ roslaunch open_manipulator_control_gui open_manipulator_control_gui.launch
```
{% endcapture %}
<div class="notice--success">{{ kinetic_09 | markdownify }}</div>

{% capture dashing_09 %}
For `Dashing`, GUI Program is **not supported**.
{% endcapture %}
<div class="notice--danger">{{ dashing_09 | markdownify }}</div>

![](/assets/images/platform/openmanipulator_x/OpenManipulator_gui_default.png)

#### [Option 2] Keyboard

{% capture kinetic_10 %}
For `Kinetic`  

Open another terminal and enter below command.  
```bash
$ roslaunch open_manipulator_teleop open_manipulator_teleop_keyboard.launch
```
{% endcapture %}
<div class="notice--success">{{ kinetic_10 | markdownify }}</div>

{% capture dashing_10 %}
For `Dashing`  

Open another terminal and enter below command.  
```bash
$ ros2 run open_manipulator_x_teleop open_manipulator_x_teleop_keyboard
```
{% endcapture %}
<div class="notice--danger">{{ dashing_10 | markdownify }}</div>

You will see below interface on the terminal window after a successful launch.
```
  ---------------------------
  Control Your OpenMANIPULATOR-X!
  ---------------------------
  w : increase x axis in task space
  s : decrease x axis in task space
  a : increase y axis in task space
  d : decrease y axis in task space
  z : increase z axis in task space
  x : decrease z axis in task space

  y : increase joint 1 angle
  h : decrease joint 1 angle
  u : increase joint 2 angle
  j : decrease joint 2 angle
  i : increase joint 3 angle
  k : decrease joint 3 angle
  o : increase joint 4 angle
  l : decrease joint 4 angle

  g : gripper open
  f : gripper close

  1 : init pose
  2 : home pose

  q to quit
  ---------------------------
  Present Joint Angle J1: 0.000 J2: 0.000 J3: 0.000 J4: 0.000
  Present Kinematics Position X: 0.000 Y: 0.000 Z: 0.000
  ---------------------------
```

`FAQ` **For any issues with running OpenMANIPULATOR-X, submit an issue ticket on [GitHub Issue page](https://github.com/ROBOTIS-GIT/open_manipulator/issues)**.
{: .notice--warning}
