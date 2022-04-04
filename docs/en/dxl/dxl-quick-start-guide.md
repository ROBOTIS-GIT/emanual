---
layout: archive
lang: en
ref: dxl-quick-start-guide
read_time: true
share: true
author_profile: false
permalink: /docs/en/dxl/dxl-quick-start-guide/
sidebar:
  title: DYNAMIXEL Quick Start Guide
  nav: "dxl-quick-start-guide"
---

{::options parse_block_html="true" /}

# [Getting Started](#getting-started)

DYNAMIXEL Quick Start Guide is the series of Plug & Run videos covering ROBOTIS software and DYNAMIXEL.

Before starting the guide, visit the [DYNAMIXEL Selection Guide] and see the brief information on products and software introduced in the series.

The following table shows which controller or interface should be used with selected software in the series.

| Enviroment  | Software & Tool        | Controller                     | Interface                              |
|:------------|:-----------------------|:-------------------------------|:---------------------------------------|
| PC, SBC     | [DYNAMIXEL SDK]        | None                           | U2D2                                   |
| Arduino IDE | [Dynamixel2Arduino]    | OpenCR 1.0, OpenCM 9.04        | None                                   |
| Arduino IDE | [DynamixelShield]      | Compatible Arduino formfactors | Dynamixel Shield, Dynamixel Shield MKR |
| PC          | [DYNAMIXEL Wizard 2.0] | None                           | U2D2, OpenCR 1.0                       |

**NOTE**: Although the guide focuses on a plug & run for a basic example and ROBOTIS parts, it does not imply you have only one solution appliable to your system. 
As the provided libraries are shared through our github ([ROBOTIS](https://github.com/ROBOTIS-GIT/)), you can customize it for your system if needed. 
{: .notice}

## [Archive](#archive)

<details>
<summary>
![](/assets/images/icon_unfold.png) **Tip**: **Find all DYNAMIXEL Quick Start Guide series**
</summary>

| Group             | Software & Tool      | Developement<br>Enviroment | Controller / Interface                 | Title                                                                                                                                                                  |
|:------------------|:---------------------|:---------------------------|:---------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Development       | DYNAMIXEL SDK        | PC, SBC (C)                | U2D2                                   | [DYNAMIXEL Quick Start Guide for Raspberry Pi (C language)](https://www.youtube.com/watch?v=-MafNIZUCHA&list=PLRG6WP3c31_Xg_IPNGJybiP8H4Lpy2RuY&index=7)               |
| Development       | DYNAMIXEL SDK        | PC, SBC (C++)              | U2D2                                   | [DYNAMIXEL Quick Start Guide in C++](https://www.youtube.com/watch?v=bm5MBO7D13Q&list=PLRG6WP3c31_Xg_IPNGJybiP8H4Lpy2RuY&index=6)                                      |
| Development       | DYNAMIXEL SDK        | PC, SBC (C#)               | U2D2                                   | None                                                                                                                                                                   |
| Development       | DYNAMIXEL SDK        | PC, SBC (Python)           | U2D2                                   | [DYNAMIXEL Quick Start Guide in Python](https://www.youtube.com/watch?v=LAizFTTdL8o&list=PLRG6WP3c31_Xg_IPNGJybiP8H4Lpy2RuY&index=4)                                   |
| Development       | DYNAMIXEL SDK        | PC, SBC (Java)             | U2D2                                   | None                                                                                                                                                                   |
| Development       | DYNAMIXEL SDK        | PC, SBC (Matlab)           | U2D2                                   | [DYNAMIXEL Quick Start Guide in MATLAB on Windows](https://www.youtube.com/watch?v=1VWksgPqyDs&list=PLRG6WP3c31_Xg_IPNGJybiP8H4Lpy2RuY&index=3)                        |
| Development       | DYNAMIXEL SDK        | PC, SBC (Matlab)           | U2D2                                   | [DYNAMIXEL Quick Start Guide in MATLAB on Linux](https://www.youtube.com/watch?v=zGhd727NkJY&list=PLRG6WP3c31_Xg_IPNGJybiP8H4Lpy2RuY&index=5)                          |
| Development       | DYNAMIXEL SDK        | PC, SBC (LabView)          | U2D2                                   | [DYNAMIXEL Quick Start Guide for LabVIEW on Windows](https://www.youtube.com/watch?v=4fzFshycfi0)                                                                      |
| Development       | DYNAMIXEL SDK        | PC, SBC (ROS)              | U2D2                                   | [DYNAMIXEL Quick Start Guide for ROS 1](https://www.youtube.com/watch?v=SpdxjsCO9sE&list=PLRG6WP3c31_Xg_IPNGJybiP8H4Lpy2RuY&index=9)                                   |
| Development       | DYNAMIXEL SDK        | PC, SBC (ROS)              | U2D2                                   | [DYNAMIXEL Quick Start Guide for ROS 2](https://www.youtube.com/watch?v=E8XPqDjof4U&list=PLRG6WP3c31_Xg_IPNGJybiP8H4Lpy2RuY&index=1)                                   |
| Development       | DynamixelShield      | \-                         | Dynamixel Shield, Dynamixel Shield MKR | [DYNAMIXEL Quick Start Guide for DYNAMIXEL Shield for Arduino MKR Series](https://www.youtube.com/watch?v=1Y7FLG1n-9k&list=PLRG6WP3c31_Xg_IPNGJybiP8H4Lpy2RuY&index=8) |
| Development       | Dynamixel2Arduino    | Arduino IDE                | OpenCR 1.0                             | [DYNAMIXEL Quick Start Guide for OpenCR 1.0](https://www.youtube.com/watch?v=0_M0Da9SHDw&list=PLRG6WP3c31_Xg_IPNGJybiP8H4Lpy2RuY&index=10)                             |
| Management & Test | DYNAMIXEL Wizard 2.0 | \-                         | U2D2                                   | [How To: Firmware Recover DYNAMIXEL Using U2D2](https://youtu.be/PgbIAK2Qg1Y)                                                                                          |
| Management & Test | DYNAMIXEL Wizard 2.0 | \-                         | OpenCR 1.0                             | [How To: DYNAMIXEL Firmware Recovery Using OpenCR1.0](https://youtu.be/FAnVIE_23AA)                                                                                    |
     
</details>

# [DYNAMIXEL SDK](#dynamixel-sdk)

DYNAMIXEL SDK is the modulized development kit to control DYNAMIXEL for your system.

Not just provided contents in the table, also many solutions in variety programming language and operating system can be utilized (e.g, C++ on Windows,).

For more details, see [DYNAMIXEL SDK](/docs/en/software/dynamixel/dynamixel_sdk/overview/).

| Developement<br>Enviroment | Controller<br>&Interface | Title                                                       | Description                             |
|:---------------------------|:-------------------------|:------------------------------------------------------------|:----------------------------------------|
| PC, SBC (C)                | U2D2                     | [DYNAMIXEL Quick Start Guide for Raspberry Pi (C language)] | Read / Write example (Position Control) |
| PC, SBC (C++)              | U2D2                     | [DYNAMIXEL Quick Start Guide in C++]                        | Read / Write example (Position Control) |
| PC, SBC (C#)               | U2D2                     | None                                                        | \-                                      |
| PC, SBC (Python)           | U2D2                     | [DYNAMIXEL Quick Start Guide in Python]                     | Read / Write example (Position Control) |
| PC, SBC (Java)             | U2D2                     | None                                                        | \-                                      |
| PC, SBC (Matlab)           | U2D2                     | [DYNAMIXEL Quick Start Guide in MATLAB on Windows]          | Read / Write example (Position Control) |
| PC, SBC (Matlab)           | U2D2                     | [DYNAMIXEL Quick Start Guide in MATLAB on Linux]            | Read / Write example (Position Control) |
| PC, SBC (LabView)          | U2D2                     | [DYNAMIXEL Quick Start Guide for LabVIEW on Windows]        | Read / Write example (Position Control) |
| PC, SBC (ROS)              | U2D2                     | [DYNAMIXEL Quick Start Guide for ROS 1]                     | Read / Write example (Position Control) |
| PC, SBC (ROS)              | U2D2                     | [DYNAMIXEL Quick Start Guide for ROS 2]                     | Read / Write example (Position Control) |

{% capture TTL_RS485 %}

**NOTE**: U2D2 interface is necessary to begin the DYNAMIXEL SDK series. If you are integrating a custom interface to communicate with DYNAMIXEL, make the following communication circuit interface based on your [Models](/docs/en/reference/dxl-selection-guide/#models).
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

<details>
<summary>
![](/assets/images/icon_unfold.png) **Tip**: **Communication Circuit of RS485 based DYNAMIXEL**
</summary>

To control the DYNAMIXELs, the main controller needs to convert its UART signals to the half duplex type. The recommended circuit diagram for this is shown below.  
![](/assets/images/dxl/x/x_series_485_circuit.jpg)  

**NOTE**: Above circuit is designed for 5V or 5V tolerant MCU. Otherwise, use a Level Shifter to match the voltage of MCU.
{: .notice}
</details>

{% endcapture TTL_RS485 %}
<div class="notice"> {{ TTL_RS485 | markdownify }}</div>

## [C](#c)

### [DYNAMIXEL Quick Start Guide for Raspberry Pi (C language)](#dynamixel-quick-start-guide-for-raspberry-pi-c-language)

[DYNAMIXEL SDK] in C with Raspberry Pi, by implementing Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/-MafNIZUCHA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Tested with**
- PC (Raspberry Pi 3B+, Raspbian)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL: XL430-W250 (12V) / XL330-M288 (5V)

## [C++](#c-1)

### [DYNAMIXEL Quick Start Guide in C++](#dynamixel-quick-start-guide-in-c-1)

[DYNAMIXEL SDK] in C++, by implementing Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/bm5MBO7D13Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Tested with**
- PC (Laptop, Linux)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL: XL430-W250 (12V)

## [C-Sharp](#c-sharp)

DYNAMIXEL Quick Start Guide in C-Sharp will be worked on. Until it is ready for being done, Visit DYNAMIXEL SDK, [C-Sharp Windows Library Setup](/docs/en/software/dynamixel/dynamixel_sdk/library_setup/csharp_windows/#csharp-windows).
{: .notice}

## [Python](#python)

### [DYNAMIXEL Quick Start Guide in Python](#dynamixel-quick-start-guide-in-python)

[DYNAMIXEL SDK] in Python, by implementing Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/LAizFTTdL8o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Tested with**
- PC (Laptop, Linux)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL: XL430-W250 (12V)

## [Java](#java)

DYNAMIXEL Quick Start Guide in Java will be worked on. Until it is ready for being done, Visit DYNAMIXEL SDK, [Java Windows](/docs/en/software/dynamixel/dynamixel_sdk/library_setup/java_windows/#java-windows) or [Java Linux](/docs/en/software/dynamixel/dynamixel_sdk/library_setup/java_linux/#java-linux).
{: .notice}

## [Matlab](#matlab)

### [DYNAMIXEL Quick Start Guide in MATLAB on Windows](#dynamixel-quick-start-guide-in-matlab-on-windows)

[DYNAMIXEL SDK] in Matlab on Windows, by implementing Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/1VWksgPqyDs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Tested with**
- PC (Laptop, Windows)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL: XL430-W250 (12V)

### [DYNAMIXEL Quick Start Guide in MATLAB on Linux](#dynamixel-quick-start-guide-in-matlab-on-linux)

[DYNAMIXEL SDK] in Matlab on Linux,  by implementing Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/zGhd727NkJY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Tested with**
- PC (Laptop, Linux)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL: XL430-W250 (12V)

## [LabView](#labview)

### [DYNAMIXEL Quick Start Guide for LabVIEW on Windows](#dynamixel-quick-start-guide-for-labview-on-windows)

[DYNAMIXEL SDK] in LabView on Windows, by implementing Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/4fzFshycfi0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Tested with**
- PC (Laptop, Windows)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL: XL430-W250 (12V)

## [ROS](#ros)

### [DYNAMIXEL Quick Start Guide for ROS 1](#dynamixel-quick-start-guide-for-ros-1)

[DYNAMIXEL SDK] in ROS, by implementing Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/SpdxjsCO9sE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Tested with**
- PC (Laptop, Linux)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL: XL430-W250 (12V)

### [DYNAMIXEL Quick Start Guide for ROS 2](#dynamixel-quick-start-guide-for-ros-2)

[DYNAMIXEL SDK] in ROS2, by implementing Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/E8XPqDjof4U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Tested with**
- PC (Laptop, Linux)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL: XL430-W250 (12V)

# [Arduino Library](#arduino-library)

ROBOTIS provides comprehensive code APIs and basic example for Arduino users.

The following table shows which controller or interface is compatible with provided libraries. 

| Developement<br>Enviroment | Controller<br>&Interface | Title                                                                     | Description                             |
|:---------------------------|:-------------------------|:--------------------------------------------------------------------------|:----------------------------------------|
| Arduino IDE                | OpenCR 1.0               | [DYNAMIXEL Quick Start Guide for OpenCR 1.0]                              | Read / Write example (Position Control) |
| Arduino IDE                | DYNAMIXEL Shields        | [DYNAMIXEL Quick Start Guide for DYNAMIXEL Shield for Arduino MKR Series] | Read / Write example (Position Control) |

## [Dynamixel2Arduino](#dynamixel2arduino)

DYNAMIXEL Control Library for [Embedded Controller](/docs/en/reference/dxl-selection-guide/#embedded-controllers)

### [DYNAMIXEL Quick Start Guide for OpenCR 1.0](#dynamixel-quick-start-guide-for-opencr-10)

<!-- OpenCR 1.0 by implementing Read / Write example for DYNAMIXEL position control.   -->

<iframe width="560" height="315" src="https://www.youtube.com/embed/0_M0Da9SHDw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Tested with**
- Arduino IDE
- OpenCR 1.0
- DYNAMIXEL: XL430-W250 (12V)

## [DynamixelShield](#dynamixelshield)

DYNAMIXEL Control Library for [DYNAMIXEL Shields](/docs/en/reference/dxl-selection-guide/#dynamixel-shields)

### [DYNAMIXEL Quick Start Guide for DYNAMIXEL Shield for Arduino MKR Series](#dynamixel-quick-start-guide-for-dynamixel-shield-for-arduino-mkr-series)

Implementing the basic position control example by DynamixelShield, and guide powering the DYNAMIXEL from different power connectors (either Battery or USB power) using DYNAMIXEL MKR Shield.

<iframe width="560" height="315" src="https://www.youtube.com/embed/1Y7FLG1n-9k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Tested with**
- Arduino IDE
- DYNAMIXEL Shield for Arduino MKR Series
- DYNAMIXEL: XL430-W250 (12V), XL330-M288(5V)

# [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)

DYNAMIXEL Wizard is the optimized tool for the maintanance (Firmware Recovery, Update), test and configuration of DYNAMIXEL. 

| Software<br>&Tool    | Developement<br>Enviroment  | Controller<br>&Interface | Title                                                 | Description       |
|:---------------------|:----------------------------|:-------------------------|:------------------------------------------------------|:------------------|
| DYNAMIXEL Wizard 2.0 | PC (Windows, Linux, Mac OS) | U2D2                     | [How To: Firmware Recover DYNAMIXEL Using U2D2]       | Firmware Recovery |
| DYNAMIXEL Wizard 2.0 | PC (Windows, Linux, Mac OS) | OpenCR 1.0               | [How To: DYNAMIXEL Firmware Recovery Using OpenCR1.0] | Firmware Recovery |

## [Firmware Recovery](#firmware-recovery)

[Firmware Recovery](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-recovery) is the hard reset solution, turning back to its original state as factory released, to your DYNAMIXEL. 

### [How To: Firmware Recover DYNAMIXEL Using U2D2](#dxl-quick-start-guide/#how-to-firmware-recover-dynamixel-using-u2d2)

Basic solution of firmware recovery using the U2D2. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/PgbIAK2Qg1Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [How To: DYNAMIXEL Firmware Recovery Using OpenCR1.0](#how-to-dynamixel-firmware-recovery-using-opencr10)

OpenCR 1.0 can be used as an interface like U2D2 by a particular firmware that can be installed by Arduino example.

<iframe width="560" height="315" src="https://www.youtube.com/embed/FAnVIE_23AA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<!-- # [DYNAMIXEL Tip](#dynamixel-tip)

If you complete the DYNAMIXEL Quick Start Guide series, this is time to look deepen contents about the useful features of DYNAMIXEL through the DYNAMIXEL Tip series. 

**DYNAMIXEL Tip** series introduces the variety features to enhance your development experience, unlike DYNAMIXEL Quick Start Guide getting you plug and run our basic example (position control only).

Visit the page here -->

[DYNAMIXEL Quick Start Guide for Raspberry Pi (C language)]: #dynamixel-quick-start-guide-for-raspberry-pi-c-language
[DYNAMIXEL Quick Start Guide in C++]: #dynamixel-quick-start-guide-in-c
[DYNAMIXEL Quick Start Guide in Python]: #dynamixel-quick-start-guide-in-python
[DYNAMIXEL Quick Start Guide in MATLAB on Linux]: #dynamixel-quick-start-guide-in-matlab-on-linux
[DYNAMIXEL Quick Start Guide in MATLAB on Windows]: #dynamixel-quick-start-guide-in-matlab-on-windows
[DYNAMIXEL Quick Start Guide for LabVIEW on Windows]: #dynamixel-quick-start-guide-for-labview-on-windows
[DYNAMIXEL Quick Start Guide for ROS 1]: #dynamixel-quick-start-guide-for-ros-1
[DYNAMIXEL Quick Start Guide for ROS 2]: #dynamixel-quick-start-guide-for-ros-2
[DYNAMIXEL Quick Start Guide for DYNAMIXEL Shield for Arduino MKR Series]: #dynamixel-quick-start-guide-for-dynamixel-shield-for-arduino-mkr-series
[DYNAMIXEL Quick Start Guide for OpenCR 1.0]: #dynamixel-quick-start-guide-for-opencr-10

[How To: Firmware Recover DYNAMIXEL Using U2D2]: https://youtu.be/PgbIAK2Qg1Y)
[How To: DYNAMIXEL Firmware Recovery Using OpenCR1.0]: https://www.youtube.com/watch?v=FAnVIE_23AA&feature=youtu.be
[How To: DYNAMIXEL Firmware Recovery Using OpenCM9.04]: https://www.youtube.com/watch?v=92HAcjeAQGg&feature=youtu.be
[Troubleshooting DYNAMIXEL Shutdowns with Dynamixel Wizard 2.0 Self-Diagnosis]: https://youtu.be/xVk4XcXfQX8
[How To update the protocol on MX Series DYNAMIXELs]: https://youtu.be/aVZytXRc_r8
[DYNAMIXEL Selection Guide]: /docs/en/reference/dxl-selection-guide/


[DYNAMIXEL SDK]: #dynamixel-sdk
[Dynamixel2Arduino]: #dynamixel2arduino
[DynamixelShield]: #dynamixelshield
[DYNAMIXEL Wizard 2.0]: #dynamixel-wizard20
