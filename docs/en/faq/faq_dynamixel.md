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

**TIP** : If you have any problem with DYNAMIXEL, please go over this [DYNAMIXEL Self Checklist] first.
{: .notice--success}

**NOTE** : More FAQ can be found from [ROBOTIS Support page].
{: .notice}

# What is the difference between Protocol 1.0 and 2.0?

The structure of the instruction and status packet are different.
## Protocol 1.0
[Protocol 1.0] is used with established DYNAMIXEL product lines; the AX-series and MX-series DYNAMIXEL servos operate with [Protocol 1.0].

## Protocol 2.0
[Protocol 2.0] is used with the most recently-released DYNAMIXEL series; the X-series and PRO series utilize [Protocol 2.0]. The control tables of DYNAMIXEL's using Protocol 2.0 are expanded to include PID (Proportional, Integral, Derivative) controls allowing for extremely precise and fine-tuned movements. In addition, [MX]-series DYNAMIXEL's may undergo firmware upgrade to utilize [Protocol 2.0].

- X-series : XL, XM, XH
- MX-series : MX-28/64/106

Please refer to [Protocol 1.0] and [Protocol 2.0] description pages for more information.

# Which DYNAMIXEL uses Protocol 1.0 and Protocol 2.0?

Please refer to [Compatibility Table]{: .popup} of ROBOTIS products.

# What does Control Table/DYNAMIXEL firmware mean?

The Control Table contains every numbered firmware address that may be used in a command or status packet.

**TIP** : The firmware addresses remain similar for DYNAMIXEL's within the same series.    
ex) Goal Position of [AX-12A](/docs/en/dxl/ax/ax-12a/#goal-position-30) and [AX-18A](/docs/en/dxl/ax/ax-18a/#goal-position-30) is firmware address 30.
{: .notice--success}


# What kind of connector and cable does DYNAMIXEL use?
Please refer to Connector Information section of each DYNAMIXEL manual page below.

  - [Standard](http://en.robotis.com/model/board.php?bo_table=tutorial_vod_en&wr_id=1131796) - AX-Series, MX-Series, X-Series
  - [Pro](http://en.robotis.com/model/board.php?bo_table=tutorial_vod_en&wr_id=1151886) - H-Series, M-Series

# Which hardware should I use to connect DYNAMIXEL?
1. [U2D2]
   U2D2 is the most widely used and recommended interface to connect DYNAMIXEL and PC.
2. [USB2DYNAMIXEL]
   Check QC number. If it's in the range of 1412-1502 there may be an FTDI issue. Try [manual installation] or return the product for replacement.
2. ROBOTIS controllers
   You can use [OpenCM9.04], [OpenCM9.04] + [OpenCM 485 EXP], [CM-530], [CM-700], and [OpenCR1.0].
3. Other controllers
   DYNAMIXEL communicates via half-duplex UART (TTL or RS485 depending on your model). Refer to the **Communication Circuit** section in each DYNAMIXEL manual.

# How can I test DYNAMIXEL control table?
1. Please use [DYNAMIXEL Wizard] or [DYNAMIXEL Wizard 2.0] for the product using **Protocol 1.0**.
2. Please use [R+ Manager 2.0] or [DYNAMIXEL Wizard 2.0] for the product using **Protocol 2.0**.

# How can I make a program to control DYNAMIXEL?
1. If you are operating DYNAMIXEL from your PC with [U2D2] or [USB2DYNAMIXEL]
  You can use [DYNAMIXEL SDK](/docs/en/software/dynamixel/dynamixel_sdk/overview/)(C, C++, C#, Java, MATLAB, LabVIEW, Python, ROS) or [R+ Task] or [R+ Task 2.0]
2. If you are operating DYNAMIXEL from [OpenCM9.04] or [OpenCR1.0] embedded controller
  You can use [Arduino IDE] that supports [DYNAMIXEL SDK] and [DYNAMIXEL Workbench] libraries.


# If the Protocol Version of DYNAMIXEL's X-Series is changed, does it really change the firmware address?
This does not change the firmware addresses of DYNAMIXEL, but will allow it to communicate in Protocol 1.0 for compatibility with older series such as AX or MX.


# I'd like to know which frames and horns are compatible to my DYNAMIXEL.
Please refer to the [DYNAMIXEL Compatibility Guide].

# Where can I find 3D modeling files?
3D files can be found from [ROBOTIS Download Center].

# Can I purchase internal components for my DYNAMIXEL?
Replacement gears can be purchased except PRO and higher series.

# What is the power requirement of DYNAMIXEL?
Each DYNAMIXEL has different power requirements. Please refer to the manual page for each model.
Do not exceed the operating voltage range as it will damage the internal components.
DYNAMIXEL Pro is highly recommended to use with DC 24V.

# Why DYNAMIXEL X-series doesn't work with other DYNAMIXEL series?
1. To communicate with any DYNAMIXEL, users must utilize the communication protocol accepted by DYNAMIXEL as well as the [correct logic level (buffer circuit)](http://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#ttl-communication). The [XL430-W250-T](/docs/en/dxl/x/xl430-w250/) utilizes Communication [Protocol 2.0] for packet structure and instructions.

2. The third-party software solution you linked likely did not work due to being based on Communication [Protocol 1.0]. However, ROBOTIS does not recommend operating DYNAMIXEL's without the appropriate communication circuit.

3. [XL430-W250-T](/docs/en/dxl/x/xl430-w250/), and all Protocol 2.0 DYNAMIXEL actuators, may be configured to accept Communication Protocol 1.0 commands by changing the [Protocol Version parameter](/docs/en/dxl/x/xl430-w250/#protocol-version13) in DYNAMIXEL firmware.

# What is the recommended torque for DYNAMIXEL?
Each DYNAMIXEL has different torque ranges.
Please refer to the performance graph in the manual to find the most efficient torque range.
Please refer to the specifications for DYNAMIXEL Pro series.

# DYNAMIXEL is not detected from softwares(R+ softwares, DYNAMIXEL Wizard).
1. Make sure that proper power is being supplied to all DYNAMIXEL.
2. Make sure that each DYNAMIXEL in the network has unique ID.
3. Make sure that cables and connectors are securely connected.
4. Make sure that cables are not damaged.
5. Try searching for all Baud Rates.
6. Try [Firmware Recovery] for undetected DYNAMIXEL.

# DYNAMIXEL is not detected from other softwares(LabView, Visual Studio, etc) when trying to communicate via SDK source code examples.
In a peculiar case, Windows 32-bit DLL could not recognize COM port higher than COM9.


# What is the meaning of suffix 'R','T' on the last digit of DYNAMIXEL's model number?
Most models of DYNAMIXEL contain a suffix on the last digit of the model number (e.g. MX-64R ; XM430-W210T) which denotes the format of asynchronous serial communication utilized by DYNAMIXEL. It is important to ensure the correct serial interface format is chosen for compatibility in the intended system and across daisy-chained DYNAMIXEL's.
- R : RS-485 serial communication
- T : TTL serial communication
- [MOLEX Connector Information](/docs/en/dxl/mx/mx-28/#connector-information)
- [JST Connector Information](/docs/en/dxl/x/xm430-w350/#connector-information)


# Are actuators certified as intrinsically safe?
DYNAMIXEL Pro is CE/FCC certified. For more information, please search ROBOTIS [e-Manual](http://emanual.robotis.com/) for Pro and Pro + series.


[Protocol 1.0]: /docs/en/dxl/protocol1/
[Protocol 2.0]: /docs/en/dxl/protocol2/
[DX]: /docs/en/dxl/#dx-series
[AX]: /docs/en/dxl/#ax-series
[RX]: /docs/en/dxl/#rx-series
[EX]: /docs/en/dxl/#ex-series
[MX]: /docs/en/dxl/#mx-series
[DYNAMIXEL X]: /docs/en/dxl/#x-series
[DYNAMIXEL Pro]: /docs/en/dxl/#pro-series
[DYNAMIXEL Pro+]: /docs/en/dxl/#pro-plus-series
[MX]: /docs/en/dxl/#mx-series
[U2D2]: /docs/en/parts/interface/u2d2/
[USB2DYNAMIXEL]: /docs/en/parts/interface/usb2dynamixel/
[manual installation]: /docs/en/parts/interface/usb2dynamixel/#install-driver-manually
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
[ROBOTIS Support page]: http://en.robotis.com/model/board.php?bo_table=robotis_faq_en
[Compatibility Table]: /docs/en/popup/faq_protocol_compatibility_table/
