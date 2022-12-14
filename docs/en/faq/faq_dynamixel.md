---
layout: archive
lang: en
ref: faq_dynamixel
read_time: true
share: true
author_profile: false
permalink: /docs/en/faq/faq_dynamixel/
sidebar:
  title: FAQ DYNAMIXEL
  nav: "faq_dynamixel"
---

**TIP** : If you are experiencing problems with your DYNAMIXEL actuators, the [DYNAMIXEL Self Checklist] is a great way to diagnose and resolve most issues.
{: .notice--success}

**NOTE** : More FAQs can be found on the [ROBOTIS Support FAQ page].
{: .notice}

# What is the difference between DYNAMIXEL Protocol 1.0 and 2.0?

The structure of the DYNAMIXEL packets used to communicate has been changed between the protocols. Products utilizing different DYNAMIXEL protocols are not able to be utilized together on a single DYNAMIXEL network.

## DYNAMIXEL Protocol 1.0
[DYNAMIXEL Protocol 1.0] was used on our legacy DYNAMIXEL models, including:
* [MX Series]
* [AX Series]
* [RX Series]
* [EX Series]
* [DX Series]

[DYNAMIXEL Protocol 1.0] is now considered a legacy communications protocol, and ROBOTIS recommends transitioning to products utilizing [DYNAMIXEL Protocol 2.0].

## DYNAMIXEL Protocol 2.0
[DYNAMIXEL Protocol 2.0] is used in ROBOTIS' new DYNAMIXEL series: 
* [DYNAMIXEL-X]
* [DYNAMIXEL-P]

[DYNAMIXEL Protocol 2.0] is an improved communications protocol featuring PID (Proportional, Integral, Derivative) controls allowing for extremely precise and fine-tuned movements. In addition to the default support for Protocol 2.0 provided by our new actuators, [MX Series] DYNAMIXELs may undergo firmware upgrade to add support for [DYNAMIXEL Protocol 2.0].

Please refer to [DYNAMIXEL Protocol 1.0] and [DYNAMIXEL Protocol 2.0] description pages for more information.

# What is a Control Table?

The Control Table is an internal memory structure consisting of multiple memory types (EEPROM, RAM) and data fields (Control Table Items) used by DYNAMIXELs to store status information and to control the device. Users can check current status of the device by reading specific control table fields, or control DYNAMIXELs by writing to control table fields. 

For more details about Instruction and Status Packets as well as how to read and write to DYNAMIXEL control tables, please refer to the eManual pages regarding [DYNAMIXEL Protocol 1.0] or [DYNAMIXEL Protocol 2.0] depending on the communications protocol supported by your actuators.

**NOTE**: To check which products support which DYNAMIXEL Protocol (1.0 or 2.0), see the [DYNAMIXEL Protocol Compatibility Table](/docs/en/popup/faq_protocol_compatibility_table/){: .popup} 
{: .notice}

**TIP** : The firmware addresses remain similar for DYNAMIXEL's within the same series.    
ex) Goal Position of [AX-12A](/docs/en/dxl/ax/ax-12a/#goal-position-30) and [AX-18A](/docs/en/dxl/ax/ax-18a/#goal-position-30) is firmware address 30.
{: .notice--success}


# What kind of connector does my DYNAMIXEL use?
Connector information for each DYNAMIXEL actuator is available in the "Connector Information" section on the actuator's eManual page.

* [DYNAMIXEL-X]
* [DYNAMIXEL-P]

**LEGACY PRODUCTS**
* [MX Series]
* [AX Series]
* [RX Series]
* [EX Series]
* [DX Series]
{: .notice--warning}

# Which hardware should I use to connect DYNAMIXEL?
1. [U2D2]
   The U2D2 USB to Serial converter is the most widely used interface to connect DYNAMIXEL actuators to a PC.
2. ROBOTIS provides a variety of robot controllers designed especially for use with DYNAMIXEL servos, including: [OpenRB-150], [OpenCM9.04], [OpenCM9.04] + [OpenCM 485 EXP], [CM-530], [CM-700], and [OpenCR1.0].
3. DYNAMIXEL actuators are completely controller agnostic, and are fully compatible with any system capable of DYNAMIXEL Protocol communications. DYNAMIXEL actuators communicate via half-duplex UART (TTL or RS485 depending on your model). Refer to the **Communication Circuit** section on the eManual page for your DYNAMIXEL model for more information on communication circuit implementation.

# How can I test or configure my DYNAMIXEL actuator?
1. Use [DYNAMIXEL Wizard 2.0] or [R+ Manager 2.0] for products using **DYNAMIXEL Protocol 2.0**.
2. Use [DYNAMIXEL Wizard 2.0] or [DYNAMIXEL Wizard] for products using **DYNAMIXEL Protocol 1.0**.

# How can I create a program to control DYNAMIXELs?
1. If you intend to control your DYNAMIXELs from your PC with a [U2D2] or comparable USB to serial interface, you can use ROBOTIS' [DYNAMIXEL SDK](/docs/en/software/dynamixel/dynamixel_sdk/overview/)(C, C++, C#, Java, MATLAB, LabVIEW, Python, ROS) or [R+ Task 3.0]
2. If you want to control your DYNAMIXELs using an embedded microcontroller like our [OpenRB-150] or [OpenCR1.0] the [Arduino IDE] supports the [DYNAMIXEL SDK] through the offical DYNAMIXEL2Arduino library.


# When DYNAMIXEL X series servos are operating in DYNAMIXEL Protocol 1.0 compatibility mode, are the firmware addresses really changed?
Protocol 1.0 compatibility mode does not change the firmware addresses of DYNAMIXEL actuators, but will allow it to communicate using DYNAMIXEL Protocol 1.0 for compatibility with legacy DYNAMIXEL actuators.


# I'd like to know which frames and horns are compatible with my DYNAMIXEL actuator.
Please refer to the [DYNAMIXEL Compatibility Guide].

# Where can I find 3D models of DYNAMIXEL servos and accessories?
Models for 3d printing and component design can be downloaded from the [ROBOTIS Download Center].

# Can I purchase internal components for my DYNAMIXEL?
Replacement gear sets for AX, MX and X Series DYNAMIXELs are available for purchase from ROBOTIS online storefront in your region. Other internal components are not sold separately.

# What are the power requirements for DYNAMIXEL actuators?
Each DYNAMIXEL has different power requirements. Please refer to the eManual page for your DYNAMIXEL model for more information.

# Can I mix different DYNAMIXEL series actuators in the same DYNAMIXEL Network?
DYNAMIXEL communication relies on all actuators utilizing the same communication protocol as well as the [correct logic level (buffer circuit)](http://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#ttl-communication) for packet structure and instructions.

DYNAMIXEL Protocol 2.0 DYNAMIXEL actuators may be configured to accept Communication DYNAMIXEL Protocol 1.0 commands by changing the [DYNAMIXEL Protocol Version parameter](/docs/en/dxl/x/xl430-w250/#protocol-version13) in DYNAMIXEL firmware to allow compatibility with legacy actuators.

# What is the recommended torque range for DYNAMIXEL actuators?
Each DYNAMIXEL has different torque ranges. Please refer to the performance graph on the eManual page for your actuator for more specific information.

# My DYNAMIXEL is not being detected by ROBOTIS software!
1. Make sure that proper power is being supplied to all connected DYNAMIXELs.
2. Make sure that each DYNAMIXEL in the network has a unique ID assigned.
3. Make sure that all cables and connectors are securely connected.
4. Make sure that all cables are not damaged.
5. Try searching all Baud Rates for connected DYNAMIXELs.
6. Try [Firmware Recovery].

# DYNAMIXEL is not detected in 3rd party software (LabView, Visual Studio, etc) when trying to communicate via SDK source code examples!
A known issue with Windows' 32-bit DLL may be preventing communication over COM ports higher than 09. Utilizing a lower COM port may resolve this issue.


# What is the meaning of the 'R' and 'T' at the end of a DYNAMIXEL's model name?

This character indicates the supported communications protocol for that model of DYNAMIXEL actuator:
- R indicates support for RS-485 serial communication
- T indicates support for TTL serial communication

Connector information for each communications protocol is available here on the ROBOTIS eManual.
- [MOLEX Connector Information](/docs/en/dxl/mx/mx-28/#connector-information)
- [JST Connector Information](/docs/en/dxl/x/xm430-w350/#connector-information)


# What certifications/ratings do DYNAMIXEL actuators have?
* DYNAMIXEL [P Series] actuators are CE/FCC certified.
* DYNAMIXEL XW Series actuators are IP68 rated.

 For more information, please refer to the eManual pages for each actuator.




[DYNAMIXEL Protocol 1.0]: /docs/en/dxl/protocol1/
[DYNAMIXEL Protocol 2.0]: /docs/en/dxl/protocol2/
[MX Series]: /docs/en/dxl/#mx-series
[AX Series]: /docs/en/dxl/#ax-series
[RX Series]: /docs/en/dxl/#rx-series
[EX Series]: /docs/en/dxl/#ex-series
[DX Series]: /docs/en/dxl/#dx-series
[DYNAMIXEL-X]: /docs/en/dxl/#x-series
[DYNAMIXEL Pro]: /docs/en/dxl/#pro-series
[DYNAMIXEL-P]: /docs/en/dxl/#p-series
[MX]: /docs/en/dxl/#mx-series
[U2D2]: /docs/en/parts/interface/u2d2/
[USB2DYNAMIXEL]: /docs/en/parts/interface/usb2dynamixel/
[manual installation]: /docs/en/parts/interface/usb2dynamixel/#install-driver-manually
[OpenRB-150]: /docs/en/parts/controller/openrb-150/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[OpenCM 485 EXP]: /docs/en/parts/controller/opencm485exp/
[CM-530]: /docs/en/parts/controller/cm-530/
[CM-700]: /docs/en/parts/controller/cm-700/
[OpenCR1.0]: /docs/en/parts/controller/opencr10/
[DYNAMIXEL Wizard]: /docs/en/software/rplus1/dynamixel_wizard/
[DYNAMIXEL Wizard 2.0]: /docs/en/software/dynamixel/dynamixel_wizard2/
[R+ Manager 2.0]: /docs/en/software/rplus2/manager/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[R+ Task]: /docs/en/software/rplus1/task/getting_started/
[R+ Task 2.0]: /docs/en/software/rplus2/task/
[Arduino IDE]: /docs/en/software/arduino_ide/
[DYNAMIXEL Workbench]: /docs/en/software/dynamixel/dynamixel_workbench/
[DYNAMIXEL Compatibility Guide]: http://en.robotis.com/service/compatibility_table.php?cate=dx
[ROBOTIS Download Center]: http://en.robotis.com/service/downloadcenter.php
[Firmware Recovery]: /docs/en/software/dynamixel/dynamixel_wizard2/#firmware-recovery
[DYNAMIXEL Self Checklist]: http://en.robotis.com/model/selfcheck.php
[ROBOTIS Support FAQ page]: http://en.robotis.com/model/board.php?bo_table=robotis_faq_en
[Compatibility Table]: /docs/en/popup/faq_protocol_compatibility_table/
