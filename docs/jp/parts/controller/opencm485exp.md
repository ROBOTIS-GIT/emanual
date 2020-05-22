---
layout: archive
lang: jp
ref: opencm485exp
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/opencm485exp/
sidebar:
  title: OpenCM 485 EXP
  nav: "opencm485exp"
---

![](/assets/images/parts/controller/opencm904/opencm485exp_product.jpg)

> OpenCM 485 Expansion Board

# [イントロダクション](#introduction)

# [仕様表](#specifications)

| 項目　           | 説明　                   |
| :-------------: | :---------------------: |
| 入力電圧　　      | 5 ~ 30V                 |
| 電源　           | SMPS, LiPo, DXL PRO 24V |
| 電源スイッチ      | 1                       |
| DYNAMIXEL ポート | 4ピン x 5, 3ピン x 5　　  |
| ボタン           | 2                       |
| LED             | 5                       |
| サイズ           | 68 mm X 66.5 mm         |
| 重量　           | 32g                     |
| シリアル3 TX　　  | ヘッダーピン #24          |
| シリアル3 RX　　  | ヘッダーピン #25          |
| 方向制御　　      | ヘッダーピン #22          |

# [レイアウト](#layout)

![](/assets/images/parts/controller/opencm904/opencm485exp_01.jpg)

1. **SMPS DC コネクタ** : SMPS DCアダプタを使用しOpenCM 485 EXP ボードに電源を供給します。
2. **DXL Pro 電源コネクタ** : DYNAMIXEL Pro (24V) の電源コネクタです。
3. **Li-Po バッテリコネクタ** : 11.1V Li-Po battery(LBS-10) の 電源コネクタです。
4. **DYNAMIXEL TTL 3-ピン バス** : 3ピンケーブル(DYNAMIXEL TTL バス)の接続及び、DYNAMIXELのデイジーチェーン接続に使用します。
5. **ユーザーボタン** : これらのボタンは、ユーザーが割り当てる事ができます。
6. **ユーザー LED** : ユーザーが制御できるLEDです。
7. **I/O ヘッダ** : OpenCM9.04(2.54mm pitch)をマウントするピンヘッダです。
8. **DYNAMIXEL 485 4-ピン バス** : 4ピンケーブル(DYNAMIXEL TTL バス)の接続及び、DYNAMIXELのデイジーチェーン接続に使用します。
9. **電源スイッチ** : ボードとDYNAMIXELに電源を供給するスイッチです。  注釈: このスイッチでは、USBケーブル経由の電源を切断しません。
10. **JP1 ジャンパ** : OpenCM485EXPに入力された電力をOpenCM9.04ボードに供給するかを決定するジャンバです。。

{% include jp/dxl/pinout_warning.md %}

# [OpenCM9.04の接続](#connecting-opencm904)

1. OpenCM 485 EXPおよびOpenCM9.04ボードを準備します。 OpenCM9.04のどのバージョンでも互換性があります。 ヘッダピンをOpenCM9.04にはんだ付けします。

    ![](/assets/images/parts/controller/opencm904/opencm485exp_02.jpg)

2. OpenCM9.04を下図に示すようにOpenCM 485 EXPにマウントします。

    **注意** : 正しい方向で接続する必要があります。
    {: .notice--warning}

    ![](/assets/images/parts/controller/opencm904/opencm485exp_03.jpg)

3. USBケーブルをOpenCM9.04ボードに接続します。

    ![](/assets/images/parts/controller/opencm904/opencm485exp_04.jpg)

4. DYNAMIXELと12V SMPSアダプタをOpenCM 485 EXPボードに接続します。

    ![](/assets/images/parts/controller/opencm904/opencm485exp_05.jpg)


# [Power Circuit Connection](#power-circuit-connection)

A power circuit block diagram of the OpenCM 485 EXP and OpenCM9.04, once mounted, is shown below.  
OpenCM 485 EXP supplies 5V from OpenCM9.04 as default. JP1 can be used to determine if VDD power from OpeCM 485 EXP board is supplied to OpenCM9.04.

![](/assets/images/parts/controller/opencm904/opencm485exp_06.png)

> OpenCM 485 EXP Power Connection

OpenCM 485 EXP’s DYNAMIXEL 485 bus operates as DYNAMIXEL bus using OpenCM9.04’s USART3(Serial3).

**NOTE** : OpenCM9.04’s DYNAMIXEL TTL BUS is connected to USART1(Serial1).
{: .notice}

![](/assets/images/parts/controller/opencm904/opencm485exp_07.gif)

> OpenCM9.04 & OpenCM 485 EXP Bus Connections

# [EXP Board Programming](#exp-board-programming)


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

# [Button & LED](#button-led)

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


# [Downloads](#downloads)

- `Download PDF` [PCB Schematic](http://support.robotis.com/en/baggage_files/opencm/schematic1___opencm_485exp.pdf)


[RoboPlus Task]: /docs/en/software/rplus1/task/getting_started/
[Number of pressed Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[LN-101]: /docs/en/parts/interface/ln-101/
[ZIG-100]: /docs/en/parts/communication/zig-110/
[BT-110]: /docs/en/parts/communication/bt-110/
[BT-210]: /docs/en/parts/communication/bt-210/
[Automatic Turn-off]: /docs/en/software/rplus1/task/programming_02/#powersave-timer
[Top Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-top.pdf
[Bottom Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-bottom.pdf
[Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-gerber.pdf
[DARWIN-MINI Controller Firmware Update]: /docs/en/edu/mini/#firmware-update
[Install Arduino IDE]: /docs/en/software/arduino_ide/
