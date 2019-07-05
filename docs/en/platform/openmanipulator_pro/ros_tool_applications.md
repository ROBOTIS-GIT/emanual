---
layout: archive
lang: en
ref: openmanipulator_pro_ros_tool_applications
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_pro/ros_tool_applications/
sidebar:
  title: OpenMANIPULATOR-PRO
  nav: "openmanipulator_pro"
---

<div style="counter-reset: h1 7"></div>

# [[ROS] Tool Applications](#ros-tool-application)

## [RH-P12-RN Gripper](#rh-p12-rn-gripper)

### [Parts List](#parts-list)

|                     | Part Name           | Quantity |
|:--------------------|:--------------------|:--------:|
| **Necessary Parts** | OpenMANIPULATOR_PRO |    1     |
| .                   | RH-P12-RN (Gripper) |    1     |
| **Chassis Parts**   | FRP42_A110K         |    1     |
| **Cables**          | CABLE_4P_180MM      |    1     |
| **Miscellaneous**   | WB_M3X08_NYLOK_K    |    12    |


![](/assets/images/platform/openmanipulator_pro/open_manipulator_gripper_assembly_01.png)

### [Assembly Manual](#assembly-manual)

1. Fix FRP42_A110K to the tip of OpenMANIPUALTOR-PRO with eight WB_M3X08_NYLOK_K screws.
 
    ![](/assets/images/platform/openmanipulator_pro/open_manipulator_gripper_assembly_02.png)

2. Assemble RH-P12-RN Gripper on fixed frame(FRP42_A110K) and tighten four WB_M3X08_NYLOK_K screws.
  
    ![](/assets/images/platform/openmanipulator_pro/open_manipulator_gripper_assembly_03.png)
    
    **NOTE** : There are 2 more holes on the other side for screws.
    {: .notice}

3. Connect OpenMANIPULATOR-PRO and RH-P12-RN with CABLE_4P_180MM Cable.

    ![](/assets/images/platform/openmanipulator_pro/open_manipulator_gripper_assembly_04.png)


### [Operation](#operation)

**NOTE** :This instruction has been tested on Ubuntu 16.04 and ROS Kinetic Kame.
{: .notice}

Please, open the Terminal then run **roscore** along with following command.  

```bash
$ roscore
```
 
After running **roscore**, open another Terminal then write the following commands in Terminal.  

```bash
$ roslaunch open_manipulator_pro_controller open_manipulator_pro_controller.launch with_gripper:=true
```

#### [GUI Program](#gui-program)

```bash
$ roslaunch open_manipulator_pro_control_gui open_manipulator_pro_control_gui.launch with_gripper:=true
```

#### [Teleoperation](#teleoperation)

**Keyboard**  
You can do Teleoperation with a keyboard on your pc.

```bash
$ roslaunch open_manipulator_pro_teleop open_manipulator_pro_teleop_keyboard.launch with_gripper:=true
```

**PS4 & XBOX 360 Joystick**  
You can do Teleoperation with a joystic.

```bash
$ export ROS_NAMESPACE=open_manipulator_pro
$ roslaunch teleop_twist_joy teleop.launch
$ roslaunch open_manipulator_pro_teleop open_manipulator_pro_teleop_joystick.launch with_gripper:=true
```
