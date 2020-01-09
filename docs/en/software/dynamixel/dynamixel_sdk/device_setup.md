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

<div style="counter-reset: h1 2"></div>

# [Device Setup](#device-setup)

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/connection.png)

To use the DYNAMIXEL SDK, you need to set up the [Controller](#controller) and [DYNAMIXEL](#dynamixel).

## [Controller](#controller)

### [Signal Interface](#signal-interface)
DYNAMIXEL's communicate at one of the following signal levels: 
* TTL
* RS485

Please check to see whether your DYNAMIXEL is a TTL-based DYNAMIXEL or an RS485-based DYNAMIXEL. TTL-based DYNAMIXEL's have 3P connectors while RS485-based DYNAMIXEL's have 4P connectors. 

The SDK and its examples were written using ROBOTIS [USB2DYNAMIXEL](http://emanual.robotis.com/docs/en/parts/interface/usb2dynamixel/) signal converter, which is shown below. You can use any other converter as long as it generates TTL or RS485-level signals. 

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/usb2dynamixel.jpg)

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/u2d_select.png)

Adjust the signal interface so that you can communicate with your DYNAMIXEL by flipping the switch between the following communication modes: 

* TTL: Models with 3P connectors (AX-Series, MX-Series, X-Series)
* RS485: Models with 4P connectors (DX-Series, RX-Series, EX-Series, MX-Series, X-Series, PRO-Series)
* RS232: Models attached via serial connector (CM-5 controller, CM-510 controller, other UART devices)

**NOTE** : The X-Series' connector is different than the USB2DYNAMIXEL's connector. Please check [the connector types of X-Series](http://emanual.robotis.com/docs/en/dxl/x/xm430-w210/#connector-information).
{: .notice}

The SDK also supports the recently released [U2D2](http://emanual.robotis.com/docs/en/parts/interface/u2d2/). This interface features a small size and automatic conversion of TTL and RS485. We are using the same model connector as the latest DYNAMIXEL-X series, so we recommend this U2D2 to use the latest model DYNAMIXEL.

![](/assets/images/parts/interface/u2d2_product.jpg)

Since the other signal ports, such as UART, I2C, etc., are in various conditions depending on the controller specification, modify SDK yourselves and optimize your codes to your own controllers.

Note that USB2DYNAMIXEL and U2D2 will be able to be used by following settings:
 * DEVICENAME : `/dev/ttyUSB0` for Linux, `COM1` for Windows (for examples using MultiPort, + `/dev/ttyUSB1` for Linux, + `COM2` for Windows)
 * DYNAMIXEL ID : 1 (for examples with DYNAMIXEL's, + ID 2)

### [Controllers](#controllers)
The SDK was tested on a desktop PC and some common SBCs such as Raspberry Pi and ODROID, in the following OS:

|                 | PC | Intel Joule | Up Board | Raspberry Pi | ODROID |
|:---------------:|:--:|:-----------:|:--------:|:------------:|:------:|
|   **Windows**   |    |             |          |              |        |
|       10        | O  |             |          |              |        |
|       IoT       |    |             |          |              |        |
|   **Ubuntu**    |    |             |          |              |        |
|      14.04      | O  |             |    O     |              |   O    |
|      16.04      | O  |      O      |    O     |              |   O    |
| **Ubuntu Mate** |    |             |          |              |        |
|      16.04      | O  |             |          |      O       |   O    |
|  **Raspbian**   |    |             |          |              |        |
|     Wheezy      | O  |             |          |      O       |        |
|     Jessie      | O  |             |          |      O       |        |
|     Stretch     | O  |             |          |      O       |        |
|    **macOS**    |    |             |          |              |        |
|     Sierra      | O  |             |          |              |        |

  > O: Test Successful  
  > X: Test Failed  
  > Blank: Not tested yet

and also in MCU:

* [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/)
* [OpenCM9.04](http://emanual.robotis.com/docs/en/parts/controller/opencm904/)
* The other Arduino boards (will be tested soon)

### [USB2DYNAMIXEL Driver Installation](#usb2dynamixel-driver-installation)

* [Installation in Windows](#installation-in-windows)

* [Installation in Linux](#installation-in-linux)

**NOTE** : The FTDI driver may not be compatible with some devices.
{: .notice}

#### [Installation in Windows](#installation-in-windows)

If you installed ROBOTIS RoboPlus software - a suite of software that allows you to easily interface with all of ROBOTIS’ hardware, including ROBOTIS controllers, DYNAMIXEL's, sensors, and other hardware components - the FTDI driver will be automatically installed. 

If you don't want to install RoboPlus, install the latest VCP driver from the [FTDI Driver Download page](http://www.ftdichip.com/Drivers/VCP.htm).

##### Manually Installing the FTDI Driver
 
* If the FTDI driver isn't automatically installed, the Found New Hardware Wizard pops up after connecting USB2DYNAMIXEL to your controller. Select **Install from a list or specific location** and click **Next**.

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/ftdi_driver_install/ln101_driverinstall_01.png)

* Choose your driver's directory.  
a. The driver must be in **LN101** folder of RoboPlus installed folder.  
b. If you don't want to install RoboPlus, install the latest VCP driver from the [FTDI Driver Download page](http://www.ftdichip.com/Drivers/VCP.htm).
 
* Click **Next** to start the installation. 

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/ftdi_driver_install/ln101_driverinstall_03.png)

* Click **Finish** to complete installation of the **USB Serial Port** driver. 

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/ftdi_driver_install/ln101_driverinstall_06.png)

#### [Installation in Linux](#installation-in-linux)

Recent Linux releases include the kernel which contains the FT232RL driver for the FTDI driver used by USB2DYNAMIXEL. **Hence, most users won't need to install the driver manually.**

## [DYNAMIXEL](#dynamixel)

The SDK and SDK examples were developed based on the MX-28 and H54-200 PRO DYNAMIXEL's. 

SDK examples were tested with the following DYNAMIXEL's: 

|              | AX  | EX  | RX  | MX  | MX  |  X  |  X  | PRO | PRO+ |
|:------------:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:----:|
| **Protocol** | 1.0 | 1.0 | 1.0 | 1.0 | 2.0 | 1.0 | 2.0 | 2.0 | 2.0  |
|              |     |     |     |     |     |     |     |     |      |
|  **Series**  |     |     |     |     |     |     |     |     |      |
|      12      |  O  |  -  |  -  |     |     |  -  |  -  |  -  |  -   |
|      18      |     |  -  |  -  |     |     |  -  |  -  |  -  |  -   |
|      24      |  -  |  -  |  O  |  O  |  O  |  -  |  -  |  -  |  -   |
|      28      |  -  |  -  |  O  |  O  |  O  |  -  |  -  |  -  |  -   |
|      64      |  -  |  -  |  O  |  O  |  O  |  -  |  -  |  -  |  -   |
|     106      |  -  |  O  |  -  |  O  |  O  |  -  |  -  |  -  |  -   |
|     320      |  -  |  -  |  -  |  -  |  -  |  -  |  O  |  -  |  -   |
|     430      |  -  |  -  |  -  |  -  |  -  |  O  |  O  |  -  |  -   |
|     540      |  -  |  -  |  -  |  -  |  -  |  O  |  O  |  -  |  -   |
|              |     |     |     |     |     |     |     |     |      |
|      42      |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  O  |  O   |
|      54      |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  O  |  O   |

> O : Compatible  
> X : Incompatible  
> -- : Doesn't exist  
> blank : Not tested yet

**NOTE** : The BulkRead function doesn't work with the AX, EX, or RX series
{: .notice}

### [Power Requirements](#power-requirements)

* 12V for MX (also AX, EX, RX, and X series)

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/1.png)

* 24V for PRO 

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/2.png)

**NOTE** : The X series' 4P connector is not compatible with the USB2DYNAMIXEL connector.
{: .notice}

### [DYNAMIXEL Parameters](#dynamixel-parameters)

To run the SDK examples, the following DYNAMIXEL parameters need to be changed: 
* ID = 1 (and 2, when the example uses two DYNAMIXEL's) 
* Baud Rate = 57600 bps (baud value = 34 for MX, 1 for PRO.)

To change DYNAMIXEL parameters, use [DYNAMIXEL Wizard](http://emanual.robotis.com/docs/en/software/rplus1/dynamixel_wizard/#introduction) or [RoboPlus Manager](http://emanual.robotis.com/docs/en/software/rplus2/manager/).

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/3.png)

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/4.png)
