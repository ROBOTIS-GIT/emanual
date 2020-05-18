---
layout: archive
lang: jp
ref: opencm904
read_time: true
share: true
author_profile: false
permalink: /docs/jp/parts/controller/opencm904/
sidebar:
  title: OpenCM 9.04
  nav: "opencm904"
---

# [イントロダクション](#introduction)

![](/assets/images/parts/controller/opencm904/opencm904_product.png)

> OpenCM 9.04

- OpenCM9.04タイプパッケージ

|           項目          | OpenCM9.04タイプA | OpenCM9.04タイプB | OpenCM9.04タイプC |
|:--------------------:|:-----------------:|:-----------------:|:-----------------:|
|        電源スイッチ       |         X         |         1         |         1         |
|      ユーザースイッチ     |         1         |         1         |         1         |
|2ピンバッテリー<br>(LBS-40)|         X         |         2         |         2         |
|        JTAG/SWD         |         X         |         1         |         1         |
|     マイクロUSBタイプB    |         X         |         1         |         1         |
|       5-ピンポート       |         X         |         4         |         4         |
|    DYNAMIXEL TTLバス    |         X         |       4 `1`       |       4 `2`       |
|        4ピン通信         |         X         |         1         |         1         |

`1`: [MOLEX 53253-0370] x 2(for XL-320), [MOLEX 22-03-5035] x 2(for AX/MX-Series)  
`2`: [MOLEX 53253-0370] x 4(for XL-320)

- OpenCM9.04は、32ビットARM Cortex-M3に基づくマイクロコントローラーボードです。 OpenCM9.04の回路図とソースコードはオープンソースです。
- タイプA、タイプB、タイプCの3つのタイプが使用できます。タイプA、タイプB、タイプCの違いは、コネクタの可用性です。 （上の画像と表を参照してください。）
（OpenCM9.04アクセサリーセットを購入することで、タイプAからタイプBタイプCへのアップグレードに必要なコネクタをすべて取得することができます。）  [OpenCM9.04 Accessory Set](http://en.robotis.com/shop_en/item.php?it_id=902-0084-030)

**注釈** : コントローラーの復旧についてはROBOTIS-MINIを参照してください（タイプCのみ）ROBOTIS-MINIコントローラーのファームウェアの更新 [ROBOTIS-MINI Controller Firmware Update]
{: .notice}

**注意** : DYNAMIXELファームウェアの更新または復旧する際は、OpenCM9.04およびOpenCM 485の拡張ボードを**取り外してください**。
{: .notice--warning}

# [仕様表](#specifications)

|           項目          |               説明               |
|:----------------------:|:-------------------------------:|
|          CPU           |   STM32F103CB (ARM Cortex-M3)   |
|         動作電圧        |            5V ~ 16V             |
|          I/O           |            GPIO x 26            |
|         タイマー        |            4 (16bit)            |
|     アナログ入力(ADC)    |           10 (12bit)            |
|       フラッシュROM      |              128Kb              |
|          SRAM          |              20Kb               |
|         クロック        |              72Mhz              |
|          USB           | 1 (2.0 Full Speed) マイクロUSBタイプB |
|         USART          |                3                |
|          SPI           |                2                |
|        I2C(TWI)        |                2                |
|         デバッグ        |           JTAG & SWD            |
| DYNAMIXEL TTL BUS 3pin |                4                |
|          寸法          |          27mm x 66.5mm          |

{% capture opencm904_caution_01 %}
**警告**
- DYNAMIXELの操作にUSB電源は使用できません。 別電源からの供給が必要です。
（OpenCM9.04は、USB、バッテリー、+-端子から供給される電力によって動作します。)  
  (OpenCM9.04 can operate using power supplied via USB, battery, + - terminal.)
- 電源を使用する際は、周辺機器の動作電圧を確認してください。DYNAMIXELやXLシリーズは全く同じ電圧を受けます。
- XL-320は動作電圧の違いにより、他のDYNAMIXELとの併用はできません。
{% endcapture %}

<div class="notice--danger">{{ opencm904_caution_01 | markdownify }}</div>

# [コントロールテーブル](#control-table)

**注意**  
OpenCM9.04のコントロールテーブルには、デフォルトのファームウェアの場合のみアクセス可能です。  
Arduinoスケッチ等をダウンロードした場合は、コントロールテーブルにアクセスできません。  
コントロールテーブルを使用しRoboplusソフトウェアに接続するには、R+Manager2.0からファームウェアリカバリーを実行してください。
{: .notice--warning}

コントロールテーブルは、コントローラの現在の状態と操作に関するデータで構成されています。  ユーザーは、インストラクションパケットを介してコントロールテーブルのデータを変更することにより、コントローラを制御できます。

- **EEPROMとRAM**  
  RAM領域のデータは電源投入時にデフォルト値でリセットされ、EEPROM領域のデータは電源を切っても設定値が保持されます。

- **アドレス**  
  データの位置を示します。コントロールテーブルからデータを読み/書きするには、インストラクションパケットで正しいアドレスを割り当てる必要があります。

- **アクセス**  
  コントローラには、主にセンシングに使用される読み取り専用データと、駆動に使用される読み取り/書き込みデータの2種類のデータがあります。

- **デフォルト値**  
  EEPROM領域のデータの場合、下記のコントロールテーブルの右側の値が工場出荷時の設定です。
   RAM領域のデータの場合、下記の管理表の右側の値が電源投入時の値です。

- **データサイズ**  
  データサイズは、1〜4バイトでコントロールテーブルのアイテムによって異なります。 インストラクションパケットでデータを更新する場合は、データサイズを確認してください。

## [EEPROM領域](#eeprom-area)

| アドレス | サイズ |      アイテム名      | 説明                         | アクセス | デフォルト値 |
|:-------:|:----:|:-------------------:|:---------------------------:|:------:|:----------:|
|    0    |  2   |    Model Number     | モデル番号                    |   R    |    400     |
|    6    |  1   |  Firmware Version   | ファームウェア バージョン        |   R    |     -      |
|    7    |  1   |         ID          | コントローラID                 |   RW   |    200     |
|    8    |  1   |      Baud Rate      | 通信ボーレート                 |   R    |     1      |
|    9    |  1   |  Return Delay Time  | 応答待ち時間                   |   RW   |     0      |
|   10    |  1   | Status Return Level | リターンパケットのレベル選択     |   RW   |     2      |
|   11    |  1   | Bootloader Version  | ブートローダ バージョン          |   R    |     -      |
|   12    |  1   |    DXL Baud Rate    | DYNAMIXELとの通信ボーレート     |   RW   |     3      |
|   16    |  1   |  DYNAMIXEL Channel  | DYNAMIXELとの通信ポート選択     |   RW   |     0      |

## [RAM領域](#ram-area)

| アドレス | サイズ |              アイテム名          | 説明                            | アクセス | デフォルト値 |
|:-------:|:----:|:-------------------------------:|:------------------------------:|:------:|:----------:|
|   21    |  1   |           Mode Number           | 動作モード                       |   RW   |     -      |
|   26    |  1   |          Button Status          | スタートボタンの状態               |   R    |     0      |
|   66    |  2   |        Motion Play Page         | Motion Play ページ番号           |   RW   |     0      |
|   68    |  1   |       Motion Play Status        | Motion Play ステータス           |   R    |     -      |
|   73    |  1   |        128ms Timer Value        | 128ms タイマカウンタ              |   RW   |     0      |
|   74    |  2   |         1ms Timer Value         | 1ms タイマカウンタ                |   RW   |     0      |
|   77    |  1   |          Random Number          | 乱数値の生成                      |   RW   |     -      |
|   79    |  1   |            Green LED            | 緑LEDのステータス                 |   RW   |     0      |
|   82    |  1   |           Motion LED            | Motion LEDのステータス            |   RW   |     0      |
|   360   |  2   |     Port 1 IR Sensor Value      | ポート1の赤外線センサ値           |   R    |     -      |
|   366   |  2   |     Port 4 IR Sensor Value      | ポート4の赤外線センサ値           |   R    |     -      |
|   368   |  2   |     Port 1 DMS Sensor Value     | ポート1の距離センサ値             |   R    |     -      |
|   370   |  2   |     Port 2 DMS Sensor Value     | ポート2の距離センサ値             |   R    |     -      |
|   372   |  2   |     Port 3 DMS Sensor Value     | ポート3の距離センサ値             |   R    |     -      |
|   374   |  2   |     Port 4 DMS Sensor Value     | ポート4の距離センサ値             |   R    |     -      |
|   376   |  1   |    Port 1 Touch Sensor Value    | ポート1のタッチセンサ値           |   R    |     -      |
|   377   |  1   |    Port 2 Touch Sensor Value    | ポート2のタッチセンサ値           |   R    |     -      |
|   378   |  1   |    Port 3 Touch Sensor Value    | ポート3のタッチセンサ値           |   R    |     -      |
|   379   |  1   |    Port 4 Touch Sensor Value    | ポート4のタッチセンサ値           |   R    |     -      |
|   381   |  1   |     Port 2 LED Module Value     | ポート2のLEDモジュール値          |   RW   |     0      |
|   382   |  1   |     Port 3 LED Module Value     | ポート3のLEDモジュール値          |   RW   |     0      |
|   386   |  2   |    Port 2 User Device Value     | ポート2のユーザーデバイス値        |   RW   |     0      |
|   388   |  2   |    Port 3 User Device Value     | ポート3のユーザーデバイス値        |   RW   |     0      |
|   392   |  1   | Port 1 Temperature Sensor Value | ポート1の温度センサ値             |   R    |     -      |
|   393   |  1   | Port 2 Temperature Sensor Value | ポート2の温度センサ値             |   R    |     -      |
|   394   |  1   | Port 3 Temperature Sensor Value | ポート3の温度センサ値             |   R    |     -      |
|   395   |  1   | Port 4 Temperature Sensor Value | ポート4の温度センサ値             |   R    |     -      |
|   396   |  1   | Port 1 Ultrasonic Sensor Value  | ポート1の超音波センサ値           |   R    |     -      |
|   397   |  1   | Port 2 Ultrasonic Sensor Value  | ポート2の超音波センサ値           |   R    |     -      |
|   398   |  1   | Port 3 Ultrasonic Sensor Value  | ポート3の超音波センサ値           |   R    |     -      |
|   399   |  1   | Port 4 Ultrasonic Sensor Value  | ポート4の超音波センサ値           |   R    |     -      |
|   400   |  1   |  Port 1 Magnetic Sensor Value   | ポート1の磁気センサ値             |   R    |     -      |
|   401   |  1   |  Port 2 Magnetic Sensor Value   | ポート2の磁気センサ値             |   R    |     -      |
|   402   |  1   |  Port 3 Magnetic Sensor Value   | ポート3の磁気センサ値             |   R    |     -      |
|   403   |  1   |  Port 4 Magnetic Sensor Value   | ポート4の磁気センサ値             |   R    |     -      |
|   404   |  1   |   Port 1 Motion Sensor Value    | ポート1のモーションセンサ値        |   R    |     -      |
|   405   |  1   |   Port 2 Motion Sensor Value    | ポート2のモーションセンサ値        |   R    |     -      |
|   406   |  1   |   Port 3 Motion Sensor Value    | ポート3のモーションセンサ値        |   R    |     -      |
|   407   |  1   |   Port 4 Motion Sensor Value    | ポート4のモーションセンサ値        |   R    |     -      |
|   409   |  1   |    Port 2 Color Sensor Value    | ポート2のカラーセンサ値           |   R    |     -      |
|   410   |  1   |    Port 3 Color Sensor Value    | ポート3のカラーセンサ値           |   R    |     -      |

**注釈** : コントロールテーブルの一部のアドレスは、R+Manager2.0を使用してテストが可能です。
{: .notice}

**警告** : OpenCM9.04をR+Manager2.0で工場出荷時のファームウェアに書き換えた場合、DYNAMIXELでは**ID 200を使用しないでください**。  
ID 200は、工場出荷時のファームウェアでOpenCM9.04に割り当てられています。
{: .notice--warning}

# [ハードウェア](#hardware)

## [メモリマップ](#memory-map)

![](/assets/images/parts/controller/opencm904/memory_map.png)

## [ブロック図](#block-diagram)

OpenCM9.04のブロック図を以下に示します。OpenCM9.04の回路図は、32bit Cortex-M3コアのSTM32F103CBマイクロコントローラに基づいています。  
電源回路図は、5Vと3.3Vのレギュレータを介してカスケードするように設計されています。5VはTTLバスに、3.3Vはマイクロコントローラ、5ピンポート、4ピン通信ポートに供給されます。  
OpenCM9.04はUSB2.0 FSに対応しています。Micro-Bコネクタは、プログラムのダウンロードやデータ通信を行うために使われます。  
USARTチャンネル1はDYNAMIXEL TTLバスに割当てられているため、ピン 11(TX1)とピン 12(RX1)を併用することはできません。  
 
![](/assets/images/parts/controller/opencm904/opencm904_01.png)


## [レイアウト/ピン配置](#layoutpin-map)

![](/assets/images/parts/controller/opencm904/opencm904_02.png)

### [電源スイッチ](#power-switch)
このスイッチは、ボードへの電源供給とDYNAMIXELのON/OFFを制御するためのスイッチです。(注: USB ケーブルが接続されているときは、ボードの電源は常にオンになっています)  

### [直列バッテリーソケット](#serial-battery-socket)
LBS-04リチウムイオン電池2本を接続します。  

**注意** : 回路をショートさせてしまうため、基板に接続されている間はバッテリーを充電しないでください。バッテリーを充電する際には、必ず基板から切り離してください。  

### [DYNAMIXEL TTL 3ピン](#dynamixel-ttl-3-pin)
3ピンケーブル(DYNAMIXEL TTL Bus)を使用するDYNAMIXELをデイジーチェーン接続するためのポートです。  

**警告** : **ピンアウトを確認してください** DYNAMIXELのピンアウトはコネクタメーカーのピンアウトと異なる場合があります。

### [通信ポート](#communication-port)
周辺機器（BT-410、BT-210、BT-110A、ZIG-110A、LN-101など）を使う有線/無線通信から使用します。OpenCM9.04 の 4 ピン通信ポートは、Serial2(USART2)を使用しています。　

![](/assets/images/parts/controller/opencm904/opencm9.04_1-1.jpg)

> 4ピン通信ポート ピン配置

![](/assets/images/parts/controller/opencm904/opencm904_04.png)

> 例：OpenCM9.04とスマートフォン間の無線通信

![](/assets/images/parts/controller/opencm904/opencm904_05.png)

> 例：OpenCM9.04とRC100を使用したBluetooth通信  

![](/assets/images/parts/controller/opencm904/opencm904_06.png)

> 例：OpenCM9.04とRC100を使用したZigbee通信

![](/assets/images/parts/controller/opencm904/opencm904_07.png)

> 例：OpenCM9.04とLN-101を使用した有線通信

### [ユーザーボタン](#user-button)
ユーザが制御/プログラムできるボタンです。ピン23またはBOARD_BUTTON_PINとして使用できます。setup()でpinMode(23, INPUT_PULLDOWN)として初期化することができます。    
OpenCM9.04がプログラムをダウンロードできない場合は、「ユーザーボタン」を押しながらUSBケーブルを接続してください。ステータスLEDが点灯したままになり、ダウンロードが開始されます。  

![](/assets/images/parts/controller/opencm904/opencm904_08.png)

> OpenCM9.04では、「ユーザーボタン」を使用して「緊急復旧モード」に入ることができます。

### [Ext. ADC Ref Jumper](#ext-adc-ref-jumper)
アナログ基準電圧の変更ができます。I/Oヘッダーの項目を参照してください。 [I/Oヘッダー](#io-header).

### [マイクロUSBタイプB](#micro-b-usb)
OpenCM9.04にプログラムをダウンロードし、USB経由で他のデバイスと通信しながら、同時に5Vを基板に供給するために使用します。  
バッテリーを接続すると、USBからの5V電源は自動的に切断され、バッテリーから電源が供給されます。
過大な電流が流れた場合は、内部のヒューズが5VのUSB接続からの電流を遮断し、ユーザーのPCを破損から保護します。  

![](/assets/images/parts/controller/opencm904/opencm904_09.png)

### [ステータスLED]
OpenCM9.04のプログラムをテストするためのLEDです。14番ピンまたはBOARD_LED_PINがHIGHの時に点灯し、LOWの時に消灯します。PWM制御が可能です。  

![](/assets/images/parts/controller/opencm904/opencm904_10.png)

> ステータスLEDの位置

### [リセットボタン](#reset-button)
CPUをリセットします。

### [JTAG/SWD 4ピン](#jtagswd-4-pin)
ST-LINKや、その他のインサーキットデバッガ/プログラマとの接続に使用します。  
JTAG/SWD 4ピンポートは、上級者の方の様々な開発にご利用いただけます。以下にST-LINKの接続例を示します。  
![](/assets/images/parts/controller/opencm904/opencm904_11.png)

> 例：ST-LINKとOpenCM9.04の接続

### [ROBOTIS 5-ピンポート](#robotis-5-pin-port)
ROBOTISの5ピン-デバイス（モジュール）を接続するために使用します。

![](/assets/images/parts/controller/opencm904/opencm904_12.png)

> 5ピン-ポート番号と手順

![](/assets/images/parts/controller/opencm904/opencm904_13.png)

> 例：5ピンケーブルの方向

|    5-ピン デバイスタイプ     | ポート1 | ポート2 | ポート3 | ポート4 |
|:------------------------:|:------:|:------:|:------:|:------:|
|        IRセンサ           |   O    |   X    |   X    |   O    |
|        DMSセンサ          |   O    |   O    |   O    |   O    |
|       ジャイロセンサ       |   O    |   O    |   O    |   O    |
|       タッチセンサ         |   O    |   O    |   O    |   O    |
|       カラーセンサ         |   X    |   O    |   O    |   X    |
|        磁気センサ         |   O    |   O    |   O    |   O    |
|        温度センサ         |   O    |   O    |   O    |   O    |
| Passive IRセンサ PIR-10  |   O    |   O    |   O    |   O    |
|       LED モジュール      |   X    |   O    |   O    |   X    |

> 例：ROBOTIS センサとLEDモジュールの互換性一覧

### [I/Oヘッダ](#io-header)
OpenCM9.04のCPU STM32F103CBはGPIOピンを介してアクセスできます。  
26本のGPIOピン(0～25)はデジタルI/Oで、3.3Vで動作します。デジタル入力はHIGH(3.3V)またはLOW(0V)です。  
デジタル入力の最大トグル速度は18Mhzです。(ピン22と23を除いて、最大トグル速度は2Mhzです)。  
デジタルピンは3.3Vまでしか許容できません。3.3Vを超える電圧を入力するとOpenCM9.04が破損する可能性があります。  
5V耐圧ピン : 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21  
これらのピンが許容できる最大電流は25mAです。(例外：ピン22と23は3mAまでしか許容できません。)  
OpenCM9.04のすべてのGPIOピンは内部的に"プルアップ"または"プルダウン"が可能で、ソフトウェアによって変更することができます。"プルアップ"と "プルダウン"の抵抗は40KΩ(標準)です。  
![](/assets/images/parts/controller/opencm904/opencm904_14.png)

> OpenCM9.04 GPIOピン配置

| 名称             | Arduinoピン |          |
|:-----------------|:--------------|:---------|
| シリアル/シリアルUSB | USBポート      |          |
| シリアル1          | D11, D12      | DXLポート |
| シリアル2          | A4,  A5       |          |
| シリアル3          | D24, D25      |          |
| SPI1             | A1, A6, A7    |          |
| SPI2             | D19, D20, D21 |          |
| PWM              | A2 ~ D14      |          |
| ADC              | A0 ~ A9       |          |
| LED              | D14           |          |
| EXTI             | A0 ~ D25      |          |
| I2C              | D24, D25      |          |
| ボタン            | D23           |          |
| 5ピン #1          | D2, D6, D7    |          |
| 5ピン #2          | D3, D8, D9    |          |
| 5ピン #3          | D0, D10, D11  |          |
| 5ピン #4          | D1, D12, D13  |          |
| 4ピン UART        | D1, D12, D13  | シリアル2  |

- **シリアル(USART)** : 11(TX1), 12(RX1), 4(TX2), 5(RX2), 24(TX3), 25(RX3)  
- **PWM** : 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14  
- **SPI** : 0(SS1), 1(SCK1), 6(MISO1), 7(MOSI1), 18(SS2), 19(SCK2), 20(MISO2), 21(MOSI2)  
- **LED** : 14(BOARD_LED_PINは14として定義されています)  
- **ボタン** : 23(BOARD_BUTTON_PINは23として定義されています)  
- **TWI(I2C)** : 24(SCL2), 25(SDA2)  
- **RST** : CPUのリセット信号に接続するピンです。  
- **5V** : バッテリーを基板に接続した時に5Vを出力します。(USBケーブルのみを接続した場合は5Vを出力しません)  
- **3.3V** : バッテリーもしくはUSBケーブルで基板に電源を供給した場合は3.3Vを出力します。  
- **GND** : GROUND(-)端子です。  
- **A0** : デジタルI/O、アナログ入力です。  
- **A1** : デジタルI/O、アナログ入力です。SPIチャンネル1のSCKクロックピンに使用できます。  
- **A2** : デジタルI/O、アナログ入力、PWM出力です。  
- **A3** : デジタルI/O、アナログ入力、PWM出力です。  
- **A4** : デジタルI/O、アナログ入力、PWM出力です。USART2(Serial2)チャンネルのTXDピンとして使用し、4ピン通信ポートのTX2に接続します。  
- **A5** : デジタルI/O、アナログ入力、PWM出力です。USART2(Serial2)チャンネルのRXDピンとして使用し、4ピン通信RX2に接続されています。  
- **A6** : デジタルI/O、アナログ入力、PWM出力です。SPIチャンネル1のMISOピンとして使用できます。  
- **A7** : デジタルI/O、アナログ入力、PWM出力です。SPIチャンネル1のMISOピンとして使用できます。  
- **A8** : デジタルI/O、アナログ入力、PWM出力です。  
- **A9** : デジタルI/O、アナログ入力、PWM出力です。  
- **D10** : デジタルI/O、アナログ入力、PWM出力です。  
- **D11** : デジタルI/O、PWM出力です。USART1(Serial1)のTXピンです。DYNAMIXEL TTLバスとの併用はできません。  
- **D12** : デジタルI/O、PWM出力です。USART1(Serial1)のRXピン。DYNAMIXEL TTLバスとの併用はできません。  
- **D13** : デジタルI/O、PWM出力です。  
- **D14** : デジタルI/O、PWM出力です。ステータスLEDに接続されているピンです。それは、BOARD_LED_PINとして定義されています。  
- **D15** : デジタルI/Oです。  
- **VCC(+)** : 基板の+電圧です。VCC(+)ピンが2つあります。バッテリーソケットの+端子に接続されています。  
- **GND(-)** : ボードの-電圧です。2本のGND(-)ピンがあります。バッテリーソケットの+端子に接続します。  
- **TTL** : DYNAMIXEL TTLバスのデータライン。3ピンTTL DYNAMIXELとの通信に使用します。  
- **D** : DYNAMIXEL TTLバスに関連し、TX、RXを選択するために使用されます。  
- **X** : DYNAMIXEL TTLバスのTXピン。  
- **L** : DYNAMIXEL TTLバスのRXピン。 
- **D16** : デジタルI/Oピンです。  
- **D17** : デジタルI/Oピンです。  
- **D18** : デジタルI/Oピンです。  
- **D19** : デジタルI/Oです。SPIチャンネル2のSCKクロックピンに使用できます。  
- **D20** : デジタルI/Oピンです。SPIチャンネル2のMOSIピンに使用できます。  
- **D21** : デジタルI/Oピンです。SPIチャンネル2のMOSIピンに使用できます。  
- **D22** : デジタルI/O品です。最大出力電流は3mA、最大トグル速度は2Mhzです。  
- **D23** : デジタルI/Oピンです。ユーザーボタンに接続されています。ユーザーボタンが押されている間に電源が供給されると、ボードは緊急リカバリー(ダウンロード)モードを開始します。最大出力電流は3mAで、最大トグル速度は2Mhzです。  
- **D24** : デジタルI/Oピンです。I2Cチャンネル2のSCLピンもしくは、USART3(Serial3)のTXピンとして使用できます。  
- **D25** : デジタルI/Oピンです。I2Cチャンネル2のSDAピンまたはUSART3(Serial3)のRXピンとして使用できます。  
- **5V** : 5V出力ピンです。JP2ジャンパーを変更してAREFピンに接続し、デフォルトの電圧を5Vに変更することができます。  
- **AREF** : CPU のアナログリファレンスピンに接続します。JP2ジャンパを変更することで、3.3Vから電圧を変更することができます（最大5V）。仕様はSTM32F103CBのデータシートを参照してください。  

![](/assets/images/parts/controller/opencm904/opencm904_15.png)

> JP2ジャンパーの位置と手順

![](/assets/images/parts/controller/opencm904/opencm904_16.png)

> 例：JP2を修正してデフォルトのアナログ基準電圧(AREF)を5Vに変更する。

**注意** : アナログリファレンス(AREF)を5Vに修正した場合は、5Vまで対応しているかどうかを確認してください。

## [ピン名の定義](#pin-name-definition)

```c++
#define LED_BUILTIN             14

#define BOARD_BUTTON_PIN        23  //PC15
#define BOARD_LED_PIN           14  //PB9

#define BOARD_USART1_TX_PIN     11  //D9(PA9)
#define BOARD_USART1_RX_PIN     12  //D10(PA10)
#define BOARD_USART2_TX_PIN     4   //D2 (PA2)
#define BOARD_USART2_RX_PIN     5   //D3 (PA3)
#define BOARD_USART3_TX_PIN     24  //D24 (PB10)
#define BOARD_USART3_RX_PIN     25  //D25 (PB11)

#define BOARD_SPI1_NSS_PIN      0   //D10 (PA4)
#define BOARD_SPI1_MOSI_PIN     7   //D11 PA7
#define BOARD_SPI1_MISO_PIN     6   //D12 PA6
#define BOARD_SPI1_SCK_PIN      1   //D13 PA5
#define BOARD_SPI2_NSS_PIN      18  //D26 PB12
#define BOARD_SPI2_MOSI_PIN     21  //D29 PB15
#define BOARD_SPI2_MISO_PIN     20  //D28 PB14
#define BOARD_SPI2_SCK_PIN      19  //D27 PB13
```

## [ピン機能の定義](#pin-function-definition)

```c++
extern const Pin2PortMapArray g_Pin2PortMapArray[]=
{
  {GPIOA, GPIO_PIN_4,   &hADC1,   ADC_CHANNEL_4 , NULL   ,   NO_PWM       , 0       },  // 0
  {GPIOA, GPIO_PIN_5,   &hADC1,   ADC_CHANNEL_5 , NULL   ,   NO_PWM       , 1       },  // 1
  {GPIOA, GPIO_PIN_0,   &hADC1,   ADC_CHANNEL_0 , &hTIM2 ,   TIM_CHANNEL_1, 2       },  // 2
  {GPIOA, GPIO_PIN_1,   &hADC1,   ADC_CHANNEL_1 , &hTIM2 ,   TIM_CHANNEL_2, 3       },  // 3
  {GPIOA, GPIO_PIN_2,   &hADC1,   ADC_CHANNEL_2 , &hTIM2 ,   TIM_CHANNEL_3, 4       },  // 4
  {GPIOA, GPIO_PIN_3,   &hADC1,   ADC_CHANNEL_3 , &hTIM2 ,   TIM_CHANNEL_4, 5       },  // 5
  {GPIOA, GPIO_PIN_6,   &hADC1,   ADC_CHANNEL_6 , &hTIM3 ,   TIM_CHANNEL_1, 6       },  // 6
  {GPIOA, GPIO_PIN_7,   &hADC1,   ADC_CHANNEL_7 , &hTIM3 ,   TIM_CHANNEL_2, 7       },  // 7
  {GPIOB, GPIO_PIN_0,   &hADC1,   ADC_CHANNEL_8 , &hTIM3 ,   TIM_CHANNEL_3, 8       },  // 8
  {GPIOB, GPIO_PIN_1,   &hADC1,   ADC_CHANNEL_9 , &hTIM3 ,   TIM_CHANNEL_4, 9       },  // 9

  {GPIOA, GPIO_PIN_8,   NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_1, 10      },  // 10
  {GPIOA, GPIO_PIN_9,   NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_2, 11      },  // 11
  {GPIOA, GPIO_PIN_10,  NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_3, 12      },  // 12
  {GPIOB, GPIO_PIN_8,   NULL,     NO_ADC        , &hTIM4 ,   TIM_CHANNEL_3, 13      },  // 13
  {GPIOB, GPIO_PIN_9,   NULL,     NO_ADC        , &hTIM4 ,   TIM_CHANNEL_4, 14      },  // 14 LED
  {GPIOA, GPIO_PIN_15,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , 15      },  // 15
  {GPIOB, GPIO_PIN_3,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , 16      },  // 16
  {GPIOB, GPIO_PIN_4,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , 17      },  // 17
  {GPIOB, GPIO_PIN_12,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , 18      },  // 18
  {GPIOB, GPIO_PIN_13,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , 19      },  // 19

  {GPIOB, GPIO_PIN_14,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , 20      },  // 20
  {GPIOB, GPIO_PIN_15,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , 21      },  // 21
  {GPIOC, GPIO_PIN_14,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , 22      },  // 22
  {GPIOC, GPIO_PIN_15,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , 23      },  // 23 USER_BUTTON
  {GPIOB, GPIO_PIN_10,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , 24      },  // 24
  {GPIOB, GPIO_PIN_11,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , 25      },  // 25


  {GPIOA, GPIO_PIN_13,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 26 JTAG SWDIO
  {GPIOA, GPIO_PIN_14,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 27 JTAG SWDCLK
  {GPIOB, GPIO_PIN_5,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 28 DXL DIR
  {GPIOB, GPIO_PIN_6,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 29 DXL TXD
  {GPIOB, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 30 DXL RXD

  {NULL , 0          ,  NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI }
};
```

# [電源接続方法](#connecting-power)

OpenCM9.04ボードは、3種類の電圧入力で動作します。:
1. LB-040バッテリーソケット
2. +/- のヘッダピン
3. Micro-B USB

![](/assets/images/parts/controller/opencm904/opencm904_17.png)

XL-320の動作時には、LB-040バッテリーを2つ使用する事をお勧めします。

![](/assets/images/parts/controller/opencm904/opencm904_18.png)

> 例：OpenCM9.04, XL-320, LB-040（リチウムイオンバッテリー）を接続

![](/assets/images/parts/lbs-40_product.jpg)

> LB-040 バッテリー

XL-320以外のDYNAMIXELに電源を供給する場合は、+/-ピンを使用する事をお勧めします。

![](/assets/images/parts/controller/opencm904/opencm904_19.png)

> 例：OpenCM9.04, AX-12を接続

以下の図のように、+/-ピンの両方端に接続します。他の電源装置を使用して接続する事も可能です。  
（OpenCM9.04の裏面が見える場合は、中央の+/-ピンが画像Aのように接続されています。以下の画像のように接続してください）

![](/assets/images/parts/controller/opencm904/opencm904_20.jpg)

> 画像 A

![](/assets/images/parts/controller/opencm904/opencm904_21.jpg)

> 例:電源接続

- `例` 電源接続ケーブル ([Link](http://www.robotsource.org/bs/bd.php?bt=forum_CM9DeveloperWorld&bt_id=583))

バッテリーソケットと+/-ピン（下図を参照）に同時に電源を接続しないでください。間違ったバッテリーをバッテリーソケットに接続しないでください。  
LB-040はバッテリーソケットのみに接続してください。

![](/assets/images/parts/controller/opencm904/opencm904_22.jpg)

> 注意：バッテリーコネクタ、または+/- ヘッダピン電源を取り外します。

![](/assets/images/parts/controller/opencm904/opencm904_23.jpg)

> 注意：種類の異なるバッテリーは、使用しないでください

![](/assets/images/parts/controller/opencm904/opencm904_24.png)

USBポート、LB-040バッテリー、+/-ピンを同時に接続することが可能です。（保護機能あり）  
+/-ピン、またはバッテリーを介して電力を供給する場合、DYNAMIXELの推奨電圧を供給することをお勧めします。  
より高い電圧で使用すると、DYNAMIXELの寿命が短くなったり、製品が損傷する可能性があります。  
OpenCM9.04の最大許容電圧は16Vです。16Vを超える電圧入力はボードを損傷する可能性があります。  
DYNAMIXELは、USBケーブルから供給される電源では動作しませんが、通信ポートやI/Oヘッダーは正常に動作します。  
注意：LB-040バッテリーがボードに接続され、ボードがUSBケーブルを介してPCに接続されている間は、LBS-40バッテリーを充電しないでください。

# [スイッチアセンブリ(Type A)](#switch-assemblytype-a)

OpenCM9.04 Type Aは、電源スイッチとJP1が短絡されていない状態で販売されています。  
電源スイッチを追加するには、JP1のはんだ接続を取り外し、2.54mmピッチの電源スイッチをはんだ付けします。  
電源スイッチは、OpenCMアクセサリキットに含まれているものか、同じピッチの他のスイッチを使用できます。  

![](/assets/images/parts/controller/opencm904/opencm904_25.png)

> JP1＆電源スイッチの回路図：スイッチが無くてもJP1が接続されている場合、ボードに電力が供給されます。

![](/assets/images/parts/controller/opencm904/opencm904_26.png)

> OpenCM9.04 Type Aが正しく動作するためには、スイッチをはんだ付けする際にJP1を切断する必要があります。

# [コネクタアセンブリ(Type A)](#connector-assemblytype-a)

OpenCM9.04のDYNAMIXEL 3ピンTTLピンは、DYNAMIXEL 3ピンTTLおよびXL-320 3ピンTTL（ミニタイプ）と互換性があります。
したがって、両方のタイプのピンをはんだ付けして使用可能です。  
両方のタイプの3ピンTTLピンがOpenCMアクセサリセットに含まれています。

![](/assets/images/parts/controller/opencm904/opencm904_27.png)

> OpenCM9.04 Type Aは、2種類の3ピンコネクタをボードに取り付ける事ができます。

# [開発環境](#development-environment)

## [サポート ソフトウェア](#supported-software)

- [Arduino IDE]
- [OpenCM IDE]

|                      | [Arduino IDE] | [OpenCM IDE] |
|:--------------------:|:-------------:|:------------:|
|   [DYNAMIXEL SDK]    |       O       |      X       |
| [DYNAMIXELWorkbench] |       O       |      X       |
|  Arduino Libraries   |       O       |      O       |
|         OS X         |       O       |  O(10.12.2)  |
|        Linux         |       O       |   O(12.04)   |
|       Windows        |       O       |      O       |

## [OpenCM IDE](#opencm-ide)
OpenCM IDEがメンテナンスされなくなるため、OpenCM IDEを使用している開発者は、[Arduino IDE]を使用することをお勧めします。

`e-Manual` [OpenCM IDE]

## [Arduino IDE](#arduino-ide)

### [Linuxのインストール](#install-on-linux)

#### [USBポートの設定 (Linux)](#usb-port-settings-linux)
OpenCM9.04 USBポートがルート権限無しでArduino IDEプログラムをアップロードできるようにします。
```
wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/99-opencm-cdc.rules
sudo cp ./99-opencm-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
```

#### [コンパイラの設定 (Linux)](#compiler-settings-linux)
OpenCM9.04ライブラリは32ビットプラットフォーム用に構築されているため、64ビットPCにはArduino IDEに関連する32ビットコンパイラ関連が必要です。
```
sudo apt-get install libncurses5-dev:i386
```

#### [Arduino IDEのインストール (Linux)](#install-the-arduino-ide-linux)

Arduinoの公式HPから最新版のArduino IDEをダウンロード後、インストールします。 現在、OpenCM9.04はバージョン1.6.4以降で動作します。

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

次に、ダウンロードしたファイルを目的のフォルダーに展開し、ターミナルからインストールファイルを実行します。 本例では、ユーザーの最上位フォルダー（〜/）にフォルダを作成します。 このフォルダは、Arduino IDEフォルダとして機能します。
```
cd ~/tools/arduino-1.8.3
./install.sh
```

インストールされているArduino IDEのファイルパスを、bashrcファイルのPATHという名前の絶対パスとして設定します。 ここでは、geditエディターの使用を推奨しています。  
（必要に応じて、別のエディターを使用します。）最後に、変更を適用します。
```
gedit ~/.bashrc
export PATH=$PATH:$HOME/tools/arduino-1.8.3
source ~/.bashrc
```

#### [Arduino IDEの実行 (Linux)](#run-the-arduino-ide-linux)

LinuxプラットフォームでArduino IDEを実行するには、次のようにターミナルに入力します。
```
arduino
```

#### [Arduino IDE でOpenCM9.04ボードを使用する(Linux)](#porting-the-opencm904-board-to-the-arduino-ide-linux)

##### [環境設定 (Linux)](#preferences-linux)
Arduino IDEの実行後、IDEのトップメニューでFile → Preferencesをクリックします。 Preferencesウィンドウが表示されたら、次のリンクをコピーして、Additional Boards Manager URLsテキストボックスに貼り付けます。  
（設定に約20分かかる場合があります。）

[https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json](https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json)

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_1.png)


##### [ボードマネージャー経由でOpenCM9.04パッケージをインストールする(Linux)](#install-the-opencm904-package-via-boards-manager-linux)
Tools → Board → Boards Managerを選択する。

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_2.png)

テキストボックスにOpenCM9.04と入力して、ROBOTISパッケージによるOpenCM9.04を検索します。 見つけたら、インストールをクリックします。

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_3.png)

インストール後、「INSTALLED」が表示されます。

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_4.png)

OpenCM9.04 BoardがTools → Boardのリストにあるかどうかを確認します。 これをクリックしてOpenCM9.04ボードをインポートします。

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_5.png)

##### [ポート設定 (Linux)](#port-setting-linux)
このステップは、プログラムのアップロード用のポート設定を示しています。 OpenCM9.04は、USBポートを介してPCおよびOpenCM9.04に接続する必要があります。

Tools → Port → /dev/ttyACM0を選択します。

/dev/ttyACM0 の値は、PCに接続されている環境によって異なる場合があります。
{: .notice}


![](/assets/images/parts/controller/opencm904/opencm9.04_linux_6.png)

### [Macのインストール](#install-on-mac)

#### [Arduino IDEのインストール (Mac)](#install-the-arduino-ide-mac)

Arduinoの公式HPから最新版のArduino IDEをダウンロード後、インストールします。 現在、OpenCM9.04はバージョン1.6.4以降で動作します。

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

#### [Arduino IDEの実行 (Mac)](#run-the-arduino-ide-mac)

MacプラットフォームでArduino IDEを実行するには、次のようにArduino IDEアイコンをクリックします。

![](/assets/images/parts/controller/opencm904/arduino_mac_01.png)

![](/assets/images/parts/controller/opencm904/arduino_mac_02.png)

#### [Arduino IDE でOpenCM9.04ボードを使用する (Mac)](#porting-the-opencm904-board-to-the-arduino-ide-mac)

##### [環境設定 (Mac)](#preferences-mac)
Arduino IDEの実行後、IDEのトップメニューでFile → Preferencesをクリックします。 Preferencesウィンドウが表示されたら、次のリンクをコピーして、Additional Boards Manager URLsテキストボックスに貼り付けます。  
（設定に約20分かかる場合があります。）

[https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json](https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json)

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_1.png)

##### [ボードマネージャー経由でOpenCM9.04パッケージをインストールする (Mac)](#install-the-opencm904-package-via-boards-manager-mac)
Tools → Board → Boards Managerを選択する。

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_2.png)

テキストボックスにOpenCM9.04と入力して、ROBOTISパッケージによるOpenCM9.04を検索します。 見つけたら、インストールをクリックします。

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_3.png)

インストール後、「INSTALLED」が表示されます。

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_4.png)

OpenCM9.04 BoardがTools → Boardのリストにあるかどうかを確認します。 これをクリックしてOpenCM9.04ボードをインポートします。

##### [ポート設定 (Mac)](#port-setting-mac)
このステップは、プログラムのアップロード用のポート設定を示しています。 OpenCM9.04は、USBポートを介してPCおよびOpenCM9.04に接続する必要があります。

Tools → Port → /dev/ttyACM0を選択します。

/dev/ttyACM0 の値は、PCに接続されている環境によって異なる場合があります。
{: .notice}

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_6.png)

### [Windowsのインストール](#windows-driver-installation)

#### [仮想COMポートドライバのインストール](#install-virtual-com-port-driver)
WindowsでOpenCM9.04のUSBポートをシリアルポートとして使用するには、USB CDCドライバーが必要です。 USBドライバは次のようにインストールできます。

- [Windows ドライバのインストール](#install-windows-driver)

Arduinoの公式HPから最新版のArduino IDEをダウンロード後、インストールします。 現在、OpenCM9.04はバージョン1.6.4以降で動作します。

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

Arduino IDE for Windowsは、インストールバージョンと圧縮バージョンを利用できるので、好みの方法でインストールできます。

#### [Arduino IDE でOpenCM9.04ボードを使用する (Windows)](#porting-the-opencm-904-board-to-the-arduino-ide-windows)

##### [環境設定 (Windows)](#preferences-windows)
Arduino IDEの実行後、IDEのトップメニューでFile → Preferencesをクリックします。 Preferencesウィンドウが表示されたら、次のリンクをコピーして、Additional Boards Manager URLsテキストボックスに貼り付けます。  
（設定に約20分かかる場合があります。）

[https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json](https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json)

![](/assets/images/parts/controller/opencm904/opencm904_win_1.png)

##### [ボードマネージャー経由でOpenCM9.04パッケージをインストールする (Windows)](#install-the-opencm904-package-via-boards-manager-windows)
Tools → Board → Boards Managerを選択する。

![](/assets/images/parts/controller/opencm904/opencm904_win_2.png)

テキストボックスにOpenCM9.04と入力して、ROBOTISパッケージによるOpenCM9.04を検索します。 見つけたら、インストールをクリックします。

![](/assets/images/parts/controller/opencm904/opencm904_win_3.png)

インストール後、「INSTALLED」が表示されます。

![](/assets/images/parts/controller/opencm904/opencm904_win_4.png)

OpenCM9.04 BoardがTools → Boardのリストにあるかどうかを確認します。 これをクリックしてOpenCM9.04ボードをインポートします。

![](/assets/images/parts/controller/opencm904/opencm904_win_5.png)

##### [ポート設定 (Windows)](#port-setting-windows)
このステップは、プログラムのアップロード用のポート設定を示しています。 OpenCM9.04は、USBポートを介してPCおよびOpenCM9.04に接続する必要があります。

Tools → Port → COM1を選択します。

COM1 の値は、PCに接続されている環境によって異なる場合があります。
{: .notice}

## [ライブラリAPI](#library-api)

Arduino IDEにライブラリを追加する方法は3つあります。

- ライブラリマネージャを使用する  
- .zip ライブラリのインポート  
- マニュアルインストール  

それぞれの方法は [Arduino Official Guide]{: .blank}に詳しく記載されていますので、必要に応じて参考にしてください。  
以下にライブラリマネージャの使用例を示します。 

![](/assets/images/parts/interface/dynamixel_shield/library_manager_01.png)

ライブラリマネージャから`DYNAMIXEL2Arduino`を検索し、ライブラリをインストールします。

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

DYNAMIXEL2Arduinoライブラリが正常にインストールされている場合、DYNAMIXELを制御するために役に立つサンプルプログラムは、DYNAMIXEL2Arduinoカテゴリで見つけることができます。

### [Dynamixel2Arduinoライブラリ](#dynamixel2arduino-library)

#### [Dynamixel2Arduinoクラス](#dynamixel2arduino-class)

- [begin()]{: .popup}
- [getPortBaud()]{: .popup}
- [ping()]{: .popup}
- [scan()]{: .popup}
- [getModelNumber()]{: .popup}
- [setID()]{: .popup}
- [setProtocol()]{: .popup}
- [setBaudrate()]{: .popup}
- [torqueOn()]{: .popup}
- [torqueOff()]{: .popup}
- [ledOn()]{: .popup}
- [ledOff()]{: .popup}
- [setOperatingMode()]{: .popup}
- [setGoalPosition()]{: .popup}
- [getPresentPosition()]{: .popup}
- [setGoalVelocity()]{: .popup}
- [getPresentVelocity()]{: .popup}
- [setGoalPWM()]{: .popup}
- [getPresentPWM()]{: .popup}
- [setGoalCurrent()]{: .popup}
- [getPresentCurrent()]{: .popup}
- [readControlTableItem()]{: .popup}
- [writeControlTableItem()]{: .popup}

#### [マスタークラス](#master-class)

Dynamixel2Arduinoクラスは、マスタークラスから以下のパブリック関数を継承しています。


- [syncRead()]{: .popup}
- [syncWrite()]{: .popup}
- [bulkRead()]{: .popup}
- [bulkWrite()]{: .popup}
- [getLastLibErrCode()]{: .popup}

# [例](#examples)

## [LED](#led)

OpenCM9.04ボードに内蔵されているLEDテストです。  

### [LEDのテスト例](#test-example-for-led)
OpenCM9.04には1個のLEDが用意されており、Arduinoのベース14に接続されています。   
内蔵のLED端子をHigh/Lowで出力すると、LEDが点灯/消灯します。

```
#define BOARD_LED_PIN        14
```

全てのLEDを順次点灯・消灯するコードです。

```c++
int led_pin = 14;

void setup() {
  // Set up the built-in LED pin as an output:
  pinMode(led_pin, OUTPUT);

  Serial.begin(115200);
}

void loop() {
  int i;

  digitalWrite(led_pin, HIGH);  // set to as HIGH LED is turn-off
  Serial.println("led_off");
  delay(100);                   // Wait for 0.1 second
  digitalWrite(led_pin, LOW);   // set to as LOW LED is turn-on
  Serial.println("led_on");
  delay(100);                   // Wait for 0.1 second
}
```

## [ボタン](#button)

これはOpenCM9.04ボードに内蔵されているBUTTONテストです。

### [ボタンのテスト例](#test-example-for-button)
OpenCM9.04には押しボタンが1つあります。ピン番号は以下のように定義されており、そのピンのデータを入力すると現在のボタンの状態がわかります。

```
#define BOARD_BUTTON_PIN        23  
```

ボタンの入力状態をシリアルで出力するコードです。内蔵ボタンを使用するためには、ポートをプルダウンに設定する必要があります。

```c++
void setup(){
  Serial.begin(115200);

  pinMode(BOARD_BUTTON_PIN, INPUT_PULLDOWN);
}

void loop(){
  int push_state;

  push_state  = digitalRead(BOARD_BUTTON_PIN)&lt;&lt;0;

  Serial.print("push_state = ");
  Serial.println(push_state, BIN);

  delay(100);
}
```

## [ブザー](#buzzer)

ArduinoトーンAPIを使用してブザーを駆動できます。ブザー対応のピンは、OpenCM 9.04のすべてのI/Oピンで利用可能です。

### [ブザーとの接続](#connection-with-buzzer)

![](/assets/images/parts/controller/opencm904/buzzer_bb.png)


### [ブザー用のArduinoコード](#arduino-code-for-buzzer)
以下の例は、Arduinoが提供する基調の例で、ブザーを使ってメロディを演奏する場合のブザー端子を変更したものです。

```c++
#include "pitches.h"

int buzzer_pin = A0;

// notes in the melody:
int melody[] = {
  NOTE_C4, NOTE_G3, NOTE_G3, NOTE_A3, NOTE_G3, 0, NOTE_B3, NOTE_C4
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  4, 8, 8, 4, 4, 4, 4, 4
};

void setup() {
  // iterate over the notes of the melody:
  for (int thisNote = 0; thisNote < 8; thisNote++) {

    // to calculate the note duration, take one second
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 1000 / noteDurations[thisNote];
    tone(buzzer_pin, melody[thisNote], noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(buzzer_pin);
  }
}
```

## [PWM](#pwm)

OpenCM9.04ボードのピンからのPWM出力テストです。

### [PWMのテスト例](#test-example-for-pwm)

PWMのデューティ比を対応するポートに出力するために使用するanalogueWriteです。分解能は0から255までの8ビットで、周波数は10KHzです。   
OpenCM9.04では全部で13本のPWMピンがあります。これは6本のピンにPWMを出力した例です。  


```c++
/*
 * PWM Pins : 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
 */

int pwm_pins[6] = { 2, 3, 4, 5, 6, 7 };

void setup() {
  // put your setup code here, to run once:
}

void loop() {
  // put your main code here, to run repeatedly:
  int i;
  static uint8_t pwm_out = 0;

  for( i=0; i<6; i++ )
  {
    analogWrite(pwm_pins[i], pwm_out++);
  }
  delay(100);
}
```

## [EEPROM](#eeprom)

OpenCM9.04ボードのEEPROMライブラリテストです。

### [テスト](#test)

OpenCM9.04はEEPROMメモリを持っていないので、STM32F103に内蔵されているフラッシュメモリの一部をEEPROMでエミュレートします。  
エミュレーションの方法はSTから例として提供されたものです。  
EEPROMとして使用する領域は、以下のように0x0801F800～0x08020000（2KBytes）です。セクターが2つ使用されています。


![](/assets/images/parts/controller/opencm904/memory_map.png)

32ビットは1つのデータを格納するためのもので、下位16ビットは格納するデータ、上位16ビットは対応するデータのアドレスを示しています。データを保存する際には、常に新しい場所に保存されます。データ保存中に１ページを使用した場合、保存したページの最新値のみが新しいページにコピーされ、既存のページは削除されます。  
その結果、フラッシュメモリの消去回数が減り、書き込み寿命が延びます。

![](/assets/images/parts/controller/opencm904/ex_eeprom_02.png)

![](/assets/images/parts/controller/opencm904/ex_eeprom_03.png)

EEPROMライブラリを使用するにはヘッダを追加する必要があり、現在のEEPROMの最大サイズは512バイトです。EEPROMライブラリはArduinoでサポートされているものを移植しているため、基本的な使用方法は他の既存のArduinoボードで使用されているものと同じです。詳しい使い方はArduinoのサイトを参照してください。

[https://www.arduino.cc/en/Reference/EEPROM](https://www.arduino.cc/en/Reference/EEPROM)

```c++
#include <EEPROM.h>
```

```c++
#include <EEPROM.h>

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  uint32_t tTime;
  static int i = 0;


  if( (millis()-tTime) > 100 )
  {
    Serial.print(EEPROM.read(0));
    Serial.print("\t");
    Serial.print(EEPROM.read(1));
    Serial.print("\t");
    Serial.print(EEPROM.read(2));
    Serial.println("\t");

    tTime = millis();
  }

  if (Serial.available())
  {
    uint8_t inByte = Serial.read();

    if( inByte == '1' )
    {
      EEPROM.write(0, i+1);
      EEPROM.write(1, i+2);
      EEPROM.write(2, i+3);
      i++;
    }
  }
}
```

## [DYNAMIXELWorkbench](#dynamixelworkbench)

- [DYNAMIXEL Workbench examples](/docs/en/software/dynamixel/dynamixel_workbench/#opencr-and-opencm-tutorials)

## [サーボ](#servo)

- サーボライブラリは、RC用のRCサーボを駆動するために使用されます。
- RCサーボライブラリは、OpenCM9.04のハードウェアタイマを使用しており、PWM出力ピンに接続することで使用することができます。
- A2～D14ピンはPWM出力ピンです。
- サーボライブラリを利用する際には、ハードウェアタイマーを利用した他の機能を同時に利用することができないので注意が必要です。
- 使用しているハードウェアとチャンネルは、以下のリストを参照してください。

```c++
{GPIOA, GPIO_PIN_0,   &hADC1,   ADC_CHANNEL_0 , &hTIM2 ,   TIM_CHANNEL_1, 2       },  // 2
{GPIOA, GPIO_PIN_1,   &hADC1,   ADC_CHANNEL_1 , &hTIM2 ,   TIM_CHANNEL_2, 3       },  // 3
{GPIOA, GPIO_PIN_2,   &hADC1,   ADC_CHANNEL_2 , &hTIM2 ,   TIM_CHANNEL_3, 4       },  // 4
{GPIOA, GPIO_PIN_3,   &hADC1,   ADC_CHANNEL_3 , &hTIM2 ,   TIM_CHANNEL_4, 5       },  // 5
{GPIOA, GPIO_PIN_6,   &hADC1,   ADC_CHANNEL_6 , &hTIM3 ,   TIM_CHANNEL_1, 6       },  // 6
{GPIOA, GPIO_PIN_7,   &hADC1,   ADC_CHANNEL_7 , &hTIM3 ,   TIM_CHANNEL_2, 7       },  // 7
{GPIOB, GPIO_PIN_0,   &hADC1,   ADC_CHANNEL_8 , &hTIM3 ,   TIM_CHANNEL_3, 8       },  // 8
{GPIOB, GPIO_PIN_1,   &hADC1,   ADC_CHANNEL_9 , &hTIM3 ,   TIM_CHANNEL_4, 9       },  // 9

{GPIOA, GPIO_PIN_8,   NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_1, 10      },  // 10
{GPIOA, GPIO_PIN_9,   NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_2, 11      },  // 11
{GPIOA, GPIO_PIN_10,  NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_3, 12      },  // 12
{GPIOB, GPIO_PIN_8,   NULL,     NO_ADC        , &hTIM4 ,   TIM_CHANNEL_3, 13      },  // 13
{GPIOB, GPIO_PIN_9,   NULL,     NO_ADC        , &hTIM4 ,   TIM_CHANNEL_4, 14      },  // 14 LED
```

### [サーボとの接続](#connection-with-servo)

![](/assets/images/parts/controller/opencm904/servo_bb.png)

### [サーボ用Arduinoコード](#arduino-code-for-servo)
これは、サーボライブラリの例で、OpenCM9.04のA2ピンを使用しています。入力値の範囲は、0度から180度です。

```c++
#include <Servo.h>

Servo myservo;  // create servo object to control a servo

void setup() {
  myservo.attach(A2);  // attaches the servo on pin 2 to the servo object
}

void loop() {  
  myservo.write(0);                    // sets the servo position according to the scaled value
  delay(1000);                         // waits for the servo to get there
  myservo.write(180);                  // sets the servo position according to the scaled value
  delay(1000);                         // waits for the servo to get there
}
```

## [SDカード](#sd-card)

Arduino IDEは、SPIライブラリを使ったSDカード制御ライブラリが含まれています。OpenCM 9.04ではデフォルトのSDライブラリをサポートしています。

### [SDカードとの接続](#connection-with-sd-card)

- SDカード接続(SPIポート)

  ![](/assets/images/parts/controller/opencm904/sdcard_bb.png)

### [SDカード用Arduinoコード](#arduino-code-for-sd-card)
SDカードライブラリからのcardInfoの例では、SDカードの初期化後のファイルリストを表示しています。OpenCM9.04のSPI1を使用し、CSピンを4番として使用しています。

```c++
// include the SD library:
#include <SPI.h>
#include <SD.h>

// set up variables using the SD utility library functions:
Sd2Card card;
SdVolume volume;
SdFile root;

// change this to match your SD shield or module;
// Arduino Ethernet shield: pin 4
// Adafruit SD shields and modules: pin 10
// Sparkfun SD shield: pin 8
// MKRZero SD: SDCARD_SS_PIN
const int chipSelect = 4;

void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  Serial.print("\nInitializing SD card...");

  // we'll use the initialization code from the utility libraries
  // since we're just testing if the card is working!
  if (!card.init(SPI_HALF_SPEED, chipSelect)) {
    Serial.println("initialization failed. Things to check:");
    Serial.println("* is a card inserted?");
    Serial.println("* is your wiring correct?");
    Serial.println("* did you change the chipSelect pin to match your shield or module?");
    return;
  } else {
    Serial.println("Wiring is correct and a card is present.");
  }

  // print the type of card
  Serial.print("\nCard type: ");
  switch (card.type()) {
    case SD_CARD_TYPE_SD1:
      Serial.println("SD1");
      break;
    case SD_CARD_TYPE_SD2:
      Serial.println("SD2");
      break;
    case SD_CARD_TYPE_SDHC:
      Serial.println("SDHC");
      break;
    default:
      Serial.println("Unknown");
  }

  // Now we will try to open the 'volume'/'partition' - it should be FAT16 or FAT32
  if (!volume.init(card)) {
    Serial.println("Could not find FAT16/FAT32 partition.\nMake sure you've formatted the card");
    return;
  }

  // print the type and size of the first FAT-type volume
  uint32_t volumesize;
  Serial.print("\nVolume type is FAT");
  Serial.println(volume.fatType(), DEC);
  Serial.println();

  volumesize = volume.blocksPerCluster();    // clusters are collections of blocks
  volumesize *= volume.clusterCount();       // we'll have a lot of clusters
  volumesize *= 512;                            // SD card blocks are always 512 bytes
  Serial.print("Volume size (bytes): ");
  Serial.println(volumesize);
  Serial.print("Volume size (Kbytes): ");
  volumesize /= 1024;
  Serial.println(volumesize);
  Serial.print("Volume size (Mbytes): ");
  volumesize /= 1024;
  Serial.println(volumesize);

  Serial.println("\nFiles found on the card (name, date and size in bytes): ");
  root.openRoot(volume);

  // list all files in the card with date and size
  root.ls(LS_R | LS_DATE | LS_SIZE);
}

void loop(void) {

}
```

## [MS5540S](#ms5540s)

MS5540Sは、水圧を測定できるセンサーで、水圧を測定することで水中の水深を計算することができます。SPI通信を使用しています。

### [MS5540Sとの接続](#connection-with-ms5540s)

| MS5540S | OpenCM9.04 | etc       |
|:--------|:-----------|:----------|
| VCC     | 3.3V       |           |
| GND     | GND        |           |
| MCLK    | D13        | 32.768Khz |
| DIN     | A7         | MOSI      |
| DOUT    | A6         | MISO      |
| SCLK    | A1         | SCK       |

### [MS5540S用Arduinoコード](#arduino-code-for-ms5540s)
OpenCM9.04のSPI1を使用し、MS5540SセンサーのMCLKに32.768Khzのクロックを入力します。OpenCM9.04のPWMピンの周波数を調整できるanalogWriteFreq機能で32.768KHzのクロックを生成します。

```c++
#include <SPI.h>

float water_depth;
float water_temp;

void ms5540s_reset();
void ms5540s_setup();
void ms5540s_loop();

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  ms5540s_setup();
}

void loop() {
  // put your main code here, to run repeatedly:
  static uint32_t pre_time[2];

  if( (millis() - pre_time[0]) >= 10 )
  {
    pre_time[0] = millis();
    ms5540s_loop();
  }

  if( (millis() - pre_time[1]) >= 100 )
  {
    pre_time[1] = millis();
    Serial.print(water_depth);
    Serial.print(" m\t");
    Serial.print(water_temp);
    Serial.println(" 'C");       
  }  
}

////////////////////////////////////////////
// MS5540S
////////////////////////////////////////////

#define FRESH_WATER  1000.0 // [kg/m^3]
#define SEA_WATER    1030.0 // [kg/m^3]


const int clock = 13;

const float water_type = SEA_WATER;
const int get_interval = 35;
static int ms5540s_state = 0;

float g;
float latitude = 37.0;
float lat_rad = ((37.0/57.29578) * PI / 180);
float x = sin(lat_rad)*sin(lat_rad);

/*---------------------------------------------------------------------------
     TITLE   : ms5540s_reset
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void ms5540s_reset() //this function keeps the sketch a little shorter
{
 SPI.setDataMode(SPI_MODE0);
 SPI.transfer(0x15);
 SPI.transfer(0x55);
 SPI.transfer(0x40);
}

/*---------------------------------------------------------------------------
     TITLE   : ms5540s_setup
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void ms5540s_setup() {
 SPI.begin(); //see SPI library details on arduino.cc for details
 SPI.setBitOrder(MSBFIRST);
 SPI.setClockDivider(SPI_CLOCK_DIV32); //divide 16 MHz to communicate on 500 kHz
 pinMode(clock, OUTPUT);
 analogWriteFreq(clock, 32768);
 delay(100);
}

/*---------------------------------------------------------------------------
     TITLE   : ms5540s_loop
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void ms5540s_loop()
{
  static uint32_t tTime;

  unsigned int word1 = 0;
  unsigned int word11 = 0;
  unsigned int word2 = 0;
  unsigned int word3 = 0;
  byte word22 = 0;
  byte word33 = 0;
  unsigned int word4 = 0;
  byte word44 = 0;
  static long c1;
  static long c2;
  static long c3;
  static long c4;
  static long c5;
  static long c6;
  unsigned int presMSB = 0; //first byte of value
  unsigned int presLSB =0; //last byte of value
  static unsigned int D1 = 0;
  unsigned int tempMSB = 0; //first byte of value
  unsigned int tempLSB = 0; //last byte of value
  static unsigned int D2 = 0;
  long UT1 = 0;
  long dT = 0;
  long TEMP = 0;
  long OFF = 0;
  long SENS = 0;

  float p;
  static long PCOMP = 0;
  static long PCOMP2 = 0;
  static long PH2 = 0;
  static float TEMPREAL = 0;
  static float DEPTH = 0;

  long dT2 = 0;
  static float TEMPCOMP = 0;

  bool ret = false;

//////////////////////////////////////////
  switch( ms5540s_state )
  {
    case 0:      
      analogWrite (clock, 128) ;
      ms5540s_reset();//resets the sensor - caution: afterwards mode = SPI_MODE0!
      //Calibration word 1
      word1 = 0;
      word11 = 0;
      SPI.transfer(0x1D); //send first byte of command to get calibration word 1
      SPI.transfer(0x50); //send second byte of command to get calibration word 1
      SPI.setDataMode(SPI_MODE1); //change mode in order to listen
      word1 = SPI.transfer(0x00); //send dummy byte to read first byte of word
      word1 = word1 << 8; //shift returned byte
      word11 = SPI.transfer(0x00); //send dummy byte to read second byte of word
      word1 = word1 | word11; //combine first and second byte of word
      ms5540s_reset();//resets the sensor
      //Calibration word 2; see comments on calibration word 1
      word2 = 0;
      word22 = 0;
      SPI.transfer(0x1D);
      SPI.transfer(0x60);
      SPI.setDataMode(SPI_MODE1);
      word2 = SPI.transfer(0x00);
      word2 = word2 <<8;
      word22 = SPI.transfer(0x00);
      word2 = word2 | word22;
      ms5540s_reset();//resets the sensor
      //Calibration word 3; see comments on calibration word 1
      word3 = 0;
      word33 = 0;
      SPI.transfer(0x1D);
      SPI.transfer(0x90);
      SPI.setDataMode(SPI_MODE1);
      word3 = SPI.transfer(0x00);
      word3 = word3 <<8;
      word33 = SPI.transfer(0x00);
      word3 = word3 | word33;
      ms5540s_reset();//resets the sensor
      //Calibration word 4; see comments on calibration word 1
      word4 = 0;
      word44 = 0;
      SPI.transfer(0x1D);
      SPI.transfer(0xA0);
      SPI.setDataMode(SPI_MODE1);
      word4 = SPI.transfer(0x00);
      word4 = word4 <<8;
      word44 = SPI.transfer(0x00);
      word4 = word4 | word44;
////////////////////////////////////////////////////////////////////

      c1 = (word1 >> 1);
      c2 = ((word3 & 0x3F) << 6) | ((word4 & 0x3F));
      c3 = (word4 >> 6);
      c4 = (word3 >> 6);
      c5 = (word2 >> 6) | ((word1 & 0x1) << 10);
      c6 = (word2 & 0x3F);
      ms5540s_reset();//resets the sensor

      //Temperature:
      SPI.transfer(0x0F); //send first byte of command to get temperature value
      SPI.transfer(0x20); //send second byte of command to get temperature value

      tTime = millis();
      ms5540s_state = 1;
      break;

    case 1:
      if( (millis()-tTime) >= get_interval )
      {
        ms5540s_state = 2;
      }
      break;

    case 2:
      SPI.setDataMode(SPI_MODE1); //change mode in order to listen
      tempMSB = SPI.transfer(0x00); //send dummy byte to read first byte of value
      tempMSB = tempMSB << 8; //shift first byte
      tempLSB = SPI.transfer(0x00); //send dummy byte to read second byte of value
      D2 = tempMSB | tempLSB; //combine first and second byte of value
      ms5540s_reset();//resets the sensor

     //Pressure:
      SPI.transfer(0x0F); //send first byte of command to get pressure value
      SPI.transfer(0x40); //send second byte of command to get pressure value

      tTime = millis();
      ms5540s_state = 3;
      break;

    case 3:
      if( (millis()-tTime) >= get_interval )
      {
        ms5540s_state = 4;
      }
      break;

    case 4:
      SPI.setDataMode(SPI_MODE1); //change mode in order to listen
      presMSB = SPI.transfer(0x00); //send dummy byte to read first byte of value
      presMSB = presMSB << 8; //shift first byte
      presLSB = SPI.transfer(0x00); //send dummy byte to read second byte of value
      D1 = presMSB | presLSB;   

      UT1 = (c5 * 8) + 20224;   //calculate calibration temperature
      //calculate actual temperature
      dT =(D2 - UT1);
      TEMP = 200 + ((dT * (c6 + 50))/1024);
      //TEMP = 20 + (dT * c6);
      //calculate temperature compensated pressure
      OFF = (c2*4) + (((c4 - 512) * dT)/4096);
      SENS = c1 + ((c3 * dT)/1024) + 24576;

      //0.1 mbar resolution
      PCOMP = ((((((SENS * (D1 - 7168))/16384)- OFF)*10)/32)+(250*10))/10;

      if(PCOMP > 1000)
      {
       PH2 = (-5*((PCOMP-1000)*(PCOMP-1000)))/(1<<19);
      }
      else
      {
        PH2 = 0;
      }
      PCOMP2 = PCOMP - PH2;

       // smaller than 1atm (1,013.25 hPa)
      //if(PCOMP2 < 1013.25) PCOMP2 = 0;

      TEMPREAL = TEMP/10;

      dT2 = dT - ((dT >> 7 * dT >> 7) >> 3);
      TEMPCOMP = (200 + (dT2*(c6+100) >>11))/10;

      if(water_type == FRESH_WATER)
      {
        DEPTH = PCOMP2 * 1.019716 / 1000;   // 1000mb = bar
      }
      else
      {
        g = 9.780318*(1.0 + ((5.2788*1/1000) + 2.36*1/100000 * x)*x) + (1.092*1/1000000*PCOMP2);
        DEPTH = (((((-1.82*1/1000000000000000)*PCOMP2 + (2.279*1/10000000000))*PCOMP2 - (2.2512*1/100000))*PCOMP2 + 9.72659)*PCOMP2)/g;
      }  

      water_depth = DEPTH;
      water_temp  = TEMPCOMP;
/*
      Serial.print("Pressure : ");      
      Serial.print(PCOMP);
      Serial.println(" mb(millibar)");   
      Serial.print("Temperature : ");      
      Serial.print(TEMPCOMP);
      Serial.println(" 'C");   
      Serial.print("WaterDepth : ");      
      Serial.print(DEPTH);
      Serial.println(" m");   
      Serial.println();
*/
      ret = true;
      ms5540s_state = 0;
      break;

    default:
      ms5540s_state = 0;
      break;
  }
}
```

## [MPU6050 DMP](#mpu6050-dmp)

MPU6050は、3軸の加速度/3軸のジャイロで構成されているセンサです。MPU6050にDMPと呼ばれる専用プロセッサを使用した場合、
MPU6050はロール/ピッチ/ヨーを得るためのセンサフュージョン処理を行います。

### [MPU6050 DMPとの接続](#connection-with-mpu6050-dmp)

| MPU6050 | OpenCM9.04 | etc  |
|:--------|:-----------|:-----|
| VCC     | 5V         |      |
| GND     | GND        |      |
| SCL     | D24        | I2C2 |
| SDA     | D25        | I2C2 |
| INT     | A2         |      |

### [MPU6050 DMP用のArduinoコード](#arduino-code-for-mpu6050-dmp)
MPU6050のDMP機能を有効にして、ロール/ピッチ/ヨーの値を50ミリ秒ごとにシリアルで出力します。ソースコードは以下からダウンロードできます。

- ソースコード ダウンロードリンク
  [https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Exam_MPU6050.zip](https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Exam_MPU6050.zip)

```c++
#include "mpu.h"

MPU6050 mpu;

void setup()
{
  Serial.begin(115200);

  dmpDataReady();
  dmp_setup();
}

void loop()
{
  static uint32_t tTime[4];

  dmp_loop();

  if( (millis() - tTime[2]) >= 50 )
  {
    tTime[2] = millis();
    Serial.print("roll : ");
    Serial.print(String(roll, 2));
    Serial.print("  pitch : ");
    Serial.print(String(pitch, 2));
    Serial.print("  yaw : ");
    Serial.println(String(yaw, 2));
  }  
}

////////////////////////////////////////
//        IMU
/////////////////////////////////////////
/*---------------------------------------------------------------------------
     TITLE   : dmpDataReady
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void dmpDataReady() {
    mpuInterrupt = true;
}

/*---------------------------------------------------------------------------
     TITLE   : dmp_setup
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void dmp_setup() {
    I2Cdev::begin(400);

    // initialize device
    Serial.println(F("Initializing I2C devices..."));
    mpu.initialize();
    pinMode(INTERRUPT_PIN, INPUT);

    // verify connection
    Serial.println(F("Testing device connections..."));
    Serial.println(mpu.testConnection() ? F("MPU6050 connection successful") : F("MPU6050 connection failed"));

    // wait for ready
    Serial.println(F("\nSend any character to begin DMP programming and demo: "));
  //  while (Serial.available() && Serial.read()); // empty buffer
  //  while (!Serial.available());                 // wait for data
  //  while (Serial.available() && Serial.read()); // empty buffer again

    // load and configure the DMP
    Serial.println(F("Initializing DMP..."));
    devStatus = mpu.dmpInitialize();

    // supply your own gyro offsets here, scaled for min sensitivity
    //mpu.setXGyroOffset(220);
    //mpu.setYGyroOffset(76);
    //mpu.setZGyroOffset(-85);
    //mpu.setZAccelOffset(1788); // 1688 factory default for my test chip

    // make sure it worked (returns 0 if so)
    if (devStatus == 0) {
        // turn on the DMP, now that it's ready
        Serial.println(F("Enabling DMP..."));
        mpu.setDMPEnabled(true);

        // enable Arduino interrupt detection
        Serial.println(F("Enabling interrupt detection (Arduino external interrupt 0)..."));
        attachInterrupt(digitalPinToInterrupt(INTERRUPT_PIN), dmpDataReady, RISING);
        mpuIntStatus = mpu.getIntStatus();

        // set our DMP Ready flag so the main loop() function knows it's okay to use it
        Serial.println(F("DMP ready! Waiting for first interrupt..."));
        dmpReady = true;

        // get expected DMP packet size for later comparison
        packetSize = mpu.dmpGetFIFOPacketSize();
    } else {
        // ERROR!
        // 1 = initial memory load failed
        // 2 = DMP configuration updates failed
        // (if it's going to break, usually the code will be 1)
        Serial.print(F("DMP Initialization failed (code "));
        Serial.print(devStatus);
        Serial.println(F(")"));
    }
}

/*---------------------------------------------------------------------------
     TITLE   : dmp_loop
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void dmp_loop() {
    // if programming failed, don't try to do anything
    if (!dmpReady) return;

    // wait for MPU interrupt or extra packet(s) available
    if (!mpuInterrupt && fifoCount < packetSize) return;

    // reset interrupt flag and get INT_STATUS byte
    mpuInterrupt = false;
    mpuIntStatus = mpu.getIntStatus();

    // get current FIFO count
    fifoCount = mpu.getFIFOCount();

    // check for overflow (this should never happen unless our code is too inefficient)
    if ((mpuIntStatus & 0x10) || fifoCount == 1024) {
        // reset so we can continue cleanly
        mpu.resetFIFO();
      //  Serial.println(F("FIFO overflow!"));

    // otherwise, check for DMP data ready interrupt (this should happen frequently)
    } else if (mpuIntStatus & 0x02) {
        // wait for correct available data length, should be a VERY short wait
        while (fifoCount < packetSize) fifoCount = mpu.getFIFOCount();

        // read a packet from FIFO
        mpu.getFIFOBytes(fifoBuffer, packetSize);

        // track FIFO count here in case there is > 1 packet available
        // (this lets us immediately read more without waiting for an interrupt)
        fifoCount -= packetSize;

        // display Euler angles in degrees
        mpu.dmpGetQuaternion(&q, fifoBuffer);
        mpu.dmpGetGravity(&gravity, &q);
        mpu.dmpGetYawPitchRoll(ypr, &q, &gravity);

        // store roll, pitch, yaw
        yaw = ypr[0] * 180/M_PI;
        roll = ypr[1] * 180/M_PI;
        pitch = ypr[2] * 180/M_PI;                       
    }
}
```

## [0.96" OLED LCD](#096-oled-lcd)

0.96インチの有機ELモノクロ液晶です。解像度は128x64で、Adafruit_GFX_Libraryライブラリを使用して制御します。

![](/assets/images/parts/controller/opencm904/AD304-2T.jpg)

### [LCDとの接続](#connection-with-lcd)

| OLED | OpenCM9.04 | etc  |
|:-----|:-----------|:-----|
| VCC  | 3.3V       |      |
| GND  | GND        |      |
| SCK  | D24        | I2C2 |
| SDA  | D25        | I2C2 |


### [LCD用のArduinoコード](#arduino-code-for-lcd)
MPU6050のDMP機能を有効にして、ロール/ピッチ/ヨーの値を50ミリ秒ごとにシリアルで出力します。ソースコードは以下からダウンロードできます。


- ライブラリを`ダウンロード`します。以下の2つのライブラリを Document > Arduino > libraries フォルダにコピーして解答します。
  [https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Adafruit_GFX_Library.zip](https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Adafruit_GFX_Library.zip)  
  [https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Adafruit_SSD1306.zip](https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Adafruit_SSD1306.zip)

- ソースコードを`ダウンロード`します。ダウンロードしたソースコードを解凍し、Arduino IDEから File > Open で開きます。
  [https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Exam_ssd1306_128x64_i2c.zip](https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Exam_ssd1306_128x64_i2c.zip)

```c++
/*********************************************************************
This is an example for our Monochrome OLEDs based on SSD1306 drivers

  Pick one up today in the adafruit shop!
  ------> http://www.adafruit.com/category/63_98

This example is for a 128x64 size display using I2C to communicate
3 pins are required to interface (2 I2C and one reset)

Adafruit invests time and resources providing this open source code,
please support Adafruit and open-source hardware by purchasing
products from Adafruit!

Written by Limor Fried/Ladyada  for Adafruit Industries.  
BSD license, check license.txt for more information
All text above, and the splash screen must be included in any redistribution
*********************************************************************/

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define OLED_RESET 4
Adafruit_SSD1306 display(-1);

#define NUMFLAKES 10
#define XPOS 0
#define YPOS 1
#define DELTAY 2

#define LOGO16_GLCD_HEIGHT 16
#define LOGO16_GLCD_WIDTH  16
static const unsigned char PROGMEM logo16_glcd_bmp[] =
{ B00000000, B11000000,
  B00000001, B11000000,
  B00000001, B11000000,
  B00000011, B11100000,
  B11110011, B11100000,
  B11111110, B11111000,
  B01111110, B11111111,
  B00110011, B10011111,
  B00011111, B11111100,
  B00001101, B01110000,
  B00011011, B10100000,
  B00111111, B11100000,
  B00111111, B11110000,
  B01111100, B11110000,
  B01110000, B01110000,
  B00000000, B00110000 };

#if (SSD1306_LCDHEIGHT != 64)
#error("Height incorrect, please fix Adafruit_SSD1306.h!");
#endif

void setup()   {                
  Serial.begin(9600);

  // by default, we'll generate the high voltage from the 3.3v line internally! (neat!)
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);  // initialize with the I2C addr 0x3D (for the 128x64)
  // init done

  // Show image buffer on the display hardware.
  // Since the buffer is intialized with an Adafruit splashscreen
  // internally, this will display the splashscreen.
  display.display();
  delay(2000);

  // Clear the buffer.
  display.clearDisplay();

  // draw a single pixel
  display.drawPixel(10, 10, WHITE);
  // Show the display buffer on the hardware.
  // NOTE: You _must_ call display after making any drawing commands
  // to make them visible on the display hardware!
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw many lines
  testdrawline();
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw rectangles
  testdrawrect();
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw multiple rectangles
  testfillrect();
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw mulitple circles
  testdrawcircle();
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw a white circle, 10 pixel radius
  display.fillCircle(display.width()/2, display.height()/2, 10, WHITE);
  display.display();
  delay(2000);
  display.clearDisplay();

  testdrawroundrect();
  delay(2000);
  display.clearDisplay();

  testfillroundrect();
  delay(2000);
  display.clearDisplay();

  testdrawtriangle();
  delay(2000);
  display.clearDisplay();

  testfilltriangle();
  delay(2000);
  display.clearDisplay();

  // draw the first ~12 characters in the font
  testdrawchar();
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw scrolling text
  testscrolltext();
  delay(2000);
  display.clearDisplay();

  // text display tests
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0,0);
  display.println("Hello, world!");
  display.setTextColor(BLACK, WHITE); // 'inverted' text
  display.println(3.141592);
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.print("0x"); display.println(0xDEADBEEF, HEX);
  display.display();
  delay(2000);
  display.clearDisplay();

  // miniature bitmap display
  display.drawBitmap(30, 16,  logo16_glcd_bmp, 16, 16, 1);
  display.display();
  delay(1);

  // invert the display
  display.invertDisplay(true);
  delay(1000);
  display.invertDisplay(false);
  delay(1000);
  display.clearDisplay();

  // draw a bitmap icon and 'animate' movement
  testdrawbitmap(logo16_glcd_bmp, LOGO16_GLCD_HEIGHT, LOGO16_GLCD_WIDTH);
}

void loop() {

}

void testdrawbitmap(const uint8_t *bitmap, uint8_t w, uint8_t h) {
  uint8_t icons[NUMFLAKES][3];

  // initialize
  for (uint8_t f=0; f< NUMFLAKES; f++) {
    icons[f][XPOS] = random(display.width());
    icons[f][YPOS] = 0;
    icons[f][DELTAY] = random(5) + 1;

    Serial.print("x: ");
    Serial.print(icons[f][XPOS], DEC);
    Serial.print(" y: ");
    Serial.print(icons[f][YPOS], DEC);
    Serial.print(" dy: ");
    Serial.println(icons[f][DELTAY], DEC);
  }

  while (1) {
    // draw each icon
    for (uint8_t f=0; f< NUMFLAKES; f++) {
      display.drawBitmap(icons[f][XPOS], icons[f][YPOS], bitmap, w, h, WHITE);
    }
    display.display();
    delay(200);

    // then erase it + move it
    for (uint8_t f=0; f< NUMFLAKES; f++) {
      display.drawBitmap(icons[f][XPOS], icons[f][YPOS], bitmap, w, h, BLACK);
      // move it
      icons[f][YPOS] += icons[f][DELTAY];
      // if its gone, reinit
      if (icons[f][YPOS] > display.height()) {
        icons[f][XPOS] = random(display.width());
        icons[f][YPOS] = 0;
        icons[f][DELTAY] = random(5) + 1;
      }
    }
   }
}

void testdrawchar(void) {
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0,0);

  for (uint8_t i=0; i < 168; i++) {
    if (i == '\n') continue;
    display.write(i);
    if ((i > 0) && (i % 21 == 0))
      display.println();
  }    
  display.display();
  delay(1);
}

void testdrawcircle(void) {
  for (int16_t i=0; i<display.height(); i+=2) {
    display.drawCircle(display.width()/2, display.height()/2, i, WHITE);
    display.display();
    delay(1);
  }
}

void testfillrect(void) {
  uint8_t color = 1;
  for (int16_t i=0; i<display.height()/2; i+=3) {
    // alternate colors
    display.fillRect(i, i, display.width()-i*2, display.height()-i*2, color%2);
    display.display();
    delay(1);
    color++;
  }
}

void testdrawtriangle(void) {
  for (int16_t i=0; i<min(display.width(),display.height())/2; i+=5) {
    display.drawTriangle(display.width()/2, display.height()/2-i,
                     display.width()/2-i, display.height()/2+i,
                     display.width()/2+i, display.height()/2+i, WHITE);
    display.display();
    delay(1);
  }
}

void testfilltriangle(void) {
  uint8_t color = WHITE;
  for (int16_t i=min(display.width(),display.height())/2; i>0; i-=5) {
    display.fillTriangle(display.width()/2, display.height()/2-i,
                     display.width()/2-i, display.height()/2+i,
                     display.width()/2+i, display.height()/2+i, WHITE);
    if (color == WHITE) color = BLACK;
    else color = WHITE;
    display.display();
    delay(1);
  }
}

void testdrawroundrect(void) {
  for (int16_t i=0; i<display.height()/2-2; i+=2) {
    display.drawRoundRect(i, i, display.width()-2*i, display.height()-2*i, display.height()/4, WHITE);
    display.display();
    delay(1);
  }
}

void testfillroundrect(void) {
  uint8_t color = WHITE;
  for (int16_t i=0; i<display.height()/2-2; i+=2) {
    display.fillRoundRect(i, i, display.width()-2*i, display.height()-2*i, display.height()/4, color);
    if (color == WHITE) color = BLACK;
    else color = WHITE;
    display.display();
    delay(1);
  }
}

void testdrawrect(void) {
  for (int16_t i=0; i<display.height()/2; i+=2) {
    display.drawRect(i, i, display.width()-2*i, display.height()-2*i, WHITE);
    display.display();
    delay(1);
  }
}

void testdrawline() {  
  for (int16_t i=0; i<display.width(); i+=4) {
    display.drawLine(0, 0, i, display.height()-1, WHITE);
    display.display();
    delay(1);
  }
  for (int16_t i=0; i<display.height(); i+=4) {
    display.drawLine(0, 0, display.width()-1, i, WHITE);
    display.display();
    delay(1);
  }
  delay(250);

  display.clearDisplay();
  for (int16_t i=0; i<display.width(); i+=4) {
    display.drawLine(0, display.height()-1, i, 0, WHITE);
    display.display();
    delay(1);
  }
  for (int16_t i=display.height()-1; i>=0; i-=4) {
    display.drawLine(0, display.height()-1, display.width()-1, i, WHITE);
    display.display();
    delay(1);
  }
  delay(250);

  display.clearDisplay();
  for (int16_t i=display.width()-1; i>=0; i-=4) {
    display.drawLine(display.width()-1, display.height()-1, i, 0, WHITE);
    display.display();
    delay(1);
  }
  for (int16_t i=display.height()-1; i>=0; i-=4) {
    display.drawLine(display.width()-1, display.height()-1, 0, i, WHITE);
    display.display();
    delay(1);
  }
  delay(250);

  display.clearDisplay();
  for (int16_t i=0; i<display.height(); i+=4) {
    display.drawLine(display.width()-1, 0, 0, i, WHITE);
    display.display();
    delay(1);
  }
  for (int16_t i=0; i<display.width(); i+=4) {
    display.drawLine(display.width()-1, 0, i, display.height()-1, WHITE);
    display.display();
    delay(1);
  }
  delay(250);
}

void testscrolltext(void) {
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(10,0);
  display.clearDisplay();
  display.println("scroll");
  display.display();
  delay(1);

  display.startscrollright(0x00, 0x0F);
  delay(2000);
  display.stopscroll();
  delay(1000);
  display.startscrollleft(0x00, 0x0F);
  delay(2000);
  display.stopscroll();
  delay(1000);    
  display.startscrolldiagright(0x00, 0x07);
  delay(2000);
  display.startscrolldiagleft(0x00, 0x07);
  delay(2000);
  display.stopscroll();
}
```

### [ビデオ](#video)

<iframe width="560" height="315" src="https://www.youtube.com/embed/0E4cu4GE17k" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

# [ダウンロード](#downloads)

- `ZIPダウンロード` [OpenCM 9.04 Manual]
- `PDFダウンロード` [PCB Schematic]
- `PDFダウンロード` [Top Gerber]
- `PDFダウンロード` [Bottom Gerber]
- `PDFダウンロード` [Gerber]
- `ソフトウェア ダウンロードリンク` [Arduino IDE]
- `ソフトウェア ダウンロードリンク` [OpenCM IDE]

# [参考](#references)

## [リカバリーモード](#recovery-mode)

- ファームウェアが壊れて動かない場合は、Roboplus Manager1.0/2.0からデフォルトのファームウェアを強制的にダウンロードすることができます。スケッチは、Arduino IDE, OpenCM IDEからもダウンロードできます。
- OpenCM9.04から他の電源やデバイスの接続を外します。OpenCM9.04のユーザーボタンを押しながら、USBケーブルでボードとPCを直接接続します。

  ![](/assets/images/sw/mobile/mini_firmware_02.jpg)
  > ユーザーボタン

  ![](/assets/images/parts/controller/opencm904/opencm904_08.png)

- 下記のようにリカバリーモードに入ると、緑色のLEDが点灯します。正常にダウンロードが完了すると、ボードはリセットされ、緑色のLEDが消灯します。

  ![](/assets/images/parts/controller/opencm904/recovery_led.jpg)

## [R+Manager2.0 ファームウェアリカバリー](#firmware-recovery)

1. “Firmware Recovery”を選択します。

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_22.jpg)

2. 通知メッセージを確認し、"Next"を押します。

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_23.jpg)

3. OpenCM9.04を選択し、"Next"ボタンを押します。

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_24.jpg)

4. 順番に表示される指示にしたがってください。また、黄色で表示されるメッセージを確認してください。

5. 全ての準備が完了したら、"Next"ボタンを押します。

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_25.jpg)

6. 接続するポートを選択し、"Next"ボタンを押します。

   ![](/assets/images/sw/rplus2/manager/roboplus_manager2_51_2.jpg)

7. デバイスが接続されると、ファームウェアインストールのためのブートローダーが検出されます。アクティブになったら"Next"ボタンを選択します。

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_26.jpg)

8. インストールされているファームウェアの情報を確認し、"Next"ボタンをクリックします。

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_27.jpg)

9. ファームウェアのリカバリーが完了したら、"Finish"ボタンを選択します。

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_28.jpg)

## Dynamixelのチャンネル構成の変更(XM/XH Series)

1. R+Manager2.0を開き、DYNAMIXEL2.0 製品を選択し、"Update & Test"のメニューを選択します。

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_30_en_1.jpg)

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_30_en_2.jpg)

2. OpenCM9.04をLN-101やBT-210、USBケーブル経由でPCと接続します。

3. 以下の手順に従ってOpenCM9.04を検索します。(OpenCM9.04のDYNAMIXELチャンネルの値は、デフォルトでXL-320になっているため、XM/XHは検出されません。)

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_31_en.jpg)

4. 製品の更新が完了すると、コントロールテーブルの画面が開きます。

5. コントロールテーブルの"Dynamixel Channel"の値を"EXP Board(X-Series)"に設定し、"Save"を選択します。

  ![](/assets/images/sw/rplus2/manager/roboplus_manager2_32_en.jpg)

**注意** :EXP Board(X-Series)は、OpenCM 485 EXPを使用する場合に設定してください。
{: .notice--warning}

## [Windowsドライバのインストール](#windows-driver-installation)
- 「Windows用ROBOTIS仮想COMポートのインストール方法」を参照してください。{: .popup} 

## [寸法](#dimension)

![](/assets/images/parts/controller/opencm904/opencm904_28.png)

{% include en/dxl/download_center_notice.md %}

[Windows Driver Installation]: /docs/en/popup/usb_driver_install/
[MOLEX 53253-0370]: https://www.molex.com/molex/products/datasheet.jsp?part=active/0532530370_PCB_HEADERS.xml
[MOLEX 22-03-5035]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0022035035_PCB_HEADERS.xml
[RoboPlus Task]: /docs/en/software/rplus1/task/getting_started/
[RoboPlus Motion]: /docs/en/software/rplus1/motion/
[RoboPlus Manager]: /docs/en/software/rplus1/manager/
[Number of pressed Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[LN-101]: /docs/en/parts/interface/ln-101/
[ZIG-110A]: /docs/en/parts/communication/zig-110/
[BT-110A]: /docs/en/parts/communication/bt-110/
[BT-210]: /docs/en/parts/communication/bt-210/
[BT-410]: /docs/en/parts/communication/bt-410/
[Automatic Turn-off]: /docs/en/software/rplus1/task/programming_02/#powersave-timer
[Firmware Update]: /docs/en/software/rplus1/manager/#firmware-update
[OpenCM 9.04 Manual]: http://www.robotis.com/download/doc/controller/OpenCM9.04_en/OpenCM9.04_manual_en.zip
[PCB Schematic]: http://support.robotis.com/en/baggage_files/opencm/opencm904_rev_10_final_schematic.pdf
[Top Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-top.pdf
[Bottom Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-bottom.pdf
[Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-gerber.pdf
[ROBOTIS-MINI Controller Firmware Update]: /docs/en/edu/mini/#firmware-update
[Arduino IDE]: /docs/en/parts/controller/opencm904/#arduino-ide
[OpenCM IDE]: http://emanual.robotis.com/docs/en/software/opencm_ide/getting_started/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[DYNAMIXELWorkbench]: http://wiki.ros.org/dynamixel_workbench
[Arduino Official Guide]: https://www.arduino.cc/en/Guide/Libraries
[GitHub repository]: https://github.com/ROBOTIS-GIT/Dynamixel2Arduino
[begin()]: /docs/en/popup/arduino_api/begin/
[getPortBaud()]: /docs/en/popup/arduino_api/getPortBaud/
[ping()]: /docs/en/popup/arduino_api/ping/
[scan()]: /docs/en/popup/arduino_api/scan/
[getModelNumber()]: /docs/en/popup/arduino_api/getModelNumber/
[setID()]: /docs/en/popup/arduino_api/setID/
[setProtocol()]: /docs/en/popup/arduino_api/setProtocol/
[setBaudrate()]: /docs/en/popup/arduino_api/setBaudrate/
[torqueOn()]: /docs/en/popup/arduino_api/torqueOn/
[torqueOff()]: /docs/en/popup/arduino_api/torqueOff/
[ledOn()]: /docs/en/popup/arduino_api/ledOn/
[ledOff()]: /docs/en/popup/arduino_api/ledOff/
[setOperatingMode()]: /docs/en/popup/arduino_api/setOperatingMode/
[setGoalPosition()]: /docs/en/popup/arduino_api/setGoalPosition/
[getPresentPosition()]: /docs/en/popup/arduino_api/getPresentPosition/
[setGoalVelocity()]: /docs/en/popup/arduino_api/setGoalVelocity/
[getPresentVelocity()]: /docs/en/popup/arduino_api/getPresentVelocity/
[setGoalPWM()]: /docs/en/popup/arduino_api/setGoalPWM/
[getPresentPWM()]: /docs/en/popup/arduino_api/getPresentPWM/
[setGoalCurrent()]: /docs/en/popup/arduino_api/setGoalCurrent/
[getPresentCurrent()]: /docs/en/popup/arduino_api/getPresentCurrent/
[readControlTableItem()]: /docs/en/popup/arduino_api/readControlTableItem/
[writeControlTableItem()]: /docs/en/popup/arduino_api/writeControlTableItem/
[syncRead()]: /docs/en/popup/arduino_api/syncRead/
[syncWrite()]: /docs/en/popup/arduino_api/syncWrite/
[bulkRead()]: /docs/en/popup/arduino_api/bulkRead/
[bulkWrite()]: /docs/en/popup/arduino_api/bulkWrite/
[getLastLibErrCode()]: /docs/en/popup/arduino_api/getLastLibErrCode/
