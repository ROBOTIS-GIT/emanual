---
layout: archive
lang: en
ref: dxl-selection-guide
read_time: true
share: true
author_profile: false
permalink: /docs/en/dxl/dxl-selection-guide/
sidebar:
  title: DYNAMIXEL Selection Guide
  nav: "dxl-selection-guide"
---

{::options parse_block_html="true" /}

<!-- # [Getting Started](#getting-started) -->

<!-- **Thank you** for your purchase or consideration of ROBOTIS' DYNAMIXEL Smart Servos.  -->

<!-- DYNAMIXEL is a brand of Smart Actuator developed by ROBOTIS for use in any robotic system.  
The name “DYNAMIXEL” is derived from two words- *“Dynamic”* and *“Cell”*, which when combined together form DYNAMIXEL, the all-in-one smart actuator.  
DYNAMIXELs offer various benefits over other comparable servos including:  
- Each DYNAMIXEL is an All-in-one module with a variety of elements required to drive a robot without other devices. All you need is power and communication to operate a robot.
- Extensive support and knowledge base to support first time users, as well as experts
- DYNAMIXELs are completely controller agnostic, allowing the use of any control solution compatible with TTL or RS485 serial communication.
- Select from a wide variety of models to best suit your system’s needs based on torque, velocity, and other specifications ranging from low-cost models for beginners to high-performance models for professionals.
- Control Modes supporting Position Control, Velocity Control, Current (Torque) Control, PWM Control, and more.
- Real-time feedback for position, velocity, current (torque/load), temperature, voltage, hardware status, and more are available through the DYNAMIXEL firmware without any additional hardware. 
- Full PID Control allowing users to fine-tune motions.
- A selection of optional frames are available to enable simple construction of robot designs.
- CAD data for products available online to enable design of custom parts and robots. 
- Designed for "daisy-chain" connections to link multiple DYNAMIXELs. One cable between each link in the DYNAMIXEL chain simplifies cable management and power delivery. -->

# [Getting Started](#getting-started)

When selecting a DYNAMIXEL servo and control solution for your application, it is important to ensure that all of your chosen components are compatible with one another. One way to ensure that they will all be compatible with one another is to select them in the following order.  

- [DYNAMIXEL](#dynamixel)
- [Power](#power)
- [Controller & Interface](#controller--interface)
- [Software & Tools](#software--tools)

Each of these components is vital, and your choice for each will be dictated by the needs of your application, as well as your previous choices. It is important to consider all of the factors before you begin building your DYNAMIXEL, as well as during the selection process, so that you can ensure that all your choices are compatible.  

The remainder of this document will provide a helpful guide to assist you in selecting the DYNAMIXEL Smart servo and control solution perfect for your use case.  

<!-- ## [DYNAMIXEL.com](#dynamixelcom)

Going through the DYNAMIXEL Selection Guide, it is highly recommended to visit [DYNAMIXEL.com](http://www.dynamixel.com/) if you are the first user. 

Each page (DYNAMIXEL-X and DYNAMIXEL-P) DYNAMIXEL.com provides summarized performance table with the link to our e-Shop (For America User, please visit [https://www.robotis.us/](https://www.robotis.us/)) -->

## [e-Shop](#e-shop)

To purchase items, please visit the e-Shop :

1. **Global (International)**: [http://en.robotis.com/shop_en/](http://en.robotis.com/shop_en/)
2. **America (USA)**: [https://robotis.us/](http://en.robotis.com/shop_en/)

# [DYNAMIXEL](#dynamixel)

The first consideration for any DYNAMIXEL System is the servos. Choosing a DYNAMIXEL for your application should start by understanding the capabilities and communication protocols supported by the servos you are considering. 

## [Models](#models)

DYNAMIXELs come in a variety of sizes and with a variety of capabilities, with each model especially suited for a particular purpose. Before we look into the specifics of DYNAMIXEL performance, it is helpful to understand the differences between each DYNAMIXEL model. 

![](/assets/images/dxl/x/dxl_x_productline.png)
> DYNAMIXEL-X Series Naming Convention

![](/assets/images/dxl/p/dynamixel_pro_plus_lineup_table.jpg)
> DYNAMIXEL-P Series Naming Convention

This information is invaluable in narrowing your choices for servos before moving on to considering the performance of the units.

**NOTE**: DYNAMIXEL AX, MX series does not follow the naming rule, please jump to [Performance](#performance).
{: .notice}

<!-- 
1. **Performance** - DYNAMIXELs are grouped in performance categories, based on the performance and construction materials of each servo.
2. **Dimensions** - DYNAMIXELs come in a selection of sizes, to enable them to be used in a variety of applications. Models with the same dimensional number have identical exterior dimensions and mounting features, enabling them to be used interchangeably as the same formfactor.
3. **Voltage** - Each DYNAMIXEL has a specified operational voltage, this is an important factor to consider when selecting your servos.
4. **Gear Ratio** - The reduction ratio of the included gear set. Higher numbers mean more torque at the cost of lower RPM.
5. **Interface** (Communication Protocols) - DYNAMIXELs support one of two serial communications protocols to transmit instructions. It is important to select servos with matching protocols. -->

<!-- 
<details>
<summary>
![](/assets/images/icon_unfold.png) **Tip**: **DYNAMIXEL-P series Naming Convention**
</summary>
![](/assets/images/dxl/p/dynamixel_pro_plus_lineup_table.jpg)
</details> 
-->

## [Performance](#performance)

The easiest way to select a DYNAMIXEL based on its performance is to look at the N-T graph:

![](/assets/images/dxl/pro/h54-100-s500-r_performance_graph_2.png)
> Performance Graph (N-T graph)

<!-- {% include en/dxl/note_performance_graph.md %} -->

Most DYNAMIXEL servos have a graph like that one located on their page here on the e-Manual. This graph provides an easy way to examine the overall performance characteristics of the servo at a glance, by graphing four of the most important metrics against one another:

**NOTE**: In selecting DYNAMIXEL in terms of torque, ~20% of **Stall Torque** (See Specification) of DYNAMIXEL will be the general range of use for your system. 
{: .notice}

1. **Torque(Nm)** - External load applied at the shaft of servo. 

2. **Speed(RPM)** - The output speed at the Torque. This shares the **black** line in the graph with the Torque.

3. **Current(A)** - The amount of current drawn at the applied load to the servo. Represented by the <span style="color:red">**red**</span> line in the second Y-axis in the graph.

4. **Efficiency(%)** - The output efficiency considering with a DC motor and its gearset. Different motors and gearset will perform more or less efficiently at different speeds and loads. This is represented by the <span style="color:green">**green**</span> line on the graph.

These factors can help you compare the performance of different DYNAMIXELs to help you find the one that is right for your use case.

## [Communication](#communication)

Each DYNAMIXEL supports one of two serial communications: [TTL](#ttl), [RS485](#rs485). 

To communicate with DYNAMIXELs, consistent communication protocol must be promised.

<details>
<summary>
![](/assets/images/icon_unfold.png) **Tip**: **Looking for a solution to combining TTL and RS485 of DYNAMIXEL in your system ?**
</summary>
Ordinarily, DYNAMIXELs utilizing different serial protocols can not communicate with one another over the same serial bus. This means that it is important to select servos using compatible communications protocols. In some applications, you may need to combine DYNAMIXELs with mismatched serial protocols. For these cases, you can combine mismatched serial protocols using a [DYNAMIXEL Communication Bridge](/docs/en/parts/interface/dxl_bridge/).

![](/assets/images/parts/interface/dxl_bridge/u2d2_bridge_ttl_485.png)

</details>

### [TTL](#ttl)

TTL (Transistor-Transistor Logic), 0 to 5V logic level, is the common serial communication protocol in DYNAMIXEL. 

An easy way to identify TTL DYNAMIXEL servos is if the model name ends with a "T", or if the DYNAMIXEL ports on the rear of the servos are 3 pin ports like these:

<!-- ![](/assets/images/dxl/jst_b3beha.png)  
> 3 Pin JST Type Connector  

![](/assets/images/dxl/jst_b3beha_diagram.png)  
> Pin Diagram for TTL Based DYNAMIXEL   -->

![](/assets/images/dxl/x/x_series_ttl_pin.png)  
> Pin Diagram for TTL Based DYNAMIXEL, using JST connectors

<details>
<summary>
![](/assets/images/icon_unfold.png) **Tip**: **Communication Circuit of TTL based DYNAMIXEL**
</summary>
To control the DYNAMIXEL actuators, the main controller needs to convert its UART signals to the half duplex type. The recommended circuit diagram for this is shown below.  
![](/assets/images/dxl/ttl_circuit.png)  

**NOTE**: Above circuit is designed for 5V or 5V tolerant MCU. Otherwise, use a Level Shifter to match the voltage of MCU.
{: .notice}  

**NOTE**: 3.3V logic DYNAMIXELs, such as XL330 series, is 5V tolerant at data line. 
{: .notice}  
</details>

### [RS485](#rs485)

Some higher end DYNAMIXEL servos operate using RS485 communications protocol. If you need longer cabling distance, RS485 will the best option for you. 

These servos can be identified by a model name that ends with an "R", or if the DYNAMIXEL ports on the rear of the servos are 4 pin ports like these:

<!-- 
![](/assets/images/dxl/jst_b4beha.png)  
![](/assets/images/dxl/jst_b4beha_diagram.png)  
-->

![](/assets/images/dxl/x/x_series_485_pin.png)   
> Pin Diagram for RS485 Based DYNAMIXEL, using JST connectors

<details>
<summary>
![](/assets/images/icon_unfold.png) **Tip**: **Communication Circuit of RS485 based DYNAMIXEL**
</summary>

To control the DYNAMIXELs, the main controller needs to convert its UART signals to the half duplex type. The recommended circuit diagram for this is shown below.  
![](/assets/images/dxl/x/x_series_485_circuit.jpg)  

**NOTE**: Above circuit is designed for 5V or 5V tolerant MCU. Otherwise, use a Level Shifter to match the voltage of MCU.
{: .notice}
</details>

<!-- ## [Firmware](#firmware)

DYNAMIXELs depend on their firmware being up to date to deliver the best performance possible. Keeping your DYNAMIXEL updated ensures that you will have the most reliable servo possible, as well as access to the newest DYNAMIXEL features as they debut.

MX series servos ship with firmware limited to [DYNAMIXEL Protocol 1.0](/docs/en/dxl/protcol1/) by default. Updating your MX firmware using **Firmware Recovery** through [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-recovery) or [R+ Manager](/docs/en/software/rplus2/manager/#firmware-recovery) is required to use the advanced features of [DYNAMIXEL Protocol 2.0](/docs/en/dxl/protcol2/).  
{: .notice--warning}

<iframe width="560" height="315" src="https://www.youtube.com/embed/q_gAewi_dyY" frameborder="0" allowfullscreen></iframe>

For other DYNAMIXEL models, the firmware can be updated using the [Firmware Update](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-update) feature of DYNAMIXEL Wizard. -->

# [Power](#power)

Supplying your DYNAMIXELs with adequate power is important to ensure proper function of your DYNAMIXEL System. DYNAMIXELs can be powered in a variety of ways, depending on the needs of the DYNAMIXEL and your project.

**NOTE**: For allowable current to a daisy chain of DYNAMIXELs in your system, visit your product e-Manual and see the **Connector Information** (e.g,[XD540-T150 Connector Information](/docs/en/dxl/x/xd540-t150/#connector-information))  
Note that used connector may differ depending on your selection.
{: .notice}

## [Operating Voltage](#operating-voltage)

Before selecting your power solution, check out the operating voltage for each DYNAMIXEL Model.

### [DYNAMIXEL-X](dynamixel-x)

- **DYNAMIXEL-X** Series: Operating Voltage may differ depending on what model to be selected. See the following table.  

| Symbol |             Operating Voltage             |              Recommended              |
|:------:|:-----------------------------------------:|:-------------------------------------:|
|   M    |                 3.7 ~ 6.0                 |                **5.0**                |
| T / W  | 10.0 ~ 14.8<br>(Max 12V for XL430, XC330) | **12.0** <br>(11.1V for XL430, XC330) |
| H / V  |                   24.0                    |               **24.0V**               |

**NOTE**: The **_Symbol_** in the table follows our [Naming Convention](#models) of DYNAMIXEL-X series only. For other DYNAMIXEL family's operating voltage, such as AX, MX, please visit [DYNAMIXEL.com](http://www.dynamixel.com/list.php?dxl=x) and find it at **Voltage** cell in a table.
{: .notice}

### [DYNAMIXEL-P](#dynamixel-p)

- **DYNAMIXEL-P** Series: DYNAMIXEL-P Series runs at 24.0V. This can be compatible with DYNAMXEL-X's `V` models (24V). 

|  Series   | Operating Voltage | Recommended |
|:---------:|:-----------------:|:-----------:|
| PM Series |       24.0        |  **24.0**   |
| PH Series |       24.0        |  **24.0**   |

<!-- 
**WARNING** Each DYNAMIXEL model has a specified operating voltage and current. It is important to stay within these specified parameters. Exceeding a DYNAMIXEL's specified maximums or mixing DYNAMIXELS with different specifications may cause damage to your servos.
{: .notice--warning} 
-->

## [Power Solution](#power-solution)

### [SMPS](#smps)

The **SMPS** is recommended power solution with ROBOTIS' providing interface and controller. Most of items offer the SMPS DC Connector that is compatible with 2.5mm / 5.5mm OD, Center Positive SMPS.
  
![](/assets/images/reference/selection_guide/selection_guide_smps.png)
> SMPS 12V, 5A

### [Batteries](#batteries)

The **Batteries** provides more mobility than a fixed power supply can offer, in those cases batteries may be the optimal solution for your high mobility robot. If Li-Po batteries are your choice, check if there is PCM (Protection Circuit Modules) are included for your system safety. 
  
![](/assets/images/reference/selection_guide/selection_guide_lipo.png)
> LIPO Battery(LB-012) 11.1V 1800mAh 

### [PSU](#psu)

The **PSU** gives you wide range of power options for your system. Espectially, With DYNAMIXEL-P or DYNAMIXEL-X with `V` model (24V), PSU will be the right selection for your system. * Using a sufficient wattage model is recommended for the stability.

# [Controller & Interface](#controller--interface)

The controller is the part of the DYNAMIXEL system responsible for issuing commands to the servos, as well as for interpreting the data received from connected DYNAMIXELs or any other integrated devices or sensors. For this reason, your choice of controller has a large impact on the rest of your DYNAMIXEL system. DYNAMIXEL's controller agnostic nature means that you can utilize any device capable of communication over TTL or RS485 serial as your DYNAMIXEL controller. For most applications, you can choose which of the following control solution fits your needs best.

{% capture sdk_notice_03 %}
**NOTE**: 
The DYNAMIXEL [Controller Compatibility Chart](/docs/en/parts/controller/controller_compatibility/) provides a convenient way to quickly check which controllers are compatible with each of ROBOTIS' sensors, servos, and software.
{% endcapture %}
<div class="notice">{{ sdk_notice_03 | markdownify }}</div>

## [Educational](#educational)

### [CM Series](#cm-series)

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_04.png)
> Connection Example of DYNAMIXEL with CM series.
 
CM Series are designed for the [Educational Kits](/docs/en/edu/) to support our dedicated [educational software](#educational-software)(R+). 

Most of CM Series controllers provide the OLLO Ports where [our exclusive sensors](/docs/en/parts/all_sensors/) can be mounted and easily controled by using R+ software. 

![](/assets/images/parts/controller/cm-150/cm-150_002.jpg)
> e.g, CM-150

The following items are our recent & most popular educational level controllers. Checkout its specification, and select the one fullfiing your interesting.
- [OpenCM9.04]
- [CM-530]
- [CM-550]

**NOTE**: To see a full range of controllers provided by ROBOTIS, visit our [Controllers](/docs/en/parts/all-controller/) page.
{: .notice}

**NOTE**: Not all sensors are compatible with CM series, check out the compatible sensors with OLLO ports at [Compatibility Table for parts](/docs/en/parts/controller/controller_compatibility/#parts)
{: .notice}

<!-- ### [OpenCM9.04](#opencm904)

![](/assets/images/parts/controller/opencm904/opencm904_14.png)

[OpenCM9.04] is an open source robot controller developed to serve as the main controller used in the [ROBOTIS MINI](/docs/en/edu/mini) educational platform, comparable to the Arduino UNO. Featuring an embedded MCU from the ARM Cortex-M7 line-up. The OpenCM is compatible with the [Arduino IDE](docs/en/parts/controller/opencm904/#arduino-ide) for development of custom software for your project.

When combined with the [Expansion Board](/docs/en/parts/controller/opencm485exp.md) the OpenCM can be used to drive any variety of DYNAMXEL.
{: .notice}
 
![](/assets/images/parts/controller/opencm904/opencm485exp_product.jpg) -->

<!-- 
### [CM-530](#cm-530)

![](/assets/images/parts/controller/cm-530/cm-530_product.png)

The ROBOTIS [CM-530] features a 32-bit ARM Cortex-M3 processor (STM32F103RE), GPIO ports for connecting analog sensors, and support for IR, ZigBee, and Bluetooth communication. The controller features ports for TTL-based AX and MX series DYNAMIXELs. 

The [CM-530] is compatible with RoboPlus software, and using the [Embedded C SDK](/docs/en/software/embedded_sdk/embedded_c_cm530) users can develop their own custom firmware for precise control over the [CM-530].

### [CM-550](#cm-550)

![](/assets/images/parts/controller/cm-550/cm-550_product.png)

The ROBOTIS [CM-550] features a 168MHz, 32-bit ARM Cortex-M4 processor, DYNAMIXEL X Series TTL communication ports, BlueTooth communication module, gyroscope/accelerometer, temperature sensor, buzzer, RGB LED, microphone, and sensor ports for additional accessories.

The [CM-550] is designed for use with [R+ 3.0 software] and only supports TTL-based X series DYNAMIXELs.

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_04.png)  -->

## [Interfaces](#interfaces)

### [U2D2](#u2d2)
 
The most flexible control solution for operating a DYNAMIXEL system is a PC, utilizing a [U2D2] or other serial interface you can directly control your DYNAMIXELs with limitless possibilities. A PC and [U2D2] enable you to use [DYNAMIXEL Wizard 2.0] to test, configure, and tune your DYNAMIXELs as well as the full features of the [DYNAMIXEL SDK], with support for a variety languages.

<!-- 

- [C](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/c/c_porthandler/#c)
- [C++](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/cpp/cpp_porthandler/#cpp)
- [C#](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/csharp/csharp_porthandler/#csharp)
- [Python](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/python/python_porthandler/#python)
- [Java](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/java/java_porthandler/#java)
- [Matlab](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/matlab/matlab_porthandler/#matlab)
- [LabVIEW](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/labview/labview_porthandler/#labview) 

-->

The DYNAMIXEL Starter Set includes everything you need to utilize your PC as your chosen controller, a [U2D2], [U2D2 Power Hub Board], and an SMPS 12V 5A AC Adapter 

  ![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_01.png) 

{% capture sdk_notice_01 %}
**NOTE**: 
- [DYNAMIXEL SDK](/docs/en/software/dynamixel/dynamixel_sdk/overview/) and all other ROBOTIS software is available to download from our [Download Center](http://en.robotis.com/service/downloadcenter.php).
- For more information on the ROBOTIS Software, refer to the [Software](/docs/en/software/) e-Manual page.
- U2D2 [assembly instructions](/docs/en/parts/interface/u2d2_power_hub/#how-to-assemble) are available here on the e-Manual.
{% endcapture %}
<div class="notice">{{ sdk_notice_01 | markdownify }}</div>

### [DYNAMIXEL Shields](#dynamixel-shields)

The [DYNAMIXEL Shield] and [DYNAMIXEL Shield MKR] were created to enable users to easily integrate DYNAMIXELs into their arduino based projects. Using the shields in combination with the [DynamixelShield](#dynamixelshield) library enables Arduino users to access the full features of DYNAMIXELs.

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_05.png) 

## [Embedded Controllers](#embedded-controllers)

### [OpenCR1.0](#opencr10)

[OpenCR1.0](/docs/en/parts/controller/opencr10) (Open-source Control module for ROS) is an open source robot controller with a powerful embedded MCU from the ARM Cortex-M7 line-up. The hardware, software, schematics, PCB Gerber, BOM, and firmware of the OpenCR1.0 are completely open source. It was developed to serve as the main controller used in the official ROBOTIS ROS education platform [TurtleBot3](/docs/en/platform/turtlebot3/overview/).

The OpenCR1.0 supports RS-485 and TTL communication for DYNAMIXEL control as well as UART and CAN buses and a variety of other ports and opportunites for other peripherals. The OpenCR is also compatible with Arduino IDE for developing customized software for your projects. Additionally, the OpenCR can be used in coordination with a SBC such as a RaspberyPi to enable more powerful mobile operation than a standalone embedded controller.

![](/assets/images/parts/controller/opencr10/opencr_pinout.png) 
> OpenCR 1.0 Layout and Pin Map

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_03.png) 
> Connection Example of DYNAMIXEL with OpenCR 1.0

### [OpenCM9.04](#opencm904)

![](/assets/images/parts/controller/opencm904/opencm904_14.png)

[OpenCM9.04] is featuring an embedded MCU from the ARM Cortex-M7 line-up. The OpenCM is compatible with the [Arduino IDE](docs/en/parts/controller/opencm904/#arduino-ide) for development of custom software for your project.  


{% capture 485exp_board %}
**NOTE**: When combined with the [OpenCM 485 EXP Board](/docs/en/parts/controller/opencm485exp) the OpenCM 9.04 can drive RS485 DYNAMIXELs as well as TTL ones.
 
![](/assets/images/parts/controller/opencm904/opencm485exp_product.jpg)

{% endcapture %}

<div class="notice"> {{ 485exp_board | markdownify }}</div>

## [Other Controllers](#other-controllers)

ROBOTIS provides a range of [Educational Kits](/docs/en/edu/) and [DYNAMIXEL System](/docs/en/platform/) that accompany a dedicated controller.

See all the range of [Controllers](/docs/en/parts/all-controller/) for more information.

# [Software & Tools](#software--tools)

Your choice of software is another important consideration for your DYNAMIXEL System. Your controller combined with your software defines the capabilities of your project, and how you will interact with your DYNAMIXELs.

- Check out the [Controller Compatibility](/docs/en/parts/controller/controller_compatibility/) which software is supportive with your selection.

## [Educational Software](#educational-software)

Educational software is ROBOTIS dedicated software for our [educational kits](/docs/en/edu/) and [CM Series](#cm-series). 

- Task and motion programming tools ([R+ Software Suite](#r-software-suite)) provide a variety of examples that you can start off.
- For easy maintanance for your kits and CM Series, ROBOTIS provdides free manager program for our educational kits and CM Series controller. See [R+ Manager 2.0](#r-manager-20)

### [R+ Software Suite](#r-software-suite)

The R+ (Roboplus) Software suite is ROBOTIS' first party robot controller software offering. R+ is offered in a variety of forms to enable users to start the programming style they feel most comfortable with. See provided [R+ Software](/docs/en/software/#roboplus-r).

![](/assets/images/sw/rplus_task3/task3_001.png)
> R+Task 3.0

<!-- 
### [Test & Managerment](#test--management)

#### [R+ Manager 2.0](#r--manager-20)

![](/assets/images/sw/all_software/icon_r_manager.png)

[R+ Manager 2.0](/docs/en/software/rplus2/manager/) is a firmware management tool to test and update sensors, motors, controllers and servos. -->

<!-- The most fully featured option is [R+ Task 3.0](/docs/en/software/rplustask3/), featuring options to program your robot using ROBOTIS [Task Code](/docs/en/software/rplustask3/task_programming), Python, and [Motion Programming](/docs/en/software/rplustask3/motion_programming). R+ Task 3.0 also supports all current ROBOTIS [CM series](#cm-series) controllers. -->

<!-- ### [R+ Mobile](#r+-mobile)

![](/assets/images/sw/rplus_mobile/r+m_task2_4.png)

[R+ Mobile](/docs/en/software/rplus_mobile/mtask20/) is a fully featured programming environment for your Android smartphone, allowing programming, testing, and debugging to be done on the go.The ease of use and portability of this solution make it perfect for use in classroom settings as an easy to use programming interface that students will love. -->

## [Test & Management](#test--management)

### [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)

[DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/) is an optimized tool for managing DYNAMIXEL’s from various operating systems (Linux / Mac / Windows) 

The following features are provided with DYNAMIXEL Wizard 2.0.

- DYNAMIXEL Firmware Update
- DYNAMIXEL Diagnosis
- DYNAMIXEL Configuration and Test
- DYNAMIXEL Data Plotting in Real-Time
- Generate & Monitor DYNAMIXEL Packets

![](/assets/images/sw/dynamixel/wizard2/wizard2_main_001.png)

### [R+ Manager 2.0](#r-manager-20)

[R+ Manager 2.0](/docs/en/software/rplus2/manager/) is one of the [R+ Software Suite](#r-software-suite) for you to maintanance Educational Kits including [CM-Series](#cm-series) and its supported DYNAMIXELs. 

![](/assets/images/sw/rplus2/manager/roboplus_manager2_07.jpg)

<!-- For more information on the supported DYNAMIXEL with CM-Series, See [Controller Compatibility](/docs/en/parts/controller/controller_compatibility/#dynamixel) -->

**NOTE**: For those who developing DYNAMIXEL System, [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20) will provide the best experience in terms of DYNAMIXEL test and management.
{: .notice}

## [DYNAMIXEL Development](#dynamixel-development)

### [DYNAMIXEL SDK](#dynamixel-sdk)

<iframe width="560" height="315" src="https://www.youtube.com/embed/F-sXbIAM0jc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

[DYNAMIXEL SDK](/docs/en/software/dynamixel/dynamixel_sdk/overview/) is a software development kit to support a variety programming language(C, C++, C#, Python, Java, Matlab and LabVIEW) on major OS(Linux, Windows, Mac). The provided APIs will allow you to manipulate data of DYNAMIXEL with ease. 

**NOTE**: It is recommended to use [U2D2](#u2d2) (USB to TTL & RS485 converter) to interface DYNAMIXEL with your development device (PC,SBC and etc). Or You will be reequired to build DYNAMIXEL comm circuit. See [Communication](#communication)
{: .notice}

#### [DYNAMIXEL SDK for Arduino](#dynamixel-sdk-for-arduino)

[Embedded Controllers](#embedded-controllers) support DYNAMIXEL SDK at [Arduino IDE](/docs/en/software/arduino_ide/) and allow your system to use full APIs of the SDK.

**NOTE**: If you are a hobbiest user, it is recommended to use our comprehensive APIs in [Dynamixel2Arduino](#dynamixel2arduino) library.
{: .notice}

### [Arduino Library](#arduino-library)

ROBOTIS provides comprehensive code APIs and basic example for Arduino users.
- [Dynamixel2Arduino](#dynamixel2arduino)
- [DynamixelShield](#dynamixelshield)

![](/assets/images/parts/interface/dynamixel_shield/examples.png)
> DynamixelShield Library: Basic Examples

#### [Dynamixel2Arduino](#dynamixel2arduino)

[Dynamixel2Arduino] library designed based on [DYNAMIXEL SDK](#dynamixel-sdk-for-arduino) provides comprehensive code APIs. Dynamixel2Arduino give you user-friendly experience rather than using DYNAMIXEL SDK in Arduino. 
- [API Reference](/docs/en/software/arduino_ide/#dynamixel2arduino-library)

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

#### [DynamixelShield](#dynamixelshield)

[DynamixelShield] library inherits features of [Dynamixel2Arduino](#dynamixel2arduino). But this is specifially designed for [DYNAMIXEL Shields](#dynamixel-shields) to interface with Arduino boards. 

![](/assets/images/parts/interface/dynamixel_shield/library_manager_03.png)

[DYNAMIXEL Wizard 2.0]: /docs/en/software/dynamixel/dynamixel_wizard2/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[U2D2]: /docs/en/parts/interface/u2d2/
[U2D2 Power Hub Board]: /docs/en/parts/interface/u2d2_power_hub/
[Software]: /docs/en/software/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[The OpenCM 485 Expansion Board]: /docs/en/parts/controller/opencm485exp/
[OpenCR 1.0]: /docs/en/parts/controller/opencr10/
[CM-530]: /docs/en/parts/controller/cm-530/
[CM-550]: /docs/en/parts/controller/cm-550/
[R+ 3.0 software]: /docs/en/software/rplustask3/
[DYNAMIXEL Shield]: /docs/en/parts/interface/dynamixel_shield/
[DYNAMIXEL Shield MKR]: /docs/en/parts/interface/mkr_shield
[RC-100]: /docs/en/parts/communication/rc-100/
[LN-101]: /docs/en/parts/interface/ln-101/
[Dynamixel2Arduino]: https://github.com/ROBOTIS-GIT/Dynamixel2Arduino
[DynamixelShield]: https://github.com/ROBOTIS-GIT/DynamixelShield
