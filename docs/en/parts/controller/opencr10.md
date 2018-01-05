---
layout: archive
lang: en
ref: opencr10
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/opencr10/
sidebar:
  title: OpenCR1.0
  nav: "opencr10"
---

![](/assets/images/parts/controller/opencr10/opencr_product.png)

> OpenCR 1.0

# [Introduction](#introduction)
OpenCR1.0 is developed for ROS embedded systems to provide completely open-source hardware and software.  
Everything about the board; Schematics, PCB Gerber, BOM and the firmware source code for the TurtleBot3 and OP3 are free to distribute under open-source licenses for users and the ROS community.  
The STM32F7 series chip inside the OpenCR1.0 board is based on a very powerful ARM Cortex-M7 with floating point unit.  
The development environment for OpenCR1.0 is wide open from Arduino IDE and Scratch for young students to traditional firmware development for the expert.

# [Specifications](#specifications)

| Items               | Specifications                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|:--------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Microcontroller     | STM32F746ZGT6 / 32-bit ARM Cortex®-M7 with  FPU (216MHz, 462DMIPS)                                                                                                                                                                                                                                                                                                                                                                                                  |
| Sensors             | Gyroscope 3Axis, Accelerometer 3Axis, Magnetometer 3Axis (MPU9250)                                                                                                                                                                                                                                                                                                                                                                                                  |
| Programmer          | ARM Cortex 10pin JTAG/SWD connector<br />USB Device Firmware Upgrade (DFU)<br />Serial                                                                                                                                                                                                                                                                                                                                                                              |
| Digital I/O         | 32 pins (L 14, R 18) *Arduino connectivity<br />5Pin OLLO x 4<br />GPIO x 18 pins<br />PWM x 6<br />I2C x 1<br />SPI x 1                                                                                                                                                                                                                                                                                                                                            |
| Analog INPUT        | ADC Channels (8bit) x 6                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Communication Ports | USB x 1 (Micro-B USB connector/USB 2.0/Host/Peripheral/OTG)<br />TTL x 3 ([B3B-EH-A] / Dynamixel)<br />RS485 x 3 ([B4B-EH-A] / Dynamixel)<br />UART x 2 ([20010WS-04])<br />CAN x 1 ([20010WS-04])                                                                                                                                                                                                                                                                  |
| LEDs and buttons    | LD2 (red/green) : USB communication<br />User LED x 4 : LD3 (red), LD4 (green), LD5 (blue)<br />User button  x 2                                                                                                                                                                                                                                                                                                                                                    |
| Powers              | External input source<br />5 V (USB VBUS), 7-24 V (Battery or SMPS)<br />Default battery : LI-PO 11.1V 1,800mAh 19.98Wh<br />Default SMPS: 12V 5A<br />External output source<br />`*`12V max 5A([SMW250-02]), `*`5V max 4A([5267-02A]), 3.3V@800mA([20010WS-02])<br />External battery Port for RTC (Real Time Clock) ([Molex 53047-0210])<br />Power LED: LD1 (red, 3.3 V power on)<br />Reset button x 1 (for power reset of board)<br />Power on/off switch x 1 |
| Dimensions          | 105(W) X 75(D) mm                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Mass                | 60g                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |

`*` 5V power source is supplied from regulated 12V output.
{: .notice}

`Note` Hot swap power switch between "shore power"(12V, 5A SMPS) and "mobile power"(battery) from OpenCR1.0 board enables UPS(Uninterrupted Power Supply) feature.
{: .notice}

# [Hardware](#hardware)

## [Layout/Pin Map](#layoutpin-map)

![](/assets/images/parts/controller/opencr10/opencr_pinout.png)

# [Bootloader](#bootloader)
The bootloader is responsible for initializing the board and downloading and executing the firmware into flash memory.

|     Item     |     Description     |
|:------------:|:-------------------:|
| Supported OS | Windows, Linux, Mac |
|   Compiler   | gcc arm 5.4 2016q2  |

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

- USB Port
  - Connected to PC and recognized as serial port
  - A communication cable for downloading firmware through the bootloader.

- PUSH SW2
  - Press and hold the button when the power is on or reset to execute the bootloader
  - If the button is not pressed when the power is turned on, the bootloader is executed. If the firmware is in the flash memory, the bootloader executes the firmware.

## [Memory Map](#memory-map)

The STM32F746 used in OpenCR has an internal flash memory of 1024KB, and each area is defined as follows. The bootloader is located at the lowest address in the flash memory and the bootloader is first executed when the power is turned on and reset.

![](/assets/images/parts/controller/opencr10/bootloader_01.png)

## [Boot Sequence](#boot-sequence)

![](/assets/images/parts/controller/opencr10/bootloader_03.png)

If the board is powered on or reset, if the SW2 button is pressed, it waits for commands from the PC in the boot loader state. If the SW2 button is not pressed, jump to the firmware if the firmware exists in the firmware area of ​​the flash memory and execute it.

## [Communication Protocol](#communication-protocol)

### [MavLink](#mavlink)

The communication protocol for downloading firmware from the boot loader uses MavLink. MavLink was created for communication in UAV, see the link below for details.

As a feature, when the command name and parameters are generated as an xml file, the communication code for each command is automatically generated by the code such as java / c / python. It creates a function that performs CRC checking or data parsing for communication automatically, so if you define only necessary commands as xml file, you can generate the source automatically.

It is also easy to port because it generates in various languages.

[http://qgroundcontrol.org/mavlink/start](http://qgroundcontrol.org/mavlink/start)

### [Composition of Commands](#composition-of-commands)

```xml
<?xml version="1.0"?>
<mavlink>
        <!--<include>common.xml</include>-->
        <!-- NOTE: If the included file already contains a version tag, remove the version tag here, else uncomment to enable. -->
<!--<version>3</version>-->
<enums>
</enums>
<messages>
 <message id="150" name="ACK">
  <description></description>
  <field type="uint8_t"    name="msg_id"></field>
  <field type="uint16_t"   name="err_code"></field>
  <field type="uint8_t"    name="length"></field>
  <field type="uint8_t[16]" name="data"></field>
 </message>
</messages>
      ... omit ...
</mavlink>
```

The final defined xml file is added to github.

```
https://github.com/ROBOTIS-GIT/OpenCR/blob/master/arduino/opencr_bootloader/common/msg/xml/opencr_msg
```

The defined xml file should be converted to the command code of the language you want to use through the MavLink utility. Download the MavLink utility source code from github below.

[https://github.com/mavlink/mavlink/](https://github.com/mavlink/mavlink/)

It is written in Python and requires Python 2.7 or later. If it is not installed, add it.

```bash
$ sudo apt-get install python-tk
$ sudo apt-get install python-future
$ python mavgenerate.py
```

When you run MAVLink Generator, a GUI screen will appear, select the XML file already created in XML, set the language to C, and set the protocol version to 1.0. If you select the folder name for output in Out, and select Generate, a function header file that can use the command added based on the xml file is created and can be used in the firmware

![](/assets/images/parts/controller/opencr10/bootloader_04.png)

The final generated communication code can be seen in the link below.

[https://github.com/ROBOTIS-GIT/OpenCR/tree/master/arduino/opencr_bootloader/common/msg/mavlink](https://github.com/ROBOTIS-GIT/OpenCR/tree/master/arduino/opencr_bootloader/common/msg/mavlink)

The commands for the boot loader to download and execute the firmware through the MavLink protocol are as follows.

```c++
void cmd_read_version( msg_t *p_msg );
void cmd_read_board_name( msg_t *p_msg );
void cmd_jump_to_fw( msg_t *p_msg );
void cmd_flash_fw_write_packet( msg_t *p_msg );
void cmd_flash_fw_write_begin( msg_t *p_msg );
void cmd_flash_fw_write_end( msg_t *p_msg );
void cmd_flash_fw_write_block( msg_t *p_msg );
void cmd_flash_fw_erase( msg_t *p_msg );
void cmd_flash_fw_verify( msg_t *p_msg );
void cmd_flash_fw_read_block( msg_t *p_msg );
```

### [Download Sequence](#download-sequence)

The main function of the boot loader is to receive the firmware file from the PC, store it in flash, and execute the stored firmware. The order of downloading is as follows, and you can check how to proceed and how to proceed by looking at it. You can do the actual implementation based on this.

![](/assets/images/parts/controller/opencr10/bootloader_05.png)

![](/assets/images/parts/controller/opencr10/bootloader_06.png)


### [Message Processing](#message-processing)

In the code actually implemented, the main function calls the msg_process_vcp() function for message processing. In this case, if there is data coming from USB, msg_recv function is called to parse the message, and if any command is received, it returns TRUE to call the corresponding command function.

```c++
int main(void)
{
  tTime = millis();
  while(1)
  {
    msg_process_vcp();
  }
}

void msg_process_vcp(void)
{
  BOOL ret;
  uint8_t ch;
  msg_t msg;


  while(vcp_is_available())
  {
    ch = vcp_getch();
    ret = msg_recv( 0, ch, &msg );

    if( ret == TRUE )
    {
      switch( msg.p_msg->msgid )
      {
        case MAVLINK_MSG_ID_READ_VERSION:
          cmd_read_version(&msg);
          break;

        case MAVLINK_MSG_ID_READ_BOARD_NAME:
          cmd_read_board_name(&msg);
          break;

        ... omit ...
        
       default:
         cmd_send_error(&msg, ERR_INVALID_CMD);
         break;
      }
    }
  }
}
```

For example, the Mavlink_msg_read_version_decode() function parses the message data into the data structure of the command. If the field Responsive to parsed mav_data is active, it sends the boot loader version and revision via the ACK command.

![](/assets/images/parts/controller/opencr10/bootloader_07.png)

```c++
void cmd_read_version( msg_t *p_msg )
{
  err_code_t err_code = OK;
  mavlink_ack_t     mav_ack;
  mavlink_read_version_t mav_data;


  mavlink_msg_read_version_decode(p_msg->p_msg, &mav_data);


  if( mav_data.resp == 1 )
  {
    mav_ack.msg_id   = p_msg->p_msg->msgid;
    mav_ack.err_code = err_code;
    mav_ack.data[0] = boot_version;
    mav_ack.data[1] = boot_version>>8;
    mav_ack.data[2] = boot_version>>16;
    mav_ack.data[3] = boot_version>>24;
    mav_ack.data[4] = boot_revision;
    mav_ack.data[5] = boot_revision>>8;
    mav_ack.data[6] = boot_revision>>16;
    mav_ack.data[7] = boot_revision>>24;
    mav_ack.length  = 8;
    resp_ack(p_msg->ch, &mav_ack);
  }
}
```

### [Folder Structure](#folder-structure)

| Item         | Contents                                                     |
|:-------------|:-------------------------------------------------------------|
| bin          | Save obj and bin files generated after build                 |
| common->bsp  | Includes board-specific functions (LED / BUTTON / USB, etc.) |
| common->hal  | Hardware independent function folders on the board           |
| common->lib  | Libraries used externally or publicly                        |
| msg->mavlink | Communication protocol source generated by Xml               |
| msg->xml     | The xml file folder where you defined the command            |
| src          | Function folder required for boot loader function            |

![](/assets/images/parts/controller/opencr10/bootloader_08.png)

## [Update Bootloader(Linux)](#update-bootloaderlinux)

You can update the bootloader using the MCU's DFU mode on the OpenCR board.  
To update using DFU mode, you need to install dfu-util.

```bash
$ sudo apt-get install dfu-util
```

### [Enter DFU Mode](#enter-dfu-mode)
To run OpenCR in DFU mode, press `Reset Button` while holding down `Boot Button` and OpenCR will enter the DFU mode by the built-in boot loader.

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

### [Check Boot Mode](#check-boot-mode)
If you run lsusb, you can check if it is in DFU mode. If the MCU is in DFU mode, the DFU device will be displayed after running lsusb.

```bash
$ lsusb
```

![](/assets/images/parts/controller/opencr10/bootloader_10.png)

### [Update Bootloader](#update-bootloader)
After building the boot loader, move to the folder where the bin file is located and update it with dfu-util.

```bash
$ sudo dfu-util -d 0483:df11 -a 0 -s 0x08000000 -D ./opencr_boot.bin
```

![](/assets/images/parts/controller/opencr10/bootloader_11.png)

## [Firmware Recovery Mode](#firmware-recovery-mode)

If the wrong firmware is downloaded and the board freezes or does not work, you must force the boot loader to run and download the normal firmware.

To execute the boot loader, hold down PUSH SW2 on the board and press the reset button to execute the boot loader. When the boot loader is running, the STATUS LED blinks every 100ms.

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

You can download the normal firmware while the boot loader is running.

# [Downloader](#downloader)

The PC program Downloader communicates with the boot loader and downloads the firmware from the PC to the firmware area of ​​the OpenCR board flash.

| Item         | Description                       |
|:-------------|:----------------------------------|
| Supported OS | Windows, Linux, Mac               |
| Compiler     | Linux : gcc<br />Windows : Qt 5.7 |

## [Usage](#usage)

```bash
$ opencr_ld <Communication port> <Baudrate> <Firmware binary> <Firmware execution status [0|1]>
```

- Communication port: The serial port name is usually / dev / ttyACM0 for Linux, and it should be the same as the serial port connected to OpenCR.
- Baudrate : The speed to communicate and input at 115200bps.
- Firmware binary : The firmware binary image has an extension of bin.
- Firmware execution status : In case of 1, the firmware will be executed after downloading the firmware. If it is not input or if it is 0, only downloading the firmware is performed.

## [Linux/Mac Example](#linuxmac-example)

```bash
$ sudo opencr_ld /dev/ttyACM0 115200 ./opencrfw.bin 1
```

## [Windows Example](#windows-example)

```
opencr_ld.exe COM1 115200 ./opencrfw.bin 1
```

## [Execution Result](#execution-result)

![](/assets/images/parts/controller/opencr10/downloader_01.png)


## [Download Executable File](#download-executable-file)

- [https://github.com/ROBOTIS-GIT/OpenCR/tree/master/arduino/opencr_arduino/tools/opencr_tools_1.0.0](https://github.com/ROBOTIS-GIT/OpenCR/tree/master/arduino/opencr_arduino/tools/opencr_tools_1.0.0)

# [Arduino IDE](#arduino-ide)

## [Install on Linux](#install-on-linux)

### [USB Port Settings](#usb-port-settings)
Make the OpenCR USB port be able to upload the Arduino IDE program without root permission.

```bash
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/99-opencr-cdc.rules
$ sudo cp ./99-opencr-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

![](/assets/images/platform/turtlebot3/preparation/7_1_1_usb_port_setting.png)

### [Compiler Settings](#compiler-settings)
Since the OpenCR libraries is built for 32 bit platform, 64 bit PC needs the 32 bit compiler relevants for the ArduinoIDE.

```bash
$ sudo apt-get install libncurses5-dev:i386
```

![](/assets/images/platform/turtlebot3/preparation/7_1_2_compiler_settings.png)

### [Install Arduino IDE(Linux)](#install-arduino-idelinux)
Download the latest version of Arduino IDE from the official arduino homepage, and install it. Currently, the OpenCR will be on service in the version 1.6.4 or later.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

Then, extract the downloaded file to the desired folder and execute the installation file from the terminal. In this case, the example shown below makes the folder tools in the user’s top folder (~/). This folder will act as the Arduino IDE folder.

```bash
$ cd ~/tools/arduino-1.16.0
$ ./install.sh
```

Set the file path of installed Arduino IDE as an absolute path named PATH in the bashrc file. Here recommends to use gedit editor. (Use another editor, if necessary.) Finally, source it to apply the changes.

```bash
$ gedit ~/.bashrc
$ export PATH=$PATH:$HOME/tools/arduino-1.16.0
$ source ~/.bashrc
```

### [Run Arduino IDE(Linux)](#run-arduino-idelinux)
To run the Arduino IDE on Linux platform, type into the terminal as follows.

```bash
$ arduino
```

![](/assets/images/platform/turtlebot3/preparation/ide0.png)

### [Porting to Arduino IDE(Linux)](#porting-to-arduino-idelinux)

#### Preferences
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

![](/assets/images/platform/turtlebot3/preparation/ide1.png)

#### Install the OpenCR package via Boards Manager
Click Tools → Board → Boards Manager.

![](/assets/images/platform/turtlebot3/preparation/ide2.png)

Type OpenCR into the textbox to find the OpenCR by ROBOTIS package. After it finds out, click Install.

![](/assets/images/platform/turtlebot3/preparation/ide3.png)

After the installation, “INSTALLED” will be appeared.

![](/assets/images/platform/turtlebot3/preparation/ide4.png)

See if OpenCR Board is now on the list of Tools → Board. Click this to import the OpenCR Board source.

![](/assets/images/platform/turtlebot3/preparation/ide5.png)

#### Port setting
This step shows the port setting for the program uploads. The OpenCR should be connected to the PC and the OpenCR via the USB ports.

Select Tools → Port → /dev/ttyACM0.

`Warning` The last digit value `0` in the string `/dev/ttyACM0` might be different depend on the USB connection environment.
{: .notice--warning}

![](/assets/images/platform/turtlebot3/preparation/ide6.png)

### [Remove Modemmanager](#remove-modemmanager)

After programming with the Arduino IDE and uploading the program to the OpenCR, the OpenCR will be restarted and be reconnected. At the same moment, the modem-related packages of the Linux will send the AT command to manage the device. Thus indicates an connection error on the OpenCR, so this step should be done previously.

```bash
$ sudo apt-get purge modemmanager
```

### [Writing Bootloader(Linux)](#writing-bootloaderlinux)

`Caution` Update only if the boot loader version has been changed.
{: .notice--warning}

The STM32F7xx, which is used for the main MCU on the OpenCR board, supports DFU(Device Firmware Upgrade). This enables the built-in bootloader of the MCU by itself to boot the DFU protocol by using USB, primarily for the bootloader initialization, the recovery mode, and the bootloader update. The biggest advantage to let the users be able to use bootloader with USB but no other JTAG equipment. Write the firmware by using the DFU mode which is embedded in MCU without writing / debugging equipment, such as STLink.

#### Programmer Setting
Select Tools → DFU-UTIL

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

#### Run DFU mode.
Press the `Reset Button` while the `Boot Button` is being pushed. This activates the DFU mode.  
If you successfully entered to DFU mode, you will be able to find `STMicroelectronics STM Device in DFU Mode` text string when *lsusb* is entered in the terminal.

![](/assets/images/platform/turtlebot3/preparation/ide10.png)

#### Download the bootloader.

Click Tools → Burn Bootloader to download the bootloader.

![](/assets/images/platform/turtlebot3/preparation/ide9.png)

## [Install on Mac](#install-on-mac)

### [Install Arduino IDE(Mac)](#install-arduino-idemac)

Download the latest version of Arduino IDE from the official arduino homepage, and install it. Currently, the OpenCR will be on service in the version 1.6.4 or later.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

### [Run Arduino IDE(Mac)](#run-arduino-idemac)

To run the Arduino IDE on Mac platform, click the Arduino IDE icon as follows.

![](/assets/images/parts/controller/opencr10/arduino_mac_01.png)

![](/assets/images/parts/controller/opencr10/arduino_mac_02.png)

### [Porting to Arduino IDE(Mac)](#porting-to-arduino-idemac)

#### Preferences
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

![](/assets/images/parts/controller/opencr10/arduino_mac_03.png)

#### Install the OpenCR package via Boards Manager
Click Tools → Board → Boards Manager.

![](/assets/images/parts/controller/opencr10/arduino_mac_04.png)

Type OpenCR into the textbox to find the OpenCR by ROBOTIS package. Install of the OpenCR package.  
After the installation, “INSTALLED” will be appeared.

See if OpenCR Board is now on the list of Tools → Board. Click this to import the OpenCR Board source.

![](/assets/images/parts/controller/opencr10/arduino_mac_05.png)

#### Port setting
This step shows the port setting for the program uploads. The OpenCR should be connected to the PC and the OpenCR via the USB ports.  
Select Tools → Port → /dev/cu.usbmodem1411

`Caution` The value of `/dev/cu.usbmodem1411` may be different depending on the environment connected to the PC.
{: .notice--warning}

![](/assets/images/parts/controller/opencr10/arduino_mac_06.png)

### [Writing Bootloader(Mac)](#writing-bootloadermac)
The STM32F7xx, which is used for the main MCU on the OpenCR board, supports DFU(Device Firmware Upgrade). This enables the built-in bootloader of the MCU by itself to boot the DFU protocol by using USB, primarily for the bootloader initialization, the recovery mode, and the bootloader update. The biggest advantage to let the users be able to use bootloader with USB but no other JTAG equipment. Write the firmware by using the DFU mode which is embedded in MCU without writing / debugging equipment, such as STLink.

#### Programmer Setting

Select Tools → DFU-UTIL

![](/assets/images/parts/controller/opencr10/arduino_mac_07.png)

#### Run DFU Mode
Press the `Reset Button` while the `Boot Button` is being pushed. This activates the DFU mode.

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

#### Download bootloader

Click Tools → Burn Bootloader to download the bootloader.

![](/assets/images/parts/controller/opencr10/arduino_mac_08.png)

## [Install on Windows](#install-on-windows)

### [Install Driver](#install-driver)
To use OpenCR's USB port as a serial port in Windows, you need a USB CDC driver. You can install the USB driver provided by ST.

[http://www.st.com/en/development-tools/stsw-stm32102.html](http://www.st.com/en/development-tools/stsw-stm32102.html)

### [Install Arduino IDE(Windows)](#install-arduino-idewindows)

Download the latest version of Arduino IDE from the official arduino homepage, and install it. Currently, the OpenCR will be on service in the version 1.16.0 or later.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

The Arduino IDE for Windows is available as an installation version and a compressed version, so you can install it using your preferred method.

### [Porting to Arduino IDE(Windows)](#porting-to-arduino-idewindows)

#### Preferences
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

#### Install the OpenCR package via Boards Manager
1. Click Tools → Board → Boards Manager.
2. Type OpenCR into the textbox to find the OpenCR by ROBOTIS package. After it finds out, click Install.
3. After the installation, “INSTALLED” will be appeared.
4. See if OpenCR Board is now on the list of Tools → Board. Click this to import the OpenCR Board source.

#### Port setting
This step shows the port setting for the program uploads. The OpenCR should be connected to the PC and the OpenCR via the USB ports.  
Select Tools → Port → COM1.

`Caution` The value of `COM1` may be different depending on the environment connected to the PC.
{: .notice--warning}

## [Arduino Pinmap](#arduino-pinmap)
OpenCR includes a connector that is compatible with Arduino Uno pinmap.

### OpenCR Arduino compatible connector

The pins 0 to 21 are the same pin as the Arduino Uno, and thereafter they are mapped to the pins added to OpenCR.

![](/assets/images/parts/controller/opencr10/arduino_pinmap_01.png)

| Pin No. | Function |     1     |     2     |   3    |
|:-------:|:--------:|:---------:|:---------:|:------:|
|    0    | UART RXD | UART6_RX  |           |        |
|    1    | UART TXD | UART6 TX  |           |        |
|    2    |          |           |           | EXTI_0 |
|    3    |   PWM    | TIM3_CH1  |           | EXTI_1 |
|    4    |          |           |           | EXTI_2 |
|    5    |   PWM    | TIM1_CH1  |           |        |
|    6    |   PWM    | TIM2_CH3  |           |        |
|    7    |          |           |           | EXTI_3 |
|    8    |          |           |           | EXTI_4 |
|    9    |   PWM    | TIM9_CH2  |           |        |
|   10    | PWM/NSS  | TIM11_CH1 | SPI2_NSS  |        |
|   11    | PWM/MOSI | TIM12_CH2 | SPI2_MOSI |        |
|   12    |   MISO   |           | SPI2_MISO |        |
|   13    |   SCK    |           | SPI2_SCK  |        |
|   14    |   SDA    |           | I2C1_SDA  |        |
|   15    |   SCL    |           | I2C1_SCL  |        |
|   16    |   ADC    |    A0     |           |        |
|   17    |   ADC    |    A1     |           |        |
|   18    |   ADC    |    A2     |           |        |
|   19    |   ADC    |    A3     |           |        |
|   20    |   ADC    |    A4     |           |        |
|   21    |   ADC    |    A5     |           |        |

## USER LED
The OpenCR additional LEDs consist of four LEDs and are mapped to Arupinopin 22-25.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/arduino_pinmap_03.png?raw=true)


| Name    | Arduino Pin | Pin Name         |
|:--------|:------------|:-----------------|
| USER1   | 22          | BDPIN_LED_USER_1 |
| USER2   | 23          | BDPIN_LED_USER_2 |
| USER3   | 24          | BDPIN_LED_USER_3 |
| USER4   | 25          | BDPIN_LED_USER_4 |
| STS     | 36          | BDPIN_LED_STATUS |
| Arduino | 13          | LED_BUILTIN      |


## Dip Switch

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/arduino_pinmap_04.png?raw=true)

| Arduino Pin | Pin Name       |
|:------------|:---------------|
| 26          | BDPIN_DIP_SW_1 |
| 27          | BDPIN_DIP_SW_2 |


## GPIO
It has an 18-pin common GPIO expansion connector and is mapped to the GPIO pin of the Arduino. The pin number below is the arduino pin number.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/arduino_pinmap_05.png?raw=true)


| Pin Number | Arduino Pin | Pin Name      | Pin Number | Arduino Pin | Pin Name     |
|:-----------|:------------|:--------------|:-----------|:------------|:-------------|
| 1          | -           | 3.3V          | 2          | -           | GND          |
| 3          | 50          | BDPIN_GPIO_1  | 4          | 51          | BDPIN_GPIO_1 |
| 5          | 52          | BDPIN_GPIO_3  | 6          | 53          | BDPIN_GPIO_1 |
| 7          | 54          | BDPIN_GPIO_5  | 8          | 55          | BDPIN_GPIO_1 |
| 9          | 56          | BDPIN_GPIO_7  | 10         | 57          | BDPIN_GPIO_1 |
| 11         | 58          | BDPIN_GPIO_9  | 12         | 59          | BDPIN_GPIO_1 |
| 13         | 60          | BDPIN_GPIO_11 | 14         | 61          | BDPIN_GPIO_1 |
| 15         | 62          | BDPIN_GPIO_13 | 16         | 63          | BDPIN_GPIO_1 |
| 17         | 64          | BDPIN_GPIO_15 | 18         | 65          | BDPIN_GPIO_1 |
| 19         | 66          | BDPIN_GPIO_17 | 20         | 67          | BDPIN_GPIO_1 |


## OLLO connector

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/arduino_pinmap_06.png?raw=true)


## Push Switch

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/OpenCR/arduino_pinmap_08.png?raw=true)

| Arduino Pin | Pin Name        |
|:------------|:----------------|
| 34          | BDPIN_PUSH_SW_1 |
| 35          | BDPIN_PUSH_SW_2 |



## Pin Definition 

```c++
extern const Pin2PortMapArray g_Pin2PortMapArray[]=
{
    {GPIOC, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 0  UART6_RX
    {GPIOC, GPIO_PIN_6,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 1  UART6_TX
    {GPIOG, GPIO_PIN_6,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , 0       },  // 2                         EXTI_0
    {GPIOB, GPIO_PIN_4,   NULL,     NO_ADC        , &hTIM3 ,   TIM_CHANNEL_1, 1       },  // 3  TIM3_CH1               EXTI_1
    {GPIOG, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , 2       },  // 4                         EXTI_2
    {GPIOA, GPIO_PIN_8,   NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_1, NO_EXTI },  // 5  TIM1_CH1
    {GPIOA, GPIO_PIN_2,   NULL,     NO_ADC        , &hTIM2 ,   TIM_CHANNEL_3, NO_EXTI },  // 6  TIM2_CH3
    {GPIOC, GPIO_PIN_1,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , 3       },  // 7                         EXTI_3
    {GPIOC, GPIO_PIN_2,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , 4       },  // 8                         EXTI_4
    {GPIOA, GPIO_PIN_3,   NULL,     NO_ADC        , &hTIM9 ,   TIM_CHANNEL_2, NO_EXTI },  // 9  TIM9_CH2
    {GPIOB, GPIO_PIN_9,   NULL,     NO_ADC        , &hTIM11,   TIM_CHANNEL_1, NO_EXTI },  // 10 TIM11_CH1   SPI2_NSS
    {GPIOB, GPIO_PIN_15,  NULL,     NO_ADC        , &hTIM12,   TIM_CHANNEL_2, NO_EXTI },  // 11 TIM12_CH2   SPI2_MOSI
    {GPIOB, GPIO_PIN_14,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 12             SPI2_MISO
    {GPIOA, GPIO_PIN_9,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 13 LED         SPI2_SCK
    {GPIOB, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 14             I2C1_SDA
    {GPIOB, GPIO_PIN_8,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 15             I2C1_SCL

    {GPIOA, GPIO_PIN_0,   &hADC3,   ADC_CHANNEL_0 , NULL   ,   NO_PWM       , NO_EXTI },  // 16 A0
    {GPIOF, GPIO_PIN_10,  &hADC3,   ADC_CHANNEL_8 , NULL   ,   NO_PWM       , NO_EXTI },  // 17 A1
    {GPIOF, GPIO_PIN_9,   &hADC3,   ADC_CHANNEL_7 , NULL   ,   NO_PWM       , NO_EXTI },  // 18 A2
    {GPIOF, GPIO_PIN_8,   &hADC3,   ADC_CHANNEL_6 , NULL   ,   NO_PWM       , NO_EXTI },  // 19 A3
    {GPIOF, GPIO_PIN_7,   &hADC3,   ADC_CHANNEL_5 , NULL   ,   NO_PWM       , NO_EXTI },  // 20 A4
    {GPIOF, GPIO_PIN_6,   &hADC3,   ADC_CHANNEL_4 , NULL   ,   NO_PWM       , NO_EXTI },  // 21 A5

    {GPIOG, GPIO_PIN_12,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 22 BDPIN_LED_USER_1
    {GPIOE, GPIO_PIN_5,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 23 BDPIN_LED_USER_2
    {GPIOE, GPIO_PIN_4,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 24 BDPIN_LED_USER_3
    {GPIOG, GPIO_PIN_10,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 25 BDPIN_LED_USER_4
    {GPIOG, GPIO_PIN_11,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 26 BDPIN_DIP_SW_1
    {GPIOE, GPIO_PIN_6,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 27 BDPIN_DIP_SW_2
    {GPIOA, GPIO_PIN_4,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 28 BDPIN_SPI_CS_IMU
    {GPIOC, GPIO_PIN_0,   &hADC3,   ADC_CHANNEL_10, NULL   ,   NO_PWM       , NO_EXTI },  // 29 BDPIN_BAT_PWR_ADC
    {GPIOC, GPIO_PIN_3,   &hADC3,   ADC_CHANNEL_13, NULL   ,   NO_PWM       , NO_EXTI },  // 30
    {GPIOF, GPIO_PIN_14,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 31 BDPIN_BUZZER
    {GPIOF, GPIO_PIN_15,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 32 BDPIN_DXL_PWR_EN
    {GPIOG, GPIO_PIN_14,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 33
    {GPIOG, GPIO_PIN_3,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 34 BDPIN_PUSH_SW_1
    {GPIOC, GPIO_PIN_12,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 35 BDPIN_PUSH_SW_2
    {GPIOG, GPIO_PIN_9,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 36 BDPIN_LED_STATUS
    {GPIOA, GPIO_PIN_5,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 37 BDPIN_SPI_CLK_IMU
    {GPIOA, GPIO_PIN_6,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 38 BDPIN_SPI_SDO_IMU
    {GPIOB, GPIO_PIN_5,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 39 BDPIN_SPI_SDI_IMU

    {GPIOB, GPIO_PIN_0,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 40 OLLO_P1_SIG1
    {GPIOC, GPIO_PIN_8,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 41 OLLO_P1_SIG2
    {GPIOA, GPIO_PIN_7,   &hADC1,   ADC_CHANNEL_7 , NULL   ,   NO_PWM       , 5       },  // 42 OLLO_P1_ADC           EXTI_5
    {GPIOC, GPIO_PIN_5,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 43 OLLO_P2_SIG1
    {GPIOB, GPIO_PIN_1,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 44 OLLO_P2_SIG2
    {GPIOC, GPIO_PIN_4,   &hADC1,   ADC_CHANNEL_14, NULL   ,   NO_PWM       , 6       },  // 45 OLLO_P2_ADC           EXTI_6
    {GPIOD, GPIO_PIN_10,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 46 OLLO_SLEEP
    {GPIOF, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 47
    {GPIOF, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 48
    {GPIOF, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 49

    {GPIOB, GPIO_PIN_10,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 50 BDPIN_GPIO_1
    {GPIOB, GPIO_PIN_11,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 51 BDPIN_GPIO_2
    {GPIOC, GPIO_PIN_13,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 52 BDPIN_GPIO_3
    {GPIOD, GPIO_PIN_2,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 53 BDPIN_GPIO_4
    {GPIOE, GPIO_PIN_3,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 54 BDPIN_GPIO_5
    {GPIOG, GPIO_PIN_2,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 55 BDPIN_GPIO_6
    {GPIOE, GPIO_PIN_10,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 56 BDPIN_GPIO_7
    {GPIOE, GPIO_PIN_11,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 57 BDPIN_GPIO_8
    {GPIOE, GPIO_PIN_12,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 58 BDPIN_GPIO_9
    {GPIOE, GPIO_PIN_13,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 59 BDPIN_GPIO_10
    {GPIOE, GPIO_PIN_14,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 60 BDPIN_GPIO_11
    {GPIOE, GPIO_PIN_15,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 61 BDPIN_GPIO_12
    {GPIOF, GPIO_PIN_0,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 62 BDPIN_GPIO_13
    {GPIOF, GPIO_PIN_1,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 63 BDPIN_GPIO_14
    {GPIOF, GPIO_PIN_2,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 64 BDPIN_GPIO_15
    {GPIOD, GPIO_PIN_8,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 65 BDPIN_GPIO_16
    {GPIOF, GPIO_PIN_4,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 66 BDPIN_GPIO_17
    {GPIOD, GPIO_PIN_9,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 67 BDPIN_GPIO_18
    {GPIOF, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 68
    {GPIOF, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 69

    {GPIOF, GPIO_PIN_12,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 70 OLLO_P3_SIG1
    {GPIOF, GPIO_PIN_11,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 71 OLLO_P3_SIG2
    {GPIOF, GPIO_PIN_5,   &hADC3,   ADC_CHANNEL_15, NULL   ,   NO_PWM       , 7       },  // 72 OLLO_P3_ADC           EXTI_7
    {GPIOE, GPIO_PIN_9,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 73 OLLO_P4_SIG1
    {GPIOE, GPIO_PIN_8,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 74 OLLO_P4_SIG2
    {GPIOF, GPIO_PIN_3,   &hADC3,   ADC_CHANNEL_9 , NULL   ,   NO_PWM       , 8       },  // 75 OLLO_P4_ADC           EXTI_8
    {GPIOF, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 76
    {GPIOF, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 77
    {GPIOF, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 78
    {GPIOF, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 79

    {GPIOD, GPIO_PIN_6,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 80 BDPIN_UART1_RX
    {GPIOD, GPIO_PIN_5,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 81 BDPIN_UART1_TX
    {GPIOE, GPIO_PIN_0,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 82 BDPIN_UART2_RX
    {GPIOE, GPIO_PIN_1,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 83 BDPIN_UART2_TX



    {NULL , 0          ,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI }
};

```



[RoboPlus Task]: /docs/en/software/rplus1/task/getting_started/
[RoboPlus Motion]: /docs/en/software/rplus1/motion/
[RoboPlus Manager]: /docs/en/software/rplus1/manager/
[Number of pressed Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[LN-101]: /docs/en/parts/interface/ln-101/
[ZIG-100]: /docs/en/parts/communication/zig-110/
[BT-110]: /docs/en/parts/communication/bt-110/
[BT-210]: /docs/en/parts/communication/bt-210/
[Automatic Turn-off]: /docs/en/software/rplus1/task/programming_02/#powersave-timer
[Firmware Update]: /docs/en/software/rplus1/manager/#firmware-update
[Top Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-top.pdf
[Bottom Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-bottom.pdf
[Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-gerber.pdf
[DARWIN-MINI Controller Firmware Update]: /docs/en/edu/mini/#firmware-update
[Arduino IDE]: https://github.com/ROBOTIS-GIT/OpenCM9.04/wiki
[OpenCM IDE]: http://emanual.robotis.com/docs/en/software/opencm_ide/getting_started/
[Dynamixel SDK]: https://github.com/ROBOTIS-GIT/DynamixelSDK/wiki
[DynamixelWorkbench]: http://wiki.ros.org/dynamixel_workbench

[B3B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[B4B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[20010WS-04]: http://www.alldatasheet.com/datasheet-pdf/pdf/147797/YEONHO/20010WS-04000.html
[20010WS-04]: http://www.alldatasheet.com/datasheet-pdf/pdf/147797/YEONHO/20010WS-04000.html
[SMW250-02]: http://www.alldatasheet.com/datasheet-pdf/pdf/148144/YEONHO/SMW250-02P.html
[5267-02A]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0022035025_PCB_HEADERS.xml&channel=Products&Lang=en-US
[20010WS-02]: http://www.alldatasheet.com/datasheet-pdf/pdf/147795/YEONHO/20010WS-02000.html
[Molex 53047-0210]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0530470210_PCB_HEADERS.xml
