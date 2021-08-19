---
layout: archive
lang: en
ref: openmanipulator_x_tool_modification
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/tool_modification/
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 14
---

<div style="counter-reset: h1 9"></div>


# [Tool Modification](#tool-modification)

We are proposing a way to replace and manipulate tool(gripper) of manipulator to take advantage of OpenMANIPULATOR-X for a wider range of applications. Try the new application using the Pen holder or Vacuum gripper as shown in the example below, and create your own tool to challenge more applications.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_tool_modi.png" width="600">

## [Vacuum Gripper](#vaccum-gripper)

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/TR6DS9Zg_5I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Hardware Setup


Remove normal gripper of OpenMANIPULATOR-X and install a vacuum gripper. You can download the STL file of the vacuum gripper from the link in the table below, and print it to the 3D printer.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_vacuum_cad.png" width="1000">

Set vacuum gripper system referring [Instrucables page](https://www.instructables.com/id/Vacuum-Gripper-System-Using-OpenCR/).

- Part List

|                          | Part Name                                      | Quantity | Link                                                                                                                                                                                                                                                                         |
|:-------------------------|:-----------------------------------------------|:---------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **3D Printed Tool Part** | Vacuum Holder                                  | 1        | [Download Link](https://www.thingiverse.com/thing:3069574)                                                                                                                                                                                                                   |
| **Vacuum System**        | ARDUINO 4 RELAYS SHIELD                        | 1        | [shop Link](https://store.arduino.cc/usa/arduino-4-relays-shield)                                                                                                                                                                                                            |
| .                        | 12V Air Pump Motor                             | 1        | [shop Link](https://www.amazon.com/dp/B00DYA21PU/ref=sxbs_sxwds-stppvp_1?pf_rd_p=d45777d6-4c64-4117-8332-1659db52e64f&pd_rd_wg=4GrxM&pf_rd_r=B6N50VB3NHQT92HY91GK&pd_rd_i=B00DYA21PU&pd_rd_w=hP7Ev&pd_rd_r=f1ca7704-2522-4488-a625-16e3a8803027&ie=UTF8&qid=1547619718&sr=1) |
| .                        | UD0640-20-C (Air Tube 6Ø)                      | 1        | [shop Link](https://us.misumi-ec.com/vona2/detail/221000039579/?HissuCode=UD0640-20-C&PNSearch=UD0640-20-C&KWSearch=UD0640-20-C&searchFlow=results2type)                                                                                                                     |
| .                        | UD0860-20-C (Air Tube 8Ø)                      | 1        | [shop Link](https://us.misumi-ec.com/vona2/detail/221000039579/?HissuCode=UD0860-20-C&PNSearch=UD0860-20-C&KWSearch=UD0860-20-C&searchFlow=results2type)                                                                                                                     |
| .                        | MSCNL6-1 (Coupling 6Ø)                         | 1        | [shop Link](https://us.misumi-ec.com/vona2/detail/110300335060/?HissuCode=MSCNL6-1&PNSearch=MSCNL6-1&KWSearch=MSCNL6-1&searchFlow=results2type)                                                                                                                              |
| .                        | MSCNL8-1 (Coupling 8Ø)                         | 2        | [shop Link](https://us.misumi-ec.com/vona2/detail/110300335060/?HissuCode=MSCNL8-1&PNSearch=MSCNL8-1&KWSearch=MSCNL8-1&searchFlow=results2type)                                                                                                                              |
| .                        | MVPKE8 (Suction Cup)                           | 1        | [shop Link](https://us.misumi-ec.com/vona2/detail/110300346620/?HissuCode=MVPKE8&PNSearch=MVPKE8&KWSearch=MVPKE8&searchFlow=results2type)                                                                                                                                    |
| .                        | MHE3-M1H-3/2G-1/8 (Control Valve)              | 1        | [shop Link](https://www.festo.com/cat/en-us_us/products_MH2?CurrentIDCode1=MHE3-M1H-3%2F2G-1%2F8&CurrentPartNo=525146)                                                                                                                                                       |
| .                        | NEBV-Z4WA2L-P-E-2.5-N-LE2-S1 (Cable for Valve) | 1        | [shop Link](https://www.festo.com/cat/en-us_us/products_NEBV_V?CurrentIDCode1=NEBV-Z4WA2L-P-E-2.5-N-LE2&CurrentPartNo=8003577)                                                                                                                                               |

### Software Setup
Please refer the detailed description of [[OpenCR] Setup](/docs/en/platform/openmanipulator_x/opencr_setup/#opencr-setup)      
Download Arduino IDE and load OpenCR board on it

- [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

Find example source codes.

Go to `Examples` → `OpenManipulator` → `example` → `Chain` → `open_manipulator_chain_vacuum` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_arduino.png)

{% capture warning_01 %}

**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. It might stop operation because of joint position out of range.  
The picture on the below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque isn't enabled.    
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

## [Pen Holder](#pen-holder)

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/SIpV8Vuua_c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Hardware Setup

Remove normal gripper of OpenMANIPULATOR-X and install a pen holder. You can download the STL file of the pen holder from the link in the table below, and print it to the 3D printer.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_pen_cad.png" width="1000">

- Part List

|                          | Part Name  | Quantity | Link                                                       |
|:-------------------------|:-----------|:---------|:-----------------------------------------------------------|
| **3D Printed Tool Part** | Pen Holder | 1        | [Download Link](https://www.thingiverse.com/thing:3069574) |

### Software Setup
Please refer the detailed description of [[OpenCR] Setup](/docs/en/platform/OpenMANIPULATOR_x/opencr_setup/#opencr-setup)    
Download Arduino IDE and load OpenCR board on it

- [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

Find example source codes.

Go to `Examples` → `OpenManipulator` → `example` → `Chain` → `open_manipulator_chain_pen` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_arduino.png)

{% capture warning_01 %}

**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. It might stop operation because of joint position out of range.  
The picture on the below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque isn't enabled.    
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>


[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR Manual]: /docs/en/parts/controller/opencr10/
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/

[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[open_manipulator_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_msgs_SetActuatorState/
[open_manipulator_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_msgs_SetDrawingTrajectory/

[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/
[open_manipulator_msgs/OpenManipulatorState]: /docs/en/popup/open_manipulator_msgs_OpenManipulatorState/
[std_msgs::String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
