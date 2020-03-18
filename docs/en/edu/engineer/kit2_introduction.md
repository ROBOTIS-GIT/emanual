---
layout: archive
lang: en
ref: kit2
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/engineer/kit2_introduction/
sidebar:
  title: ENGINEER Kit2
  nav: "kit2"
---

# [Introduction](#introduction)

![](/assets/images/edu/engineer/kit1/enginner_main.png)

**ROBOTIS ENGINEER** is the next generation robot that adopts AI technology based on smart devices.  

- ROBOTIS ENGINEER Kit offers standardized curriculum for multi level robotics educational courses
- Joint structure allows diverse motions for versatile robots
- Supports 3D part designing and printing
- Compatible with R+ ENGINEER(Smart device app), R+ Task 3.0(PC software)
- Upgrade to Raspberry Pi and Camera

## [Parts List](#parts-list)

![](/assets/images/edu/engineer/kit1/parts_list.png)

### [CM-550 Controller](#cm-550-controller)

#### [Specifications](#specifications)

|         Item          |                                                                               Specifications                                                                                |
|:---------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|        Weight         |                                                                                  58.8 [g]                                                                                   |
|          MCU          |                                                                     ARM Cortex-M4 (168 [MHz], 32 [Bit])                                                                     |
|   Operating Voltage   | Battery : 6.5 ~ 15 [V], **Recommended 11.1 [V] (Li-PO 3cell)**<br />SMPS : 6.5 ~ 15 [V], **Recommended 12.0 [V]**<br />Micro USB : 4.75 ~ 5.25 [V], **Recommended 5.0 [V]** |
|  Current Consumption  |                              Standby : 50 [mA]<br />Port 1 ~ 2 I/O Max : 0.5 [A]<br />Port 3 ~ 5 I/O Max : 0.02 [A]<br />Total : 10 [A] (Fuse)                              |
| Operating Temperature |                                                                              -5 ~ 70 [&deg;C]                                                                               |
| Communication Module  |                                                                              BLE Slave Module                                                                               |
| Internal I/O Devices  |  Buttons : 2 (MODE, START)<br />Mic (Sound Detection) : 1<br />Buzzer : 1<br />Voltage Sensor : 1<br />Gyro Accelerometer : 1<br />Temperature Sensor : 1<br />RGB LED : 3  |
| External I/O Devices  |                                   ROBOTIS 5 Pin Port : 5 (SM-10 / IR Array / TMS-10 : Use Port 1 or 2)<br />X series DYNAMIXEL Ports : 6                                    |


#### [CM-550 Layout](#cm-550-layout)

![](/assets/images/edu/engineer/kit1/cm550_1.png)

![](/assets/images/edu/engineer/kit1/cm550_2.png)

- `USB` Micro USB Port : The 5 pin micro USB cable can be used to connect to the USB port of the PC.
- `UART` Communication Port : BT-210, BT-410, LN-101, IR receiver or other communication modules can be connected.
- `BAT` Battery Socket : Provided Li-Po battery can be connected.
- `12VDC` DC Input : The DC barrel jack of provided SMPS can be connected.
- `POWER` Power Switch : Controls the power supply of the controller.
- Status LED : Displays voltage level and wireless device connection status with RGB LED.
- `MODE` MODE LED : This RGB LED displays the operating mode of CM-550. Please refer to the [Operating Mode] of CM-550.
- `START` START LED : Please refer to the [Operating Mode] of CM-550.
- `MODE` MODE Button : The operating mode can be changed with this button. Please refer to the [Operating Mode] of CM-550.
- `START` START Button : This button runs selected operating mode. Please refer to the [Operating Mode] of CM-550.
- `DXL` DYNAMIXEL-X Series Port : DYNAMIXEL-X series can be connected in any of these ports.
- `PORT` ROBOTIS 5 Pin Port : Sensors such as DMS, Touch sensor, IR sensor can be connected.  
  Servo motor, IR array sensor, Temperature & Humidity sensor can only be connected to Port 1 or 2.
- `MIC` Internal Microphone : The integrated microphone detects clapping sound.
- `FUSE` Fuse : 10A fuse protects electric damage.

**CAUTION** : The USB port on CM-550 is designed to be connected with the PC. Please do **NOT** connect other USB devices, or it may cause damage to the controller.
{: .notice--warning}

**[CM-550 eManual]{: .blank}**
{: .notice}

### [2XL430-W250 DYNAMIXEL](#2xl430-w250-dynamixel)

![](/assets/images/edu/engineer/kit1/2xl430_intro.png)

**2XL430-W250** is a ground breaking DYNAMIXEL that allows to control **2 axis(2 DOF)** with a single module. In order to control 2 axis at the same time, each axle is assigned with different ID while sharing an identical Baudrate. Since the Control Table for each axle is separated except the Baudrate, 2XL can be applied in various applications.  

The usage is identical to other DYNAMIXEL's, but be aware that Firmware Recovery will reset both axis to factory settings.

| Item                   | Specifications                                            |
|:-----------------------|:----------------------------------------------------------|
| MCU                    | {{ site.data.dxl_x_info.2xl430-w250.mcu }}                |
| Position Sensor        | {{ site.data.dxl_x_info.2xl430-w250.encoder }}            |
| Motor                  | {{ site.data.dxl_x_info.2xl430-w250.motor }}              |
| Baud Rate              | {{ site.data.dxl_x_info.2xl430-w250.baudrate }}           |
| Control Algorithm      | {{ site.data.dxl_x_info.2xl430-w250.control }}            |
| Resolution             | {{ site.data.dxl_x_info.2xl430-w250.resolution }}         |
| Operating Modes        | {{ site.data.dxl_x_info.2xl430-w250.mode_en }}            |
| Weight                 | {{ site.data.dxl_x_info.2xl430-w250.weight }}             |
| Dimensions (W x H x D) | {{ site.data.dxl_x_info.2xl430-w250.dimensions }}         |
| Gear Ratio             | {{ site.data.dxl_x_info.2xl430-w250.gearratio }}          |
| Stall Torque           | {{ site.data.dxl_x_info.2xl430-w250.stalltorque }}        |
| No Load Speed          | {{ site.data.dxl_x_info.2xl430-w250.noloadspeed }}        |
| Operating Temperature  | {{ site.data.dxl_x_info.2xl430-w250.temperature }}        |
| Input Voltage          | {{ site.data.dxl_x_info.2xl430-w250.voltage_en }}         |
| Command Signal         | {{ site.data.dxl_x_info.2xl430-w250.command }}            |
| Protocol Type          | {{ site.data.dxl_x_info.2xl430-w250.protocoltype }}       |
| Physical Connection    | {{ site.data.dxl_x_info.2xl430-w250.physicalconnection }} |
| ID                     | {{ site.data.dxl_x_info.2xl430-w250.id }}                 |
| Feedback               | {{ site.data.dxl_x_info.2xl430-w250.feedback }}           |
| Part Material          | {{ site.data.dxl_x_info.2xl430-w250.material }}           |
| Standby Current        | {{ site.data.dxl_x_info.2xl430-w250.standbycurrent }}     |

**[2XL430-W250 eManual]{: .blank}**
{: .notice}

## [Cautions](#cautions)

### [Safety Precautions](#safety-precautions)

{% capture eng_kit1_danger1 %}  
![](/assets/images/icon_warning.png)  
1. Read this manual carefully before getting started.
2. Only use provided tools in the kit.
3. Keep the robot away from the face and body when the robot is operating.
4. Be careful for getting fingers or part of the body stuck in the robot joints.
5. Do not operate or store the robot under the direct sunlight.
6. Do not operate or store the robot near water or heat source.
7. Do not tamper or disassemble components.
8. Keep the robot and parts away from infants or younger children.
9. Do not impact or poke the robot with sharp objects.
{% endcapture %}
<div class="notice--danger">{{ eng_kit1_danger1 | markdownify }}</div>


### [Precautions on Use](#precautions-on-use)

{% capture eng_kit1_danger2 %}  
1. Use provided screwdriver(PH 1) in the kit for tightening screws.
2. Do not apply excessive force on screws and parts when assembling.
3. Operate the robot on the floor to avoid any damages from falling.
4. Accidental damages from falling is not covered by warranty.
5. DYNAMIXEL internal gears and robot joints are expendables. Excessive use or long term use may develop the backlash.
{% endcapture %}
<div class="notice--warning">{{ eng_kit1_danger2 | markdownify }}</div>

### [Precautions on Battery](#precautions-on-battery)

{% capture eng_kit1_danger3 %}  
![](/assets/images/icon_warning.png)  
1. The battery must be disconnected from the robot when not used or charged with the designated charger.
2. Do not disassemble or impact the battery or charger.
3. Do not heat the battery and avoid contact with fire and liquids.
4. Do not place battery in the microwave, laundry machine, refrigerator, or dryer.
5. Do not use damaged batteries (deformed, swollen, external damages).
6. Do not short the battery.
7. Do not reverse the polarity of the battery when charging.
8. Do not charge the battery when it is hot. Let the battery cools down to the room temperature before charging
9. Do not store the battery in hot or humid place.
10. Do not charge multiple batteries with the charger at the same time.
11. Do not connect the battery to the charger when the charger is not connected to the power source.
{% endcapture %}
<div class="notice--danger">{{ eng_kit1_danger3 | markdownify }}</div>

### [Assembly Precautions](#assembly-precautions)

#### [DYNAMIXEL Assembly](#dynamixel-assembly)

- In order to control 2 axis at the same time, each axle is assigned with different ID while sharing an identical Baudrate.  
- The ID and Status LED is located on the opposite side of the output horn.  
- ROBOTIS ENGINEER uses bolts to securely assemble the robot joints (Below image shows where bolts are required to attach the frame on DYNAMIXEL).

![](/assets/images/edu/engineer/kit1/2xl430_assembly_caution_1.png)

![](/assets/images/edu/engineer/kit1/2xl430_assembly_caution_2.png)

**CAUTION** : Please use the designated screw driver(PH 1) when assembling bolts.
{: .notice--warning}

##### [Check DYNAMIXEL ID](#check-dynamixel-id)

![](/assets/images/edu/engineer/kit1/2xl430_id.png)

##### [Check DYNAMIXEL Horn Position](#check-dynamixel-horn-position)

![](/assets/images/edu/engineer/kit1/2xl430_horn.png)  

{% capture warning_01 %}  
**CAUTION**  
- The marking on the housing should match to the horn marking when properly centered.  
- In order to align the horn to the center, use PH 1 screw driver to rotate the horn screw to clockwise. Be aware of rotating the screw to counter clockwise as it will release the screw.  
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

#### [Rivet Assembly](#rivet-assembly)

##### 6mm Rivet

![](/assets/images/edu/engineer/kit1/rivet_assembly_6mm.png)  

**CAUTION** : When reusing rivets, the pin hole must be inserted first. Used rivet will not be separated into pin and pinhole.
{: .notice--warning}

##### 12mm Rivet

![](/assets/images/edu/engineer/kit1/rivet_assembly_12mm.png)


#### [Cable Assemlby](#cable-assembly)

##### Connector

Both connectors are linked to supply power and communication to the module. Please use any connector for easier assembly.

![](/assets/images/edu/engineer/kit1/cable_assembly_1.png)

##### Wiring through Idler Cap

![](/assets/images/edu/engineer/kit1/cable_assembly_2.png)

**NOTE** :  
Through hole wiring method helps to increase the durability of cable and to simplify cable assembly.  
It is not a mandatory and it may require more time to replace the cable afterward.
{: .notice--info}
