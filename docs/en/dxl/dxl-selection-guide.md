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

# [Getting Started](#getting-started)

**Thank you** for your purchase or consideration of ROBOTIS' DYNAMIXEL Smart Servos. 

DYNAMIXEL is a brand of Smart Actuator developed by ROBOTIS for use in any robotic system.
The name “DYNAMIXEL” is derived from two words- “Dynamic” and “Cell”, which when combined together form DYNAMIXEL, the all-in-one smart actuator.
DYNAMIXELs offer various benefits over other comparable servos including:
- Each DYNAMIXEL is an All-in-one module with a variety of elements required to drive a robot without other devices. All you need is power and communication to operate a robot.
- Extensive support and knowledge base to support first time users, as well as experts
- DYNAMIXELs are completely controller agnostic, allowing the use of any control solution compatible with TTL or RS485 serial communication
- Select from a wide variety of models to best suit your system’s needs based on torque, velocity, and other specifications ranging from low-cost models for beginners to high-performance models for professionals.
- Control Modes supporting Position Control, Velocity Control, Current (Torque) Control, PWM Control, and more.
- Real-time feedback for position, velocity, current (torque/load), temperature, voltage, hardware status, and more are available through the DYNAMIXEL firmware without any additional hardware. 
- Full PID Control allowing users to fine-tune motions
- A selection of optional frames are available to enable simple construction of robot designs
- CAD data for products available online to enable design of custom parts and robots. 
- Designed for "daisy-chain" connections to link multiple DYNAMIXELs. One cable between each link in the DYNAMIXEL chain simplifies cable management and power delivery.


# [DYNAMIXEL Selection](#dynamixel-selection)

When selecting a DYNAMIXEL servo and control solution for your application, it is important to ensure that all of your chosen components are compatible with one another. One way to ensure that they will all be compatible with one another is to select them in the following order.

1. Servos
3. Controller
4. Software
5. Power

Each of these components is vital, and your choice for each will be dictated by the needs of your application, as well as your previous choices. It is important to consider all of the factors before you begin building your DYNAMIXEL, as well as during the selection process, so that you can ensure that all your choices are compatible.

The remainder of this document will provide a helpful guide to assist you in selecting the DYNAMIXEL Smart servo and control solution perfect for your use case.

## [Servos](#servos)

The first consideration for any DYNAMIXEL System is the servos. It's not a DYNAMIXEL System if it doesn't have any DYNAMIXELs! Choosing a DYNAMIXEL for your application should start by understanding the capabilities and communications protocol supported by the servos you are considering.

### [DYNAMIXEL Models](#dynamixel-models)

DYNAMIXELs come in a variety of sizes and with a variety of capabilities, with each model especially suited for a particular purpose. Before we look into the specifics of DYNAMIXEL performance, it is helpful to understand the differences between each DYNAMIXEL model. This will give you a convenient way to identify the general characteristics and uses for a particular DYNAMIXEL unit at a glance.

![](/assets/images/dxl/x/dxl_x_productline.png)

The above graphic shows the naming format for DYNAMIXEL servos. DYNAMIXEL model names can be broken down into the following components, to allow you to quickly identify a DYNAMIXEL based on it's name alone:

1. Performance Band - DYNAMIXELs are grouped in performance categories, based on the performance and construction materials of each servo.
2. Dimensions - DYNAMIXELs come in a selection of sizes, to enable them to be used in a variety of applications. Models with the same dimensional number have identical exterior dimensions and mounting features, enabling them to be used interchangeably.
3. Voltage - Each DYNAMIXEL has a specified operational voltage, this is an important factor to consider when selecting your servos.
4. Gear Ratio - The reduction ratio of the included gear set. Higher numbers mean more torque at the cost of lower RPM.
5. Communication Protocol - DYNAMIXELs support one of two serial communications protocols to transmit instructions. It is important to select servos with matching protocols.

This information is invaluable in narrowing your choices for servos before moving on to considering the performance of the units.

### [Performance](#performance)

The easiest way to select a DYNAMIXEL based on its performance is to look at the NT-graph:

![](/assets/images/dxl/pro/h54-100-s500-r_performance_graph_2.png)

Most DYNAMIXEL servos have a graph like that one located on their page here on the eManual. This graph provides an easy way to examine the overall performance characteristics of the servo at a glance, by graphing four of the most important metrics against one another:

1. Torque Output - This is the measure of the output force of the servo, measured in Newton-Meters. It is represented by the **black** line on the graph, sharing that line with the next performance metric.
2. Output Speed - The output speed at the horn of the DYNAMIXEL Servo, in Revolutions per Minute. This shares the **black** line in the graph with the Torque Output.
3. Current Draw - The amount of current drawn by the servo, measured in Amps. Represented by the <span style="color:red">**red**</span> line in the graph.
4. Efficiency - This is a measure of how much input power is being converted successfully into movement, rather than lost to heat and other factors, measured as a percentage. Different motors will perform more or less efficiently at different speeds and loads. This is represented by the <span style="color:green">**green**</span> line on the graph.

These factors can help you compare the performance of different DYNAMIXELs to help you find the one that is right for your use case.

### [Communication](#communication)

Another factor that sets DYNAMIXELs apart from one another is their supported communications protocol. DYNAMIXELS communicate with one another over a serial bus, and each DYNAMIXEL supports one of two methods of serial communication. 

#### [TTL](#ttl)

Most DYNAMIXEL servos operate using TTL communications protocol. An easy way to identify TTL DYNAMIXEL servos is if the model name ends with a "T", or if the DYNAMIXEL ports on the rear of the servos are 3 pin ports like these:

![](/assets/images/dxl/jst_b3beha.png)![](/assets/images/dxl/jst_b3beha_diagram.png)  
![](/assets/images/dxl/x/x_series_ttl_pin.png)

#### [RS485](#rs485)

Some higher end DYNAMIXEL servos operate using RS485 communications protocol. These servos can be identified by a model name that ends with an "R", or if the DYNAMIXEL ports on the rear of the servos are 4 pin ports like these:

![](/assets/images/dxl/jst_b4beha.png)![](/assets/images/dxl/jst_b4beha_diagram.png)  
![](/assets/images/dxl/x/x_series_485_pin.png)

#### [TTL + RS485](#ttl+rs485)

Ordinarily, DYNAMIXELs utilizing different serial protocols can not communicate with one another over the same serial bus. This means that it is important to select servos using compatible communications protocols. In some applications, you may need to combine DYNAMIXELs with mismatched serial protocols. For these cases, you can combine mismatched serial protocols using a [DYNAMIXEL Communication Bridge](/docs/en/parts/interface/dxl_bridge/).

![](/assets/images/parts/interface/dxl_bridge/u2d2_bridge_ttl_485.png)

For first time DYNAMIXEL users, ROBOTIS recommends selecting servos with matching protocols.

### [Firmware](#firmware)

DYNAMIXELs depend on their firmware being up to date to deliver the best performance possible. Keeping your DYNAMIXEL updated ensures that you will have the most reliable servo possible, as well as access to the newest DYNAMIXEL features as they debut.

MX series servos ship with firmware limited to [DYNAMIXEL Protocol 1.0](/docs/en/dxl/protcol1/) by default. Updating your MX firmware using **Firmware Recovery** through [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-recovery) or [R+ Manager](/docs/en/software/rplus2/manager/#firmware-recovery) is required to use the advanced features of [DYNAMIXEL Protocol 2.0](/docs/en/dxl/protcol2/).  
{: .notice--warning}
<p align="center"><iframe width="560" height="315" src="https://www.youtube.com/embed/q_gAewi_dyY" frameborder="0" allowfullscreen></iframe></p>   


For other DYNAMIXEL models, the firmware can be updated using the [Firmware Update](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-update) feature of DYNAMIXEL Wizard.

## [Controller](#controller)

The controller is the part of the DYNAMIXEL system responsible for issuing commands to the servos, as well as for interpreting the data received from connected DYNAMIXELs or any other integrated devices or sensors. For this reason, your choice of controller has a large impact on the rest of your DYNAMIXEL system. DYNAMIXEL's controller agnostic nature means that you can utilize any device capable of communication over TTL or RS485 serial as your DYNAMIXEL controller. For most applications, you can choose which of the following control solution fits your needs best.


{% capture sdk_notice_03 %}
**NOTE**: 
The DYNAMIXEL [Controller Compatibility Chart](/docs/en/parts/controller/controller_compatibility/) provides a convenient way to quickly check which controllers are compatible with each of ROBOTIS' sensors, servos, and software.
{% endcapture %}
<div class="notice">{{ sdk_notice_03 | markdownify }}</div>

### [CM Series](#cm-series)
 
ROBOTIS produces a series of controllers specifically designed for DYNAMIXEL Control. These controllers cover a wide variety of uses, so that you can choose the CM series controller best suited for your project.

#### [OpenCM9.04](#opencm904)

![](/assets/images/parts/controller/opencm904/opencm904_14.png)

[OpenCM9.04] is an open source robot controller developed to serve as the main controller used in the [ROBOTIS MINI](/docs/en/edu/mini) educational platform, comparable to the Arduino UNO. Featuring an embedded MCU from the ARM Cortex-M7 line-up. The OpenCM is compatible with the [Arduino IDE](docs/en/parts/controller/opencm904/#arduino-ide) for development of custom software for your project.

When combined with the [Expansion Board](/docs/en/parts/controller/opencm485exp.md) the OpenCM can be used to drive any variety of DYNAMXEL.
{: .notice}
 
![](/assets/images/parts/controller/opencm904/opencm485exp_product.jpg)

#### [CM-530](#cm-530)

![](/assets/images/parts/controller/cm-530/cm-530_product.png)

The ROBOTIS [CM-530] features a 32-bit ARM Cortex-M3 processor (STM32F103RE), GPIO ports for connecting analog sensors, and support for IR, ZigBee, and Bluetooth communication. The controller features ports for TTL-based AX and MX series DYNAMIXELs. 

The [CM-530] is compatible with RoboPlus software, and using the [Embedded C SDK](/docs/en/software/embedded_sdk/embedded_c_cm530) users can develop their own custom firmware for precise control over the [CM-530].

#### [CM-550](#cm-550)

![](/assets/images/parts/controller/cm-550/cm-550_product.png)

The ROBOTIS [CM-550] features a 168MHz, 32-bit ARM Cortex-M4 processor, DYNAMIXEL X Series TTL communication ports, BlueTooth communication module, gyroscope/accelerometer, temperature sensor, buzzer, RGB LED, microphone, and sensor ports for additional accessories.

The [CM-550] is designed for use with [R+ 3.0 software] and only supports TTL-based X series DYNAMIXELs.

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_04.png) 


### [PC](#pc)
 
The most flexible control solution for operating a DYNAMIXEL system is a PC, utilizing a [U2D2] or other serial interface you can directly control your DYNAMIXELs with limitless possibilities. A PC and [U2D2] enable you to use [DYNAMIXEL Wizard 2.0] to test, configure, and tune your DYNAMIXELs as well as the full features of the [DYNAMIXEL SDK], with support for:
- [C](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/c/c_porthandler/#c)
- [C++](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/cpp/cpp_porthandler/#cpp)
- [C#](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/csharp/csharp_porthandler/#csharp)
- [Python](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/python/python_porthandler/#python)
- [Java](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/java/java_porthandler/#java)
- [Matlab](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/matlab/matlab_porthandler/#matlab)
- [LabVIEW](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/labview/labview_porthandler/#labview)


The DYNAMIXEL Starter Set includes everything you need to utilize your PC as your chosen controller, a [U2D2], [U2D2 Power Hub Board], and an SMPS 12V 5A AC Adapter 

  ![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_01.png) 

{% capture sdk_notice_01 %}
**NOTE**: 
- [DYNAMIXEL SDK](/docs/en/software/dynamixel/dynamixel_sdk/overview/) and all other ROBOTIS software is available to download from our [Download Center](http://en.robotis.com/service/downloadcenter.php).
- For more information on the ROBOTIS Software, refer to the [Software](/docs/en/software/) eManual page.
- U2D2 [assembly instructions](/docs/en/parts/interface/u2d2_power_hub/#how-to-assemble) are available here on the eManual.
{% endcapture %}
<div class="notice">{{ sdk_notice_01 | markdownify }}</div>


### [Arduino](#arduino)

![](/assets/images/parts/interface/dynamixel_shield/with_arduino.png)

The [DYNAMIXEL Shield] and [MKR Shield](/docs/en/parts/interface/mkr_shield) were created to enable users to easily integrate DYNAMIXELs into their arduino based projects. Using the shields in combination with the [DYNAMIXEL2Arduino](docs/en/parts/interface/dynamixel_shield/#features) enables Arduino users to access the full features of DYNAMIXELs.

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_05.png) 

### [OpenCR1.0](#opencr10)

![](/assets/images/parts/controller/opencr10/opencr_product.png)

[OpenCR1.0](/docs/en/parts/controller/opencr10) (Open-source Control module for ROS) is an open source robot controller with a powerful embedded MCU from the ARM Cortex-M7 line-up. The hardware, software, schematics, PCB Gerber, BOM, and firmware of the OpenCR1.0 are completely open source. It was developed to serve as the main controller used in the official ROBOTIS ROS education platform [TurtleBot3](/docs/en/platform/turtlebot3/overview/).

The [OpenCR1.0](/docs/en/parts/controller/opencr10) supports RS-485 and TTL communication for DYNAMIXEL control as well as UART and CAN buses and a variety of other ports and opportunites for other peripherals. The OpenCR is also compatible with Arduino IDE for developing customized software for your projects. Additionally, the OpenCR can be used in coordination with a SBC such as a RaspberyPi to enable more powerful mobile operation than a standalone embedded controller.

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_03.png) 


## [Software](#software)

Your choice of software is another important consideration for your DYNAMIXEL System. Your controller combined with your software defines the capabilities of your project, and how you will interact with your DYNAMIXELs.

### [R+ 3.0 Software Suite](#r+-software-suite)

The R+ Software suite is ROBOTIS' first party robot controller software offering. R+ is offered in a variety of forms and on all major platforms, to enable DYNAMIXEL users to use the device and programming style they feel most comfortable with.

#### [R+ 3.0 Task](#r+-task)

![](/assets/images/sw/rplus_task3/task3_001.png)

The most fully featured option is [R+ Task 3.0](/docs/en/software/rplustask3/), featuring options to program your robot using ROBOTIS [Task Code](/docs/en/software/rplustask3/task_programming), Python, and [Motion Programming](/docs/en/software/rplustask3/motion_programming). [R+ Task 3.0](/docs/en/software/rplustask3/) also supports all current ROBOTIS CM series controllers.

#### [R+ Mobile](#r+-mobile)

![](/assets/images/sw/rplus_mobile/r+m_task2_4.png)

[R+ Mobile](/docs/en/software/rplus_mobile/mtask20/) is a fully featured programming environment for your Android smartphone, allowing programming, testing, and debugging to be done on the go.The ease of use and portability of this solution make it perfect for use in classroom settings as an easy to use programming interface that students will love.

### [Arduino IDE](#arduino-ide)

![](/assets/images/parts/controller/opencm904/oencm904_upload_01.png)

The Arduino IDE is compatible with both [OpenCR] and [OpenCM9.04], allowing users familiar with Arduino to easily integrate the [DYNAMIXEL SDK] to add fully featured DYNAMIXEL Support into their system.

## [Power](#power)

Supplying your DYNAMIXELs with adequate power is the final step to ensure proper function of your DYNAMIXEL System. DYNAMIXELs can be powered in a variety of ways, depending on the needs of the DYNAMIXEL and your project.

**NOTE** Each DYNAMIXEL model has a specified operating voltage and current. It is important to stay within these specified parameters. Exceeding a DYNAMIXEL's specified maximums or mixing DYNAMIXELS with different specifications may cause damage to your servos.
{: .notice--warning}

### [SMPS](#smps)

The SMPS power supply is ROBOTIS' recommended solution for powering most DYNAMIXEL Systems. The SMPS is capable of safely supplying a consistent 12v to ensure optimal operation of nearly any DYNAMIXEL.

### [Batteries](#batteries)

Some robots may require more mobility than a fixed power supply can offer, in those cases batteries may be the optimal solution for your high mobility robot. 

[DYNAMIXEL Wizard 2.0]: /docs/en/software/dynamixel/dynamixel_wizard2/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[U2D2]: /docs/en/parts/interface/u2d2/
[U2D2 Power Hub Board]: /docs/en/parts/interface/u2d2_power_hub/
[Software]: /docs/en/software/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[The OpenCM 485 Expansion Board]: /docs/en/parts/controller/opencm485exp/
[OpenCR]: /docs/en/parts/controller/opencr10/
[CM-700]: /docs/en/parts/controller/cm-700/
[CM-530]: /docs/en/parts/controller/cm-530/
[CM-550]: /docs/en/parts/controller/cm-550/
[R+ 3.0 software]: /docs/en/software/rplustask3/
[DYNAMIXEL Shield]: /docs/en/parts/interface/dynamixel_shield/
[RC-100]: /docs/en/parts/communication/rc-100/
[LN-101]: /docs/en/parts/interface/ln-101/
