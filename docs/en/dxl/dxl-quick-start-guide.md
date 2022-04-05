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

**NOTE**: Although the videos and guides included on this page utilize ROBOTIS parts and software, DYNAMIXELs are compatible with a wide variety of 3rd Party software and control solutions.
Additionally, the source code for the libraries utilized throughout these tutorials are available on the official [ROBOTIS Github Repo](https://github.com/ROBOTIS-GIT/), so that they may be customized for your application.
{: .notice} 

# [Getting Started](#getting-started)

The DYNAMIXEL Quick Start Guide is a series of videos designed to help first time users, or individuals learning new ways to utilize their DYNAMIXEL actuators or ROBOTIS software.

This index lists the videos included in the DYNAMIXEL Quick start guide series, and specifies the software and hardware used and taught in the video.

| Environment | Software & Tool        | Controller                     | Interface                              |
|:------------|:-----------------------|:-------------------------------|:---------------------------------------|
| PC, SBC     | [DYNAMIXEL SDK]        | None                           | U2D2                                   |
| Arduino IDE | [Dynamixel2Arduino]    | OpenCR 1.0, OpenCM 9.04        | None                                   |
| Arduino IDE | [DynamixelShield]      | Compatible Arduino form factors | Dynamixel Shield, Dynamixel Shield MKR |
| PC          | [DYNAMIXEL Wizard 2.0] | None                           | U2D2, OpenCR 1.0                       |

**NOTE**: Before you begin, consult the [DYNAMIXEL Selection Guide] to learn how to select the to select components and software for your DYNAMIXEL system.
{: .notice}

<!-- 
**NOTE**: As the provided libraries are shared through our github ([ROBOTIS](https://github.com/ROBOTIS-GIT/)), you can customize it for your system if needed. 
{: .notice}  -->




## [Index](#index)

For your convenience, an index listing the videos included on this page as well as some information about their content is folded into the ![](/assets/images/icon_unfold.png) **Tip** section below.

<details>
<summary>
![](/assets/images/icon_unfold.png) **Tip**: **Find all DYNAMIXEL Quick Start Guide series**
</summary>

| Group             | Software & Tool      | Development<br>Environment | Controller / Interface                 | Title                                                                     |
|:------------------|:---------------------|:---------------------------|:---------------------------------------|:--------------------------------------------------------------------------|
| Development       | [DYNAMIXEL SDK]        | PC, SBC (C)                | U2D2                                   | [DYNAMIXEL Quick Start Guide for Raspberry Pi (C language)]               |
| Development       | [DYNAMIXEL SDK]        | PC, SBC (C++)              | U2D2                                   | [DYNAMIXEL Quick Start Guide in C++]                                      |
| Development       | [DYNAMIXEL SDK]        | PC, SBC (C#)               | U2D2                                   | None                                                                      |
| Development       | [DYNAMIXEL SDK]        | PC, SBC (Python)           | U2D2                                   | [DYNAMIXEL Quick Start Guide in Python]                                   |
| Development       | [DYNAMIXEL SDK]        | PC, SBC (Java)             | U2D2                                   | None                                                                      |
| Development       | [DYNAMIXEL SDK]        | PC, SBC (Matlab)           | U2D2                                   | [DYNAMIXEL Quick Start Guide in MATLAB on Windows]                        |
| Development       | [DYNAMIXEL SDK]        | PC, SBC (Matlab)           | U2D2                                   | [DYNAMIXEL Quick Start Guide in MATLAB on Linux]                          |
| Development       | [DYNAMIXEL SDK]        | PC, SBC (LabView)          | U2D2                                   | [DYNAMIXEL Quick Start Guide for LabVIEW on Windows]                      |
| Development       | [DYNAMIXEL SDK]        | PC, SBC (ROS)              | U2D2                                   | [DYNAMIXEL Quick Start Guide for ROS 1]                                   |
| Development       | [DYNAMIXEL SDK]        | PC, SBC (ROS)              | U2D2                                   | [DYNAMIXEL Quick Start Guide for ROS 2]                                   |
| Development       | [DynamixelShield]      | \-                         | Dynamixel Shield, Dynamixel Shield MKR | [DYNAMIXEL Quick Start Guide for DYNAMIXEL Shield for Arduino MKR Series] |
| Development       | [Dynamixel2Arduino]    | Arduino IDE                | OpenCR 1.0                             | [DYNAMIXEL Quick Start Guide for OpenCR 1.0]                              |
| Management & Testing | [DYNAMIXEL Wizard 2.0] | \-                         | U2D2                                   | [How To: Firmware Recover DYNAMIXEL Using U2D2]                           |
| Management & Testing | [DYNAMIXEL Wizard 2.0] | \-                         | OpenCR 1.0                             | [How To: DYNAMIXEL Firmware Recovery Using OpenCR1.0]                     |
     
</details>

# [DYNAMIXEL SDK](#dynamixel-sdk)

The DYNAMIXEL SDK is a modular software development kit to control DYNAMIXELs in in a variety of programming languages.

These examples and tutorials are not an exhaustive representation of what the DYNAMIXEL SDK is capable of. For more details, see the [DYNAMIXEL SDK](/docs/en/software/dynamixel/dynamixel_sdk/overview/) eManual page.

| Development<br>Environment | Controller<br>&<br>Interface | Title                                                       | Description                             |
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

<!-- 

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

-->

## [C](#c)

### [DYNAMIXEL Quick Start Guide for Raspberry Pi (C language)](#dynamixel-quick-start-guide-for-raspberry-pi-c-language)

Tutorial for the [DYNAMIXEL SDK] in C on a Raspberry Pi, implementing a Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/-MafNIZUCHA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Components Used**
- PC (Raspberry Pi 3B+, Raspbian)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL actuators: XL430-W250 (12V) / XL330-M288 (5V)

## [C++](#c-1)

### [DYNAMIXEL Quick Start Guide in C++](#dynamixel-quick-start-guide-in-c-1)

Tutorial for the [DYNAMIXEL SDK] in C++ on PC, implementing a Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/bm5MBO7D13Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Components Used**
- PC (Laptop, Linux)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL actuator: XL430-W250 (12V)

## [C-Sharp](#c-sharp)

The DYNAMIXEL Quick Start Guide video for C-Sharp is still in progress. Until the video is complete, see the [DYNAMIXEL SDK](/docs/en/software/dynamixel/dynamixel_sdk/library_setup/csharp_windows/#csharp-windows) eManual page for library setup instructions.
{: .notice}

## [Python](#python)

### [DYNAMIXEL Quick Start Guide in Python](#dynamixel-quick-start-guide-in-python)

Tutorial for the [DYNAMIXEL SDK] in Python on PC, implementing a Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/LAizFTTdL8o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Components Used**
- PC (Laptop, Linux)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL actuator: XL430-W250 (12V)

## [Java](#java)

The DYNAMIXEL Quick Start Guide video for Java is still in progress. Until the video is complete, see the DYNAMIXEL SDK eManual page for [Windows](/docs/en/software/dynamixel/dynamixel_sdk/library_setup/java_windows/#java-windows) or [Linux](/docs/en/software/dynamixel/dynamixel_sdk/library_setup/java_linux/#java-linux) library setup instructions.
{: .notice}

## [Matlab](#matlab)

### [DYNAMIXEL Quick Start Guide in MATLAB on Windows](#dynamixel-quick-start-guide-in-matlab-on-windows)

Tutorial for the [DYNAMIXEL SDK] in Matlab on Windows, implementing a Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/1VWksgPqyDs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Components Used**
- PC (Laptop, Windows)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL actuator: XL430-W250 (12V)

### [DYNAMIXEL Quick Start Guide in MATLAB on Linux](#dynamixel-quick-start-guide-in-matlab-on-linux)

Tutorial for the [DYNAMIXEL SDK] in Matlab on Linux,  implementing a Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/zGhd727NkJY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Components Used**
- PC (Laptop, Linux)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL actuator: XL430-W250 (12V)

## [LabView](#labview)

### [DYNAMIXEL Quick Start Guide for LabVIEW on Windows](#dynamixel-quick-start-guide-for-labview-on-windows)

Tutorial for the [DYNAMIXEL SDK] in LabView on Windows, implementing a Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/4fzFshycfi0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Components Used**
- PC (Laptop, Windows)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL actuator: XL430-W250 (12V)

## [ROS](#ros)

### [DYNAMIXEL Quick Start Guide for ROS 1](#dynamixel-quick-start-guide-for-ros-1)

Tutorial for the [DYNAMIXEL SDK] in ROS, implementing a Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/SpdxjsCO9sE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Components Used**
- PC (Laptop, Linux)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL actuator: XL430-W250 (12V)

### [DYNAMIXEL Quick Start Guide for ROS 2](#dynamixel-quick-start-guide-for-ros-2)

Tutorial for the [DYNAMIXEL SDK] in ROS2, implementing a Read / Write example for DYNAMIXEL position control.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/E8XPqDjof4U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Components Used**
- PC (Laptop, Linux)
- DYNAMIXEL Starter Kit (U2D2, U2D2 PHB, SMPS(12V))
- DYNAMIXEL actuator: XL430-W250 (12V)

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

<!-- OpenCR 1.0 implementing a Read / Write example for DYNAMIXEL position control.   -->

<iframe width="560" height="315" src="https://www.youtube.com/embed/0_M0Da9SHDw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Components Used**
- Arduino IDE
- OpenCR 1.0
- DYNAMIXEL actuator: XL430-W250 (12V)

## [DynamixelShield](#dynamixelshield)

DYNAMIXEL Control Library for [DYNAMIXEL Shields](/docs/en/reference/dxl-selection-guide/#dynamixel-shields)

### [DYNAMIXEL Quick Start Guide for DYNAMIXEL Shield for Arduino MKR Series](#dynamixel-quick-start-guide-for-dynamixel-shield-for-arduino-mkr-series)

Implementing the basic position control example by DynamixelShield, and guide powering the DYNAMIXEL from different power connectors (either Battery or USB power) using DYNAMIXEL MKR Shield.

<iframe width="560" height="315" src="https://www.youtube.com/embed/1Y7FLG1n-9k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Components Used**
- Arduino IDE
- DYNAMIXEL Shield for Arduino MKR Series
- DYNAMIXEL actuator: XL430-W250 (12V), XL330-M288(5V)

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

Tutorial for the [DYNAMIXEL Quick Start Guide for Raspberry Pi (C language)]: #dynamixel-quick-start-guide-for-raspberry-pi-c-language
Tutorial for the [DYNAMIXEL Quick Start Guide in C++]: #dynamixel-quick-start-guide-in-c
Tutorial for the [DYNAMIXEL Quick Start Guide in Python]: #dynamixel-quick-start-guide-in-python
Tutorial for the [DYNAMIXEL Quick Start Guide in MATLAB on Linux]: #dynamixel-quick-start-guide-in-matlab-on-linux
Tutorial for the [DYNAMIXEL Quick Start Guide in MATLAB on Windows]: #dynamixel-quick-start-guide-in-matlab-on-windows
Tutorial for the [DYNAMIXEL Quick Start Guide for LabVIEW on Windows]: #dynamixel-quick-start-guide-for-labview-on-windows
Tutorial for the [DYNAMIXEL Quick Start Guide for ROS 1]: #dynamixel-quick-start-guide-for-ros-1
Tutorial for the [DYNAMIXEL Quick Start Guide for ROS 2]: #dynamixel-quick-start-guide-for-ros-2
Tutorial for the [DYNAMIXEL Quick Start Guide for DYNAMIXEL Shield for Arduino MKR Series]: #dynamixel-quick-start-guide-for-dynamixel-shield-for-arduino-mkr-series
Tutorial for the [DYNAMIXEL Quick Start Guide for OpenCR 1.0]: #dynamixel-quick-start-guide-for-opencr-10

[How To: Firmware Recover DYNAMIXEL Using U2D2]: #how-to-firmware-recover-dynamixel-using-u2d2
[How To: DYNAMIXEL Firmware Recovery Using OpenCR1.0]: #how-to-dynamixel-firmware-recovery-using-opencr10
[Troubleshooting DYNAMIXEL Shutdowns with Dynamixel Wizard 2.0 Self-Diagnosis]: https://youtu.be/xVk4XcXfQX8
[How To update the protocol on MX Series DYNAMIXELs]: https://youtu.be/aVZytXRc_r8
Tutorial for the [DYNAMIXEL Selection Guide]: /docs/en/reference/dxl-selection-guide/

<!-- [How To: DYNAMIXEL Firmware Recovery Using OpenCM9.04]: https://www.youtube.com/watch?v=92HAcjeAQGg&feature=youtu.be -->

Tutorial for the [DYNAMIXEL SDK]: #dynamixel-sdk
[Dynamixel2Arduino]: #dynamixel2arduino
[DynamixelShield]: #dynamixelshield
Tutorial for the [DYNAMIXEL Wizard 2.0]: #dynamixel-wizard-20
