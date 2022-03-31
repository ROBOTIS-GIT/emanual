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

![](/assets/images/parts/controller/openrb-150/openrb-150_product.png)

> OpenRB-150

The OpenRB-150 is a new open source Arduino compatible Microcontroller.

The controller features the same pinout and the form factor as the Arduino MKR to ensure compatibility with phyisical accessories, and has support for programming using the Arduino IDE.

The OpenRB-150 also features 4 dedicated DYNAMIXEL ports, and supports the DYNAMIXEL Wizard 2.0 testing and calibration softwere.

**NOTE** : Specialty firmware is required to utilize the OpenRB-150 with DYNAMIXEL Wizard. This firmware is included in the OpenRB board manager package.
{: .notice}

# [Specifications](#specifications)

| Item                        | Specification                                               |
|:----------------------------|:------------------------------------------------------------|
| MICROCONTROLLER             | SAMD21 Cortex-M0+ 32bit low power ARM® MCU                  |
| BOARD POWER SUPPLY          | (USB 3.0) 5 V<br />(VIN -or Terminal) 3.7 ~ 12.6 V          |
| SUPPORTED BATTERY(*)        | Li-Po 1 - 3 cell (3.7 - 11.1 V)<br />XT60 connector ready   |
| DC CURRENT FOR 3.3V PIN     | 1,200 mA                                                    |
| DC CURRENT FOR 5V PIN       | 300 mA                                                      |
| CIRCUIT OPERATING VOLTAGE   | 3.3 V                                                       |
| DIGITAL I/O PINS            | 24                                                          |
| PWM PINS                    | 12 (0, 1, 2, 3, 4, 5, 6, 7, 8, 10, A3 - or 18 -, A4 -or 19) |
| UART                        | 2                                                           |
| SPI                         | 1                                                           |
| I2C                         | 1                                                           |
| ANALOG INPUT PINS           | 7 (ADC 8/10/12 bit)                                         |
| ANALOG OUTPUT PINS          | 1 (DAC 10 bit)                                              |
| EXTERNAL INTERRUPTS         | 10 (0, 1, 4, 5, 6, 7, 8, A1 -or 16-, A2 - or 17)            |
| DC CURRENT PER I/O PIN      | 7 mA                                                        |
| FLASH MEMORY                | 256 KB                                                      |
| FLASH MEMORY FOR BOOTLOADER | 8 KB                                                        |
| SRAM                        | 32 KB                                                       |
| EEPROM                      | no                                                          |
| CLOCK SPEED                 | 32.768 kHz (RTC), 48 MHz                                    |
| LED_BUILTIN                 | 3                                                           |
| DYNAMIXEL TTL Port          | 4 (Max 3 Mbps)                                              |
| Board Dimensions            | 25 x 66 mm                                                  |

{% capture openrb-150_caution_01 %}
**WARNING**
- The current from the USB port is limited to 500mA with the built-in fuse, but a high current draw may cause damage to USB ports used to power the OpenRB-150.
- For applications requiring rapid movement or high torque, use of the terminal block to supply power is recommended.
- Always confirm the operationg voltage of your DYNAMIXEL modules before connecting them to the OpenRB-150.
{% endcapture %}

<div class="notice--danger">{{ openrb-150_caution_01 | markdownify }}</div>

# [Hardware Layout](#hardware-layout)

## [Pinout](#pinout)

![](/assets/images/parts/controller/openrb-150/openrb-150_pinout.png)

## [Reset Button](#reset-button)
Pressing the `Reset Button` hard reboots the microcontroller, double pressing the Reset Button reboots the microcontroller into bootloader mode. 

The OpenRB-150 will not load it's firmware when in bootloader mode.

**WARNING**  
Resetting the microcontroller will also reset the power of any connected DYNAMIXELs ([Power Switch](#dynamixel-power-switch)).

It is important to only reset the microcontroller when the acutators are in a safe postion, to avoid possible damage or injury when the acuators are reset.
{: .notice--danger}

## [DYNAMIXEL Power Switch](#dynamixel-power-switch)
Power to the DYNAMIXEL ports is controlled by the FET on the bottom of the microcontroller.

The FET can enable and disable the power to the connected ports, by default the FET is turned off whenever the OpenRB-150 is powered on.

When the FET is turned on the `DYNAMIXEL LED` indicator on the acutators will blink, to confirm the power connection.

![](/assets/images/parts/controller/openrb-150/openrb-150_switch.png)

## [Terminal VIN](#terminal-vin)
The included terminal block provides compatiblity with a wide range of input power sources.  
ROBOTIS recommends using the terminal block to supply power when possible.

The highest voltage among USB (`VBUS`), VIN (`Arduino_VIN`), and the terminal block (`VIN`) is the voltage that will be supplied to the entire controller.

USB (`VBUS`) and VIN(`Arduino_VIN`) feature reverse voltage protection to prevent damage.  
Terminal VIN (`VIN`) does not feature any reverse voltage protection.

To prevent damage from the reverse voltage, do not connect low voltage sources to the terminal block when other power supplies are in use.

![](/assets/images/parts/controller/openrb-150/openrb-150_power_inputs.png)

**CAUTION**  
Do not charge the battery when connected to the controller.
{: .notice--warning}

## [DYNAMIXEL Ports](#dynamixel-ports)
4 DYNAMIXEL Ports are ready for any TTL supported DYNAMIXEL.  
RS-485 supported DYNAMIXEL can also be used when connected with the [DYNAMIXEL Communication Bridge].

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_product_front.png)
> DYNAMIXEL Communication Bridge

{% include en/dxl/pinout_warning.md %}

## [Serial Port](#serial-port)
The Serial Port assigned to `Serial2` can be used to connect various devices for debugging the code or controlling the controller.

![](/assets/images/parts/controller/openrb-150/openrb-150_serial_port.png)

## [LEDs](#leds)
Three LED indicates the status of the OpenRB-150 controller.

- `Power LED` (Green) : This LED is turned on whenever the OpenRB-150 is powered.
- `USER LED` (Orange) : This LED can be controlled by user via Pin `32` or `LED_BUILTIN` in the Arduino sketch code.
- `DYNAMIXEL LED` (Red) : This LED will be turned on when the DYNAMIXEL port is powered on.

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

OpenRB-150 controller can be powered by three power sources:

1. USB C connector  
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_usb.png)
2. VIN  
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_vin.png)
3. Terminal VIN  
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_terminal_vin.png)

**CAUTION**  
Always check the polarity of any power supplies before connecting them to the OpenRB-150. 

Incorrect polarity can permanently damage the microcontroller.
{: .notice--warning}

**DANGER**  
Terminal VIN (`VIN`) does not feature any reverse voltage protection. To prevent damage, do not connect low voltage sources to the terminal block when other power supplies are in use.  
![](/assets/images/parts/controller/openrb-150/openrb-150_power_danger.png)
{: .notice--danger}

It is possible to connect multiple power sources at the same time. The power source with the highest voltage will be supplied to the rest of the controller. Terminal VIN (`VIN`) does not feature any reverse voltage protection. To prevent damage, do not connect low voltage sources to the terminal block when other power supplies are in use.

# [Development Environment](#development-environment)

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

3. Click the Arduino IDE icon below to launch the app.

![](/assets/images/parts/controller/openrb-150/arduino_mac_01.png)

### [Install on Windows](#install-on-windows)

1. Download the `Windows Installer version` of Arduino IDE from the official Arduino download page.  
  ![](/assets/images/icon_download.png) [https://www.arduino.cc/en/software](https://www.arduino.cc/en/software)

2. Install the downloaded file.

3. Click the Arduino IDE icon below to launch the app.

![](/assets/images/parts/controller/openrb-150/arduino_mac_01.png)

Please refer to [Arduino Software Installation instruction video](https://youtu.be/1Y7FLG1n-9k?t=136)

## [Install Board Manager](#install-board-manager)

On the Arduino IDE, go to `File > Preferences` from the top menu.  
When the Preferences window appears, copy and paste following address in the `Additional Boards Manager URLs` textbox.

```
https://raw.githubusercontent.com/ROBOTIS-Will/openrb/master/package_openrb_index.json
```

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_1.png)


{% include en/software/arduino/arduino_library_api.md %}

## [Upload sketch](#upload-sketch)

Uploading the sketch to the OpenRB-150 is similar with Arduino controllers.

Connect the OpenRB-150 to the PC via USB cable and click on the Upload icon. 

Make sure that the board is properly entering the Bootloader (See the resulting output from the Arduino IDE), otherwise the OpenRB-150 will fail to download the sketch. 

![](/assets/images/parts/controller/openrb-150/oencm904_upload_01.png)

**Note**
If error occurs during the Upload process, please try uploading the sketch in the bootloader mode by double clicking the [Reset Button](#reset-button).
{: .notice}

# [Downloads](#downloads)

- [OpenRB-150 Schematic (PDF)]
- [OpenRB-150 3D Modeling (STEP)]
- OpenRB Board Manager ([GitHub Repo](https://github.com/ROBOTIS-GIT), [Zip])
- DYNAMIXEL2Arduino Library ([GitHub Repo](https://github.com/ROBOTIS-GIT/Dynamixel2Arduino), [Zip])


[DYNAMIXEL Communication Bridge]: /docs/en/parts/interface/dxl_bridge/
[OpenRB-150 Schematic (PDF)]: /docs/en/parts/controller/openrb-150/
[OpenRB-150 3D Modeling (STEP)]: /docs/en/parts/controller/openrb-150/