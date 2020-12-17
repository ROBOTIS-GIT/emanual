---
layout: archive
lang: en
ref: dxl-quick-start-insert
read_time: true
share: true
author_profile: false
permalink: /docs/en/dxl/dxl-quick-start-insert/
sidebar:
  title: DYNAMIXEL Qucik Start
  nav: "dxl-quick-start"
---

# [Getting Started](#getting-started-with-dynamixel)

ROBOTIS provides the following solutions for controlling DYNAMIXEL. 
 
## [DYNAMIXEL and PC](#dynamixel-and-pc)

### [DYNAMIXEL Starter Set](#dynamixel-starter-set)
By interfacing DYNAMIXEL with your PC via the DYNAMIXEL Starter Set, you can program DYNAMIXEL in a wide variety of IDEs/programming languages including: [DYNAMIXEL Wizard 2.0] software & [DYNAMIXEL SDK] (ROS MATLAB LabView Python Visual Studio Eclipse C/C++ C# Visual Basic Java)  

DYNAMIXEL Starter Set : [U2D2], [U2D2 Power Hub Board] , SMPS 12V 5A AC Adapter 

  ![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_01.png) 

{% capture sdk_notice_01 %}
**NOTE**: 
- [DYNAMIXEL SDK] and other ROBOTIS software is available to download at the [en.robotis.com](http://en.robotis.com/) Download Center. 
- For more information on the ROBOTIS Software, see [Software](/docs/en/software/)
- To assemble DYNAMIXEL Starter Set (U2D2 + U2D2 Power Hub Board + SMPS), see [How to Assemble](/docs/en/parts/interface/u2d2_power_hub/#how-to-assemble)
{% endcapture %}

<div class="notice">{{ sdk_notice_01 | markdownify }}</div>

## [DYNAMIXEL and OpenCM](#dynamixel-and-opencm)

### [OpenCM9.04](#opencm904) 

[OpenCM9.04] is an open-source embedded controller than can be programmed with the Arduino IDE. The controller features a 32-bit ARM Cortex-M3 processor (STM32F103CB), a TTL bus for control of TTL-based DYNAMIXELs (AX/MX), a 4-pin communication port, a micro-USB Type B port for downloading programs via PC, 26 GPIO pins to access the STM32F103CB microcontroller, and 4 5-pin ports for connecting sensors. The OpenCM9.04’s circuit diagram and source code are open.

### [OpenCM 485 Expansion Board](#opencm-485-expansion-board)

[The OpenCM 485 Expansion Board] features 12V and 24V power connectors as well as TTL/RS-485 buses for simultaneous communication with TTL and RS-485 based DYNAMIXELs (X-series and P-series require "convertible" cable for correct connector such as Molex-Jst Robot Cable-[X4P](http://en.robotis.com/shop_en/item.php?it_id=903-0246-000) or [X3P](http://en.robotis.com/shop_en/item.php?it_id=903-0251-000))

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_02.png) 

{% capture sdk_notice_02 %}
**NOTE**: 
- OpenCM9.04 and OpenCM485 EXP board must be set up to be used together. Solder header pins to the OpenCM9.04 and once complete mount the OpenCM9.04 board to the OpenCM 485 EXP board.
- DYNAMIXELs may be operated using any embedded board that can send a signal through the serial bus (multi-drop, half-duplex TTL or RS-485 depending on model of DYNAMIXEL).
{% endcapture %}
<div class="notice">{{ sdk_notice_02 | markdownify }}</div>

## [DYNAMIXEL and OpenCR1.0](#dynamixel-and-opencr10)

[OpenCR1.0] (Open-source Control module for ROS) is an open source robot controller embedded with a powerful MCU from the ARM Cortex-M7 line-up. 
The hardware, software, schematics, PCB Gerber, BOM, and firmware source codes of the OpenCR1.0, the main controller used in the official ROS education platform TurtleBot3, are accessible and open to the public. 

Supports RS-485 and TTL to control DYNAMIXEL, and offers UART, CAN and a variety of other communication environment, development tools such as Arduino IDE are available as well. 
It has the advantage of being able to operate more powerfully when used with a host controller such as SBC (Single Board Computer). 
The OpenCR board manager for Arduino IDE includes various examples to maximize the feature of OpenCR1.0

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_03.png) 

## [DYNAMIXEL and CM-Series](#dynamixel-and-cm-series)
 
ROBOTIS also has exclusive controllers for programming DYNAMIXEL. These controllers include the CM-700 (Compatible with TTL-based AX / MX series DYNAMIXEL), CM-530(Compatible with TTL-based AX/MX series DYNAMIXEL), CM-550(Compatible with TTL-based X series DYNAMIXEL).

### [CM-700](#cm-700)
[CM-700] features an ATmega2561 CPU, GPIO ports for connecting analog sensors, and ZigBee and Bluetooth connectors. This controller also features a TTL/RS485 communication circuit, allowing for any TTL-based DYNAMIXELs (AX/MX) to be on the same bus as RS485-based DYNAMIXELs (AX/RX/MX).
 
### [CM-530](#cm-530)
[CM-530] features a 32-bit ARM Cortex-M3 processor (STM32F103RE), GPIO ports for connecting analog sensors, and support for IR, ZigBee, and Bluetooth communication. The controller supports TTL-based AX and MX series DYNAMIXELs. 

**NOTE**: CM-700 and CM-530 are compatible with RoboPlus software. You can develop embedded C firmware using the SDKs compatible with each controller.
{: .notice}

### [CM-550](#cm-550)
[CM-550] features a 32-bit ARM Cortex-M4 (168 \[MHz], 32 \[Bit]) , DYNAMIXEL TTL Communication board, BLE Slave communication module, Gyro Accelerometer, Temperature sensor, Buzzer, RGB LED, Sensor ports, MIC, etc. CM-550 is compatible with the latest [R+ 3.0 software] and it only supports TTL-based X series DYNAMIXEL.

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_04.png) 

{% capture sdk_notice_03 %}
**NOTE**: 
- Check the [controller compatibility](/docs/en/parts/controller/controller_compatibility/) chart to see which servos, sensors, peripherals, and software are compatible with which controller. 
{% endcapture %}
<div class="notice">{{ sdk_notice_03 | markdownify }}</div>

## [DYNAMIXEL and Arduino](#dynamixel-and-arduino)

[DYNAMIXEL Shield] was created to use [RC-100] and DYNAMIXEL on arduino board.
The hardware serial port is used to communicate with DYNAMIXEL, therefore, RC-100 or [LN-101] has to be connected to the software serial communication port(SW TX/RX) via Arduino pin 7 and 8.

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_05.png) 

{% capture sdk_notice_03 %}
**NOTE**: 
- [Use of Serial Monitor with DYNAMIXEL Shield](/docs/en/parts/interface/dynamixel_shield/#use-of-serial-monitor-with-dynamixel-shield)
- ROBOTIS provides DYNAMIXEL library for DYNAMIXEL Shield, it can help you to use DYNAMIXEL easily.
- Check the [controller compatibility](/docs/en/parts/controller/controller_compatibility/#software) chart to see which servos, sensors, peripherals, and software are compatible with which controller. 
{% endcapture %}
<div class="notice">{{ sdk_notice_03 | markdownify }}</div>

[DYNAMIXEL Wizard 2.0]: /docs/en/software/dynamixel/dynamixel_wizard2/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[U2D2]: /docs/en/parts/interface/u2d2/
[U2D2 Power Hub Board]: /docs/en/parts/interface/u2d2_power_hub/
[Software]: /docs/en/software/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[The OpenCM 485 Expansion Board]: /docs/en/parts/controller/opencm485exp/
[OpenCR1.0]: /docs/en/parts/controller/opencr10/
[CM-700]: /docs/en/parts/controller/cm-700/
[CM-530]: /docs/en/parts/controller/cm-530/
[CM-550]: /docs/en/parts/controller/cm-550/
[R+ 3.0 software]: /docs/en/software/rplustask3/
[DYNAMIXEL Shield]: /docs/en/parts/interface/dynamixel_shield/
[RC-100]: /docs/en/parts/communication/rc-100/
[LN-101]: /docs/en/parts/interface/ln-101/
