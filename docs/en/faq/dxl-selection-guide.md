---
layout: archive
lang: en
ref: dxl-selection-guide
read_time: true
share: true
author_profile: false
permalink: /docs/en/reference/dxl-selection-guide/
sidebar:
  title: DYNAMIXEL Selection Guide
  nav: "dxl-selection-guide"
---

{::options parse_block_html="true" /}

# [Getting Started](#getting-started)

When selecting a DYNAMIXEL servo and control solution for your application, it is important to ensure that all of your chosen components are compatible with one another. One way to ensure that they will all be compatible with one another is to select them in the following order.  

- [DYNAMIXEL](#dynamixel)
- [Power](#power)
- [Controller & Interface](#controller--interface)
- [Software & Tools](#software--tools)

Each of these components is vital, and your choice for each will be dictated by the needs of your application, as well as your previous choices. It is important to consider all of the factors before you begin building your DYNAMIXEL, as well as during the selection process, so that you can ensure that all your choices are compatible.  

The remainder of this document will provide a helpful guide to assist you in selecting the DYNAMIXEL Smart servo and control solution perfect for your use case.  

## [e-Shop](#e-shop)

To purchase items, please visit the e-Shop :

1. **ROBOTIS Global (International)**: [http://en.robotis.com/shop_en/](http://en.robotis.com/shop_en/)
2. **ROBOTIS America (USA)**: [https://robotis.us/](http://en.robotis.com/shop_en/)
3. **ROBOTIS Japan**: [https://e-shop.robotis.co.jp/](https://e-shop.robotis.co.jp/)
4. **ROBOTIS China**: Products can be shopped at [TaoBao](https://shop292418244.taobao.com/index.htm?spm=2013.1.w5002-17478325885.2.5bbc75c1kB9jsV) for your convenience, 

# [DYNAMIXEL](#dynamixel)

The first consideration for any DYNAMIXEL System is the actuator. Choosing a DYNAMIXEL for your application should start by understanding the capabilities and communication protocols supported by the actuator you are considering. 

## [Models](#models)

DYNAMIXELs come in a variety of sizes and with a variety of capabilities, with each model especially suited for a particular purpose. Before we look into the specifics of DYNAMIXEL performance, it is helpful to understand the differences between each DYNAMIXEL model. 

![](/assets/images/dxl/x/dxl_x_productline.png)
> DYNAMIXEL-X Series Naming Convention

![](/assets/images/dxl/p/dynamixel_pro_plus_lineup_table.jpg)
> DYNAMIXEL-P Series Naming Convention

This information is invaluable in narrowing your choices for actuators before moving on to considering the performance of the units.

**NOTE**: DYNAMIXEL AX, MX series does not follow the naming convention, please jump to [Performance](#performance).
{: .notice}

## [Performance](#performance)

The easiest way to select a DYNAMIXEL based on its performance is to look at the N-T graph:

![](/assets/images/dxl/pro/h54-100-s500-r_performance_graph_2.png)
> Performance Graph (N-T graph)

<!-- {% include en/dxl/note_performance_graph.md %} -->

Most DYNAMIXEL servos have a graph like that one located on their page here on the e-Manual. This graph provides an easy way to examine the overall performance characteristics of the servo at a glance, by graphing four of the most important metrics against one another:

**NOTE**: In selecting DYNAMIXEL in terms of torque, ~20% of **Stall Torque** (See Specification) of DYNAMIXEL will be the general range of use for your system. 
{: .notice}

1. **Torque(Nm)** - External load applied at the shaft of servo. 

2. **Speed(RPM)** - The output speed at the Torque. This shares the **black** line. 

3. **Current(A)** - The amount of current drawn at the Torque. Represented by the <span style="color:red">**red**</span> line.

4. **Efficiency(%)** - The output efficiency considering with a DC motor and its gearset. Different motors and gearset will perform more or less efficiently at different speeds and loads. This is represented by the <span style="color:green">**green**</span> line.

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

An easy way to identify TTL DYNAMIXEL actuator is if the model name ends with a "-T" (e.g, XL330-M288-**T**).  

TTL based DYNAMIXEL has three pins ports on the rear of the actuator. 

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

An easy way to identify RS485 based DYNAMIXEL actuator is if the model name ends with a "-R" (e.g, XD40-T150-**R**).  

RS485 based based DYNAMIXEL has three pins ports on the rear of the actuator. 

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

# [Power](#power)

Supplying your DYNAMIXELs with adequate power is important to ensure proper function of your DYNAMIXEL System. DYNAMIXELs can be powered in a variety of ways, depending on the needs of the DYNAMIXEL and your project.

**NOTE**: For allowable current to a daisy chain of DYNAMIXELs in your system, visit your product e-Manual and see the **Connector Information** (e.g,[XD540-T150 Connector Information](/docs/en/dxl/x/xd540-t150/#connector-information))  
Note that used connector may differ depending on your selection.
{: .notice}

## [Operating Voltage](#operating-voltage)

Before selecting your power solution, check out the operating voltage for each DYNAMIXEL Model.

### [DYNAMIXEL-X](#dynamixel-x)

Operating Voltage may differ depending on what model to be selected. See the following table.   

| Symbol |             Operating Voltage             |              Recommended              |
|:------:|:-----------------------------------------:|:-------------------------------------:|
|   M    |                 3.7 ~ 6.0                 |                **5.0**                |
| T / W  | 10.0 ~ 14.8<br>(Max 12V for XL430, XC330) | **12.0** <br>(11.1V for XL430, XC330) |
| H / V  |                   24.0                    |               **24.0V**               |

**NOTE**: The **_Symbol_** in the table follows our [Naming Convention](#models) of DYNAMIXEL-X series only. For other DYNAMIXEL family's operating voltage, such as AX, MX, please visit [DYNAMIXEL.com](http://www.dynamixel.com/list.php?dxl=x) and find it at **Voltage** cell in a table.
{: .notice}

### [DYNAMIXEL-P](#dynamixel-p)

DYNAMIXEL-P Series runs at 24.0V. This can be compatible with DYNAMXEL-X's `V` models (24V). 

|  Series   | Operating Voltage | Recommended |
|:---------:|:-----------------:|:-----------:|
| PM Series |       24.0        |  **24.0**   |
| PH Series |       24.0        |  **24.0**   |

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

The **PSU** gives you wide range of power options for your system. Espectially, With DYNAMIXEL-P or DYNAMIXEL-X with `V` model (24V), PSU will be the right selection for your system. Using a sufficient wattage model is recommended for the voltage stability.

# [Controller & Interface](#controller--interface)

The controller is one of the essential of the DYNAMIXEL system responsible for accessing the Control Table of DYNAMIXEL to read and write the data.

For most applications, you can choose which of the following control solution fits your needs best.

{% capture sdk_notice_03 %}
**NOTE**: 
The DYNAMIXEL [Controller Compatibility Chart](/docs/en/parts/controller/controller_compatibility/) provides a convenient way to quickly check which controllers are compatible with each of ROBOTIS' sensors, servos, and software.
{% endcapture %}
<div class="notice">{{ sdk_notice_03 | markdownify }}</div>

## [Interfaces](#interfaces)

### [U2D2](#u2d2)
 
[U2D2] is a serial interface that can convert USB to TTL / RS485 signal. 

Using the inteface like U2D2 enable you to use [DYNAMIXEL Wizard 2.0](#dynamixel-wizard) to test, configure, and tune your DYNAMIXELs as well as the full features of the [DYNAMIXEL SDK](#dynamixel-sdk), with support for a variety languages.

![](/assets/images/parts/interface/u2d2_04.png){: width="400px", height="240px"}

The DYNAMIXEL Starter Set includes everything you need to utilize your PC as your chosen controller, a [U2D2], [U2D2 Power Hub Board], and an SMPS 12V 5A AC Adapter 

  ![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_01.png) 

  > Connection Example of the DYNAMIXEL Starter Set

<!-- NOTE: DYNAMIXEL Quick Start Guide -->

### [DYNAMIXEL Shields](#dynamixel-shields)

The [DYNAMIXEL Shield] and [DYNAMIXEL Shield MKR] were created to enable users to easily integrate DYNAMIXELs into their arduino based projects. Using the shields in combination with the [DynamixelShield](#dynamixelshield) library enables Arduino users to do the DYNAMIXELs with simple APIs.

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_05.png) 
> Connection Example of DYNAMIXEL with DYNAMIXEL Shield

## [Embedded Controllers](#embedded-controllers)

<!-- ### [OpenRB-150](#openrb-150)

The [OpenRB-150]  is a new open source controller that is highly compatible with the Arduino products. Using a dedicated library Dynamixel2Arduino(#dynamixel2arduino), you can just start off DYNAMIXEL with ease.
- SAMD21 Cortex-M0+ 32bit low power ARM® MCU allows the OpenRB to support feature of Arduino IDE. 
- More features with Arduino MKR formfactor Shield
- On-board 3Pin JST connectors to directely power and control the DYNAMIXEL.  
- With the firmware provided by the OpenRB Board Manager, you can scan use the OpenRB-150 with [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)  -->

### [OpenCR1.0](#opencr10)

[OpenCR1.0](/docs/en/parts/controller/opencr10) (Open-source Control module for ROS) is an open source robot controller with a powerful embedded MCU from the ARM Cortex-M7 line-up. The hardware, software, schematics, PCB Gerber, BOM, and firmware of the OpenCR1.0 are completely open source. It was developed to serve as the main controller used in the official ROBOTIS ROS education platform [TurtleBot3](/docs/en/platform/turtlebot3/overview/).

The OpenCR is also compatible with Arduino IDE for developing customized software for your projects ([DYNAMIXEL SDK (Arduino)](#dynamixel-sdk-arduino), [Arduino Library](#arduino-library)). 

![](/assets/images/parts/controller/opencr10/opencr_pinout.png) 
> OpenCR 1.0 Layout and Pin Map

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_03.png) 
> Connection Example of DYNAMIXEL with OpenCR 1.0

### [OpenCM9.04](#opencm904)

[OpenCM9.04] is featuring an embedded MCU from the ARM Cortex-M7 line-up. The OpenCM is compatible with the Arduino IDE, [DYNAMIXEL SDK (Arduino)](#dynamixel-sdk-arduino), [Arduino Library](#arduino-library)), for development of custom software for your project.

![](/assets/images/parts/controller/opencm904/opencm904_14.png)

{% capture exp_board %}
**NOTE**: When combined with the [OpenCM 485 EXP Board](/docs/en/parts/controller/opencm485exp) the OpenCM 9.04 can drive RS485 DYNAMIXELs as well as TTL ones.
 
![](/assets/images/parts/controller/opencm904/opencm485exp_product.jpg)

{% endcapture %}

<div class="notice">{{ exp_board | markdownify }}</div>

## [Educational](#educational)

### [CM Series](#cm-series)

CM Series are designed for the [Educational Kits](/docs/en/edu/) to support our dedicated [educational software](#educational-software). 

Most of CM Series controllers provide the OLLO Ports where [dedicated sensors for CM series](/docs/en/parts/all_sensors/) can be mounted and easily controled by using R+ software. 

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_04.png)
> Connection Example of DYNAMIXEL with CM series.

![](/assets/images/parts/controller/cm-150/cm-150_002.jpg)
> e.g, OLLO Ports for sensor controls on CM-150

The following items are our recent & the most popular educational level controllers. Checkout its specification, and select the one to meet your requirements in your educational use.
- [OpenCM9.04]
- [CM-530]
- [CM-550]

**NOTE**: To see a full range of controllers provided by ROBOTIS, visit our [Controllers](/docs/en/parts/all-controller/) page.
{: .notice}

**NOTE**: Not all sensors are compatible with each CM series, check out the compatible sensors with each CM series at [Parts Compatibility](/docs/en/parts/controller/controller_compatibility/#parts)
{: .notice}

## [Other Controllers](#other-controllers)

ROBOTIS provides a range of [Educational Kits](/docs/en/edu/) and [DYNAMIXEL System](/docs/en/platform/) that accompany a dedicated controller.

See all the range of [Controllers](/docs/en/parts/all-controller/) for more information.

# [Software & Tools](#software--tools)

Your choice of software is another important consideration for your DYNAMIXEL System. Your controller combined with your software defines the capabilities of your project, and how you will interact with your DYNAMIXELs.

Check out the [Software Compatibility](/docs/en/parts/controller/controller_compatibility/#software) which software is supportive with your selection.

## [Test & Management](#test--management)

### [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)

[DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/) is an optimized tool for managing DYNAMIXEL’s from various operating systems (Linux / Mac / Windows). [U2D2](#u2d2) or [Compatible controller](/docs/kr/parts/controller/controller_compatibility) is required to use.

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

**NOTE**: For those who developing DYNAMIXEL System, [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20) will provide the best experience in terms of DYNAMIXEL test and management.
{: .notice}

## [DYNAMIXEL Development](#dynamixel-development)

### [DYNAMIXEL SDK](#dynamixel-sdk)

<iframe width="560" height="315" src="https://www.youtube.com/embed/F-sXbIAM0jc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

[DYNAMIXEL SDK](/docs/en/software/dynamixel/dynamixel_sdk/overview/) is a software development kit to support a variety programming language(C, C++, C#, Python, Java, Matlab and LabVIEW) on major OS(Linux, Windows, Mac). The provided APIs will allow you to manipulate data of DYNAMIXEL with ease. 

**NOTE**: It is recommended to use [U2D2](#u2d2) (USB to TTL & RS485 converter) to interface DYNAMIXEL with your development device (PC,SBC and etc). Otherwise, You will be required to build DYNAMIXEL communication circuit. See [Communication](#communication)
{: .notice}

#### [DYNAMIXEL SDK (Arduino)](#dynamixel-sdk-arduino)

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

[Dynamixel2Arduino] library designed based on [DYNAMIXEL SDK](#dynamixel-sdk-arduino) provides comprehensive code APIs. Dynamixel2Arduino give you user-friendly experience than DYNAMIXEL SDK in Arduino
- [API Reference](/docs/en/software/arduino_ide/#dynamixel2arduino-library)

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

#### [DynamixelShield](#dynamixelshield)

[DynamixelShield] library inherits features of [Dynamixel2Arduino](#dynamixel2arduino). But this is specifially designed for [DYNAMIXEL Shields](#dynamixel-shields) to interface with Arduino boards. 

![](/assets/images/parts/interface/dynamixel_shield/library_manager_03.png)

## [Educational Software](#educational-software)

Educational software is ROBOTIS dedicated software for our [educational kits](/docs/en/edu/) and [CM Series](#cm-series). 

- Task and motion programming tools ([R+ Software Suite](#r-software-suite)) provide a variety of examples that you can start off.
- For easy maintanance for your kits and CM Series, ROBOTIS provdides free manager program for our educational kits and CM Series controller. See [R+ Manager 2.0](#r-manager-20)

### [R+ Software Suite](#r-software-suite)

The R+ (Roboplus) Software suite is ROBOTIS' first party robot controller software offering. R+ is offered in a variety of forms to enable users to start the programming style they feel most comfortable with. See provided [R+ Software](/docs/en/software/#roboplus-r).

![](/assets/images/sw/rplus_task3/task3_001.png)
> R+Task 3.0

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
