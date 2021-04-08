---
layout: archive
lang: en
ref: opencr10
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/opencr10_jp/
sidebar:
  title: OpenCR 1.0
  nav: "opencr10_jp"
---

![](/assets/images/parts/controller/opencr10/opencr_product.png)

> OpenCR 1.0

# [イントロダクション](#イントロダクション)
OpenCR1.0は、完全にオープンソースのハードウェアとソフトウェアを提供するために、ROSの組み込みシステム用に開発されました。  
ボードの回路図、PCBカバー、BOM、TurtleBot3とOP3用のファームウェアのソースコードなど、ボードに関するすべてのものは、ユーザーとROSコミュニティのためにオープンソースライセンスのもとで無料で配布されています。  
OpenCR1.0ボード内のSTM32F7シリーズチップは、浮動小数点演算ユニットを搭載した非常に強力なARM Cortex-M7をベースにしています。  
OpenCR1.0の開発環境は、若い学生向けのArduino IDEやScratchから、エキスパート向けの従来のファームウェア開発まで幅広く対応しています。 

# [仕様表](#仕様表)

| 項目                   | 仕様                                                                                                                                                                                                                              |
|:-----------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| マイクロコントローラー | STM32F746ZGT6 / 32-bit ARM Cortex®-M7 with  FPU (216MHz, 462DMIPS)<br />[Reference Manual], [Datasheet]                                                                                                                           |
| センサー               | (**廃止**) 三軸ジャイロ, 三軸加速度, 三軸磁気センサ (MPU9250)<br /> (**新設**) 三軸ジャイロ, 3軸加速度, デジタルモーションプロセッサー™ (ICM-20648)                                                                               |
| プログラマー           | ARM Cortex 10ピン JTAG/SWD コネクター<br />USBデバイスファームウェア アップグレード (DFU)<br />シリアル                                                                                                                           |
| デジタルI/O            | 32ピン (L 14, R 18) *Arduino connectivity<br />5ピン OLLO x 4<br />GPIO x 18ピン<br />PWM x 6<br />I2C x 1<br />SPI x 1                                                                                                           |
| アナログ入力           | ADCチャンネル (最大 12bit) x 6                                                                                                                                                                                                    |
| 通信ポート             | USB x 1 (マイクロUSBタイプB/USB 2.0/Host/Peripheral/OTG)<br />TTL x 3 ([B3B-EH-A] / DYNAMIXEL)<br />RS485 x 3 ([B4B-E名称H-A] / DYNAMIXEL)<br />UART x 2 ([20010WS-04])<br />CAN x 1 ([20010WS-04])                               |
| LEDとボタン            | LD2 (red/green) : USB通信<br />ユーザーLED x 4 : LD3 (赤), LD4 (緑), LD5 (青)<br />ユーザーボタン  x 2<br />パワーLED : LD1 (赤, 3.3 V 電源オン)<br />リセットボタン x 1 (ボードの電源リセット用)<br />電源オン/オフ スイッチ x 1 |
| 入力電源               | 5 V (USB VBUS), 5-24 V (バッテリーもしくはSMPS)<br />標準バッテリー : LI-PO 11.1V 1,800mAh 19.98Wh<br />標準SMPS : 12V 4.5A<br />RTC（リアルタイムクロック）用外部バッテリー ([Molex 53047-0210])                                 |
| 出力電源               | <sup>`*`</sup>12V 最大 4.5A([SMW250-02])<br /><sup>`*`</sup>5V 最小 4A([5267-02A]), 3.3V@800mA([20010WS-02])                                                                                                                      |
| 寸法                   | 105(幅) X 75(奥行き) mm                                                                                                                                                                                                           |
| 重量                   | 60g                                                                                                                                                                                                                               |

{% capture note_01 %}
**注釈**: ご使用の前に必ずお読みいいただき、正しくお使いください。
- 2020年以降、MPU9250センサーはICM-20648に置き換えられ、MPU9250の生産は中止されました。
- 5V電源は安定化された12V出力を供給することにより安定している必要があります。
- OpenCR1.0ボードからの「ショアパワー」（12V、4.5A SMPS）と「モバイルパワー」（バッテリー）間のホットスワップ電源スイッチにより、UPS（無停電電源装置）機能が有効になります。
{% endcapture %}
<div class="notice--notice">{{ note_01 | markdownify }}</div>

# [レイアウト/ピン配置](#レイアウトピン配置)

![](/assets/images/parts/controller/opencr10/opencr_pinout.png)

{% include jp/dxl/pinout_warning.md %}

## [Arduinoコネクター](#arduinoコネクター)
OpenCRにはArduino Unoのピンに対応したコネクタが付属しています。  
0～21番のピンはArduino Unoと同じピンで、それ以降はOpenCRに追加されたピンにマッピングされています。  

![](/assets/images/parts/controller/opencr10/arduino_pinmap_01.png)

| ピン番号 |   関数   |     1     |     2     |   3    | etc  |
|:--------:|:--------:|:---------:|:---------:|:------:|:----:|
|    0     | UART RXD | UART6_RX  |           |        | `FT` |
|    1     | UART TXD | UART6 TX  |           |        | `FT` |
|    2     |          |           |           | EXTI_0 | `FT` |
|    3     |   PWM    | TIM3_CH1  |           | EXTI_1 | `FT` |
|    4     |          |           |           | EXTI_2 | `FT` |
|    5     |   PWM    | TIM1_CH1  |           |        | `FT` |
|    6     |   PWM    | TIM2_CH3  |           |        | `FT` |
|    7     |          |           |           | EXTI_3 | `FT` |
|    8     |          |           |           | EXTI_4 | `FT` |
|    9     |   PWM    | TIM9_CH2  |           |        | `FT` |
|    10    | PWM/NSS  | TIM11_CH1 | SPI2_NSS  |        | `FT` |
|    11    | PWM/MOSI | TIM12_CH2 | SPI2_MOSI |        | `FT` |
|    12    |   MISO   |           | SPI2_MISO |        | `FT` |
|    13    |   SCK    |           | SPI2_SCK  |        | `FT` |
|    14    |   SDA    |           | I2C1_SDA  |        | `FT` |
|    15    |   SCL    |           | I2C1_SCL  |        | `FT` |
|    16    |   ADC    |    A0     |           |        | `FT` |
|    17    |   ADC    |    A1     |           |        | `FT` |
|    18    |   ADC    |    A2     |           |        | `FT` |
|    19    |   ADC    |    A3     |           |        | `FT` |
|    20    |   ADC    |    A4     |           |        | `FT` |
|    21    |   ADC    |    A5     |           |        | `FT` |

`FT`ピンはアナログモード時を除き、5Vトレラントです。FTピンの最大注入電流は **-5mA** です。また、全I/O端子を合計した総出力電流は、**120mA / -120mA** となります。  
{: .notice}

## [ユーザーLED](#ユーザーled)
OpenCRの追加LEDは4つのLEDで構成されており、Arduinoのピン22-25にマッピングされています。  

![](/assets/images/parts/controller/opencr10/arduino_pinmap_03.png)

| 名称    | Arduinoピン | ピンの名称       |
|:--------|:------------|:-----------------|
| USER1   | 22          | BDPIN_LED_USER_1 |
| USER2   | 23          | BDPIN_LED_USER_2 |
| USER3   | 24          | BDPIN_LED_USER_3 |
| USER4   | 25          | BDPIN_LED_USER_4 |
| STS     | 36          | BDPIN_LED_STATUS |
| Arduino | 13          | LED_BUILTIN      |

## [ディップスイッチ](#ディップスイッチ)

![](/assets/images/parts/controller/opencr10/arduino_pinmap_04.png)

| Arduinoピン | ピンの名称     |
|:------------|:---------------|
| 26          | BDPIN_DIP_SW_1 |
| 27          | BDPIN_DIP_SW_2 |

## [GPIO](#gpio)
18ピンの共通GPIO拡張コネクタを持ち、ArduinoのGPIOピンにマッピングされています。下のピン番号はArduinoのピン番号です。  

![](/assets/images/parts/controller/opencr10/arduino_pinmap_05.png)

| ピン番号 | Arduinoピン | ピンの名称    | ピン番号 | Arduinoピン | ピンの名称    | etc  |
|:---------|:------------|:--------------|:---------|:------------|:--------------|:-----|
| 1        | -           | 3.3V          | 2        | -           | GND           | -    |
| 3        | 50          | BDPIN_GPIO_1  | 4        | 51          | BDPIN_GPIO_2  | `FT` |
| 5        | 52          | BDPIN_GPIO_3  | 6        | 53          | BDPIN_GPIO_4  | `FT` |
| 7        | 54          | BDPIN_GPIO_5  | 8        | 55          | BDPIN_GPIO_6  | `FT` |
| 9        | 56          | BDPIN_GPIO_7  | 10       | 57          | BDPIN_GPIO_8  | `FT` |
| 11       | 58          | BDPIN_GPIO_9  | 12       | 59          | BDPIN_GPIO_10 | `FT` |
| 13       | 60          | BDPIN_GPIO_11 | 14       | 61          | BDPIN_GPIO_12 | `FT` |
| 15       | 62          | BDPIN_GPIO_13 | 16       | 63          | BDPIN_GPIO_14 | `FT` |
| 17       | 64          | BDPIN_GPIO_15 | 18       | 65          | BDPIN_GPIO_16 | `FT` |
| 19       | 66          | BDPIN_GPIO_17 | 20       | 67          | BDPIN_GPIO_18 | `FT` |

`FT`ピンはアナログモード時を除き、5Vトレラントです。FTピンの最大注入電流 **-5mA** です。また、全I/Oピンを合計した総出力電流は、 **120mA / -120mA** となります。  
{: .notice}

**注釈** : プルアップ/プルダウンの代表的な抵抗は40kΩです。  
{: .notice}

## [ROBOTIS 5-ピン コネクター](#robotis-5-ピン-コネクター)

![](/assets/images/parts/controller/opencr10/arduino_pinmap_06.png)

## [プッシュスイッチ](#プッシュスイッチ)

![](/assets/images/parts/controller/opencr10/arduino_pinmap_08.png)

| Arduinoピン | ピンの名称      |
|:------------|:----------------|
| 34          | BDPIN_PUSH_SW_1 |
| 35          | BDPIN_PUSH_SW_2 |

## [外部割り込み](#外部割り込み)
外部割込みは以下のピンに割り当てられており、 *attachInterrupt(EXTI_Pin, callbackFunction, Mode)* マクロで使用することができます。  

| EXTI ピン | Arduinoピン | ピンの名称  |
|:----------|:------------|:------------|
| 0         | 2           | -           |
| 1         | 3           | TIM3_CH1    |
| 2         | 4           | -           |
| 3         | 7           | -           |
| 4         | 8           | -           |
| 5         | 42          | OLLO_P1_ADC |
| 6         | 45          | OLLO_P2_ADC |
| 7         | 72          | OLLO_P3_ADC |
| 8         | 75          | OLLO_P4_ADC |

```c
/*
  EXTI_0 is assigned to Arduino PIN 2
*/
pinmode(2, INPUT_PULLDOWN); //set Arduino Pin 2 as input with pull-down
attachInterrupt(0, changeDirection_EXIT_0, RISING);

void changeDirection_EXIT_0(void){
  Serial.println("EXIT_Interrupt! 0");
}
```

## [UART(Serial)](#uartserial)

| Classインスタンス   | Arduinoピン  | ハードウェア |
|:--------------------|:-------------|:-------------|
| Serial              | USB          | USB          |
| Serial1             | 0(RX), 1(TX) | USART6       |
| Serial2 (SerialBT1) | UART1        | USART2       |
| Serial3             | DXL Port     | USART3       |
| Serial4 (SerialBT2) | UART2        | UART8        |

**注意**: DYNAMIXELではSerial3を使用しているため、他のシリアルとは使い方が異なります。（詳細はDYNAMIXEL Workbenchを参照してください）。  
{: .notice--warning}


## [ピンの定義](#ピンの定義)

```c++
extern const Pin2PortMapArray g_Pin2PortMapArray[]=
{
  {GPIOC, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 0  UART6_RX
  {GPIOC, GPIO_PIN_6,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 1  UART6_TX
  {GPIOG, GPIO_PIN_6,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , 0       },  // 2              EXTI_0
  {GPIOB, GPIO_PIN_4,   NULL,     NO_ADC        , &hTIM3 ,   TIM_CHANNEL_1, 1       },  // 3  TIM3_CH1    EXTI_1
  {GPIOG, GPIO_PIN_7,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , 2       },  // 4              EXTI_2
  {GPIOA, GPIO_PIN_8,   NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_1, NO_EXTI },  // 5  TIM1_CH1
  {GPIOA, GPIO_PIN_2,   NULL,     NO_ADC        , &hTIM2 ,   TIM_CHANNEL_3, NO_EXTI },  // 6  TIM2_CH3
  {GPIOC, GPIO_PIN_1,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , 3       },  // 7              EXTI_3
  {GPIOC, GPIO_PIN_2,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , 4       },  // 8              EXTI_4
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
  {GPIOA, GPIO_PIN_7,   &hADC1,   ADC_CHANNEL_7 , NULL   ,   NO_PWM       , 5       },  // 42 OLLO_P1_ADC    EXTI_5
  {GPIOC, GPIO_PIN_5,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 43 OLLO_P2_SIG1
  {GPIOB, GPIO_PIN_1,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 44 OLLO_P2_SIG2
  {GPIOC, GPIO_PIN_4,   &hADC1,   ADC_CHANNEL_14, NULL   ,   NO_PWM       , 6       },  // 45 OLLO_P2_ADC    EXTI_6
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
  {GPIOF, GPIO_PIN_5,   &hADC3,   ADC_CHANNEL_15, NULL   ,   NO_PWM       , 7       },  // 72 OLLO_P3_ADC    EXTI_7
  {GPIOE, GPIO_PIN_9,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 73 OLLO_P4_SIG1
  {GPIOE, GPIO_PIN_8,   NULL,     NO_ADC        , NULL   ,   NO_PWM       , NO_EXTI },  // 74 OLLO_P4_SIG2
  {GPIOF, GPIO_PIN_3,   &hADC3,   ADC_CHANNEL_9 , NULL   ,   NO_PWM       , 8       },  // 75 OLLO_P4_ADC    EXTI_8
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


# [Arduino IDE](#arduino-ide)

## [Linuxにインストール](#linuxにインストール)

### [USBポートの設定](#usbポートの設定)
OpenCRのUSBポートがroot権限無しでArduinoスケッチをアップできるようにします。  

```bash
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/99-opencr-cdc.rules
$ sudo cp ./99-opencr-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

![](/assets/images/platform/turtlebot3/preparation/7_1_1_usb_port_setting.png)

### [コンパイラの設定](#コンパイラの設定)
OpenCRライブラリは、32ビットプラットフォーム用に構築されているため、64ビットPCではArduino IDE用の32ビットコンパイラが必要になります。  

```bash
$ sudo apt-get install libncurses5-dev:i386
```

![](/assets/images/platform/turtlebot3/preparation/7_1_2_compiler_settings.png)

### [Arduino IDE(Linux)のインストール](#arduino-idelinuxのインストール)
Arduino公式ホームページから最新版のArduino IDEをダウンロードして、インストールします。現在、OpenCRはバージョン1.6.4.以降でサービス開始予定です。  

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

そして、ダウンロードしたファイルを任意のフォルダに展開し、ターミナルからインストールファイルを実行します。この場合、以下の例ではユーザーの一番上のフォルダ(~/)にtoolsというフォルダを作ります。このフォルダがArduino IDEフォルダとして機能します。  

```bash
$ cd ~/tools/arduino-1.6.4
$ ./install.sh
```

インストールしたArduino IDEのファイルパスを、bashrcファイルのPATHという絶対パスに設定します。ここでは、geditエディタの使用を推奨します。(必要に応じて他のエディタを使用してください。) 最後にソースを作成して変更を適用します。  

```bash
$ gedit ~/.bashrc
$ export PATH=$PATH:$HOME/tools/arduino-1.6.4
$ source ~/.bashrc
```

### [Arduino IDE(Linux)の実行](#arduino-idelinuxの実行)
Linuxプラットフォーム上でArduino IDEを実行するには、ターミナルに以下のように入力します。  

```bash
$ arduino
```

![](/assets/images/platform/turtlebot3/preparation/ide0.png)

### [Arduino IDE(Linux)へのポーティング](#arduino-idelinuxへのポーティング)

#### 環境設定
Arduino IDEを起動した後に、IDEのトップメニューにある「ファイル」→「環境設定」をクリックします。環境設定ウィンドウが表示されたら、以下のリンクをコピーして、Additional Boards Manager URLsのテキストボックスに貼り付けます。(この作業には約20分かかります)  

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

![](/assets/images/platform/turtlebot3/preparation/ide1.png)

#### ボードマネージャーを使ってOpenCRパッケージをインストール
ツール → ボード → ボードマネージャーをクリックします。  

![](/assets/images/platform/turtlebot3/preparation/ide2.png)

テキストボックスにOpenCRと入力して、OpenCR by ROBOTISパッケージを検索します。見つかったら、インストールをクリックします。  

![](/assets/images/platform/turtlebot3/preparation/ide3.png)

インストールが終わると「INSTALLED」と表示されます。  

![](/assets/images/platform/turtlebot3/preparation/ide4.png)

ツール → ボードのリストにOpenCRボードが表示されるようになったかどうかを確認します。これをクリックして、OpenCRボードのソースをインポートします。  

![](/assets/images/platform/turtlebot3/preparation/ide5.png)

#### ポート設定
このステップでは、プログラムをアップロードするためのポート設定を行います。パソコンとOpenCRをUSBポートで接続してください。  

ツール → ポート → /dev/ttyACM0を選択してください。  

**警告** : 文字列 `/dev/ttyACM0` の下一桁の値 `0` は USB 接続環境によって異なる場合があります。  
{: .notice--warning}

![](/assets/images/platform/turtlebot3/preparation/ide6.png)

### [モデムマネージャの削除](#モデムマネージャの削除)

Arduino IDEでプログラミングを行い、OpenCRにプログラムをアップロードすると、OpenCRが再起動して再接続されます。同時に、Linuxのモデム関連のパッケージから、デバイスを管理するためのATコマンドが送信されます。このように、OpenCR上で接続エラーが発生していることを示していますので、このステップは事前に行っておく必要があります。 

```bash
$ sudo apt-get purge modemmanager
```

## [Macにインストール](#macにインストール)

### [Arduino IDE(Mac)のインストール](#arduino-idemacのインストール)

Arduinoの公式ホームページから最新版のArduino IDEをダウンロードしてインストールします。現在、OpenCRはバージョン1.6.4以降でサービスを開始する予定です。

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

### [Arduino IDE(Mac)の実行](#arduino-idemacの実行)

MacプラットフォームでArduino IDEを実行するには、以下のようにArduino IDEのアイコンをクリックします。  

![](/assets/images/parts/controller/opencr10/arduino_mac_01.png)

![](/assets/images/parts/controller/opencr10/arduino_mac_02.png)

### [Arduino IDE(Mac)へのポーティング](#arduino-idemacへのポーティング)

#### 環境設定
Arduino IDEを起動したら、IDEのトップメニューにある「ファイル」→「環境設定」をクリックします。環境設定ウィンドウが表示されたら、以下のリンクをコピーして、Additional Boards Manager URLsのテキストボックスに貼り付けます。(この作業には約20分かかります)  

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

![](/assets/images/parts/controller/opencr10/arduino_mac_03.png)

#### ボードマネージャーを使ってOpenCRパッケージをインストール
ツール → ボード→ ボードマネージャーをクリックします。  
実行 
![](/assets/images/parts/controller/opencr10/arduino_mac_04.png)

テキストボックスにOpenCRと入力して、OpenCR by ROBOTISパッケージを探します。OpenCRパッケージをインストールします。  
インストールが終わると「INSTALLED」と表示されます。  

ツール → ボードの一覧にOpenCR Boardが表示されるようになったかどうかを確認してください。これをクリックして、OpenCR Boardのソースをインポートします。  

![](/assets/images/parts/controller/opencr10/arduino_mac_05.png)

#### ポート設定
このステップでは、プログラムアップロードをするためのポート設定を行います。パソコンとOpenCRをUSBポートで接続します。  
 ツール → ポート → /dev/cu.usbmodem1411を選択します。

**注意** : PSの接続されている環境によっては、 `/dev/cu.usbmodem1411` 値が異なる場合があります。  
{: .notice--warning}

![](/assets/images/parts/controller/opencr10/arduino_mac_06.png)

## [Windowsにインストール](#windowsにインストール)

### [ドライバーインストール](#ドライバーインストール)

**警告** : Windows 10の場合は、このドライバーのインストールをスキップしてください。  
適切なドライバーが自動的にインストールされます。  
{: .notice--warning}

8.x以下のWindowsでOpenCRのUSBポートをシリアルポートとして使用するには、USB CDCドライバが必要です。STが提供するUSBドライバをインストールすることができます。  

[http://www.st.com/en/development-tools/stsw-stm32102.html](http://www.st.com/en/development-tools/stsw-stm32102.html)

### [Arduino IDE(Windows)のインストール](#arduino-idewindowsのインストール)

Arduinoの公式ホームページから最新版のArduino IDEをダウンロードしてインストールします。現在、OpenCRはバージョン1.6.4以降でサービスを開始する予定です。  

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

Arduino IDE for Windowsにはインストール版と圧縮版がありますので、お好きな方法でインストールしてください。  

### [Arduino IDE(Windows)へのポーティング](#arduino-idewindowsへのポーティング)

#### 環境設定
Arduino IDEを起動したら、IDEのトップメニューにある「ファイル」→「環境設定」をクリックします。環境設定ウィンドウが表示されたら、以下のリンクをコピーして、Additional Boards Manager URLsのテキストボックスに貼り付けます。(この作業には約20分かかります)  

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

#### ボードマネージャーを使ってOpenCRパッケージをインストール
1. ツール → ボード → ボードマネージャをクリックします。  
2. テキストボックスに OpenCR と入力して、OpenCR by ROBOTIS パッケージを検索します。見つかったら、[インストール]をクリックします。  
3. インストールが終わると、「INSTALLED」と表示されます。  
4. ール→ボードの一覧にOpenCR Boardが表示されるようになったかどうかを確認してください。これをクリックするとOpenCR Boardのソースがインポートされます。  

#### ポート設定
このステップでは、プログラムアップロード時のポート設定を行います。パソコンとOpenCRをUSBポートで接続する必要があります。  
ツール→ポート→COM1を選択します。  

**注意** : `COM1`の値は、PCに接続されている環境によって異なる場合があり  。  
{: .notice--warning}


# [例](#例)

## [LED](#led)
OpenCRボードに内蔵されているLEDテストです。  

### コード
OpenCRには5つのLEDがあり、USER1～4とArduinoの13番ピンに接続されているLEDがあります。  
USER1～4のArduinoのピン番号は以下のように定義されています。対応するピンがHigh/Lowとして出力されると、LEDが点灯/消灯します。  

```c++
#define BDPIN_LED_USER_1        22
#define BDPIN_LED_USER_2        23
#define BDPIN_LED_USER_3        24
#define BDPIN_LED_USER_4        25
```

すべてのLEDを順次点灯、消灯するコードです。  

```c++
int led_pin = 13;
int led_pin_user[4] = { BDPIN_LED_USER_1, BDPIN_LED_USER_2, BDPIN_LED_USER_3, BDPIN_LED_USER_4 };

void setup() {
  // Set up the built-in LED pin as an output:
  pinMode(led_pin, OUTPUT);
  pinMode(led_pin_user[0], OUTPUT);
  pinMode(led_pin_user[1], OUTPUT);
  pinMode(led_pin_user[2], OUTPUT);
  pinMode(led_pin_user[3], OUTPUT);
}

void loop() {
  int i;

  digitalWrite(led_pin, HIGH);  // set to as HIGH LED is turn-off
  delay(100);                   // Wait for 0.1 second
  digitalWrite(led_pin, LOW);   // set to as LOW LED is turn-on
  delay(100);                   // Wait for 0.1 second

  for( i=0; i<4; i++ )
  {
    digitalWrite(led_pin_user[i], HIGH);
    delay(100);
  }
  for( i=0; i<4; i++ )
  {
    digitalWrite(led_pin_user[i], LOW);
    delay(100);
  }
}
```

### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/VTz_iBqisFk" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [ボタン](#ボタン)
これは、OpenCRボードに内蔵されているBUTTONテストです。 　

### コード
OpenCRにはプッシュスイッチ1〜2とディップスイッチ1〜2があります。ピン番号は以下のように定義されており、そのピンのデータを入力すると現在のボタンの状態がわかります。  

```c++
#define BDPIN_DIP_SW_1          26
#define BDPIN_DIP_SW_2          27
#define BDPIN_PUSH_SW_1         34
#define BDPIN_PUSH_SW_2         35
```

ボタンの入力状態をシリアルで出力するコードです。  

```c++
void setup(){
  Serial.begin(115200);

  pinMode(BDPIN_DIP_SW_1, INPUT);
  pinMode(BDPIN_DIP_SW_2, INPUT);
  pinMode(BDPIN_PUSH_SW_1, INPUT);
  pinMode(BDPIN_PUSH_SW_2, INPUT);

}
void loop(){
  int dip_state;
  int push_state;

  dip_state  = digitalRead(BDPIN_DIP_SW_1)<<0;
  dip_state |= digitalRead(BDPIN_DIP_SW_2)<<1;

  push_state  = digitalRead(BDPIN_PUSH_SW_1)<<0;
  push_state |= digitalRead(BDPIN_PUSH_SW_2)<<1;

  Serial.print("dip_state = ");
  Serial.print(dip_state, BIN);

  Serial.print("\tpush_state = ");
  Serial.println(push_state, BIN);


  delay(100);
}
```

### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/8RfEmWHOjlQ" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [ブザー](#ブザー)
OpenCRボードに内蔵されたBUZZER関連のテストで、ArduinoのTone機能を利用しています。  　

### コード
OpenCRにはブザーが内蔵されており、周波数に依存して音が変化します。
また、内蔵されているブザーはArduinoのピン番号にマッピングされており、Arduinoのピン番号は以下のようになっています。Arduinoのトーン機能が移植されているので、この機能を使うことでブザーを使うことができます。  

```c++
#define BDPIN_BUZZER            31
```

pitches.hヘッダで定義されたスケールに従ってメロディを出力します。以下のコードは、Arduino IDEで提供されている例で、OpenCRのBUZZERをピン番号のみに変更したものです。  

```c++
#include "pitches.h"

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
    tone(BDPIN_BUZZER, melody[thisNote], noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(BDPIN_BUZZER);
  }
}
```

### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/gvICseDo0SQ" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [PWM](#pwm)
OpenCRボードのArundinピンからのPWM出力テストです。  

### コード
OpenCRはArduino Unoと同じピン構成です。PWM出力も同じポートにマッピングされています。そのため、対応するポートにPWMのデューティー比を出力するため、analogueWriteを使用しています。分解能は0から255までの8ビットで、周波数は50KHzです。  

![](/assets/images/parts/controller/opencr10/exam_pwm_01.png)

これは6ピン全てにPWM出力を行った例です。  

```c++
int pwm_pins[6] = { 3, 5, 6, 9, 10, 11 };

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

### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/de_K0mpgVcE" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [EEPROM](#eeprom)
OpenCRボートのEEPROMライブラリのテストです。  

OpenCRはEEPROMメモリを持っていないので、STM32F746に内蔵されているフラッシュメモリの一部をEEPROMにエミュレートします。エミュレーションの方法はSTマイクロエレクトロニクス社から例として提供されたものです。  
EEPROMとして使用する領域は、以下のように0x08010000～0x08020000です。2つのセクターが使用されています。  

![](/assets/images/parts/controller/opencr10/ex_eeprom_01.png)
32ビットは1つのデータを格納するためのもので、下位16ビットは格納するデータ、上位16ビットは対応するデータのアドレスを示しています。データを保存する際には、常に新しい場所に保存されます。データ保存中に1ページを使用した場合、保存したページの最新値のみが新しいページにコピーされ、既存のページは削除されます。
その結果、フラッシュメモリの消去回数が減り、書き込み寿命が長くなります。  

![](/assets/images/parts/controller/opencr10/ex_eeprom_02.png)

![](/assets/images/parts/controller/opencr10/ex_eeprom_03.png)

EEPROMライブラリを使用するにはヘッダを追加する必要があり、現在のEEPROMの最大サイズは1KBytesです。EEPROMライブラリはArduinoでサポートされているものを移植しているので、基本的な使用方法は他の既存のArduinoボードで使用されているものと同じです。詳しい使い方はAdunionのサイトを参照してください。  

[https://www.arduino.cc/en/Reference/EEPROM](https://www.arduino.cc/en/Reference/EEPROM)

### コード

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

### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/wTTbqdFP8uc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [OP3](#op3)
人型ロボットOP3では、電源やセンサー制御にOpenCRを使用しています。OP3のOpenCRのファームウェアが変更されている場合は、以下の手順でアップデートしてください。  
 
**警告** : 本製品に電源(電池やSMPS)を接続する際は、必ず電源スイッチを切ってから行ってください。  
{: .notice--warning}

### 準備
OpenCRはArduino IDEを介してファームウェアの開発とダウンロードを行います。そのため、事前にArduino IDEをインストールしておき、OpenCRボードのパッケージをインストールする必要があります。以下のリンク先のドキュメントからインストールします。  

- [Arduino IDEとOpenCRのインストール](#arduino-ide)

### OP3ファームウェアのダウンロード

1. OpenCRのファームウェアをアップデートするには、下図のようにOP3のフロントカバーを開き、USBをPCに接続します。  

    ![](/assets/images/parts/controller/opencr10/op3_01.png)

2. USB接続後にArduino IDEにて、ツール-> ボード-> OpenCRボードを選択します。  
3. ツール-> ボードが接続されているポートに変更します。  
4. Arduino IDEの例で、OP3用のファームウェアを選択します。  

    ![](/assets/images/parts/controller/opencr10/op3_02.png)

5. 下図の赤丸が表示されているArduino IDEのアイコンをクリックして、ファームウェアをビルドしてダウンロードします。ダウンロードが完了すると、ファームウェアが自動的に実行されます。  

    ![](/assets/images/parts/controller/opencr10/op3_03.png)

### OP3ファームウェアの編集
OpenCRの基本例として提供されているファームウェアは読み込み専用です。編集したい場合は、新しいフォルダに保存して作業する必要があります。  

1. OP3の例を開きます。  

    ![](/assets/images/parts/controller/opencr10/op3_02.png)

2. ファイル-> 保存を選択します。  

    ![](/assets/images/parts/controller/opencr10/op3_05.png)

3. 提供された例は読み取り専用なので、OKを選択して新規ファイルとして保存します。  

    ![](/assets/images/parts/controller/opencr10/op3_06.png)

4. 新しいフォルダに保存して編集します。編集が完了したら、ファームウェアのビルドとダウンロードを繰り返します。  

    ![](/assets/images/parts/controller/opencr10/op3_09.png)

## [センサー](#センサー)

### [環境光センサー](#環境光センサー)
OpenCRボード上での環境光センサーテストです。  

- ピン配置
  - 緑 : 信号
  - 赤 : Vcc
  - 黒 : Gnd

- 仕様
  - [ambient light sensor specification](https://www.dfrobot.com/wiki/index.php/DFRobot_Ambient_Light_Sensor_SKU:DFR0026#Application)
  - 電源電圧 : 3.3V ~ 5V
  - 照明範囲 : 1ルクス ~ 6000ルクス
  - インターフェース : アナログ

#### コード
センサーの受け取った光に応じてLEDが順次消灯/点灯します。  
明るい場所ではLEDが消灯します。暗い場所では点灯します。  
このセンサはアナログセンサのため、ポートA0に接続してください。  

```c++
#define BDPIN_LED_USER_1     23
#define BDPIN_LED_USER_2     24
#define BDPIN_LED_USER_3     25
```

光の明るさの変化に応じてLEDをON/OFFするコードです。  

```c++

void setup()
{
  Serial.begin(9600);
  pinMode(BDPIN_LED_USER_1, OUTPUT);
  pinMode(BDPIN_LED_USER_2, OUTPUT);
  pinMode(BDPIN_LED_USER_3, OUTPUT);
}

void loop()
{
  if(analogRead(0)<200)
  {
    digitalWrite(BDPIN_LED_USER_1, LOW);
    digitalWrite(BDPIN_LED_USER_2, LOW);
    digitalWrite(BDPIN_LED_USER_3, LOW);
  }
  else if(analogRead(0)>200 && analogRead(0)<300)
  {
    digitalWrite(BDPIN_LED_USER_1, HIGH);
    digitalWrite(BDPIN_LED_USER_2, LOW);
    digitalWrite(BDPIN_LED_USER_3, LOW);
  }
  else if(analogRead(0)>300 && analogRead(0)<400)
  {
    digitalWrite(BDPIN_LED_USER_1, HIGH);
    digitalWrite(BDPIN_LED_USER_2, HIGH);
    digitalWrite(BDPIN_LED_USER_3, LOW);
  }
  else if(analogRead(0)>400 && analogRead(0)<500)
  {
    digitalWrite(BDPIN_LED_USER_1, HIGH);
    digitalWrite(BDPIN_LED_USER_2, HIGH);
    digitalWrite(BDPIN_LED_USER_3, HIGH);
  }
  Serial.println(analogRead(0), DEC);
  delay(100);
}
```

#### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/eqZsd12g0VI" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

### [チルトセンサー](#チルトセンサー)
OpenCRのチルトセンサーのテストです。  

![](/assets/images/parts/controller/opencr10/tilt_sensor.png)

- ピン配置
  - 緑 : 信号
  - 赤 : Vcc
  - 黒 : Gnd

- 仕様
  - [Tilt Sensor Specification](https://www.dfrobot.com/wiki/index.php/Digital_Tilt_Sensor_SKU:DFR0028)
  - 電源電圧 : 3.3V ~ 5V
  - インターフェース : デジタル

#### コード
チルトセンサーとLED はOpenCRに接続されており、チルトすると赤/青のLEDがON/OFF、チルトしない場合は赤/青のLEDがOFF/ONになります。  
チルトセンサー、Led_blue、Led_redの信号ピンをD0、D1、D2に接続します。  

```c++
#define tilt     0
#define led_blue 1
#define led_red  2
```

```c++

void setup()
{
  pinMode(tilt, INPUT);
  pinMode(led_blue, OUTPUT);
  pinMode(led_red, OUTPUT);
}

void loop()
{
  if(digitalRead(tilt) == HIGH)
  {
    digitalWrite(led_blue, HIGH);
    digitalWrite(led_red, LOW);
  }
  else
  {
    digitalWrite(led_blue, LOW);
    digitalWrite(led_red, HIGH);
  }
}
```

#### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/VejyCWv4FLc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

### [回転センサー](#回転センサー)

OpenCRボードの回転センサーテストです。  

![](/assets/images/parts/controller/opencr10/rotation_sensor.png)

- 仕様
  - [回転センサー仕様](https://www.dfrobot.com/wiki/index.php/Digital_Tilt_Sensor_SKU:DFR0028)
  - 回転角度 : 360度
  - 電源電圧 : 3.3V ~ 5V
  - インターフェース : アナログ

#### コード
回転センサはアナログセンサで、回転角度に応じて出力値が変わります。  
回転角度に応じて LED が点灯/消灯します。  
信号ピンは OpenCRのA0に接続されています。  

```c++
#define BDPIN_LED_USER_1        22
#define BDPIN_LED_USER_2        23
#define BDPIN_LED_USER_3        24
#define BDPIN_LED_USER_4        25
```

```c++
const int analogInPin = A0;
int sensorValue = 0;

void setup()
{
  Serial.begin(9600);
  pinMode(BDPIN_LED_USER_4, OUTPUT);
  pinMode(BDPIN_LED_USER_3, OUTPUT);
  pinMode(BDPIN_LED_USER_2, OUTPUT);
  pinMode(BDPIN_LED_USER_1, OUTPUT);
}

void loop()
{
  sensorValue = analogRead(analogInPin);
  Serial.print(" sensorValue : ");
  Serial.println(sensorValue);

  if(sensorValue>0 && sensorValue<50)
  {
    digitalWrite(BDPIN_LED_USER_4, LOW);
    digitalWrite(BDPIN_LED_USER_3, HIGH);
    digitalWrite(BDPIN_LED_USER_2, HIGH);
    digitalWrite(BDPIN_LED_USER_1, HIGH);
  }
  if(sensorValue>50 && sensorValue<100)
  {
    digitalWrite(BDPIN_LED_USER_4, LOW);
    digitalWrite(BDPIN_LED_USER_3, LOW);
    digitalWrite(BDPIN_LED_USER_2, HIGH);
    digitalWrite(BDPIN_LED_USER_1, HIGH);
  }
  if(sensorValue>100 && sensorValue<150)
  {
    digitalWrite(BDPIN_LED_USER_4, LOW);
    digitalWrite(BDPIN_LED_USER_3, LOW);
    digitalWrite(BDPIN_LED_USER_2, LOW);
    digitalWrite(BDPIN_LED_USER_1, HIGH);
  }
  if(sensorValue>200 && sensorValue<250)
  {
    digitalWrite(BDPIN_LED_USER_4, LOW);
    digitalWrite(BDPIN_LED_USER_3, LOW);
    digitalWrite(BDPIN_LED_USER_2, LOW);
    digitalWrite(BDPIN_LED_USER_1, LOW);
  }
  delay(100);
}
```

#### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/z2AbTL7R6rg" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

### [静電容量式タッチセンサー](#静電容量式タッチセンサー)
OpenCRボードの静電容量式タッチセンサーテストです。  

![](/assets/images/parts/controller/opencr10/cap_sensor.jpg)

- ピン配置
  - 緑 : 信号
  - 赤 : Vcc
  - 黒 : Gnd

- 仕様
  - [静電容量式タッチセンサー仕様](https://www.dfrobot.com/wiki/index.php/DFRobot_Capacitive_Touch_Sensor_SKU:DFR0030)
  - 電源電圧 : 3.3V ~ 5V
  - インターフェース : デジタル

#### コード
センサーに手を乗せるとLEDが順次点灯/消灯し、手を離すとLEDが消灯します。  
チルトセンサーはデジタルセンサーで、センサーの信号はOpenCRのD0に接続されています。  

```c++
#define SensorINPUT             0
#define BDPIN_LED_USER_1        22
#define BDPIN_LED_USER_2        23
#define BDPIN_LED_USER_3        24
#define BDPIN_LED_USER_4        25
```

```c++

int LED[] = {BDPIN_LED_USER_1, BDPIN_LED_USER_2, BDPIN_LED_USER_3, BDPIN_LED_USER_4};
int i = 0;

void setup()
{
  pinMode(SensorINPUT, INPUT);
  pinMode(BDPIN_LED_USER_1, OUTPUT);
  pinMode(BDPIN_LED_USER_2, OUTPUT);
  pinMode(BDPIN_LED_USER_3, OUTPUT);
  pinMode(BDPIN_LED_USER_4, OUTPUT);
}

void loop()
{
  if (digitalRead(SensorINPUT) == HIGH )
  {
    for(i=0; i<4; i++)
    {
      digitalWrite(LED[i], LOW);
      delay(100);
      digitalWrite(LED[i], HIGH);
    }
  }
  if (digitalRead(SensorINPUT) == LOW )
  {
    for(i=0; i<4; i++)
    {
      digitalWrite(LED[i], HIGH);
    }
  }
}
```

#### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/CtYwSdOD1wI" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

### [炎センサー](#炎センサー)
OpenCRボードの炎センサーのテストです。  

![](/assets/images/parts/controller/opencr10/flame_sensor.jpg)

- ピン配置
  - 青 : 信号
  - 赤 : Vcc
  - 黒 : Gnd

- 仕様
  - [炎センサー仕様](https://www.dfrobot.com/wiki/index.php/Flame_sensor_SKU:_DFR0076)
  - 検出範囲 : 20cm(4.8V) ~ 100cm(1V)
  - 電源電圧 : 3.3V ~ 5V
  - インターフェース : アナログ

#### コード
炎を検知するとLEDが点灯します。  
センサーの近くで火をつけると1024に近い高い値を出力します。  
出力が800を超えるとLEDが点灯します。  
信号はArduinoのA0に接続されています。  

```c++
#define BDPIN_LED_USER_1 22
#define flame            0
```

```c++
void setup()
{
  Serial.begin(9600);
  pinMode(BDPIN_LED_USER_1, OUTPUT);
}

void loop()
{
  int val;
  val=analogRead(flame);

  if(val>800)
  {
    digitalWrite(BDPIN_LED_USER_1, LOW);
  }
  else
  {
    digitalWrite(BDPIN_LED_USER_1, HIGH);
  }

  Serial.println(val,DEC);
  delay(100);
}
```

#### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/DcDFl4UjUos" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

### [ジョイステックセンサ](#ジョイステックセンサ)
OpenCRボードでのジョイステックテストです。  

![](/assets/images/parts/controller/opencr10/joystick_sensor.png)

- 仕様
  - [ジョイステックセンサ仕様](https://www.dfrobot.com/wiki/index.php/Joystick_Module_For_Arduino_(SKU:DFR0061))
  - インターフェース : アナログ

#### コード
入力に応じて出力値を取得するのがJジョイステックです。  
動き方によって変化するx、y、zの値を見ていきます。  
x、y、zの信号はArduinoのA0、A1、A2に接続しています。  

```c++
#define X A0
#define Y A1
#define Z A2
```

```c++
void setup()
{
  Serial.begin(9600);
}
void loop()
{
  int x,y,z;
  x=analogRead(X);
  y=analogRead(Y);
  z=analogRead(Z);
.
  Serial.print(" X = ");
  Serial.print(x,DEC);

  Serial.print(" Y = ");
  Serial.print(y,DEC);

  Serial.print(" Z = ");
  Serial.println(z,DEC);
  delay(100);
}
```

#### 結果

<iframe width="560" height="315" src="https://www.youtube.com/embed/7fOIeFTg7bY" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [DYNMAIXEL Workbench](#dynamixel-workbench)

- [DYNAMIXEL Workbenchの例](/docs/en/software/dynamixel/dynamixel_workbench/#opencr-and-opencm-tutorials)

## [OpenMANIPULATOR](#openmanipulator)

- [OpenMANIPULATORの例](/docs/en/platform/openmanipulator/#how-to-control-on-opencr)

# [ブートローダー](#ブートローダー)
ブートローダーは、ボードを初期化し、フラッシュメモリにファームウェアをダウンロードして実行する役割を担っています。

OpenCRボードのメインMCUに使用されているSTM32F7xxは、DFU(Device Firmware Upgrade)をサポートしています。  
これにより、主にブートローダーの初期化、リカバリーモード、ブートローダーの更新をUSBで行うことで、MCUの内蔵ブートローダー単体でDFUプロトコルで起動させることができるようになります。  
USBでブートローダーを使用しても、他のJTAG機器を使用せずにブートローダーを使用できることが最大のメリットです。  
STLinkなどの書き込み/デバッグ機器を使用せずに、MCUに内蔵されたDFUモードを使用してファームウェアを書き込みます。  

|     項目     |        説明         |
|:------------:|:-------------------:|
|    対応OS    | Windows, Linux, Mac |
| コンパイラー | gcc arm 5.4 2016q2  |

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

- USBポート
  - PCに接続してシリアルポートとして認識されます。
  - ブートローダー経由でファームウェアをダウンロードするための通信ケーブルです。

- プッシュスイッチ2
  - 電源投入時やリセット時にボタンを長押しすると、ブートローダーが実行されます。
  - 電源投入時にボタンが押されていない場合は、ブートローダーが実行されます。ファームウェアがフラッシュメモリにある場合は、ブートローダーがファームウェアを実行します。

## [メモリマップ](#メモリマップ)

OpenCRで使用しているSTM32F746は、1024KBの内部フラッシュメモリを持ち、各領域は以下のように定義されています。ブートローダーはフラッシュメモリ内の最下位アドレスに配置されており、電源投入時とリセット時に最初にブートローダーが実行されます。  

![](/assets/images/parts/controller/opencr10/bootloader_01.png)

## [ブートシーケンス](#ブートシーケンス)

![](/assets/images/parts/controller/opencr10/bootloader_03.png)

ボードの電源投入やリセット時にスイッチ2ボタンを押すと、ブートローダー状態でPCからのコマンドを待ちます。スイッチ2ボタンが押されていない場合は、フラッシュメモリのファームウェア領域にファームウェアが存在する場合は、ファームウェアにジャンプして実行します。

## [通信プロトコル](#通信プロトコル)

### [MavLink](#mavlink)

ブートローダーからファームウェアをダウンロードするための通信プロトコルはMavLinkを使用しています。MavLinkはUAVでの通信用に作成されたもので、詳細は以下のリンクを参照してください。  
機能として、コマンド名とパラメータをxmlファイルとして生成した際に、各コマンドの通信コードをjava / c / pythonなどのコードで自動生成してくれます。通信のためのCRCチェックやデータ解析を行う機能を自動で生成してくれるため、必要なコマンドだけをxmlファイルとして定義しておけば、ソースを自動生成することができます。  

また、様々な言語で生成するため、移植も容易です。  

[http://qgroundcontrol.org/mavlink/start](http://qgroundcontrol.org/mavlink/start)

### [コマンドの構成](#composition-of-commands)

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

最終的に定義されたxmlファイルは、githubに追加されています。　　

```
https://github.com/ROBOTIS-GIT/OpenCR/blob/master/arduino/opencr_bootloader/common/msg/xml/opencr_msg
```

定義されたxmlファイルは、MavLinkユーティリティを使って使用したい言語のコマンドコードに変換する必要があります。MavLinkユーティリティのソースコードは以下のgithubからダウンロードしてください。  

[https://github.com/mavlink/mavlink/](https://github.com/mavlink/mavlink/)

Pythonで書かれており、Python 2.7以降が必要です。インストールされていない場合は追加してください。  

```bash
$ sudo apt-get install python-tk
$ sudo apt-get install python-future
$ python mavgenerate.py
```

MAVLink Generatorを実行するとGUI画面が表示され、既に作成されているXMLファイルを選択し、言語をCに、プロトコルのバージョンを1.0に設定します。Outで出力するフォルダ名を選択し、Generateを選択すると、xmlファイルを元に追加されたコマンドを使用できる関数ヘッダーファイルが作成され、ファームウェアにおいて使用することができます。  

![](/assets/images/parts/controller/opencr10/bootloader_04.png)

最終的に生成された通信コードは、以下のリンク先で見ることができます。  

[https://github.com/ROBOTIS-GIT/OpenCR/tree/master/arduino/opencr_develop/opencr_bootloader/common/msg/mavlink](https://github.com/ROBOTIS-GIT/OpenCR/tree/master/arduino/opencr_develop/opencr_bootloader/common/msg/mavlink)

MavLink プロトコルを介してファームウェアをダウンロードして実行するブートローダのコマンドは以下の通りです。  

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

### [ダウンロードシーケンス](#ダウンロードシーケンス)

ブートローダーの主な機能は、パソコンからファームウェアファイルを受け取り、フラッシュに保存し、保存したファームウェアを実行することです。ダウンロードの順番は以下のようになっており、それを見ながら進め方やどこに目を向けて進めているかを確認することができます。これを元に実際の実装を行うことができます。  

![](/assets/images/parts/controller/opencr10/bootloader_05.png)

![](/assets/images/parts/controller/opencr10/bootloader_06.png)


### [メッセージ処理](#メッセージ処理)

実際に実装したコードでは、メイン関数はメッセージ処理のために msg_process_vcp()関数を呼び出しています。この場合、USBからのデータがある場合はmsg_recv関数を呼び出してメッセージを解析し、何かコマンドを受信した場合はTRUEを返して対応するコマンド関数を呼び出しています。  

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

例えば、Mavlink_msg_read_version_decode()関数は、メッセージデータをコマンドのデータ構造に解析します。解析されたmav_dataによく反応するフィールドがアクティブな場合、ACK コマンドを介してブートローダのバージョンとリビジョンを送信します。  

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

## [ブートローダーのアップデート](#ブートローダーのアップデート)

OpenCRボード上のMCUのDFUモードを使ってブートローダをアップデートすることができます。  
DFUモードを使ってアップデートするには、dfu-utilをインストールする必要があります。  

```bash
$ sudo apt-get install dfu-util
```

### [フォルダ構造](#フォルダ構造)

| 項目         | 内容                                                     |
|:-------------|:---------------------------------------------------------|
| bin          | ビルド後に生成されたobjとbinファイルを保存します         |
| common->bsp  | ボード固有の機能(LED / BUTTON / USBなど)を搭載しています |
| common->hal  | ハードウェアに依存しないボード上の機能フォルダ           |
| common->lib  | 外部または公的に使われているライブラリ                   |
| msg->mavlink | Xmlによって生成された通信プロトコルソース                |
| msg->xml     | コマンドを定義したxmlファイルフォルダ                    |
| src          | ブートローダー機能に必要な機能フォルダ                   |

![](/assets/images/parts/controller/opencr10/bootloader_08.png)

## [ブートローダーのアップデート](#ブートローダーのアップデート)

OpenCRボード上のMCUのDFUモードを使ってブートローダをアップデートすることができます。  
DFUモードを使ってアップデートするには、dfu-utilをインストールする必要があります。  

```bash
$ sudo apt-get install dfu-util
```

### [DFUモードに入る](#dfuモードに入る)
OpenCRをDFUモードで実行するには、以下の手順に従ってください。  

1. `Boot`ボタンを押したままにする。  
2. `Reset`ボタンを押す。  
3. `Reset`ボタンを離す。  
4. `Boot`ボタンを離す。  

内蔵のブートローダーによってリセットされた後、OpenCRはDFUモードに入ります。  

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

### [ブートモードの確認](#ブートモードの確認)

#### Linuxの場合
lsusbを実行すると、DFUモードになっているかどうかを確認することができます。MCUがDFUモードの場合、lsusbを実行するとDFUデバイスが表示されます。  

```bash
$ lsusb
```

![](/assets/images/parts/controller/opencr10/bootloader_10.png)

#### Windowsの場合
`デバイスマネージャー` > `ユニバーサルシリアルデバイス`を開き、**STM32 BOOTLOADER**が検出されていることを確認してください。  
もし検出されない場合には、[ドライバーインストール(オプション)](#ドライバーインストールオプション)の項目を参照してください。  

![](/assets/images/parts/controller/opencr10/dfu_device_manager.png)

### [ブートローダーの書き込み](#ブートローダーの書き込み)

#### [ブートローダーの書き込み(Linux)](#ブートローダーの書き込み)

**注意** : バージョンが更新されている場合には、ブートローダーを更新してください。  
{: .notice--warning}

##### プログラマー設定
ツール → DFU-UTILを選択  

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

##### DFUモードの実行
`ブートボタン`が押されている間に`リセットボタン`を押してください。これによりDFUモードが起動します。  
DFUモードに正常に入り、ターミナルで *lsusb* を入ルよくすると、`STMicroelectronics STM Device in DFU Mode` という文字列が表示されます。  

![](/assets/images/platform/turtlebot3/preparation/ide10.png)

##### ブートローダーのダウンロード

ツール → ブートローダー書き込みをクリックし、ブートローダーをダウンロードします。  

![](/assets/images/platform/turtlebot3/preparation/ide9.png)

#### [ブートローダーの書き込み(Mac)](#ブートローダーの書き込みmac)

**注意** : バージョンが更新されている場合には、ブートローダーを更新してください。  
{: .notice--warning}

##### プログラマー設定

ツール → DFU-UTILを選択  

![](/assets/images/parts/controller/opencr10/arduino_mac_07.png)

##### DFUモードの実行
`ブートボタン`が押されている間に`リセットボタン`を押してください。これによりDFUモードが起動します。  

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

##### ブートローダーのダウンロード

ツール → ブートローダー書き込みをクリックし、ブートローダーをダウンロードします。  

![](/assets/images/parts/controller/opencr10/arduino_mac_08.png)

#### [ブートローダーの書き込み(Windows)](#ブートローダーの書き込みwindows)

**注意** : バージョンが更新されている場合には、ブートローダーを更新してください。  
{: .notice--warning}

##### DFUモードの実行
`ブートボタン`が押されている間に`リセットボタン`を押してください。これによりDFUモードが起動します。  

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

##### ブートローダーのダウンロード
Arduino IDEを設定した後に、Arduino IDEを起動し、`ツール` > `ブートローダーを書き込む`でブートローダーをダウンロードします。  

![](/assets/images/parts/controller/opencr10/bootloader_12.png)

#### カスタムブートローダー
カスタムブートローダを構築している場合には、binファイルのあるフォルダに移動し、dfu-utilで更新してください。  
以下のコマンドは、*opencr_boot.bin* をルートディレクトリに置いた例です。  

```bash
$ sudo dfu-util -d 0483:df11 -a 0 -s 0x08000000 -D ./opencr_boot.bin
```

![](/assets/images/parts/controller/opencr10/bootloader_11.png)

### [ドライバーインストール(オプション)](#ドライバーインストールオプション)
ブートローダのアップデートを実行するには、ST DFUドライバーをPCにインストールする必要があります。  
Windows10では、通常、ST DFUドライバーは **自動的にインストール** されています。  

しかし、ST DFUドライバが正しくインストールされていない場合、OpenCRはArduino IDEに新しいブートローダを書き込むことができません。   

以下のようなエラーメッセージが表示されて、**Arduino IDE** でのブートローダの書き込みに失敗した場合は、以下の手順でDFUドライバーを再インストールしてください。  

```
DFUデバイス0483:df11を開けません
DFU対応のUSBデバイスが利用できません
ブートローダーの書き込み中にエラーが発生しました
```

> ブートローダーの書き込み中にArduino IDEからエラーメッセージが出る場合。  

1. Zadigを[http://zadig.akeo.ie/](http://zadig.akeo.ie/)からダウンロードします。  

2. インストールして、Zadigを実行します。  

3. `オプション` > `全てのデバイスを一覧表示`に移動します。  

    ![](/assets/images/parts/controller/opencr10/zadig_01.png)

4. **STM32 BOOTLOADER** を選択して、**WinUSB** ドライバーをインストールします。  

    ![](/assets/images/parts/controller/opencr10/zadig_02.png)

# [ダウンローダー](#ダウンローダー)

PC ダウンローダーアプリケーションは、ブートローダと通信し、PC からファームウェアを OpenCR ボードフラッシュのファームウェア領域にダウンロードします。 　
ダウンローダーは、提供されたバイナリファイルに必要な情報を追加します。  

| 項目         | 説明                              |
|:-------------|:----------------------------------|
| 対応OS       | Windows, Linux, Mac               |
| コンパイラー | Linux : gcc<br />Windows : Qt 5.7 |

## [使用方法](#使用方法)

コマンドを使用する場合は、以下の説明を読み適切に使用してください。

```bash
$ opencr_ld <Communication port> <Baudrate> <Firmware binary> <Firmware execution status [0|1]>
```

`Communication port`  
-  使用中のシリアルポートの名前を入力します（/dev/ttyACM0は、Linuxで広く使用されています）。

`Baudrate`  
-  通信、入力する速度は115200bpsです。

`Firmware binary`  
- ファームウェアのバイナリイメージには、binの拡張子があります。

`Firmware execution status`  
- ダウンロード後にファームウェアを実行するには、「1」を設定します。 
- ファームウェアをダウンロードするには、「0」を設定します（またはステータスを入力しません）。

  ![](/assets/images/parts/controller/opencr10/arduino_bin_export.png)

  > Arduino IDEからコンパイルしたバイナリファイルをエクスポートする

### [Linux/Macの例](#linuxmacの例)

以下は、LinuxおよびMacユーザーの例です。ご使用のPC環境によっては、コマンドが異なる場合があります。

```bash
$ sudo opencr_ld /dev/ttyACM0 115200 ./opencrfw.bin 1
```

`Communication port`  
- /dev/ttyACM0

`Baudrate`  
- 115,200 bps.

`Firmware binary`
- opencrfw.bin

`Firmware execution status`
- 1

### [Windowsの例](#windowsの例)

以下は、Windowsユーザーの例です。 ご使用のPC環境によっては、コマンドが異なる場合があります。

```bash
opencr_ld.exe COM1 115200 ./opencrfw.bin 1
```

`Communication port`
- COM1  

`Baudrate`  
- 115,200 bps.

`Firmware binary`
- opencrfw.bin

`Firmware execution status`
- 1

## [実行結果](#実行結果)

![](/assets/images/parts/controller/opencr10/downloader_01.png)

## [実行ファイルのダウンロード](#実行ファイルのダウンロード)

- [https://github.com/ROBOTIS-GIT/OpenCR/tree/master/arduino/opencr_arduino/tools/opencr_tools_1.0.0](https://github.com/ROBOTIS-GIT/OpenCR/tree/master/arduino/opencr_arduino/tools/opencr_tools_1.0.0)

# [リファレンス](#リファレンス)

## [リカバリーモード](#リカバリーモード)
不完全もしくは間違ったファームウェアがダウンロードされ、ボードがフリーズしたり、動作しなくなったりした場合は、正常なファームウェアをダウンロードできるようにするために、ブートローダーに入る必要があります。  
ブートローダーを実行するには、以下の手順に従ってください。  

1. `プッシュスイッチ2`ボタンを押したままにする。
2. `リセット`ボタンを押す。
3. `リセット`ボタンを離す。
4. `プッシュスイッチ2`ボタンを離す。

OpenCRはリセット後、ブートローダーに入ります。ブートローダーが動作しているときは、ステータスLEDが100msごとに点滅します。  

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

ブートローダーが起動している間に通常のファームウェアをダウンロードすることができます。

## [DYNAMIXEL コネクタ](#dynamixel-コネクタ)

次の表は、DYNAMIXELのピン配列を示しています。

{% include jp/dxl/jst_485_ttl.md %}

{% include jp/dxl/485_ttl_connection_x.md %}

## [ダウンロード](#ダウンロード)

- `ダウンロード` [部品表](https://github.com/ROBOTIS-GIT/OpenCR-Hardware/tree/master/BOM)
- `ダウンロード` [回路図](https://github.com/ROBOTIS-GIT/OpenCR-Hardware/tree/master/Schematic)
- `ダウンロード` [PCB](https://github.com/ROBOTIS-GIT/OpenCR-Hardware/tree/master/CAD)

## [認証](#認証)
未登録の認証については、お問い合わせください。  

### [FCC](#fcc)
{% include jp/dxl/fcc_class_a.md %}

[Reference Manual]: http://www.st.com/resource/en/reference_manual/dm00124865.pdf
[Datasheet]: http://www.st.com/resource/en/datasheet/stm32f745ie.pdf
[B3B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[B4B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[20010WS-04]: http://www.alldatasheet.com/datasheet-pdf/pdf/147797/YEONHO/20010WS-04000.html
[20010WS-04]: http://www.alldatasheet.com/datasheet-pdf/pdf/147797/YEONHO/20010WS-04000.html
[SMW250-02]: http://www.alldatasheet.com/datasheet-pdf/pdf/148144/YEONHO/SMW250-02P.html
[5267-02A]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0022035025_PCB_HEADERS.xml&channel=Products&Lang=en-US
[20010WS-02]: http://www.alldatasheet.com/datasheet-pdf/pdf/147795/YEONHO/20010WS-02000.html
[Molex 53047-0210]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0530470210_PCB_HEADERS.xml
