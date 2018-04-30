---
layout: archive
lang: en
ref: arduino_dynamixel_shield
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/arduino_dynamixel_shield/
sidebar:
  title: Dynamixel Shield
  nav: "arduino_dynamixel_shield"
---

# [Introduction](#introduction)
![](/assets/images/parts/controller/arduino_dynamixel_shield/with_arduino.png)

Dynamixel Shield  was created to use RC100 and Dynamixel on arduino board. We provide dynamixel library for Dynamixel Shield, it can help you to use Dynamixel easily.

**This product does not contain Arduino Uno. Also we do not sell Aruino Uno.**.

# [Specifications](#specifications)

|Item|Details|
|:---:|:---:|
|Operating Voltage|7.4V (XL-320), 12V (X Series)|
|Maximum Current|1A(Arduino), 10A(Terminal Connector)|

# [Layout](#layout)

![](/assets/images/parts/controller/arduino_dynamixel_shield/pinmap.png)

|Pin No.|Pin Name|Description|
|:---:|:---:|:---:|
|0|HW UART RX|DXL_RX|
|1|HW UART TX|DXL_TX|
|7|SW UART RX|`Caution2` SoftwareSerial|
|8|SW UART TX|`Caution2` SoftwareSerial|

|Item|Description|Note|
|:---:|:---:|:---:|
|Dynamixel Port|TTL, TTL(XL-320), RS485|`Caution3`|
|Power Switch|Power SW (Dynamixel Port Power Switch)|-|
|UART Switch|UART SW (Upload or Dynamixel Select Switch)|`Caution1`|
|Jumper Cap|Power Source Selection|Read 'Connecting Power'|

-	Arduino pin #0/ #1 : Hardware serial port to control dynamixel
- Arduino pin #2 : Control pin to select dynamixel direction
- The hardware serial port is used for Dynamixel control, therefore, the serial communication has to be performed by connecting RC100 or LN101 to the software serial port which is assigned to Arduino pin 7 and 8.


{% capture shield_01 %}
`Caution1` When uploading firmware using USB port, you should switch the UART SW(SW_2) to Upload mode. When you select the UART SW (SW_2) to Dynamixel mode, you can use Dynamixel but USB port.  
`Caution2` If you are using a board that does not support SoftwareSerial(like SAMD, etc..), you cannot use pins 7 and 8 for UART purposes.  
`Caution3` TTL, TTL (XL-320) and RS485 connectors are all connected in parallel in one serial.
{% endcapture %}

<div class="notice--warning">{{ shield_01 | markdownify }}</div>

# [Connecting Power](#connecting-power)
x
|Connect VIN|Disconnect VIN|
|:---:|:---:|
|![](/assets/images/parts/controller/arduino_dynamixel_shield/power_01.png)|![](/assets/images/parts/controller/arduino_dynamixel_shield/power_02.png)|

- The power input is divided as follows depending on whether the jumper cap is connected or not.
  1. Connect VIN : Power supply using with Arduino's SMPS connector
  2. Disconnect VIN : Power supply using Dynamixel shield's power input connector. Can not use power from arduino.

- Since the Dynamixel power can not be connected to the USB power of the Arduino board, you need to connect the external power.
-	When using the power input connector, **be sure to check the polarity of the power supply**.

  ![](/assets/images/parts/controller/arduino_dynamixel_shield/power_polarity.png)


# [Switches](#switches)

![](/assets/images/parts/controller/arduino_dynamixel_shield/switches.png)

## [Upload Switch](#upload-switch)

-	For Dynamixel control, the hardware serial port of the arduino board is used. Because the downloading is done to the same port, the two ports may collide. Therefore, to download, use serial port switch to move to upload position and download.
- After the download is completed, the switch must be moved to the Dynamixel position for Dynamixel control. If it is not moved, the Dynamixel will not work.

## [Dynamixel Power Switch](#dynamixel-power-switch)

-	It is a switch that can turn on / off the power of Dynamixel connector.


# [Arduino Shield Libraries](#arduino-shield-libraries)

## [Features](#features)

-	Support dynamixel protocol 1.0/2.0
- Up to 16 Dynamixels can be controlled

(Typically, each motor(XL-320 or XL430-W250) consumes 0.4 ~ 0.6A of current. )

- Support SynWrite function
- Support RC100 library
- Serial communication using software serial library.

## [Install Library](#install-library)

There are three ways to add libraries to the Arduino IDE.

- Using the Library Manager
- Importing a .zip Library
- Manual installation

Each way is described in detail in the [Arduino Official Guide], so please refer to it if necessary.  
Below is an example of using the Library Manager.

![](/assets/images/parts/controller/arduino_dynamixel_shield/library_manager.png)

If you have successfully installed the library, you'll be able to find several examples of DynamixelShield in the examples.

![](/assets/images/parts/controller/arduino_dynamixel_shield/examples.png)


# [Library API](#library-api)

## [Initialize Library](#initialize-library)

Before using library, you should initialize the communication speed of com port and protocol version with begin function.

```c
dxl.begin(1000000, DXL_PACKET_VER_2_0);
```

> Baud rate : 1Mbps, Protocol : Dynamixel protocol 2.0


## [Connect Dynamixel](#connect-dynamixel)

The shield library is based on the Dynamixel model and automatically refers to the address value, so you need to add the ID and model of the connected Dynamixel to know what the connected Dynamixel is.

-	Automatic Setup
  ```c
  dxl.ping();
  ```

  > Using **ping** function, automatically search from 1 to 31 and add connected Dynamixel.

-	Manual Setup
  ```c
  dxl.begin(1000000);
  delay(1000);
  dxl.addMotor(1, M_XL430);
  dxl.addMotor(2, M_XL430);
  dxl.addMotor(15, M_AX12);
  ```

  > Add Dynamixel using **addMotor** function.


## [Available APIs](#available-apis)

```c
bool begin(uint32_t baud_rate = 57600, uint8_t protocol_version = DXL_PACKET_VER_2_0);

bool scan(void);
bool ping(uint8_t id = DXL_GLOBAL_ID);
bool addMotor(uint8_t id, uint8_t model);
bool setProtocolVersion(uint8_t version);
bool write(uint8_t id, uint16_t addr, uint8_t *p_data, uint16_t length, uint32_t timeout);
bool read(uint8_t id, uint16_t addr, uint8_t *p_data, uint16_t length, uint32_t timeout);

uint8_t getDxlCount(void);
uint8_t getDxlID(uint8_t index);
uint32_t getErr(void);
void clearErr(void);

bool reboot(uint8_t id);
bool reset(uint8_t id);

bool setID(uint8_t id, uint8_t new_id);
bool setBaud(uint8_t id, uint32_t new_baud);

bool ledOn(uint8_t id);
bool ledOff(uint8_t id);

bool torqueOn(uint8_t id);
bool torqueOff(uint8_t id);

bool setJointMode(uint8_t id);
bool setWheelMode(uint8_t id);

bool    setGoalPosition(uint8_t id, uint32_t position);
int32_t getGoalPosition(uint8_t id);
int32_t getCurPosition(uint8_t id);

bool    setGoalSpeed(uint8_t id, int32_t speed);
int32_t getGoalSpeed(uint8_t id);   
int32_t getCurSpeed(uint8_t id);  

bool    setGoalAngle(uint8_t id, int32_t angle);
int32_t getGoalAngle(uint8_t id);
int32_t getCurAngle(uint8_t id);

bool syncWriteBegin(void);
bool syncWriteEnd(void);
```


[Arduino Official Guide]: https://www.arduino.cc/en/Guide/Libraries
