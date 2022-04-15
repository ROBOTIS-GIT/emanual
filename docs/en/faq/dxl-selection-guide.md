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

**NOTE**: DYNAMIXEL AX and MX series actuators do not follow the naming convention, please refer to the [Performance](#performance) section for more information about identifying their capabilities.
{: .notice}

## [Performance](#performance)

The easiest way to select a DYNAMIXEL based on its performance is to look at the N-T graph:

![](/assets/images/dxl/pro/h54-100-s500-r_performance_graph_2.png)
> Performance Graph (N-T graph)

<!-- {% include en/dxl/note_performance_graph.md %} -->

Most DYNAMIXEL servos have a graph like that one located on their page here on the e-Manual. This graph provides an easy way to examine the overall performance characteristics of the servo at a glance, by graphing four of the most important metrics against one another:

1. **Torque(Nm)** - External load applied at the shaft of servo. By the Torque(Nm), Output Speed(A) and Current(A) are determined

2. **Speed(RPM)** - The output speed at the Torque. This shares the **black** line. 

3. **Current(A)** - The amount of current drawn at the Torque. Represented by the <span style="color:red">**red**</span> line.

4. **Efficiency(%)** - The output efficiency considering with a DC motor and its gearset. Different motors and gearset will perform more or less efficiently at different speeds and loads. This is represented by the <span style="color:green">**green**</span> line.

These factors can help you compare the performance of different DYNAMIXELs to help you find the one that is right for your use case.

**NOTE:** When selecting DYNAMIXELs based on rated torque, two measurements of torque are used depending on the specific DYNAMIXEL Model.
<br>**Continuous Torque** is the measurement of the amount of torque a DYNAMIXEL can produce constantly without risk of damage to the motor or gears.
<br>**Stall Torque** is the maximum amount of torque a DYNAMIXEL can produce before the internal motor stalls. 
<br>DYNAMIXEL's operational load should be based on the **Continuous Torque** rating. For servos where this value is not given, it can be estimated to be ~20% of **Stall Torque**
{: .notice}

<span style="color:red">**WARNING**</span>**: Operating DYNAMIXELS for extended periods at or near their stall torque can cause severe damage to the servos**
{: .notice--warning}

## [Communication](#communication)

Each DYNAMIXEL supports one of two serial communications protocols: [TTL](#ttl) or [RS-485](#rs-485). 

DYNAMIXEL actuators can be controlled by any device utilizing a compatible serial communications protocol.

<details>
<summary>
![](/assets/images/icon_unfold.png) **Tip**: **Looking for a solution to combine TTL and RS-485 DYNAMIXELs in your system?**
</summary>
Ordinarily, DYNAMIXELs utilizing different serial protocols can not communicate with one another over the same serial bus. This means that it is important to select servos using compatible communications protocols. In some applications, you may need to combine DYNAMIXELs with mismatched serial protocols. For these cases, you can combine mismatched serial protocols using a [DYNAMIXEL Communication Bridge](/docs/en/parts/interface/dxl_bridge/).

![](/assets/images/parts/interface/dxl_bridge/u2d2_bridge_ttl_485.png)

</details>

### [TTL](#ttl)

TTL (Transistor-Transistor Logic) is the common serial communication interface for DYNAMIXEL actuators. 

The simplest ways to identify TTL DYNAMIXEL actuators are a model name ending with a "-T" (e.g, XL330-M288-**T**) as well as the three pin JST ports.  

![](/assets/images/dxl/x/x_series_ttl_pin.png)  
> Pin Diagram for TTL Based DYNAMIXEL, using JST connectors

<details>
<summary>
![](/assets/images/icon_unfold.png) **Tip**: **TTL DYNAMIXEL Communication Circuit**
</summary>
DYNAMIXEL actuators operate using half-duplex UART communication. The following diagram shows the recommended circuit to convert full-duplex TTL to half-duplex TTL for DYNAMIXEL control.

**WARNING**: This circuit is designed for a 5V or 5V tolerant MCU. Otherwise, a Level Shifter will be required to match the voltage of the MCU.
{: .notice--warning}  
![](/assets/images/dxl/ttl_circuit.png)  

**NOTE**: 3.3V logic level DYNAMIXELs, such as XL330 series, are 5V tolerant on the data line. 
{: .notice}  
</details>

### [RS-485](#rs-485)

Some higher end DYNAMIXEL servos operate using the RS-485 communications protocol. If you need longer cabling distance or more resistance to interference, RS-485 will the best option for you. 

The simplest ways to identify RS-485 based DYNAMIXEL actuator are a model name ending with an "-R" (e.g, XD40-T150-**R**) as well as the four pin JST ports.

![](/assets/images/dxl/x/x_series_485_pin.png)   
> Pin Diagram for RS-485 Based DYNAMIXEL, using JST connectors

<details>
<summary>
![](/assets/images/icon_unfold.png) **Tip**: **Communication Circuit of RS-485 based DYNAMIXEL**
</summary>

DYNAMIXEL actuators operate using half-duplex UART communication. The following diagram shows the recommended circuit to convert full-duplex RS-485 to half-duplex RS-485 for DYNAMIXEL control.

**WARNING**: This circuit is designed for a 5V or 5V tolerant MCU. Otherwise, a Level Shifter will be required to match the voltage of the MCU.
{: .notice--warning}  
![](/assets/images/dxl/x/x_series_485_circuit.jpg)  

</details>

# [Power](#power)

Supplying your DYNAMIXELs with adequate power is important to ensure proper function of your DYNAMIXEL System. DYNAMIXELs can be powered in a variety of ways, depending on the needs of the DYNAMIXEL and your project.

**NOTE**: For allowable current to a daisy chain of DYNAMIXELs in your system, visit your product e-Manual and see the **Connector Information** (e.g,[XD540-T150 Connector Information](/docs/en/dxl/x/xd540-t150/#connector-information))  
Note that used connector may differ depending on your selection.
{: .notice}

## [Operating Voltage](#operating-voltage)

Prior to selecting your power solution, refer to the tables below for operating voltages for all DYNAMIXEL X-Series actuators.

### [DYNAMIXEL-X](#dynamixel-x)

Operating Voltage may differ depending on what model to be selected. See the following table.   

| Symbol |             Operating Voltage             |              Recommended              |
|:------:|:-----------------------------------------:|:-------------------------------------:|
|   M    |                 3.7 ~ 6.0                 |                **5.0**                |
| T / W  | 10.0 ~ 14.8<br>(Max 12V for XL430, XC330) | **12.0** <br>(11.1V for XL430, XC330) |
| H / V  |                   24.0                    |               **24.0V**               |

**NOTE**: The **_Symbol_** in the table follows the [Naming Convention](#models) of DYNAMIXEL X-Series actuators. For DYNAMIXEL [AX](/docs/en/dxl/ax/ax-12a) and [MX](/docs/en/dxl/mx/mx-64) operating voltages refer to the eManual page for the servo in question.
{: .notice}

### [DYNAMIXEL-P](#dynamixel-p)

All DYNAMIXEL-P Series actuators run at 24.0V. This allows them to be used alongside DYNAMIXEL X `V` series 24v actuators.

<!-- 

|  Series   | Operating Voltage | Recommended |
|:---------:|:-----------------:|:-----------:|
| PM Series |       24.0        |  **24.0**   |
| PH Series |       24.0        |  **24.0**   |
 
-->

## [Power Solution](#power-solution)

### [SMPS](#smps)

The **SMPS** is ROBOTIS' recommended power solution for the vast majority of DYNAMIXEL systems. Most of ROBOTIS' hardware and controller solutions feature an SMPS DC Connector to easily allow connecting an SMPS power supply.

![](/assets/images/reference/selection_guide/selection_guide_smps.png)
> SMPS 12V, 5A

The SMPS connector featured on ROBOTIS products is compatible with any DC power supply utilizing a barrel plug with the following specifications:

* 2.5mm Inside Diameter
* 5.5mm Outside Diameter
* Center Positive
  

### [Batteries](#batteries)

**Batteries** provide more mobility than a fixed power supply can offer, in cases where high mobility is important batteries are the best option. 

**WARNING:** Lithium Polymer (LiPo) batteries pose a fire risk. If LiPo batteries are in use, be sure that your chosen batteries feature PCM (Protection Circuit Modules) and watch ROBOTIS' [LiPo Battery Quick Start Guide](https://www.youtube.com/watch?v=7oc9grl_YSA) for more Lithium Polymer Battery safety tips.
{: .notice--warning}
![](/assets/images/reference/selection_guide/selection_guide_lipo.png)
> LiPo Battery(LB-012) 11.1V 1800mAh 

### [PSU](#psu)

A **PSU** or bench top power supply offers the most power, flexibility, and stability of any power supply solution. 

For high voltage DYNAMIXEL P Series actuators a PSU is ROBOTIS' recommended solution to ensure stable power delivery at the high voltages required for correct operation.

# [Controller & Interface](#controller--interface)

The controller is an essential part of any DYNAMIXEL system, and is responsible for accessing the Control Table of connected DYNAMIXELs to read and write data and command instructions.

For most applications, you can choose any one of the following control solutions depending on which fits your needs best.

{% capture sdk_notice_03 %}
**NOTE**: 
The DYNAMIXEL [Controller Compatibility Chart](/docs/en/parts/controller/controller_compatibility/) provides a convenient way to quickly check which controllers are compatible with each of ROBOTIS' sensors, servos, and software.
{% endcapture %}
<div class="notice">{{ sdk_notice_03 | markdownify }}</div>

## [Interfaces](#interfaces)

### [U2D2](#u2d2)
 
The [U2D2] is a serial interface for converting USB to TTL / RS-485 communication. 

Using a serial interface like the U2D2 is reqired to use [DYNAMIXEL Wizard 2.0](#dynamixel-wizard) and the [DYNAMIXEL SDK](#dynamixel-sdk) from your PC.

![](/assets/images/parts/interface/u2d2_01.png){: width="1017", height="198px"}

The DYNAMIXEL Starter Set includes everything you need to utilize your PC as your chosen controller, a [U2D2], [U2D2 Power Hub Board], and an SMPS 12V 5A AC Adapter 

  ![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_01.png) 

> Example Connection Diagram for the DYNAMIXEL Starter Set

<!-- NOTE: DYNAMIXEL Quick Start Guide -->

### [DYNAMIXEL Shields](#dynamixel-shields)

The [DYNAMIXEL Shield] and [DYNAMIXEL Shield MKR] were created to enable users to easily integrate DYNAMIXELs into their arduino based projects. Using the shields in combination with the [DynamixelShield](#dynamixelshield) library enables Arduino users to control DYNAMIXELs with a simple and flexible API.

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_05.png) 
> Example Connection Diagram for the DYNAMIXEL Shield

## [Embedded Controllers](#embedded-controllers)

<!-- ### [OpenRB-150](#openrb-150)

The [OpenRB-150] is a new open source controller designed to be highly compatible with the Arduino ecosystem. Using the dedicated Dynamixel2Arduino(#dynamixel2arduino) library allows you to quickly get started developing your application.

The OpenRB's features include:
- A SAMD21 Cortex-M0+ 32bit low power ARM® MCU, providing support for Arduino IDE. 
- Compatibility with Arduino MKR form factor Shields, allowing the integration of additional features and hardware.
- On-board 3Pin JST connectors to directly control and power DYNAMIXELs.
- Special firmware included in the OpenRB Board Manager, allowing the OpenRB-150 to be used to connect with [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)  -->

### [OpenCR1.0](#opencr10)

The [OpenCR1.0](/docs/en/parts/controller/opencr10) (Open-source Control module for ROS) is an open source robot controller with a powerful embedded MCU from the ARM Cortex-M7 line-up. The hardware, software, schematics, PCB Gerber, BOM, and firmware of the OpenCR1.0 are completely open source. It was developed to serve as the main controller used in the official ROBOTIS ROS education platform [TurtleBot3](/docs/en/platform/turtlebot3/overview/).

The OpenCR is also compatible with Arduino IDE for developing customized software for your projects, with support for the [DYNAMIXEL SDK (Arduino)](#dynamixel-sdk-arduino) and [Arduino Library](#arduino-library). 

![](/assets/images/parts/controller/opencr10/opencr_pinout.png) 
> OpenCR 1.0 Layout and Pin Map

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_03.png) 
> Example Connection Diagram for the OpenCR 1.0

### [OpenCM9.04](#opencm904)

The [OpenCM9.04] features an embedded MCU from the ARM Cortex-M3 line-up, and is compatible with Arduino IDE([DYNAMIXEL SDK (Arduino)](#dynamixel-sdk-arduino), [Arduino Library](#arduino-library)) for development of custom software for your project.

![](/assets/images/parts/controller/opencm904/opencm904_14.png)

{% capture exp_board %}
**NOTE** When combined with the [OpenCM 485 EXP Board](/docs/en/parts/controller/opencm485exp) the OpenCM 9.04 can be used with both TTL and RS485 DYNAMIXEL Actuators.
 
![](/assets/images/parts/controller/opencm904/opencm485exp_product.jpg)

{% endcapture %}

<div class="notice">{{ exp_board | markdownify }}</div>

## [Educational](#educational)

### [CM Series](#cm-series)

ROBOTIS' CM Series controllers were designed for use in ROBOTIS [Educational Kits](/docs/en/edu/) alongside our dedicated [educational software](#educational-software). 

Most CM Series controllers provide OLLO Ports where [dedicated CM Series sensors](/docs/en/parts/all_sensors/) can be mounted and easily controlled using R+ software. 

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_04.png)
>Example Connection Diagram for CM Series Controllers

![](/assets/images/parts/controller/cm-150/cm-150_002.jpg)
>Dedicated OLLO Ports for Additional Sensors

The following items are our recent & most popular educational level controllers. Review the specifications available for each on their eManual pages in order to select the model best for your use.
- [OpenCM9.04]
- [CM-530]
- [CM-550]

**NOTE**: To see a full range of controllers provided by ROBOTIS, visit our [Controllers](/docs/en/parts/all-controller/) page.
<br>Not all sensors are compatible with all CM series controllers, refer to the [Parts Compatibility Chart](/docs/en/parts/controller/controller_compatibility/#parts) for more information.
{: .notice}

## [Other Controllers](#other-controllers)

ROBOTIS provides a wide range of [Educational Kits](/docs/en/edu/) and [DYNAMIXEL Systems](/docs/en/platform/) that contain everything needed to construct a DYNAMIXEL powered robotic system, including servos, frames, cables, and a dedicated controller.

See all the range of [Controllers](/docs/en/parts/all-controller/) for more information.

# [Software & Tools](#software--tools)

Your choice of software is another important consideration for your DYNAMIXEL System. Your controller combined with your software defines the capabilities of your project, and how you will interact with your DYNAMIXELs.

Check out the [Software Compatibility](/docs/en/parts/controller/controller_compatibility/#software) which software supports your previous component selections.

## [Test & Management](#test--management)

### [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)

[DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/) is an configuration and testing tool for managing DYNAMIXELs available for for all major operating systems (Linux / Mac / Windows). A [U2D2](#u2d2), [Compatible controller](/docs/en/parts/controller/controller_compatibility), or other serial converter is required for use with DYNAMIXEL Wizard.

DYNAMIXEL Wizard 2.0 supports the following DYNAMIXEL configuration and testing features:

- DYNAMIXEL Firmware Update and Recovery
- DYNAMIXEL Calibration and Testing
- Troubleshooting and Shutdown Status Diagnosis
- Real-Time Data Plotting 
- Generation & Monitoring of DYNAMIXEL Packets

![](/assets/images/sw/dynamixel/wizard2/wizard2_main_001.png)

### [R+ Manager 2.0](#r-manager-20)

[R+ Manager 2.0](/docs/en/software/rplus2/manager/) is a configuration and testing suite available as part of the [R+ Software Suite](#r-software-suite), for maintenance and configuration of robots included in ROBOTIS' Educational Kits including [CM-Series Controllers](#cm-series) and their supported DYNAMIXEL models. 

![](/assets/images/sw/rplus2/manager/roboplus_manager2_07.jpg)

**NOTE**: For new DYNAMIXEL users [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20) is ROBOTIS' recommended configuration utility. DYNAMIXEL Wizard 2.0 is the newest and most capable configuration utility provided by ROBOTIS.
{: .notice}

## [DYNAMIXEL Development](#dynamixel-development)

### [DYNAMIXEL SDK](#dynamixel-sdk)

The [DYNAMIXEL SDK](/docs/en/software/dynamixel/dynamixel_sdk/overview/) is a software development kit supporting a wide variety of programming languages including: 
* C
* C++
* C#
* Python
* Java
* Matlab
* LabVIEW
on all major operating systems (Linux, Windows, Mac). The provided APIs allow simple control and manipulation of DYNAMIXEL actuators.

<iframe width="560" height="315" src="https://www.youtube.com/embed/F-sXbIAM0jc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>


**NOTE**: ROBOTIS recommends the use of a [U2D2](#u2d2) USB to serial converter to interface DYNAMIXEL with your development device (PC,SBC and etc). Otherwise, in order to utilize these libraries without the use of a U2D2 you will be required to implement a [DYNAMIXEL Communication Cirucut](#communication).
{: .notice}

#### [DYNAMIXEL SDK (Arduino)](#dynamixel-sdk-arduino)

ROBOTIS' [Embedded Controllers](#embedded-controllers) support the DYNAMIXEL SDK through the [Arduino IDE](/docs/en/software/arduino_ide/) allowing your system to use full features of the DYNAMIXEL SDK.

**NOTE**: If you are a hobbyist user, ROBOTIS recommends the  [Dynamixel2Arduino](#dynamixel2arduino) library.
{: .notice}

### [Arduino Library](#arduino-library)

ROBOTIS provides comprehensive libraries including examples for many use cases for Arduino users.
- [Dynamixel2Arduino](#dynamixel2arduino)
- [DynamixelShield](#dynamixelshield)

![](/assets/images/parts/interface/dynamixel_shield/examples.png)
> DynamixelShield Library: Basic Examples

#### [Dynamixel2Arduino](#dynamixel2arduino)

The [Dynamixel2Arduino] library is based on the [DYNAMIXEL SDK](#dynamixel-sdk-arduino) and provides an easy way to utilize the full features of the DYNAMIXEL SDK in your Arduino sketches. Dynamixel2Arduino provides a user-friendly experience without sacrificing any of the power or flexibility of the DYNAMIXEL SDK.
- [API Reference](/docs/en/software/arduino_ide/#dynamixel2arduino-library)

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

#### [DynamixelShield](#dynamixelshield)

The [DynamixelShield] library is specifically designed for use with ROBOTIS' [DYNAMIXEL Shields](#dynamixel-shields) this library inherits all the features and capabilities of the [Dynamixel2Arduino](#dynamixel2arduino) library, while providing even easier programming for compatible shields.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_03.png)

## [Educational Software](#educational-software)

ROBOTIS Educational software is a dedicated software developed for our [educational kits](/docs/en/edu/) and [CM Series](#cm-series) controllers including: 

- Task and motion programming tools providing a variety of examples to help users get started. ([R+ Software Suite](#r-software-suite)) 
- Maintenance and configuration utilities for CM Series controllers and compatible platorms. ([R+ Manager 2.0](#r-manager-20))

### [R+ Software Suite](#r-software-suite)

The R+ (Roboplus) Software suite is ROBOTIS' first party robot controller software offering. R+ is offered in a variety of forms to enable users to utilize the programming style and language they feel most comfortable with. The [R+ Software](/docs/en/software/#roboplus-r) eManual page provides more information about the varietes of Roboplus software available.

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
[DYNAMIXEL Protocol 1.0]: /docs/en/dxl/protocol1/
[DYNAMIXEL Protocol 2.0]: /docs/en/dxl/protocol2/
