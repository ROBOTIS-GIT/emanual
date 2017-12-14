---
layout: archive
lang: en
ref: dynamixel_sdk_device_setup_controller
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/device_setup/controller/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 1"></div>

# [Device Setup](#device-setup)

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/connection.png)

To use the Dynamixel SDK, you need to set up the [Controller](#controller) and [Dynamixel](#dynamixel).  

## [Controller](#controller)

### [Signal Interface](#signal-interface)
Dynamixels communicate at one of the following signal levels: 
* TTL
* RS485

Please check to see whether your Dynamixel is a TTL-based Dynamixel or an RS485-based Dynamixel. TTL-based Dynamixels have 3P connectors while RS485-based Dynamixels have 4P connectors. 

The SDK and its examples were written using ROBOTIS USB2Dynamixel signal converter, which is shown below. You can use any other converter as long as it generates TTL or RS485-level signals. 

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/usb2dynamixel.jpg)

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/u2d_select.png)

Adjust the signal interface so that you can communicate with your Dynamixel by flipping the switch between the following communication modes: 

* TTL: Models with 3P connectors (AX-Series, MX-Series, X-Series)
* RS485: Models with 4P connectors (DX-Series, RX-Series, EX-Series, MX-Series, X-Series, PRO-Series)
* RS232: Models attached via serial connector (CM-5 controller, CM-510 controller, other UART devices)

**Note:** The X-Series' connector is different than the USB2Dynamixel's connector. Please check the connector types [here](http://support.robotis.com/en/product/actuator/dynamixel/dxl_connector.htm).

Since the other signal ports, such as UART, I2C, etc., are in various conditions depending on the controller specification, modify SDK yourselves and optimize your codes to your own controllers.

Note that USB2Dynamixel will be able to be used by following settings:
 * DEVICENAME : `/dev/ttyUSB0` for Linux, `COM1` for Windows (for examples using MultiPort, + `/dev/ttyUSB1` for Linux, + `COM2` for Windows)
 * Dynamixel ID : 1 (for examples with Dynamixels, + ID 2)

### [Controllers](#controllers)
The SDK was tested on a desktop PC and some common SBCs such as Raspberry Pi and ODROID, in the following OS:

|               | Laptop & Desktop | Intel Joule | Intel Up Board | Raspberry Pi  | ODROID        | Beagle Bone Black | 
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| Windows    |              |               |               |               |               |               |
| - 10   |      O        |               |               |               |               |               |
| - IoT   |               |               |               |               |               |               |
|               |               |               |               |               |               |               |
| Ubuntu |              |               |               |               |               |               |
| - 16.04  |       O       |       O       |               |               |               |               |
| - 14.04  |       O       |               |               |               |       O       |               |
|               |               |               |               |               |               |
| lUbuntu       |               |               |               |               |               |               |
| - 12.04  |       O       |               |               |               |       O       |               |
|               |               |               |               |               |               |               |
| Ubuntu Mate  |               |               |               |               |               |               |
| - 16.04   |               |               |               |       O       |       O       |               |
|               |               |               |               |               |               |               |
| Snappy Ubuntu |               |               |               |               |               |               |
| - 15.04 |               |               |               |       O       |               |               |
|               |               |               |               |               |               |               |
| Raspbian      |               |               |               |               |               |               |
| - wheezy      |               |               |               |       O       |               |               |
| - jessie      |               |               |               |       O       |               |               |
| - jessie lite |               |               |               |       O       |               |               |
|               |               |               |               |               |               |               |
| MacOSX |              |               |               |               |               |               |
| - Sierra  |       O       |               |               |               |               |               |

O: Test Successful  
X: Test Failed  
Blank: Not Yet Tested   

and also in MCU:

* OpenCR
* OpenCM9.04
* The other Arduino boards (will be tested soon)

### [USB2Dynamixel Driver Installation](#usb2dynamixel-driver-installation)

* [Installation in Windows](#installation-in-windows)

* [Installation in Linux](#installation-in-linux)

**Note:** The FTDI driver may not be compatible with some devices.

#### <a name="installation-in-windows"></a>[Installation in Windows](#installation-in-windows)

If you installed ROBOTIS RoboPlus software - a suite of software that allows you to easily interface with all of ROBOTIS’ hardware, including ROBOTIS controllers, Dynamixels, sensors, and other hardware components - the FTDI driver will be automatically installed. 

If you don't want to install RoboPlus, install the latest VCP driver from the [FTDI Driver Download page](http://www.ftdichip.com/Drivers/VCP.htm).

**Manually Installing the FTDI Driver**
 
* If the FTDI driver isn't automatically installed, the Found New Hardware Wizard pops up after connecting USB2Dynamixel to your controller. Select **Install from a list or specific location** and click **Next**.

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/ftdi_driver_install/ln101_driverinstall_01.png)

* Choose your driver's directory.  
a. The driver must be in **LN101** folder of RoboPlus installed folder.  
b. If you don't want to install RoboPlus, install the latest VCP driver from the [FTDI Driver Download page](http://www.ftdichip.com/Drivers/VCP.htm).
 
* Click **Next** to start the installation. 

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/ftdi_driver_install/ln101_driverinstall_03.png)

* Click **Finish** to complete installation of the **USB Serial Port** driver. 

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/ftdi_driver_install/ln101_driverinstall_06.png)

#### <a name="installation-in-linux"></a>[Installation in Linux](#installation-in-linux)

Recent Linux releases include the kernel which contains the FT232RL driver for the FTDI driver used by USB2Dynamixel. **Hence, most users won't need to install the driver manually.**