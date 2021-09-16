---
layout: archive
lang: en
ref: opencm485exp_jp
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/opencm485exp_jp/
sidebar:
  title: OpenCM 485 EXP
  nav: "opencm485exp_jp"
---

![](/assets/images/parts/controller/opencm904/opencm485exp_product.jpg)

> OpenCM 485 Expansion Board

# [イントロダクション](#イントロダクション)

# [仕様表](#仕様表)

|       項目       |          説明           |
|:----------------:|:-----------------------:|
|     入力電圧     |         5 ~ 30V         |
|       電源       | SMPS, LiPo, DXL PRO 24V |
|   電源スイッチ   |            1            |
| DYNAMIXEL ポート |  4ピン x 5, 3ピン x 5   |
|      ボタン      |            2            |
|       LED        |            5            |
|      サイズ      |     68 mm X 66.5 mm     |
|       重量       |           32g           |
|   シリアル3 TX   |    ヘッダーピン #24     |
|   シリアル3 RX   |    ヘッダーピン #25     |
|     方向制御     |    ヘッダーピン #22     |

# [レイアウト](#レイアウト)

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

# [OpenCM9.04の接続](#opencm904の接続)

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


# [電源回路接続](#電源回路接続)

OpenCM 485 EXPとOpenCM9.04の電源回路のブロック図を以下に示します。
OpenCM 485 EXPは、デフォルトでOpenCM9.04から5Vを供給します。 JP1を使用して、OpeCM 485 EXPボードからのVDD電源がOpenCM9.04に供給されているかどうかを判断できます。

![](/assets/images/parts/controller/opencm904/opencm485exp_06.png)

> OpenCM 485 EXP 電源接続

OpenCM 485 EXPのDYNAMIXELバスは、OpenCM9.04のUSART3（シリアル3）を使用してDYNAMIXELバスとして動作します。

**注釈** : OpenCM9.04のDYNAMIXEL TTLバスは、USART1（シリアル1）に接続されています。
{: .notice}

![](/assets/images/parts/controller/opencm904/opencm485exp_07.gif)

> OpenCM9.04 および OpenCM 485 EXP バス接続

# [EXP Board プログラミング](#exp-board-プログラミング)

OpenCM9.04でOpenCM 485 EXPボードを使用するには、Arduino IDEを使用してください。

1. [Arduino IDEのインストール]{: .blank}

2. OpenCM 485 EXPの485バスは、OpenCM9.04のシリアル3（USART3）を介して通信パケットを送受信します。  

    - DYNAMIXEL SDKでプログラミングする場合は、以下のようにシリアルポートを設定してください。

    ```cpp
    #include <DYNAMIXEL SDK.h>

    #define DEVICENAME      "3"   //Use Serial3 port

    dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler(DEVICENAME);
    portHandler->openPort();
    ```
    - DYNAMIXELWorkbenchを使用する場合は、以下のようにシリアル3ポートを設定してください。

    ```cpp
    #include <DYNAMIXELWorkbench.h>

    #define DEVICENAME      "3"   //Use Serial3 port
    #define BAUDRATE        57600

    DYNAMIXELWorkbench dxl_wb;
    dxl_wb.begin(DEVICE_NAME, BAUDRATE);
    ```

# [ボタン そして LED](#ボタン-そして-led)

OpenCM 485 EXPボードには、OpenCM9.04のI/Oピンに接続された2つのボタンと3つのLEDがあります。  
ボタンとLEDのOpenCM9.04のI/Oピン番号を以下に示します。

|         | OpenCM9.04 I/O |
|:-------:|:--------------:|
| ボタン1 |       16       |
| ボタン2 |       17       |
|  LED1   |       18       |
|  LED2   |       19       |
|  LED3   |       20       |

![](/assets/images/parts/controller/opencm904/opencm485exp_11.jpg)

# [ダウンロード](#ダウンロード)

- `ダウンロード PDF` [PCB Schematic](http://support.robotis.com/en/baggage_files/opencm/schematic1___opencm_485exp.pdf)

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
