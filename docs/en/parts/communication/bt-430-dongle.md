---
layout: archive
lang: en
ref: bt-430-dongle
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/communication/bt-430-dongle/
sidebar:
  title: BT-430 Dongle
  nav: "bt-430-dongle"
---

# [Introduction](#introduction)

![img](/assets/images/parts/communication/bt-430_dongle_01.jpg){: width='200px'}  

![img](/assets/images/parts/communication/bt-430_dongle_02.jpg){: width='200px'}

> BT-430 Dongle

The `BT-430 Dongle` a USB 2.0 interface and Bluetooth 5 Low Energy standard communication interface that provides USB to Bluetooth functionality for robot control, as the updated replacement to the `BT-410 Dongle`.

In other words, by attaching the `BT-430 Dongle` to a PC and pairing it with a BLE-supported controller or `BT-410 SLAVE module`, data can be exchanged between the PC and `BT-410 SLAVE module`. (Refer to the respective component's description page for how to attach each component.)

**1. Controllers and Wireless Modules Compatible with BT-430 Dongle**
  - RB-100
  - [CM-151]
  - [RB-86] / [RB-88]
  - [BT-410 SLAVE Module]

**2. Wireless Modules Not Compatible with BT-430 Dongle**
  - [BT-410 MASTER Module]
  - BT-210 MASTER Module
  - BT-210 SLAVE Module
  - BT-100/110A
  - ZIG-100/110A

## Usage Example

![img](/assets/images/parts/communication/bt-430_dongle_03.jpg)

# [Specifications](#specifications)

|     Item     |                Details                |
|:------------:|:------------------------------------:|
|    Weight    |                6.6g                   |
|    Size      |         50.5mm x 20mm x 10.5mm       |
| Bluetooth Specification | Bluetooth 5 |
| Effective Communication Range | 10M |
| Frequency Band | 2.4GHz ISM Band |
| Bandwidth | MAX 702.8kbps |
| Operating Voltage | 5.0V |
| Current Consumption | 20mA (Max) |
| Operating Temperature | 0°C ~ 40°C |
| Antenna | PCB Pattern Antenna |
| Interface | USB 2.0 Full Speed |
| Sensitivity | -81dBm (Typical) |
| Transmission Power | -6 ~ 4dBm (Class 2) |

# [Compatibility](#compatibility)

Work possible with combinations of BT-430 Dongle and BLE-supported controllers or BT-410 SLAVE module

|    Product    | R-Block | R-Motion | FW Recovery/Update<br />R+ Manager 2.0   | Entry | [R+ Scratch] | Task 2.0<br />Download  | R+ Motion 2.0<br />Download |
|:-------------:|:-------:|:--------:|:----------------------------------------:|:-----:|:------------:|:-----------------------:|:---------------------------:|
|     RB-100    |    ✓    |    ✓     |                    X                     |   ✓   |       X      |            X            |             X               |
|    [CM-151]   |    ✓    |    X     |                    ✓                     |   ✓   |       ✓      |            ✓            |             ✓               |
|[RB-86] / [RB-88] | ✓    |    X     |                    X                     |   ✓   |       X      |            X            |             X               |
|     CM-50     |    X    |    X     |                    ✓                     |   X   |       ✓      |            ✓            |             X               |
|    [CM-150]   |    X    |    X     |                    ✓                     |   X   |       ✓      |            ✓            |             X               |
|    [CM-200]   |    X    |    X     |                    ✓                     |   X   |       ✓      |            ✓            |             ✓               |
|    [CM-530]   |    X    |    X     |                    ✓                     |   X   |       X      |            ✓            |             ✓               |
| [OpenCM9.04]  |    X    |    X     |                    ✓                     |   X   |       X      |            ✓            |             ✓               |


# [Communication Modes](#communication-modes)

The BT-430 Dongle can establish reliable 1:1 communication through pairing.

## [1:1 Communication](#11-communication)

- When connected to a powered-on PC's USB port, the blue LED blinks, and when it successfully pairs with a BLE-supported controller or BT-410 SLAVE module, the blue LED remains lit.
- **Automatic Pairing Method**: When the blue LED of BT-430 Dongle blinks (not paired), if you bring the BT-410 SLAVE module close (within 10cm), it will automatically pair. (Afterward, pairing is possible even from a longer distance.)

# [BT-430 Dongle Setting](bt-430-dongle-setting)

- **[Firmware update](#firmware-update)**
- Resettable System
- Configurable SLAVE Address
- Enable/Disable Auto-Pairing Feature
- Enable/Disable [Multi-Pairing](#multi-pairing) Feature

## [Setup](#setup)

1. Connect the BT-430 Dongle to your PC and install the driver, then check the COM port number.

    - [Download] [Tera Term](http://www.robotis.com/download/software/teraterm-4.73.zip)

    ![img](/assets/images/parts/communication/bt-410_dongle_02.png)

    - Run the Tera Term terminal program(ttermpro.exe), then click File > New Connection.

    ![img](/assets/images/parts/communication/ttermpro-exe.png)

    ![img](/assets/images/parts/communication/bt-410_dongle_03.png)

2. Select the COM port number for the BT-430 Dongle.

    ![img](/assets/images/parts/communication/bt-410_dongle_04.png)

3. Enter the Serial Port Configuration Window.

    ![img](/assets/images/parts/communication/bt-410_dongle_05.png)

4. Set the communication speed to 57600.

    ![img](/assets/images/parts/communication/bt-410_dongle_06.png)

5. Enter the Terminal Configuration Window.

    ![img](/assets/images/parts/communication/bt-410_dongle_07.png)

6. Activate the Local Echo feature.

    ![img](/assets/images/parts/communication/bt-410_dongle_08.png)

7. Enter `!` as shown below in the terminal to enter command mode. Here, if OK continues to appear after entering `AT`, it means that the BT-430 Dongle has successfully connected, and you can now configure it.

    ![img](/assets/images/parts/communication/bt-410_dongle_09.png)


8. Enter AT+BTINQ=DBE7DF000001 and press Enter to search for devices with MAC addresses greater than or equal to DBE7DF000001 among nearby BLE devices.

    ![img](/assets/images/parts/communication/bt-410_dongle_10.png)

9. Device connection is done by searching for nearby devices with the AT+BTINQ command, and then pairing with the displayed Bluetooth address (12 digits in hexadecimal) without dashes. For example, if you enter `ATDDBE7DF000001` and press Enter, it will attempt to connect to the listed BLE device.


# [AT Commands](#at-commands)

You can change the settings of the BT-430 Dongle using AT commands in the terminal as follows.

#### [Check firmware version](#check-firmware-version)  
If you enter ? in the terminal, the BT-430 version will be displayed as `BT-430,2.1.1`.

#### [Firmware Update](#firmware-update)  
  - Enter `AT+BTBOOT` in the terminal and press ENTER to make the BT-430 enter bootloader mode, and the red LED will turn on.  
  - A USB storage device named "`BT-430 BOOT`" will appear in `This PC` on the computer.  
  - Download the uf2 file from [link](/assets/images/parts/communication/bt430_fw_v2.2.1.uf2) to your PC and copy this file to the USB device.  
  - Once the copy is complete, the BT-430 dongle will automatically reboot.
  - For BT-430 dongles using an older version of the bootloader, the following warning window may appear after copying the firmware, but the firmware update has been completed successfully.  

  ![img](/assets/images/parts/communication/bt-430_dongle_fw_copy_warning_en.png)

  - If you cannot find the COM port of the BT-430 after rebooting, please try the following methods:
    1. Disconnect and reconnect the USB connection of the BT-430 dongle.
    2. If the BT-430 is connected via a USB hub, disconnect and reconnect the USB connector that connects the USB hub to the PC.

#### [Restart the system](#restart-the-system)  
  Enter `ATZ` and press Enter to restart the BT-430 Dongle. If you have made any changes to the settings, they will persist across restart. 
  
  After a restart, in order to send AT commands to BT-430 Dongle, first you need to disconnect(File > Disconnect) current connection and then make a [new connection](#setup).

#### [Device discovery](#device-discovery)
  Enter `AT+BTINQ=DBE7DF000001` as shown below and press Enter to search for devices with MAC addresses greater than or equal to DBE7DF000001 among nearby BLE devices.

  ![img](/assets/images/parts/communication/bt-410_dongle_12.png)

#### [Automatic pairing](#automatic-pairing)
  Unpaired BT-430 SLAVE modules will automatically pair when brought close to the BT-430 Dongle (within about 10cm).

#### [Disable automatic pairing](#disable-automatic-pairing)
  Enter `AT+BTAUTOPAIR=0` and press ENTER.

  ![img](/assets/images/parts/communication/bt-410_dongle_13.png)

  A success message will be displayed after a few seconds.

  ![img](/assets/images/parts/communication/bt-410_dongle_14.png)

#### [Enable automatic pairng](#enable-automatic-pairng)
  Enter `AT+BTAUTOPAIR=1` and press ENTER.

  ![img](/assets/images/parts/communication/bt-410_dongle_15.png)

  A success message will be displayed after a few seconds.

  ![img](/assets/images/parts/communication/bt-410_dongle_16.png)

#### [Multi-Pairing](#multi-pairing)  
  (__Available from Firmware V2.2.1__)  
  __Enable__: Enter `AT+BTMULTIPAIR=1` and press ENTER  
  - When the multi-pairing feature is activated:  
    - If you bring a Slave device close to the BT-430 dongle, it will automatically pair.  
    - Up to 8 Peripheral devices can be connected simultaneously.  
    - If no device is connected, the BLUE LED blinks with a 50% duty cycle (equal on and off times).  
    - If 1 to 7 device(s) are connected, the BLUE LED will blink briefly based on the number of connected Slave devices.  
    - If 8 devices are connected, the BLUE LED will remain solidly ON.  
  - When the automatic pairing feature is enabled:  
    - The BT-430 remembers the last 8 connected devices (even if BT-430 is powered off).  
    - These devices will automatically pair, even if they are far away.  
  - When the automatic pairing feature is disabled:  
    - The BT-430 does not remember previously connected devices.  
    - You must always perform proximity pairing for any Slave device to connect.  

  __Disable__: Enter `AT+BTMULTIPAIR=0` and press ENTER


# [Check Driver](#check-driver)
To check if the BT-430 Dongle driver is correctly installed on your PC, follow these steps:

1. Connect the BT-430 Dongle to a USB port on your PC.

    ![img](/assets/images/parts/communication/bt-410_dongle_17.png)

2. Right-click on "My Computer" and select "Manage" from the popup menu.

    ![img](/assets/images/parts/communication/bt-430_dongle_05.jpg)

3. In the "Device Manager," under "Ports (COM & LPT)," check for "USB Serial Port (COMx)." (The COM port number may vary depending on your system.)

    ![img](/assets/images/parts/communication/bt-430_dongle_06.jpg)

# [Install Driver Manually](#install-driver-manually)

**Note**: If you install RoboPlus, the driver for the BT-430 Dongle will be installed automatically. If you choose not to install RoboPlus and need to install the driver manually, or if the driver did not install correctly when RoboPlus was installed, follow these steps.
{: .notice}

1. Connect the device to your PC. If the driver is not installed the BT-430 will be displayed as an "Unknown Device" when checked in Device Manager. 

    ![img](/assets/images/parts/communication/bt-430_dongle_07.jpg)

2. Download and extract the driver to your PC.

    - [Download Link](https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/baggage_files/opencm/robotis_cdc_drv.zip)

    ![img](/assets/images/parts/communication/bt-430_dongle_08.jpg)

3. Start the driver installation for the USB device through the Device Manager.

    ![img](/assets/images/parts/communication/bt-430_dongle_09.jpg)

4. Choose to search for the driver on your PC.

    ![img](/assets/images/parts/communication/bt-430_dongle_10.jpg)

5. Enter the path to the downloaded driver and click "Next" to install the driver.

    ![img](/assets/images/parts/communication/bt-430_dongle_11.jpg)

    ![img](/assets/images/parts/communication/bt-430_dongle_12.jpg)

    ![img](/assets/images/parts/communication/bt-430_dongle_13.jpg)

    
# [References](#references)

## [Certifications](#certifications)
Please inquire us for information regarding unlisted certifications.
- KC

[R-Block]: https://rblock.steamcup.org/?lang=en
[R-Motion]: https://rmotion.steamcup.org/?lang=en
[R+ Scratch]: /docs/en/software/rplus2/scratch/
[RB-86]: /docs/en/parts/controller/rb-86/
[RB-88]: /docs/en/parts/controller/rb-88/
[CM-151]: /docs/en/parts/controller/cm-151/
[CM-150]: /docs/en/parts/controller/cm-150/
[BT-410 SLAVE module]: /docs/en/parts/communication/bt-410/
[BT-410 MASTER module]: /docs/en/parts/communication/bt-410/
[CM-200]: /docs/en/parts/controller/cm-200/
[CM-530]: /docs/en/parts/controller/cm-530/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
