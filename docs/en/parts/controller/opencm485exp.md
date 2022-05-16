---
layout: archive
lang: en
ref: opencm485exp
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/opencm485exp/
sidebar:
  title: OpenCM 485 EXP
  nav: "opencm485exp"
---

**NOTE**: [The OpenCM 485 EXP e-Manual](/docs/en/parts/controller/opencm485exp_jp/) in Japanese (日本語) is available for the Japanese. 
{: .notice}

![](/assets/images/parts/controller/opencm904/opencm485exp_product.jpg)

> OpenCM 485 Expansion Board

# [Introduction](#introduction)

# [Specifications](#specifications)

|       Item        |       Description       |
|:-----------------:|:-----------------------:|
|   Input voltage   |         5 ~ 30V         |
|       Power       | SMPS, LiPo, DXL PRO 24V |
|   Power Switch    |            1            |
|  DYNAMIXEL Port   |   4Pin x 5, 3Pin x 5    |
|      Button       |            2            |
|        LED        |            5            |
|       Size        |     68 mm X 66.5 mm     |
|      Weight       |           32g           |
|    Serial3 TX     |     Header Pin #24      |
|    Serial3 RX     |     Header Pin #25      |
| Direction Control |     Header Pin #22      |

# [Layout](#layout)

![](/assets/images/parts/controller/opencm904/opencm485exp_01.jpg)

1. **SMPS DC Connector (2.5mm ID / 5.5mm OD, [Center Positive](https://en.wikipedia.org/wiki/Polarity_symbols))** : For using SMPS DC Adapter to supply power to OpenCM 485 EXP board.
2. **DXL Pro Power Connector** : Power connector for DYNAMIXEL Pro (24V).
3. **Li-Po battery Connector** : Connector for 11.1V Li-Po battery(LBS-10).
4. **DYNAMIXEL TTL 3 -Pin Bus** : Used to connect 3-Pin Cables(DYNAMIXEL TTL Bus) and for daisy chaining DYNAMIXEL's.
5. **User Button** : Function of these buttons can be assigned by the user.
6. **User LED** : LED that can be controlled by the user.
7. **I/O header** : Header pins used to mount OpenCM9.04(2.54mm pitch).
8. **DYNAMIXEL 485 4-Pin Bus** : Used to connect 4-Pin Cables(DYNAMIXEL TTL Bus) and for daisy chaining DYNAMIXEL's.
9. **Power Switch** : Switch that powers the board and DYNAMIXEL. Note: Does not disconnect the power received via USB cable.
10. **JP1 Jumper** : Jumper that determines whether the power inputted onto OpenCM 485 EXP will be supplied to OpenCM9.04 board or not.

- **See [Connector Information](#connector-information)**. 

{% include en/dxl/pinout_warning.md %}

# [Using with OpenCM9.04](#using-with-opencm904)

## [Connecting OpenCM9.04 to the expanstion board](#connecting-opencm904-to-the-expanstion-board)

1. Prepare OpenCM 485 EXP and OpenCM9.04 boards. Any version of OpenCM9.04 is compatible. Solder the header onto the OpenCM9.04.

    ![](/assets/images/parts/controller/opencm904/opencm485exp_02.jpg)

2. OpenCM9.04 is mounted onto OpenCM 485 EXP as shown below.

    **CAUTION** : Be sure to check the direction of the OpenCM9.04 when inserting it into the OpenCM 485 EXP board. 
    {: .notice--warning}

    ![](/assets/images/parts/controller/opencm904/opencm485exp_03.jpg)

3. Connect the USB cable onto OpenCM9.04 board.

    ![](/assets/images/parts/controller/opencm904/opencm485exp_04.jpg)

4. Connect DYNAMIXEL and 12V SMPS adapter onto OpenCM 485 EXP board.

    ![](/assets/images/parts/controller/opencm904/opencm485exp_05.jpg)

{% capture dxl_jst_molex %}
**NOTE**: 
- DYNAMIXEL-X and P series use JST connector that is not compatible with a connector installed on the OpenCM 485 EXP board. To use DYNAMIXEL X and P series with the expansion board, use [JST-Molex convertable cable](http://en.robotis.com/shop_en/list.php?ca_id=302090&sort=&sortodr=&page=2). 
- Be sure to disconnect OpenCM9.04 with OpenCM 485 EXP board before a firmware recovery for DYNAMIXEL.
{% endcapture %}
<div class="notice">{{ dxl_jst_molex | markdownify }}</div>

<!-- 

## [Using DYNAMIXEL-X](#using-dynamixel-x)

To use ROBOTIS [software](/docs/kr/software/#roboplus-r) with DYNAMIXEL-X series on OpenCM 9.04 or OpenCM485 EXP board with OpenCM9.04, [Configuring DYNAMIXEL Channle](#configuring-dynamixel-channel) is required.

### [Configuring DYNAMIXEL Channel](#configuring-dynamixel-channel)

 -->

{% include en/parts/controller/opencm904_dxl_channel.md %}

# [Reference](#reference)

## [Connector Information](#connector-information)

{% include en/dxl/molex_485_ttl.md %}

## [Power Circuit Connection](#power-circuit-connection)

A power circuit block diagram of the OpenCM 485 EXP and OpenCM9.04, once mounted, is shown below.  
OpenCM 485 EXP can supply 5V to OpenCM9.04 when connected to a power source. JP1 can be used to determine whether the VDD power from OpeCM 485 EXP board is supplied to OpenCM9.04 DYNAMIXEL ports.

![](/assets/images/parts/controller/opencm904/opencm485exp_06.png)

> OpenCM 485 EXP Power Connection

OpenCM 485 EXP’s DYNAMIXEL 485 bus operates as DYNAMIXEL bus using OpenCM9.04’s USART3(Serial3).

**NOTE** : OpenCM9.04’s DYNAMIXEL TTL BUS is connected to USART1(Serial1).
{: .notice}

![](/assets/images/parts/controller/opencm904/opencm485exp_07.gif)

> OpenCM9.04 & OpenCM 485 EXP Bus Connections

## [EXP Board Programming](#exp-board-programming)

In order to use OpenCM 485 EXP board with OpenCM9.04, please use Arduino IDE.

1. [Install Arduino IDE]{: .blank}

2. OpenCM 485 EXP’s 485 Bus sends and receives communication packets via OpenCM9.04’s Serial3(USART3).  

    - In case of programming with DYNAMIXEL SDK, please set Serial3 port as shown below.

    ```cpp
    #include <DYNAMIXEL SDK.h>

    #define DEVICENAME      "3"   //Use Serial3 port

    dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler(DEVICENAME);
    portHandler->openPort();
    ```

    - In case of programming with DYNAMIXELWorkbench, please set Serial3 port as shown below.

    ```cpp
    #include <DYNAMIXELWorkbench.h>

    #define DEVICENAME      "3"   //Use Serial3 port
    #define BAUDRATE        57600

    DYNAMIXELWorkbench dxl_wb;
    dxl_wb.begin(DEVICE_NAME, BAUDRATE);
    ```

## [Button and LED](#button-and-led)

OpenCM 485 EXP board has 2 buttons and 3 LED’s that are connected to OpenCM9.04 I/O pins.  
The OpenCM9.04 I/O pin numbers for the buttons and LED’s are indicated below.

|         | OpenCM9.04 I/O |
|:-------:|:--------------:|
| Button1 |       16       |
| Button2 |       17       |
|  LED1   |       18       |
|  LED2   |       19       |
|  LED3   |       20       |

![](/assets/images/parts/controller/opencm904/opencm485exp_11.jpg)

## [Drawings](#drawings)

- `Download PDF` [PCB Schematic](https://robotis.s3.ap-northeast-2.amazonaws.com/support/en/baggage_files/opencm/schematic1___opencm_485exp.pdf)

[RoboPlus Task]: /docs/en/software/rplus1/task/getting_started/
[Number of pressed Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[LN-101]: /docs/en/parts/interface/ln-101/
[ZIG-100]: /docs/en/parts/communication/zig-110/
[BT-110]: /docs/en/parts/communication/bt-110/
[BT-210]: /docs/en/parts/communication/bt-210/
[Automatic Turn-off]: /docs/en/software/rplus1/task/programming_02/#powersave-timer
[Top Gerber]: https://robotis.s3.ap-northeast-2.amazonaws.com/support/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-top.pdf
[Bottom Gerber]: https://robotis.s3.ap-northeast-2.amazonaws.com/support/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-bottom.pdf
[Gerber]: https://robotis.s3.ap-northeast-2.amazonaws.com/support/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-gerber.pdf
[DARWIN-MINI Controller Firmware Update]: /docs/en/edu/mini/#firmware-update
[Install Arduino IDE]: /docs/en/software/arduino_ide/
