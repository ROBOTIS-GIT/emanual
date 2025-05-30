---
layout: archive
lang: en
ref: dynamixel_sdk_device_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/device_setup/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<style>body {counter-reset: h1 2 !important;}</style>

# [Device Setup](#device-setup)

![](/assets/images/parts/interface/u2d2_01.png)
 
In order to use the DYNAMIXEL SDK, you'll need to set up your [Controller](#controller) and [DYNAMIXEL](#dynamixel).

## [Controller](#controller)

### [Signal Interface](#signal-interface)
DYNAMIXEL servos communicate using one of the following digital serial interfaces:
* TTL: TTL-based DYNAMIXEL's have 3 pin connectors
* RS485: RS485-based DYNAMIXEL's have 4 pin connectors. 

The SDK and its examples were written for compatibility with the ROBOTIS [U2D2](docs/en/parts/interface/u2d2/) USB to Serial converter, which is shown below. You can use any other converter as long as it generates TTL or RS485-level signals. 

![](/assets/images/parts/interface/u2d2_product.jpg)

Since other signal ports, such as UART, I2C, etc., may differ based on your controller specification, advanced users may wish to modify the SDK themselves to optimize for their specific controllers.

The U2D2 requires the configuration of the following settings for communication with connected DYNAMIXEL servos:
 * DEVICENAME: `/dev/ttyUSB0` for Linux, `COM1` for Windows (for examples using MultiPort, + `/dev/ttyUSB1` for Linux, + `COM2` for Windows)
 * DYNAMIXEL ID: Each connected DYNAMIXEL must have a unique ID.

### [Controllers](#controllers)
The SDK was tested on desktop PC and some common SBCs such as Raspberry Pi and ODROID, with the following OS configurations:

|                 | PC | Intel Joule | Up Board | Raspberry Pi | ODROID |
|:---------------:|:--:|:-----------:|:--------:|:------------:|:------:|
|   **Windows**   |    |             |          |              |        |
|       10        | ✓  |             |          |              |        |
|       IoT       |    |             |          |              |        |
|   **Ubuntu**    |    |             |          |              |        |
|      14.04      | ✓  |             |    ✓     |              |   ✓    |
|      16.04      | ✓  |      ✓      |    ✓     |              |   ✓    |
| **Ubuntu Mate** |    |             |          |              |        |
|      16.04      | ✓  |             |          |      ✓       |   ✓    |
|  **Raspbian**   |    |             |          |              |        |
|     Wheezy      | ✓  |             |          |      ✓       |        |
|     Jessie      | ✓  |             |          |      ✓       |        |
|     Stretch     | ✓  |             |          |      ✓       |        |
|    **macOS**    |    |             |          |              |        |
|     Sierra      | ✓  |             |          |              |        |

  > ✓: Test Successful  
  > X: Test Failed  
  > Blank: Not tested yet

The DYNAMIXEL SDK also supports various microcontroller boards through the Arduino IDE:

* [OpenRB-150](/docs/en/parts/controller/openrb-150/)
* [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/)
* [OpenCM9.04](http://emanual.robotis.com/docs/en/parts/controller/opencm904/)
* Most other Arduino boards.

### [USB2DYNAMIXEL Driver Installation](#usb2dynamixel-driver-installation)

* [Installation in Windows](#installation-in-windows)

* [Installation in Linux](#installation-in-linux)

**NOTE** : The FTDI driver may not be compatible with some devices.
{: .notice}

#### [Installation in Windows](#installation-in-windows)

If you installed ROBOTIS' R+ software - a suite of software that allows you to easily interface with all of ROBOTIS’ hardware, including ROBOTIS controllers, DYNAMIXEL's, sensors, and other hardware components - the FTDI driver will be automatically installed. 

If you don't want to install R+, install the latest VCP driver from the [FTDI Driver Download page](http://www.ftdichip.com/Drivers/VCP.htm).

##### Manually Installing the FTDI Driver
 
* If the FTDI driver isn't automatically installed, the Found New Hardware Wizard will pop up after connecting the U2D2 to your controller. Select **Install from a list or specific location** and click **Next**.

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/ftdi_driver_install/ln101_driverinstall_01.png)

* Choose your driver's directory.  
a. The driver must be in **LN101** folder of the R+ installation folder.  
b. If you don't want to install R+, install the latest VCP driver from the [FTDI Driver Download page](http://www.ftdichip.com/Drivers/VCP.htm).
 
* Click **Next** to start the installation. 

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/ftdi_driver_install/ln101_driverinstall_03.png)

* Click **Finish** to complete installation of the **USB Serial Port** driver. 

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/ftdi_driver_install/ln101_driverinstall_06.png)

#### [Installation in Linux](#installation-in-linux)

Recent Linux releases include the kernel which contains the FT232RL driver for the FTDI driver used by the U2D2. **Hence, most users won't need to install the driver manually.**

## [DYNAMIXEL](#dynamixel)

The SDK and SDK examples were developed based on the MX-28 and H54-200 PRO DYNAMIXEL's. 

SDK examples were tested with the following DYNAMIXEL's: 

|              | AX  | EX  | RX  | MX  | MX  |  X  |  X  | PRO |   P  |   Y  |
|:------------:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:----:|:----:|
| **Protocol** | 1.0 | 1.0 | 1.0 | 1.0 | 2.0 | 1.0 | 2.0 | 2.0 | 2.0  | 2.0  |
|              |     |     |     |     |     |     |     |     |      |      |
|  **Series**  |     |     |     |     |     |     |     |     |      |      |
|      12      |  ✓  |  -  |  -  |  ✓  |  -  |  -  |  -  |  -  |  -   |  -   |
|      18      |  ✓  |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
|      24      |  -  |  -  |  ✓  |  ✓  |  ✓  |  -  |  -  |  -  |  -   |  -   |
|      28      |  -  |  -  |  ✓  |  ✓  |  ✓  |  -  |  -  |  -  |  -   |  -   |
|      64      |  -  |  -  |  ✓  |  ✓  |  ✓  |  -  |  -  |  -  |  -   |  -   |
|     106      |  -  |  ✓  |  -  |  ✓  |  ✓  |  -  |  -  |  -  |  -   |  -   |
|     320      |  -  |  -  |  -  |  -  |  -  |  -  |  ✓  |  -  |  -   |  -   |
|     330      |  -  |  -  |  -  |  -  |  -  |  ✓  |  ✓  |  -  |  -   |  -   |
|     430      |  -  |  -  |  -  |  -  |  -  |  ✓  |  ✓  |  -  |  -   |  -   |
|     540      |  -  |  -  |  -  |  -  |  -  |  ✓  |  ✓  |  -  |  -   |  -   |
|              |     |     |     |     |     |     |     |     |      |      |
|      42      |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  ✓  |  ✓   |  -   |
|      54      |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  ✓  |  ✓   |  -   |
|              |     |     |     |     |     |     |     |     |      |      |
|      70      |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  -   |  ✓   |
|      80      |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  -   |  ✓   |

> ✓ : Compatible  
> X : Incompatible  
> -- : Doesn't exist  
> blank : Not tested yet

### [Power Requirements](#power-requirements)

* 12V for X Series (also for AX, EX, RX, and MX series)

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/1.png)

* 24V for PRO 

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/2.png)

### [DYNAMIXEL Parameters](#dynamixel-parameters)

To run the SDK examples, the following DYNAMIXEL parameters need to be changed: 
* ID = 1 (and 2, when the example uses two DYNAMIXEL's) 
* Baud Rate = 57600 bps (baud value = 34 for MX, 1 for PRO.)

To change DYNAMIXEL parameters, use [DYNAMIXEL Wizard](http://emanual.robotis.com/docs/en/software/rplus1/dynamixel_wizard/#introduction) or [RoboPlus Manager](http://emanual.robotis.com/docs/en/software/rplus2/manager/).

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/3.png)

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/4.png)
