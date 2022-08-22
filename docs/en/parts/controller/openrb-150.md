---
layout: archive
lang: en
ref: openrb-150
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/openrb-150/
sidebar:
  title: OpenRB-150
  nav: "openrb-150"
---


# [Overview](#overview)

![](/assets/images/parts/controller/openrb-150/openrb_fonts.png){: width="300px"}  
![](/assets/images/parts/controller/openrb-150/openrb_overview_01.png){: width="300px"}

The OpenRB-150 is a new open source Arduino compatible embedded controller.

The controller features the same pinout and the form factor as the Arduino MKR to ensure compatibility with phyisical accessories, and has support for programming using the Arduino IDE.

The OpenRB-150 also features 4 dedicated DYNAMIXEL ports, and supports the DYNAMIXEL Wizard 2.0 testing and calibration softwere.

**NOTE** : Specialty firmware is required to utilize the OpenRB-150 with DYNAMIXEL Wizard. This firmware is included in the OpenRB board manager package.
{: .notice}

# [Specifications](#specifications)

| Item                            | Specification                                               |
|:--------------------------------|:------------------------------------------------------------|
| MICROCONTROLLER                 | SAMD21 Cortex-M0+ 32bit low power ARM® MCU                  |
| BOARD POWER SUPPLY              | (USB 3.0) 5 V<br />(VIN -or Terminal) 3.7 ~ 12.6 V          |
| SUPPORTED BATTERY               | Li-Po 1 - 3 cell (3.7 - 11.1 V)<br />XT60 connector ready   |
| DC CURRENT FOR 3.3V PIN         | 300 mA                                                      |
| DC CURRENT FOR 5V PIN           | 300 mA                                                      |
| DC CURRENT FOR DYNAMIXEL PORTs  | 3,000 mA                                                    |
| CIRCUIT OPERATING VOLTAGE       | 3.3 V                                                       |
| DIGITAL I/O PINS                | 24                                                          |
| PWM PINS                        | 12 (0, 1, 2, 3, 4, 5, 6, 7, 8, 10, A3 - or 18 -, A4 -or 19) |
| UART                            | 2                                                           |
| SPI                             | 1                                                           |
| I2C                             | 1                                                           |
| ANALOG INPUT PINS               | 7 (ADC 8/10/12 bit)                                         |
| ANALOG OUTPUT PINS              | 1 (DAC 10 bit)                                              |
| EXTERNAL INTERRUPTS             | 10 (0, 1, 4, 5, 6, 7, 8, A1 -or 16-, A2 - or 17)            |
| DC CURRENT PER I/O PIN          | 7 mA                                                        |
| FLASH MEMORY                    | 256 KB                                                      |
| FLASH MEMORY FOR BOOTLOADER     | 8 KB                                                        |
| SRAM                            | 32 KB                                                       |
| EEPROM                          | no                                                          |
| CLOCK SPEED                     | 32.768 kHz (RTC), 48 MHz                                    |
| LED_BUILTIN                     | 3                                                           |
| DYNAMIXEL TTL Port              | 4 (Max 1 Mbps)                                              |
| Board Dimensions                | 25 x 66 mm                                                  |
| Supported Software              | [Arduino IDE], [DYNAMIXEL Wizard 2.0]                       |
| Supported DYNAMIXEL<sup>*</sup> | [X Series], [MX Series], [AX Series], [P Series]            |

`*` RS-485 models will require [DYNAMIXEL Communication Bridge](/docs/en/parts/interface/dxl_bridge/) to convert TTL to RS-485.  
`*` 24V models require a separate power connection.

{% capture openrb-150_caution_01 %}
**WARNING**
- The current from the USB port is limited to 500mA with the built-in fuse, but a high current draw may cause damage to USB ports used to power the OpenRB-150.
- For applications requiring rapid movement or high torque, use of the terminal block to supply power is recommended.
- Always confirm the operating voltage of your DYNAMIXEL modules before connecting them to the OpenRB-150.
{% endcapture %}

<div class="notice--danger">{{ openrb-150_caution_01 | markdownify }}</div>

# [Hardware Layout](#hardware-layout)

## [Pinout](#pinout)

![](/assets/images/parts/controller/openrb-150/openrb-150_pinout.png)

## [Reset Button](#reset-button)
Pressing the `Reset Button` hard reboots the microcontroller, double pressing the `Reset Button` reboots the microcontroller into bootloader mode. 

The OpenRB-150 will not load it's Arduino sketch(or firmware) when in bootloader mode.

{% capture openrb-150_warning_01 %}
**WARNING**  
Resetting the microcontroller will also reset the power of any connected DYNAMIXELs ([Power Switch](#dynamixel-power-switch)).

It is important to only reset the microcontroller when the acutators are in a safe postion, to avoid possible damage or injury when the acuators are reset.
{% endcapture %}
<div class="notice--danger">{{ openrb-150_warning_01 | markdownify }}</div>

## [DYNAMIXEL Power Switch](#dynamixel-power-switch)
Power to the DYNAMIXEL ports is controlled by the FET on the bottom of the microcontroller.

The FET can enable and disable the power to the connected ports, by default the FET is turned off whenever the OpenRB-150 is powered on.

When the FET is turned on, the `DXL` RED LED will also be turned on to confirm the power supply status.

![](/assets/images/parts/controller/openrb-150/openrb-150_switch.png)

## [Terminal VIN](#terminal-vin)
The included terminal block provides compatiblity with a wide range of input power sources.  
ROBOTIS recommends using the terminal block to supply power when possible.

To supply power to the OpenRB-150 controller via the Terminal VIN, set the jumper to `VIN(DXL)` side as shown below.

![](/assets/images/parts/controller/openrb-150/openrb-150_jumper.png)  
> Terminal VIN jumper setting

![](/assets/images/parts/controller/openrb-150/openrb-150_power_inputs.png)  
> Power input circuitry

**CAUTION**  
Do not charge the battery when connected to the controller.
{: .notice--warning}

### XT60 Connector

The XT60 connector is widely used in the RC products and it can be assembled on the back of the OpenRB-150 controller.  
Please remove the Terminal Block before soldering the XT60 right angle connector.

![](/assets/images/parts/controller/openrb-150/openrb-150_power_xt60.png)  
> XT60 Connector Ready


## [Power Source Jumper](#power-source-jumper)
OpenRB-150 can be powered with three sources.  
In order to properly supply power to the controller and DYNAMIXEL, the power source jumper needs to be set properly.

|                             When using USB or VIN                              |                          When using Terminal Block or XT60                           |
|:------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------:|
| ![](/assets/images/parts/controller/openrb-150/openrb-150_power_jumper_5v.png) | ![](/assets/images/parts/controller/openrb-150/openrb-150_power_jumper_terminal.png) |

## [DYNAMIXEL Ports](#dynamixel-ports)
4 DYNAMIXEL Ports are ready for any TTL supported DYNAMIXEL.  
RS-485 supported DYNAMIXEL can also be used when connected with the [DYNAMIXEL Communication Bridge].

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_product_front.png)
> DYNAMIXEL Communication Bridge

## [Serial Port](#serial-port)
The Serial Port assigned to `Serial2` can be used to connect various devices for debugging the code or controlling the controller.

![](/assets/images/parts/controller/openrb-150/openrb-150_serial_port.png)

## [LEDs](#leds)
Three LED indicates the status of the OpenRB-150 controller.

- `PWR` (Green) : This LED is turned on whenever the OpenRB-150 is powered.
- `USER` (Orange) : This LED can be controlled by user via Pin `32` or `LED_BUILTIN` in the Arduino sketch code.
- `DXL` (Red) : This LED will be turned on when the DYNAMIXEL port is powered on.

![](/assets/images/parts/controller/openrb-150/openrb-150_leds.png)

# [Pin Name Definitions](#pin-name-definitions)

```c++
// Battery
#define ADC_BATTERY	(33u)

// LEDs
#define PIN_LED     (32u)
#define LED_BUILTIN PIN_LED

// DYNAMIXEL POWER FET
#define DXL_PWR_SW  (31u)
```

# [Connecting Power](#connecting-power)

OpenRB-150 controller can be powered with three power sources.

## USB C
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_usb.png)

## VIN  
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_vin.png)

## Terminal VIN  
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_terminal_vin.png)

{% capture openrb-150_caution_02 %}
**WARNING**  
1. Always check the polarity of any power supplies before connecting them to the OpenRB-150.  
Incorrect polarity can permanently damage the microcontroller.

2. Make sure to set the Jumper correctly depending on the power source.
{% endcapture %}
<div class="notice--danger">{{ openrb-150_caution_02 | markdownify }}</div>

## [Connection Examples](#connection-examples)

### When running 5V DYNAMIXEL with the USB power  
![](/assets/images/parts/controller/openrb-150/openrb-150_connection_example01.png)

{% capture openrb-150_waring_01 %}
**WARNING**  
For applications that require high velocity or torque, please supply power via Terminal VIN.  
USB port is not a suitable power source for dynamic motor operation.  
Drawing excessive power from the USB port may cause reboot or damage on the PC.  
Using an external power source is recommended as shown below.  
![](/assets/images/parts/controller/openrb-150/openrb-150_connection_example01_1.png)
{% endcapture %}
<div class="notice--danger">{{ openrb-150_waring_01 | markdownify }}</div>

### When running 12V TTL DYNAMIXEL  
![](/assets/images/parts/controller/openrb-150/openrb-150_connection_example02.png)

### When running 12V RS-485 DYNAMIXEL  
![](/assets/images/parts/controller/openrb-150/openrb-150_connection_example03.png)

# [Development Environment](#development-environment)

## [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)
OpenRB-150 supports DYNAMIXEL Wizard 2.0.  
In order to configure and manage DYNAMIXEL with DYNAMIXEL Wizard 2.0, please upload the `usb_to_dynamixel` sketch in the OpenRB-150 board manager example.

**NOTE**  
`usb_to_dynamixel` sketch is uploaded to the OpenRB-150 as a factory default firmware.  
Up to `1 Mbps` baudrate is supported with usb_to_dynamixel sketch.
{: .notice}

![](/assets/images/parts/controller/openrb-150/openrb-150_wizard2_connection.png)  
> Connect the USB C cable to OpenRB-150 and Upload the usb_to_dynamixel sketch

OpenRB-150 supports most features of DYNAMIXEL Wizard 2.0 including testing DYNAMIXEL, firmware management, packet analyzing, data plotting, control table backup, etc.

![](/assets/images/parts/controller/openrb-150/openrb-150_wizard2_connection02.png)  
> Various baudrates up to 1 Mbps are supported

![](/assets/images/parts/controller/openrb-150/openrb-150_wizard2_fw_recovery.png)  
> DYNAMIXEL Firmware Recovery and Update are supported

![](/assets/images/parts/controller/openrb-150/openrb-150_wizard2_graph.png)  
> Graphing feature is supported

![](/assets/images/parts/controller/openrb-150/openrb-150_wizard2_packet.png)  
> Analyzing DYNAMIXEL packet is supported

## [Install the Arduino IDE](#install-the-arduino-ide)

### [Installl on Linux](#install-on-linux)

1. Download the `Linux 64 bit` version of Arduino IDE from the official Arduino download page.  
  ![](/assets/images/icon_download.png) [https://www.arduino.cc/en/software](https://www.arduino.cc/en/software)

2. Extract the downloaded file to the desired folder and execute the install script as below in the terminal.
```
$ ./install.sh
```

3. To run the Arduino IDE on Linux platform, enter the command below in the terminal.
```
$ arduino
```

### [Install on Mac](#install-on-mac)

1. Download the `Mac OS X version` of Arduino IDE from the official Arduino download page.  
  ![](/assets/images/icon_download.png) [https://www.arduino.cc/en/software](https://www.arduino.cc/en/software)

2. Drag the downloaded Arduino file into the `Applications`.

3. Run the Arduino IDE.

### [Install on Windows](#install-on-windows)

1. Download the `Windows Installer version` of Arduino IDE from the official Arduino download page.  
  ![](/assets/images/icon_download.png) [https://www.arduino.cc/en/software](https://www.arduino.cc/en/software)

2. Install the downloaded file.

3. Run the Arduino IDE.

Please refer to [Arduino Software Installation instruction video](https://youtu.be/1Y7FLG1n-9k?t=136)

## [Install Board Manager](#install-board-manager)

On the Arduino IDE, go to `File > Preferences` from the top menu.  
When the Preferences window appears, copy and paste following address in the `Additional Boards Manager URLs` textbox.

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenRB-150/master/package_openrb_index.json
```

![](/assets/images/parts/controller/openrb-150/openrb-150_board_manager_index.png)

### Arduino SAMD Board Manager

The OpenRB-150 requires Arduino SAMD board manager for building and uploading sketches to the controller.
Follow the instructions below to install the Arduino SAMD Board Manager.

1. Go to Tools > Board > Boards Manager.
2. Search for `Arduino SAMD` and Install the latest version.

![](/assets/images/parts/controller/openrb-150/arduino_samd_board_manager.png)

### OpenRB-150 Board Manager

Follow the instructions below to install the OpenRB-150 Board Manager.

1. Go to Tools > Board > Boards Manager.
2. Search for `OpenRB` and Install the latest version.

![](/assets/images/parts/controller/openrb-150/openrb-150_board_manager.png)

{% include en/software/arduino/arduino_library_api.md %}

## [Upload Sketch](#upload-sketch)

Uploading a sketch to the OpenRB-150 is similar with Arduino controllers.  
Connect the OpenRB-150 to the PC via USB cable, select the OpenRB-150 board and the port that is connected to the OpenRB-150, then click on the `Upload` icon. 

![](/assets/images/parts/controller/opencm904/oencm904_upload_01.png)

**Note**
If error occurs during the Upload process, please try uploading the sketch in the bootloader mode by double clicking the [Reset Button](#reset-button).
{: .notice}

# [Downloads](#downloads)

- [OpenRB-150 Schematic (PDF)]
- [OpenRB-150 3D Modeling (STL)]
- OpenRB-150 Board Manager ([GitHub Repo](https://github.com/ROBOTIS-GIT/OpenRB-150))
- DYNAMIXEL2Arduino Library ([GitHub Repo](https://github.com/ROBOTIS-GIT/Dynamixel2Arduino))

[X Series]: /docs/en/dxl/x/
[MX Series]: /docs/en/dxl/mx/
[AX Series]: /docs/en/dxl/ax/
[P Series]: /docs/en/dxl/p/
[DYNAMIXEL Wizard 2.0]: /docs/en/software/dynamixel/dynamixel_wizard2/
[Arduino IDE]: https://www.arduino.cc/en/software
[DYNAMIXEL Communication Bridge]: /docs/en/parts/interface/dxl_bridge/
[OpenRB-150 Schematic (PDF)]: https://www.robotis.com/service/download.php?no=2117
[OpenRB-150 3D Modeling (STL)]: https://www.robotis.com/service/download.php?no=2118
