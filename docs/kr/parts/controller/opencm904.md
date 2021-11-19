---
layout: archive
lang: kr
ref: opencm904
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/controller/opencm904/
sidebar:
  title: OpenCM 9.04
  nav: "opencm904"
---

![](/assets/images/parts/controller/opencm904/opencm904_product.png)

> OpenCM 9.04

# [개요](#개요)

- OpenCM9.04 Types Package

|         Item         | OpenCM9.04 A Type | OpenCM9.04 B Type | OpenCM9.04 C Type |
|:--------------------:|:-----------------:|:-----------------:|:-----------------:|
|     Power Switch     |         X         |         1         |         1         |
|     User Button      |         1         |         1         |         1         |
| 2Pin Battery(LBS-40) |         X         |         2         |         2         |
|       JTAG/SWD       |         X         |         1         |         1         |
|     Micro B USB      |         X         |         1         |         1         |
|      5-Pin Port      |         X         |         4         |         4         |
|  다이나믹셀 TTL BUS  |         X         |       4`1`        |       4`2`        |
|   4 Pin 통신 포트    |         X         |         1         |         1         |

`1`: [MOLEX 53253-0370] x 2(XL-320 호환), [MOLEX 22-03-5035] x 2(AX 또는 MX 시리즈 호환)  
`2`: [MOLEX 53253-0370] x 4(XL-320 호환)

- `OpenCM9.04`는 32bit ARM Cortex-M3가 장착되어 있으며, 회로도 및 소스코드가 공개된 로봇용 임베디드 보드입니다.
- Type으로는 A,B,C type이 있습니다. 위의 Type사진과 표를 보면 커넥터를 제공 여부에 따라 Type이 달라집니다.  
  (A Type의 경우 OpenCM9.04-악세서리 세트를 별도 구매하시면 B,C Type에서 제공하는 모든 커넥터 부품들과 USB Cable을 한번에 구입할 수 있습니다.) [악세서리 구매하기]

**참고**: 제어기 복구는 현재 OpenCM9.04 C 타입(다윈미니용제어기)만 지원되고있으며, 복구방법은 아래 링크에서 확인가능합니다. [OpenCM9.04 C Type 펌웨어 복구하기]
{: .notice}

**주의**: 다이나믹셀 펌웨어 업데이트 및 복구시 OpenCM9.04와 OpenCM 485 확장보드를 반드시 분리해주세요.
{: .notice--warning}

# [제품 사양](#제품-사양)

|          항목           |              사양               |
|:-----------------------:|:-------------------------------:|
|           CPU           |   STM32F103CB (ARM Cortex-M3)   |
|        동작 전압        |            5V ~ 16V             |
|         입출력          |            GPIO x 26            |
|         타이머          |            4 (16bit)            |
|   아날로그 입력(ADC)    |           10 (12bit)            |
|      플래시 메모리      |              128Kb              |
|          SRAM           |              20Kb               |
|        동작 클럭        |              72Mhz              |
|           USB           | 1 (2.0 Full Speed) Micro B Type |
|          USART          |                3                |
|           SPI           |                2                |
|        I2C(TWI)         |                2                |
|         디버깅          |           JTAG & SWD            |
| 다이나믹셀 3핀 TTL 버스 |                4                |
|          크기           |          27mm x 66.5mm          |

{% capture opencm904_caution_01 %}
**경고**:
- USB전원으로는 다이나믹셀을 구동할 수 없습니다. 별도의 전원을 공급해주세요.  
  (OpenCM9.04 는 USB나 배터리 또는 + - 터미널 중에 하나 이상의 전원이 공급되면 동작합니다.)
- 별도의 전원공급시 연결되는 주변장치의 동작전압을 확인해주세요. 제어기에 입력된 전압이 다이나믹셀에 바로 공급됩니다.
- 7.4V를 권장하는 XL-320은 다른 다이나믹셀과 동작전압의 차이가 있어 함께 사용할 수 없습니다.
{% endcapture %}

<div class="notice--danger">{{ opencm904_caution_01 | markdownify }}</div>


# [컨트롤 테이블](#컨트롤-테이블)

**주의**  
OpenCM9.04의 컨트롤 테이블은 기본 펌웨어를 사용해서 접근이 가능하며, 아두이노 또는 다른 프로그램의 코드를 다운로드하면 사용할 수 없게 됩니다.  
다시 로보플러스 소프트웨어와 연결해서 컨트롤 테이블을 사용하려면 R+ Manager 2.0을 통해 펌웨어를 복구해야 합니다.
{: .notice--warning}

컨트롤 테이블은 제어기 내부에 존재하는 데이터의 집합체입니다. 사용자는 컨트롤 테이블의 주소를 이용하여
해당 주소에 저장된 데이터를 읽어오거나 새로운 데이터를 입력할 수 있습니다.
 
- **영역(EEPROM, RAM)**
컨트롤 테이블은 2개의 영역으로 구분됩니다. RAM 영역에 위치한 데이터는 전원이 인가될 때마다 다시 기본값으로 설정됩니다(Volatile).
반면 EEPROM 영역에 위치한 데이터는 값을 변경하면 전원이 꺼져도 그 값이 보존됩니다(Non-Volatile).
 
- **접근 속성(R, RW)**
컨트롤 테이블의 데이터에는 2개의 접근 속성이 있습니다.
‘RW’는 읽기와 쓰기 접근이 모두 가능합니다. 반면 ‘R’은 읽기 전용(Read Only) 속성을 갖습니다.
읽기 전용 속성의 데이터는 사용자가 임의로 값을 바꿀 수 없기 때문에 주로 측정 또는 모니터링 용도로 사용되고,
읽기 쓰기 속성(‘RW’)은 제어 용도로 사용됩니다.
 
- **기본값**
제어기에 전원이 인가될 때 컨트롤 테이블의 각 데이터는 기본값으로 설정됩니다.
사용자가 기본값을 변경하면 새로운 기본값이 적용됩니다. RAM 영역의 기본값은 전원이 인가되었을 때 설정되는 값입니다.
 
- **크기**
데이터의 크기는 용도에 따라 1 ~ 4 byte로 정해져 있습니다. Instruction Packet을 통해 데이터를 변경할 때는 해당 데이터의 크기를 확인하시기 바랍니다.


## [EEPROM Area](#eeprom-area)

| 주소 | 크기 |       데이터        |         설명         | 접근속성 | 기본값 |
|:----:|:----:|:-------------------:|:--------------------:|:--------:|:------:|
|  0   |  2   |    Model Number     |      모델 변호       |    R     |  400   |
|  6   |  1   |  Firmware Version   |   펌웨어 버전 정보   |    R     |   -    |
|  7   |  1   |         ID          |      제어기 ID       |    RW    |  200   |
|  8   |  1   |      Baud Rate      |   제어기 통신속도    |    R     |   1    |
|  9   |  1   |  Return Delay Time  |    응답 지연 시간    |    RW    |   0    |
|  10  |  1   | Status Return Level |      응답 레벨       |    RW    |   2    |
|  11  |  1   | Bootloader Version  |  부트로더 버전 정보  |    R     |   -    |
|  12  |  1   |    DXL Baud Rate    | 다이나믹셀 통신속도  |    RW    |   3    |
|  16  |  1   |  DYNAMIXEL Channel  | 다이나믹셀 포트 선택 |    RW    |   0    |

## [RAM Area](#ram-area)

| 주소 | 크기 |             데이터              |            설명            | 접근속성 | 기본값 |
|:----:|:----:|:-------------------------------:|:--------------------------:|:--------:|:------:|
|  21  |  1   |           Mode Number           |       현재 모드 번호       |    RW    |   -    |
|  26  |  1   |          Button Status          |      사용자버튼 상태       |    R     |   0    |
|  66  |  2   |        Motion Play Page         |   모션 실행 페이지 번호    |    RW    |   0    |
|  68  |  1   |       Motion Play Status        |       모션 실행 상태       |    R     |   -    |
|  73  |  1   |        128ms Timer Value        |      128ms 타이머 값       |    RW    |   0    |
|  74  |  2   |         1ms Timer Value         |       1ms 타이머 값        |    RW    |   0    |
|  77  |  1   |          Random Number          |        임의의 숫자         |    RW    |   -    |
|  79  |  1   |            Green LED            |        녹색 LED 값         |    RW    |   0    |
|  82  |  1   |           Motion LED            |    모션중 LED 사용 여부    |    RW    |   0    |
| 360  |  2   |     Port 1 IR Sensor Value      |  1번 포트 적외선 센서 값   |    R     |   -    |
| 366  |  2   |     Port 4 IR Sensor Value      |  4번 포트 적외선 센서 값   |    R     |   -    |
| 368  |  2   |     Port 1 DMS Sensor Value     |    1번 포트 DMS 센서 값    |    R     |   -    |
| 370  |  2   |     Port 2 DMS Sensor Value     |    2번 포트 DMS 센서 값    |    R     |   -    |
| 372  |  2   |     Port 3 DMS Sensor Value     |    3번 포트 DMS 센서 값    |    R     |   -    |
| 374  |  2   |     Port 4 DMS Sensor Value     |    4번 포트 DMS 센서 값    |    R     |   -    |
| 376  |  1   |    Port 1 Touch Sensor Value    |   1번 포트 터치 센서 값    |    R     |   -    |
| 377  |  1   |    Port 2 Touch Sensor Value    |   2번 포트 터치 센서 값    |    R     |   -    |
| 378  |  1   |    Port 3 Touch Sensor Value    |   3번 포트 터치 센서 값    |    R     |   -    |
| 379  |  1   |    Port 4 Touch Sensor Value    |   4번 포트 터치 센서 값    |    R     |   -    |
| 381  |  1   |     Port 2 LED Module Value     |  2번 포트 LED모듈 제어 값  |    RW    |   0    |
| 382  |  1   |     Port 3 LED Module Value     |  3번 포트 LED모듈 제어 값  |    RW    |   0    |
| 386  |  2   |    Port 2 User Device Value     |   2번 포트의 사용자 장치   |    RW    |   0    |
| 388  |  2   |    Port 3 User Device Value     |   3번 포트의 사용자 장치   |    RW    |   0    |
| 392  |  1   | Port 1 Temperature Sensor Value |   1번 포트 온도 센서 값    |    R     |   -    |
| 393  |  1   | Port 2 Temperature Sensor Value |   2번 포트 온도 센서 값    |    R     |   -    |
| 394  |  1   | Port 3 Temperature Sensor Value |   3번 포트 온도 센서 값    |    R     |   -    |
| 395  |  1   | Port 4 Temperature Sensor Value |   4번 포트 온도 센서 값    |    R     |   -    |
| 396  |  1   | Port 1 Ultrasonic Sensor Value  |  1번 포트 초음파 센서 값   |    R     |   -    |
| 397  |  1   | Port 2 Ultrasonic Sensor Value  |  2번 포트 초음파 센서 값   |    R     |   -    |
| 398  |  1   | Port 3 Ultrasonic Sensor Value  |  3번 포트 초음파 센서 값   |    R     |   -    |
| 399  |  1   | Port 4 Ultrasonic Sensor Value  |  4번 포트 초음파 센서 값   |    R     |   -    |
| 400  |  1   |  Port 1 Magnetic Sensor Value   |   1번 포트 자석 센서 값    |    R     |   -    |
| 401  |  1   |  Port 2 Magnetic Sensor Value   |   2번 포트 자석 센서 값    |    R     |   -    |
| 402  |  1   |  Port 3 Magnetic Sensor Value   |   3번 포트 자석 센서 값    |    R     |   -    |
| 403  |  1   |  Port 4 Magnetic Sensor Value   |   4번 포트 자석 센서 값    |    R     |   -    |
| 404  |  1   |   Port 1 Motion Sensor Value    | 1번 포트 동작 감지 센서 값 |    R     |   -    |
| 405  |  1   |   Port 2 Motion Sensor Value    | 2번 포트 동작 감지 센서 값 |    R     |   -    |
| 406  |  1   |   Port 3 Motion Sensor Value    | 3번 포트 동작 감지 센서 값 |    R     |   -    |
| 407  |  1   |   Port 4 Motion Sensor Value    | 4번 포트 동작 감지 센서 값 |    R     |   -    |
| 409  |  1   |    Port 2 Color Sensor Value    |   2번 포트 칼라 센서 값    |    R     |   -    |
| 410  |  1   |    Port 3 Color Sensor Value    |   3번 포트 칼라 센서 값    |    R     |   -    |

**참고**: R+ Manager 2.0을 통해서 제어기를 연결하면 컨트롤 테이블을 확인할 수 있습니다. ([컨트롤 테이블 확인하기])
{: .notice}

**주의** : R+Manager를 통해 OpenCM9.04의 펌웨어를 복구시 제어기와 연결된 다이나믹셀의 ID가 200을 사용하지 않도록 주의해주세요.  
기본 펌웨어에서 ID 200은 OpenCM9.04에 할당됩니다.
{: .notice--warning}

# [하드웨어](#하드웨어)

## [메모리 맵](#메모리-맵)

![](/assets/images/parts/controller/opencm904/memory_map.png)

## [블럭 다이어그램](#블럭-다이어그램)

OpenCM9.04의 전체 블럭 다이어그램은 아래와 같습니다. OpenCM9.04는 32비트 Cortex-M3 코어를 가진 STM32F103CB 마이크로컨트롤러를 중심으로 회로가 구성되어 있습니다.  
전원 회로는 5V와 3.3V 레귤레이터가 다단(Cascade) 형태로 구성되어 있고 5V는 다이나믹셀 TTL 버스에 공급되고 3.3V는 마이크로컨트롤러 및 5핀 포트, 4핀 통신포트에 공급됩니다.  
OpenCM9.04의 USB 2.0 FS를 지원하고 Micro-B 커넥터를 이용해 프로그램을 다운로드 받거나 데이터 통신을 수행합니다.  
USART 1번 채널은 다이나믹셀 TTL Bus에 할당되어 있어서 핀11(TX1) 12(RX1)을 이용한 중복사용은 불가능합니다.

![](/assets/images/parts/controller/opencm904/opencm904_01.png)

> OpenCM9.04 블럭 다이어그램

## [각 부 명칭](#각-부-명칭)

![](/assets/images/parts/controller/opencm904/opencm904_02.png)

### [전원 스위치](#전원-스위치)
보드와 다이나믹셀 전원을 on/off하는 스위치 입니다. 단, USB 연결시 보드 전원은 on/off되지 않습니다.

### [직렬 배터리 소켓](#직렬-배터리-소켓)
LBS-04 리튬 이온 배터리 2개를 직렬 연결하는 커넥터 입니다. 배터리를 2개 직렬 연결한 상태에서 충전할 경우 쇼트위험이 있으므로 반드시 보드와 연결을 분리해서 충전해주세요.

### [다이나믹셀 TTL 소켓](#다이나믹셀-ttl-소켓)
3핀 케이블(다이나믹셀 TTL Bus)을 사용하는 다이나믹셀을 Daisy chain으로 연결하기 위한 포트 입니다.

{% include kr/dxl/pinout_warning.md %}

### [통신포트](#통신포트)
[BT-410],[BT-210], [BT-110], [ZIG-110], [LN-101] 등과 같은 4핀 케이블을 연결해서 외부 장치와 유/무선 통신을 수행합니다. OpenCM9.04의 4핀 통신 포트는 Serial2(USART2)를 사용합니다.

![](/assets/images/parts/controller/opencm904/opencm9.04_1-1.jpg)

> 4핀 통신 포트 핀맵

![](/assets/images/parts/controller/opencm904/opencm904_04.png)  

> OpenCM9.04와 스마트폰을 이용한 무선 통신 연결 예시

![](/assets/images/parts/controller/opencm904/opencm904_05.png)

> OpenCM9.04와 RC100을 이용한 블루투스 무선 통신 연결 예시

![](/assets/images/parts/controller/opencm904/opencm904_06.png)   

> OpenCM9.04와 RC100을 이용한 지그비 무선 통신 연결 예시

![](/assets/images/parts/controller/opencm904/opencm904_07.png)  

> OpenCM9.04와 LN-101을 이용한 유선 통신 연결 예시

### [사용자 버튼](#사용자-버튼)
사용자가 제어 할 수 있는 스위치 입니다. 23번핀 혹은 BOARD_BUTTON_PIN으로 사용할 수 있고 pinMode()에서 INPUT_PULLDOWN옵션으로 초기화해서 사용합니다.  
그리고 OpenCM9.04에서 다운로드가 되지 않을 때 User button을 누른 상태에서 USB를 연결하면 Status LED가 계속 켜지면서 바로 다운로드 모드로 진입합니다.

![](/assets/images/parts/controller/opencm904/opencm904_08.png)

> OpenCM9.04는 User button으로 긴급 복구 모드 진입을 할 수 있습니다.

### [외부 ADC 기준전압 점퍼](#외부-adc-기준전압-점퍼)
Analog 기준전압을 변경할 수 있습니다. [입출력 IO헤더](#입출력-io헤더)를 참고해주십시요.  

### [Micro-B USB](#micro-b-usb)
OpenCM9.04를 다운로드 또는 PC와 같은 외부 장치와 USB 통신을 수행하며 동시에 5V 전원이 공급됩니다.  
배터리 연결시 USB 5V는 자동으로 차단되고 배터리로부터 전원을 공급받습니다. 만약 과전류가 흐를 경우 내장된 Fuse가 USB 5V에서 흐르는 전류를 차단하므로 사용자 PC가 손상될 위험으로부터 보호됩니다

![](/assets/images/parts/controller/opencm904/opencm904_09.png)

### [상태 LED](#상태-led)
OpenCM9.04에서 프로그래밍 확인을 위한 테스트 LED입니다. 14번 핀 혹은 BOARD_LED_PIN이 HIGH이면 꺼지고 LOW가 되면 켜집니다. PWM으로 제어 가능합니다.

![](/assets/images/parts/controller/opencm904/opencm904_10.png)

> Status LED 위치

### [리셋 버튼](#리셋-버튼)
CPU의 리셋을 수행합니다.

### [JTAG/SWD 4 PIN](#jtagswd-4-pin)
ST-LINK와 같은 In-Circuit Debugger and Programmer와 연결할 수 있습니다.  
JTAG/SWD 4핀 포트를 통해서 전문가를 위한 별도의 상용개발프로그램을 이용 가능합니다. 아래는 ST-LINK와의 연결도 예시입니다.

![](/assets/images/parts/controller/opencm904/opencm904_11.png)

> ST-LINK 와 OpenCM9.04 연결 예시

### [로보티즈 5핀 포트](#로보티즈-5핀-포트)
ROBOTIS 5핀 장치(모듈)를 연결해 사용 할 수 있습니다.

![](/assets/images/parts/controller/opencm904/opencm904_12.png)

> 5핀 포트 번호 및 사용 방법

![](/assets/images/parts/controller/opencm904/opencm904_13.png)

> 5핀 케이블 연결 방향

| 5핀 장치 종류 | 포트 1 | 포트 2 | 포트 3 | 포트 4 |
|:-------------:|:------:|:------:|:------:|:------:|
|  적외선센서   |   O    |   X    |   X    |   O    |
|    DMS센서    |   O    |   O    |   O    |   O    |
|  자이로센서   |   O    |   O    |   O    |   O    |
|   접촉센서    |   O    |   O    |   O    |   O    |
|   컬러센서    |   X    |   O    |   O    |   X    |
|   자석센서    |   O    |   O    |   O    |   o    |
|   온도센서    |   O    |   O    |   O    |   O    |
| 동작감지센서  |   O    |   O    |   O    |   O    |
|    LED모듈    |   X    |   O    |   O    |   X    |

> 로보티즈 센서 및 LED 모듈 호환 리스트

### [입출력 IO헤더](#입출력-io헤더)
OpenCM9.04의 CPU인 STM32F103CB의 GPIO 핀들이 외부로 인터페이스 되어 있어서 자유롭게 활용 가능합니다.  

핀 0~25번까지 총26개의 GPIO 핀은 디지털 입력 및 출력이 가능하고 3.3V에서 동작합니다.  
디지털 출력에서 HIGH일 경우 3.3V이고 LOW일때는 0V입니다.  
디지털 출력에서 최대 토글 스피드는 18Mhz입니다.(단, 핀22, 23은 최대 2Mhz)디지털 입력의 경우 0V~3.3V까지만 입력 가능하지만 아래의 핀들은 5V입력이 가능합니다.  
그 외에 핀에 3.3V 이상의 전압을 입력할 경우 OpenCM9.04가 손상될 수 있으니 주의하세요.  

**5V입력가능한 핀(5V Tolerant) : 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21**  

각 핀에서 최대로 공급(Source) 또는 받아들일(Sink) 수 있는 전류는 최대 25mA입니다.(단 핀22,  23의 경우 3mA)  
OpenCM9.04의 모든 GPIO핀들은 내부적으로 pull-up 또는 pull-down이 지원되고 소프트웨어로 변경할 수 있습니다. 참고로 pull-up 또는 pull-down 저항은 40Kohm(Typical)입니다.  
기타 궁금한 사항은 OpenCM9.04의 CPU인 STM32F103CB의 데이터시트를 참고하세요.

![](/assets/images/parts/controller/opencm904/opencm904_14.png)

> OpenCM9.04 GPIO 핀맵

| 기능             | 아두이노 핀   | 설명                   |
|:-----------------|:--------------|:-----------------------|
| Serial/SerialUSB | USB Port      |                        |
| Serial1          | N/A           | DXL Port               |
| Serial2          | A4,  A5       | 4PIN UART              |
| Serial3          | D24, D25      | OpenCM485 EXP DXL Port |
| SPI1             | A1, A6, A7    |                        |
| SPI2             | D19, D20, D21 |                        |
| PWM              | A2 ~ D14      |                        |
| ADC              | A0 ~ A9       |                        |
| LED              | D14           |                        |
| EXTI             | A0 ~ D25      |                        |
| I2C              | D24, D25      |                        |
| BUTTON           | D23           |                        |
| 5PIN #1          | D2, D6, D7    |                        |
| 5PIN #2          | D3, D8, D9    |                        |
| 5PIN #3          | D0, D10, D11  |                        |
| 5PIN #4          | D1, D12, D13  |                        |
| 4PIN UART        | D1, D12, D13  | Serial2                |

- Serial(USART) : 11(TX1), 12(RX1), 4(TX2), 5(RX2), 24(TX3), 25(RX3)
- PWM : 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
- SPI : 0(SS1), 1(SCK1),6(MISO1) ,7(MOSI1), 18(SS2) ,19(SCK2) ,20(MISO2) ,21(MOSI2)
- LED : 14 (BOARD_LED_PIN is defined as 14)
- BUTTON : 23 (BOARD_BUTTON_PIN is defined as 23)

- RST : CPU Reset 신호와 연결된 핀입니다.
- 5V : 배터리 연결시 5V 전원을 사용할 수 있는 핀입니다. 단 USB 연결시 5V 전압이 출력되지 않습니다.
- 3.3V : 배터리 연결 혹은 USB 연결시 3.3V 전원을 사용할 수 있는 핀입니다.
- GND : -핀과 같이 연결되어 있고 보드 전체의 GND(-) 단자입니다.
- A0 : 디지털 입출력및 아날로그 입력이 가능합니다.
- A1 : 디지털 입출력및 아날로그 입력이 가능합니다. SPI 1번채널의 SCK클럭핀으로 사용 가능합니다.
- A2 : 디지털 입출력및 아날로그 입력이 가능합니다. PWM 출력이 가능합니다.
- A3 : 디지털 입출력및 아날로그 입력이 가능합니다. PWM 출력이 가능합니다.
- A4 : 디지털 입출력및 아날로그 입력이 가능합니다. PWM 출력이 가능합니다. USART2(Serial2) 채널의 TXD 핀으로 사용되고 4핀 통신포트의 TX2와 연결되어 있습니다.
- A5 : 디지털 입출력및 아날로그 입력이 가능합니다. PWM 출력이 가능합니다. USART2(Serial2) 채널의 RXD 핀으로 사용되고 4핀 통신포트의 RX2와 연결되어 있습니다.
- A6 : 디지털 입출력및 아날로그 입력이 가능합니다. PWM 출력이 가능합니다. SPI 1번 채널의 MISO 핀으로 사용 가능합니다.
- A7 : 디지털 입출력및 아날로그 입력이 가능합니다. PWM 출력이 가능합니다. SPI 1번 채널의 MOSI 핀으로 사용 가능합니다.
- A8 : 디지털 입출력및 아날로그 입력이 가능합니다. PWM 출력이 가능합니다.
- A9 : 디지털 입출력및 아날로그 입력이 가능합니다. PWM 출력이 가능합니다.
- D10 : 디지털 입출력이 가능합니다. PWM 출력이 가능합니다.
- D11 : 디지털 입출력이 가능합니다. PWM 출력이 가능합니다. USART1의 TX핀입니다.
- D12 : 디지털 입출력이 가능합니다. PWM 출력이 가능합니다. USART1의 RX핀입니다.
- D13 : 디지털 입출력이 가능합니다. PWM 출력이 가능합니다.
- D14 : 디지털 입출력이 가능합니다. PWM 출력이 가능합니다. Status LED와 연결된 핀입니다. BOARD_LED_PIN으로 미리 define되어 있습니다.
- D15 : 디지털 입출력이 가능합니다.
- VCC(+) : 보드 전체 +전원 입력단입니다. 연속된 2개의 홀이 VCC(+)에 해당합니다. 배터리 소켓의 +단자와 연결되어 있습니다.
- GND(-):보드 전체 -전원 입력단입니다. 연속된 2개의 홀이 GND(-)에 해당합니다. 배터리 소켓의 –단자와 연결되어 있습니다.
- TTL : 다이나믹셀 TTL Bus의 Data 라인입니다. 이 핀만 가지고 3핀 TTL 데이지 체인 구성을 할 수 있습니다.
- D : 다이나믹셀 TTL Bus의 통신 방향을 제어하는 핀이며, 통신 방향에 따라 TX 또는 RX를 선택합니다.
- X : 다이나믹셀 TTL Bus(Serial1)의 TX 핀입니다.
- L : 다이나믹셀 TTL Bus(Serial1)의 RX 핀입니다.
- D16 : 디지털 입출력이 가능합니다.
- D17 : 디지털 입출력이 가능합니다.
- D18 : 디지털 입출력이 가능합니다.
- D19 : 디지털 입출력이 가능합니다. SPI 2번 채널의 SCK 클럭핀으로 사용 가능합니다.
- D20 : 디지털 입출력이 가능합니다. SPI 2번 채널의 MISO핀으로 사용 가능합니다.
- D21 : 디지털 입출력이 가능합니다. SPI 2번 채널의 MOSI 클럭핀으로 사용 가능합니다.
- D22 : 디지털 입출력이 가능합니다. 최대 출력 전류가 3mA 이고 최대 토글 스피드는 2Mhz입니다.
- D23 : 디지털 입출력이 가능합니다. User Button과 연결된 핀입니다. 버튼을 누른채로 전원을 공급하면 보드가 긴급 복구(다운로드) 모드로 진입하게 되므로 유의합니다. 최대 출력 전류가 3mA 이고 최대 토글 스피드는 2Mhz입니다.
- D24 : 디지털 입출력이 가능합니다. I2C 2번 채널의 SCL 핀으로 사용 가능합니다. OpenCM485 EXP 연결시 USART3(Serial3)의 TX핀으로 사용 가능합니다.
- D25 : 디지털 입출력이 가능합니다. I2C 2번 채널의 SDA 핀으로 사용 가능합니다. OpenCM485 EXP 연결시 USART3(Serial3)의 RX핀으로 사용 가능합니다.
- 5V : 5V 공급 가능한 핀입니다. JP2 점퍼를 수정해서 아래의 AREF 핀과 연결해서 5V 기준전압으로 변경할 수 있습니다.
- AREF : CPU의 Analog Reference 핀과 연결되어 있습니다. JP2번 점퍼를 수정하면 AREF를 3.3V가 아닌 다른 전압으로 변경할 수 있습니다.(최대 5V전압만 가능합니다. 자세한 사항은 `STM32F103CB`의 데이터 시트를 참고하세요)

![](/assets/images/parts/controller/opencm904/opencm904_15.png)

> JP2 점퍼 위치 및 사용방법

![](/assets/images/parts/controller/opencm904/opencm904_16.png)

> JP2를 변경해서 아날로그 입력 기준 전압(AREF)를 5V로 변경한 예시

**주의**: 아날로그 기준전압(AREF)을 5V로 변경시 5V 입력 가능한 핀을 확인하세요.
{: .notice--danger}

## [핀 이름 정의](#핀-이름-정의)

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

## [핀 기능 정의](#핀-기능-정의)

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

# [전원 연결 방법](#전원-연결-방법)

OpenCM보드는 아래와 같이 3가지 전원 포트로 보드를 작동시킬 수 있습니다.
- LBS-40 배터리 소켓
- 오른쪽 헤더의 +-핀을 통한 공급
- USB 연결을 통한 공급

![](/assets/images/parts/controller/opencm904/opencm904_17.png)

XL-320 다이나믹셀을 구동시키기 위해서는 LBS-04 배터리 2개를 배터리 소켓에 연결하는 것을 추천합니다.

![](/assets/images/parts/controller/opencm904/opencm904_18.png)

> OpenCM9.04와 XL-320, LBS-40(Li-Ion Battery) 연결 예시

![](/assets/images/parts/controller/opencm904/dream_bat.jpg)

> LBS-40 배터리

XL-320을 제외한 3핀 TTL 다이나믹셀은 헤더의 +-핀 또는 배터리 소켓을 이용해 전원을 공급하시길 추천합니다.

![](/assets/images/parts/controller/opencm904/opencm904_19.png)

> OpenCM9.04와 AX12 연결 예시

아래의 그림과 같이 배터리 커넥터의 양끝 +,-에 연결하고 전원을 공급할 수 있는 장치로 연결도 가능합니다.  
(OpenCM9.04 뒷면을 보면 그림A와 같이 가운데 +,-가 연결 되어있으므로 아래와 같이 연결이 가능합니다.)

![](/assets/images/parts/controller/opencm904/opencm904_20.jpg)

![](/assets/images/parts/controller/opencm904/opencm904_21.jpg)

> 전원 연결 예시

아래와 그림과 같이 배터리 소켓과 +-핀으로 동시 전원 공급은 피하세요.  
그리고 배터리 소켓에 배터리를 혼용하지 마십시요. 배터리 소켓은 LBS-40 배터리만 사용해 주세요.

![](/assets/images/parts/controller/opencm904/opencm904_22.jpg)

> 배터리 커넥터 및 +-헤더핀 전원 두 개중 하나는 제거

  ![](/assets/images/parts/controller/opencm904/opencm904_23.jpg)

> 배터리 혼용 금지

USB 포트는 LBS-40 배터리 혹은 +-핀과 동시 연결해도 무방합니다.(차단회로 내장)  
+- 혹은 배터리로 공급되는 전압은 다이나믹셀의 권장 전압으로 사용하시길 추천합니다.  
그 이상의 전압은 다이나믹셀의 수명을 단축시키거나 고장의 원인이 될 수 있습니다.  
참고로 OpenCM9.04에 공급할 수 있는 최대 전압은 16V입니다. 그 이상의 전압은 OpenCM9.04의 부품들이 견디지 못할 수도 있습니다.  
USB 전원 공급만으로는 다이나믹셀의 정상 동작이 되지 않지만 그 외에 통신포트나 IO 헤더핀은 정상동작을 합니다.  
LBS-40 배터리를 직렬 연결한 채로 USB 충전은 쇼트가 생길 수 있으니 주의하세요.


# [A타입 전원 스위치 추가하기](#a타입-전원-스위치-추가하기)

A타입에는 전원 스위치가 없이 JP1이 쇼트처리 되어서 판매됩니다. 전원 스위치를 추가하기 위해서는 JP1의 납땜 처리를 제거하시고 2.54mm pitch 전원 스위치를 추가하시면 됩니다.  
전원스위치는 OpenCM9.04 악세사리 키트에 포함되어 있고 pitch가 맞는 전원 스위치를 따로 구해서 사용할 수 있습니다.

![](/assets/images/parts/controller/opencm904/opencm904_25.png)

> JP1과 전원 스위치 회로도 : JP1이 연결되어 있으면 스위치가 없이도 동작합니다.

![](/assets/images/parts/controller/opencm904/opencm904_26.png)

> OpenCM9.04의 A타입에서는 JP1의 연결을 끊고 스위치를 추가해야 제대로 동작합니다.

# [A타입 다이나믹셀 TTL 커넥터 추가하기](#a타입-다이나믹셀-ttl-커넥터-추가하기)

OpenCM9.04의 다이나믹셀 TTL 3핀 홀은 기존 다이나믹셀 TTL 3핀과 XL-320 TTL 3핀(미니타입)이 모두 호환 가능합니다. 따라서 두 가지 종류의 커넥터 모두 납땜해서 사용할 수 있습니다.  
참고로 2종류의 TTL 3핀은 OpenCM 악세사리 키트에 모두 포함되어 있습니다.

![](/assets/images/parts/controller/opencm904/opencm904_27.png)

> OpenCM9.04 A타입은 2가지 종류의 3핀 커넥터를 모두 납땜할 수 있습니다


# [소프트웨어 개발환경](#소프트웨어-개발환경)

- [아두이노 IDE]
- [OpenCM IDE]

|                       | [아두이노 IDE] | [OpenCM IDE] |
|:---------------------:|:--------------:|:------------:|
|   [다이나믹셀 SDK]    |       O        |      X       |
| [DynamixelWorkbench]  |       O        |      X       |
| [아두이노 라이브러리] |       O        |      X       |
|         OS X          |       O        | O (10.12.2)  |
|        리눅스         |       O        |  O (12.04)   |
|       윈도우즈        |       O        |      O       |

## [OpenCM IDE](#opencm-ide)
**OpenCM IDE는 더이상 지원하지 않습니다.** [아두이노 IDE]를 사용해주세요.

- [OpenCM IDE] 매뉴얼

## [아두이노 IDE](#아두이노-ide)

### [리눅스에 설치하기](#리눅스에-설치하기)

#### [USB 포트 설정](#usb-포트-설정)
리눅스 환경의 아두이노 IDE에서 루트 권한이 없이 USB를 통해 OpenCM9.04에 스케치를 업로드하기 위해서는 아래와 같은 작업이 필요합니다.

```
wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/99-opencm-cdc.rules
sudo cp ./99-opencm-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
```

#### [컴파일러 설정](#컴파일러-설정)
OpenCM9.04의 라이브러리는 32비트 플랫폼에서 작성되었기 때문에 64비트 PC에서는 아래와 같이 32비트용 컴파일러를 설치해주어야 합니다.

```
sudo apt-get install libncurses5-dev:i386
```

#### [아두이노 IDE 설치하기 (리눅스)](#아두이노-ide-설치하기-리눅스)

아래의 아두이노 홈페이지에서 최신버전의 아두이노 IDE를 다운로드 받은 뒤 설치하십시오.  
OpenCM9.04는 1.6.4 이상의 아두이노 IDE에서 동작을 확인했습니다.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

원하는 위치에 압축파일을 해제하고 터미널에서 설치파일을 실행하십시오.  
아래는 사용자의 최상위 폴더(~/)에 아두이노 IDE 1.8.3을 설치하는 예제입니다.

```
cd ~/tools/arduino-1.8.3
./install.sh
```

아두이노 IDE가 설치된 파일 경로와 절대경로명을 `.bashrc` 파일에 입력하십시오.  
여기에서는 gedit 에디터를 사용했습니다.  
입력이 완료되면 source 명령어를 사용해서 변경된 설정을 적용시켜주어야 합니다.

```
gedit ~/.bashrc
export PATH=$PATH:$HOME/tools/arduino-1.8.3
source ~/.bashrc
```

#### [아두이노 IDE 실행하기 (리눅스)](#아두이노-ide-실행하기-리눅스)

리눅스 환경에서 아두이노 IDE를 실행하기 위해서는 터미널 창에 다음과 같이 입력하십시오.

```
arduino
```

#### [OpenCM9.04를 아두이노 IDE에 포팅하기 (리눅스)](#opencm904를-아두이노-ide에-포팅하기-리눅스)

##### [환경설정 (리눅스)](#환경설정-리눅스)
아두이노 IDE가 실행되면 File > Prefereneces를 클릭한 다음 아래의 주소를 Additional Boards Maanger URLs 텍스트상자에 입력하십시오.

[https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json](https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json)

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_1.png)


##### [보드 매니저를 통해 OpenCM9.04 패키지 설치하기 (리눅스)](#보드-매니저를-통해-opencm904-패키지-설치하기-리눅스)

Tools > Board > Boards Manager를 선택하고 아래와 같이 설치하십시오. (네트워크 사정에 따라 다르지만 20분정도 걸립니다.)

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_2.png)

텍스트상자에 "OpenCM9.04"를 입력하고 검색된 패키지 중 ROBOTIS에서 제작된 패키지를 선택하고 설치하십시오.

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_3.png)

설치가 완료되면 “INSTALLED” 라는 문구가 표시됩니다.

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_4.png)

Tools > Board에서 OpenCM9.04 보드가 보이는지 확인하십시오. OpenCM9.04 관련 소스를 불러오기 위해서는 OpenCM9.04 보드를 선택해야 합니다.

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_5.png)

##### [포트 설정 (리눅스)](#포트-설정-리눅스)
여기에서는 프로그램을 업로드하기 위한 포트 설정을 합니다.  
OpenCM9.04와 PC가 USB를 통해 연결되어 있어야 합니다.

Tools > Port > /dev/ttyACM0를 선택하십시오.

`/dev/ttyACM0`의 마지막 숫자는 PC의 환경에 따라 바뀔 수 있습니다.
{: .notice}


![](/assets/images/parts/controller/opencm904/opencm9.04_linux_6.png)

### [맥에 설치하기](#맥에-설치하기)

#### [아두이노 IDE 설치하기 (맥)](#아두이노-ide-설치하기-맥)

아래의 아두이노 홈페이지에서 최신버전의 아두이노 IDE를 다운로드 받은 뒤 설치하십시오.  
OpenCM9.04는 1.6.4 이상의 아두이노 IDE에서 동작을 확인했습니다.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

#### [아두이노 IDE 실행하기 (맥)](#아두이노-ide-실행하기-맥)

맥에서 아두이노 IDE를 실행하기 위해서는 아래와 같이 아두이노 IDE 아이콘을 클릭하십시오.

![](/assets/images/parts/controller/opencm904/arduino_mac_01.png)

![](/assets/images/parts/controller/opencm904/arduino_mac_02.png)

#### [OpenCM9.04를 아두이노 IDE에 포팅하기 (맥)](#opencm904를-아두이노-ide에-포팅하기-맥)

##### [환경설정 (맥)](#환경설정-맥)
아두이노 IDE가 실행되면 File > Prefereneces를 클릭한 다음 아래의 주소를 Additional Boards Maanger URLs 텍스트상자에 입력하십시오.

[https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json](https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json)

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_1.png)

##### [보드 매니저를 통해 OpenCM9.04 패키지 설치하기 (맥)](#보드-매니저를-통해-opencm904-패키지-설치하기-맥)
Tools > Board > Boards Manager를 선택하고 아래와 같이 설치하십시오. (네트워크 사정에 따라 다르지만 20분정도 걸립니다.)

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_2.png)

텍스트상자에 "OpenCM9.04"를 입력하고 검색된 패키지 중 ROBOTIS에서 제작된 패키지를 선택하고 설치하십시오.

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_3.png)

설치가 완료되면 “INSTALLED” 라는 문구가 표시됩니다.

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_4.png)

Tools > Board에서 OpenCM9.04 보드가 보이는지 확인하십시오. OpenCM9.04 관련 소스를 불러오기 위해서는 OpenCM9.04 보드를 선택해야 합니다.

##### [포트 설정 (맥)](#포트-설정-맥)
여기에서는 프로그램을 업로드하기 위한 포트 설정을 합니다.  
OpenCM9.04와 PC가 USB를 통해 연결되어 있어야 합니다.

Tools > Port > /dev/ttyACM0를 선택하십시오.

`/dev/ttyACM0`의 마지막 숫자는 PC의 환경에 따라 바뀔 수 있습니다.
{: .notice}

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_6.png)

### [윈도우즈에 설치하기](#윈도우즈에-설치하기)

#### [USB 드라이버 설치 하기](#usb-드라이버-설치-하기)
USB 포트를 통해 OpenCM9.04를 윈도우즈 환경에서 사용하려면 USB CDC 드라이버를 설치해야 합니다. 아래 방법으로 설치하시기 바랍니다.

- [USB 드라이버 설치]{: .popup}

#### [아두이노 IDE 설치하기 (윈도우즈)](#아두이노-ide-설치하기-윈도우즈)

아래의 아두이노 홈페이지에서 최신버전의 아두이노 IDE를 다운로드 받은 뒤 설치하십시오.  
OpenCM9.04는 1.6.4 이상의 아두이노 IDE에서 동작을 확인했습니다.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

윈도우즈 버전의 아두이노 IDE는 압축파일 형태와 설치 형태로 구분됩니다. 선호하는 방법으로 설치하시기 바랍니다.

#### [OpenCM9.04를 아두이노 IDE에 포팅하기 (윈도우즈)](#opencm904를-아두이노-ide에-포팅하기-윈도우즈)

##### [환경설정 (윈도우즈)](#환경설정-윈도우즈)
아두이노 IDE가 실행되면 File > Prefereneces를 클릭한 다음 아래의 주소를 Additional Boards Maanger URLs 텍스트상자에 입력하십시오.

[https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json](https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json)

![](/assets/images/parts/controller/opencm904/opencm904_win_1.png)

##### [보드 매니저를 통해 OpenCM9.04 패키지 설치하기 (윈도우즈)](#보드-매니저를-통해-opencm904-패키지-설치하기-윈도우즈)
Tools > Board > Boards Manager를 선택하고 아래와 같이 설치하십시오. (네트워크 사정에 따라 다르지만 20분정도 걸립니다.)

![](/assets/images/parts/controller/opencm904/opencm904_win_2.png)

텍스트상자에 "OpenCM9.04"를 입력하고 검색된 패키지 중 ROBOTIS에서 제작된 패키지를 선택하고 설치하십시오.

![](/assets/images/parts/controller/opencm904/opencm904_win_3.png)

설치가 완료되면 “INSTALLED” 라는 문구가 표시됩니다.

![](/assets/images/parts/controller/opencm904/opencm904_win_4.png)

Tools > Board에서 OpenCM9.04 보드가 보이는지 확인하십시오. OpenCM9.04 관련 소스를 불러오기 위해서는 OpenCM9.04 보드를 선택해야 합니다.

![](/assets/images/parts/controller/opencm904/opencm904_win_5.png)

##### [포트 설정 (윈도우즈)](#포트-설정-윈도우즈)
여기에서는 프로그램을 업로드하기 위한 포트 설정을 합니다.  
OpenCM9.04와 PC가 USB를 통해 연결되어 있어야 합니다.

Tools > Port > COM1를 선택하십시오.

`COM1`의 마지막 숫자인 포트번호는 PC의 환경에 따라 바뀔 수 있습니다. 장치관리자에서 포트번호를 확인하시기 바랍니다.
{: .notice}


### [스케치 업로드하기](#스케치-업로드하기)

OpenCM9.04에 코드를 업로드 하는 방법은, 일반 아두이노 보드 (Arduino Uno 등)의 방법과 유사합니다.

USB를 통해, PC와 OpenCM9.04를 연결한 후, 업로드 버튼을 클릭하세요. 업로드를 시작할때, 보드가 아래처럼 부트로터 (Bootloader)에 진입하는지, 콘솔/메시지 창에서 확인해주세요. 부트로더에 진입하지 못하는 경우, 코드 업로드가 정상적으로 되지 않을수 있습니다. 

![](/assets/images/parts/controller/opencm904/oencm904_upload_01.png)

**참고**: OpenCM 9.04에 설치된 펌웨어의 손상으로, 부트로더에 적절히 진입하지 못할수 있습니다. 문제가 발생했을 경우, [사용자 버튼](#사용자-버튼)을 참고하세요. 
{: .notice}

## [라이브러리 API](#라이브러리-api)

아두이노 IDE에서 라이브러리를 추가하는 세가지 방법이 있습니다.

- 라이브러리 매니저를 활용하는 방법
- Zip파일로 압축된 라이브러리를 불러오는 방법
- 수동으로 설치하는 방법

각각의 방법에 대한 자세한 설명은 [Arduino Official Guide]{: .blank}에서 찾을 수 있습니다.  
다음은 라이브러리 매니저를 활용하는 방법입니다.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_01.png)

라이브러리 매니저에서 `DYNAMIXEL2Arduino`를 검색하고 설치합니다.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

DYNAMIXEL2Arduino 라이브러리가 성공적으로 설치되었다면, DYNAMIXEL2Arduino 항목에서 다이나믹셀을 제어하는 유용한 예제를 찾을 수 있습니다.

### [Dynamixel2Arduino 라이브러리](#dynamixel2arduino-라이브러리)

#### [Dynamixel2Arduino 클래스](#dynamixel2arduino-클래스)

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

#### [Master 클래스](#master-클래스)

Dynamixel2Arduino 클래스는 Master 클래스로부터 다음의 함수를 상속받습니다.

- [syncRead()]{: .popup}
- [syncWrite()]{: .popup}
- [bulkRead()]{: .popup}
- [bulkWrite()]{: .popup}
- [getLastLibErrCode()]{: .popup}

# [다운로드](#다운로드)

- `매뉴얼 다운로드` [OpenCM9.04_manual_ko.zip]
- `회로도 다운로드` [SCHEMATIC-OpenCM9.04.pdf]
- `TOP 거버 다운로드` [OpenCM9.04_REV_1.-(131009)-TOP.pdf]
- `BOTTOM 거버 다운로드` [OpenCM9.04_REV_1.-(131009)-BOTTOM.pdf]
- `거버 다운로드` [OpenCM9.04_REV_1.-(131009)-Gerber.pdf]

# [참고자료](#참고자료)

## [펌웨어 복구모드](#펌웨어-복구모드)

- 펌웨어의 오류나 잘못된 프로그램의 다운로드로 인해 제어기가 정상적으로 동작하지 않는 경우, 로보플러스 매니저 1.0 / 2.0을 이용해 펌웨어를 복구할 수 있습니다.
- 제어기에 연결된 전원을 모두 제거합니다. `User` 버튼을 누른 상태에서 PC와 연결된 USB 케이블을 제어기에 연결합니다.

  ![](/assets/images/sw/mobile/mini_firmware_02.jpg)
  > `User` 버튼

  ![](/assets/images/parts/controller/opencm904/opencm904_08.png)

- 아래와 같이 복구모드로 진입하게 되면, 녹색 LED가 켜집니다. 프로그램이나 펌웨어의 다운로드가 완료되면 제어기가 리셋되며 녹색 LED가 꺼집니다.

  ![](/assets/images/parts/controller/opencm904/recovery_led.jpg)

[R+ Manager 2.0: 펌웨어 복구](/docs/kr/software/rplus2/manager/#펌웨어-복구) 또는 [로보플러스 매니저 1.0: 펌웨어 복구](/docs/kr/software/rplus1/manager/#펌웨어-복구)를 참조하세요.
{: .notice}

## [USB 드라이버 설치 하기 ](#usb-드라이버-설치-하기-)
USB 포트를 통해 OpenCM9.04를 윈도우즈 환경에서 사용하려면 USB CDC 드라이버를 설치해야 합니다. 아래 방법으로 설치하시기 바랍니다.

- [USB 드라이버 설치]{: .popup}

## [다양한 X시리즈 사용하기](#다양한-x시리즈-사용하기)

로보티즈에서 제공하는 [소프트웨어](/docs/kr/software/#로보플러스)과 다이나믹셀-X 시리즈를 OpenCM 9.04에서 사용하기위해서는, [DYNAMIXEL Channel](#dynamixel-channel-설정하기) 설정이 필요합니다. 

**참고**: 아두이노를 사용시, 채널 설정이 필요하지 않습니다. 
{: .notice}

**참고**: OpenCM485 확장보드를 사용하면, 24V를 사용하는 다이나믹셀과 호환가능합니다. OpenCM 9.04의 전압 범위는 [제품 사양](#제품-사양)을 참고하세요.
![](/assets/images/sw/rplus2/manager/rplusmanager2_30_kr.jpg) 
{: .notice}
  
### [DYNAMIXEL Channel 설정하기](#dynamixel-channel-설정하기)

1. R+ Manager 2.0을 실행하여 DYNAMIXEL 2.0 제품을 선택한 후, 업데이트 & 테스트 메뉴를 실행합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_31_kr.jpg)

2. [LN-101](/docs/kr/parts/interface/ln-101/) 또는 [BT-210](/docs/kr/parts/communication/bt-210/)(혹은 [BT-110](/docs/kr/parts/communication/bt-110/)) 또는 Micro USB를 통해 제어기와 PC를 연결하세요. 
  
      **참고**: Micro USB를 사용하지않는경우, [통신포트](/docs/kr/parts/controller/opencm904/#통신포트)를 참고하세요.
      {: .notice}

3. 안내에 따라 제품을 검색하면 OpenCM9.04가 검색됩니다. (처음에는 OpenCM9.04의 DYNAMIXEL Channel 값이 Default로 설정되어 있어 다이나믹셀이 검색되지 않을수 있습니다.)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_32_kr.jpg)

4. 제품을 업데이트하는 과정을 거치면 컨트롤 테이블이 실행됩니다.
5. 컨트롤 테이블 항목에서 DYNAMIXEL Channel 값을 변경하세요.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_33_kr.jpg)

6. 설정이 완료되면, OpenCM 9.04 및 OpenCM485 확장보드의 전원을 끄고, 다시 켜주세요. (이때, 재부팅되면서 OpenCM9.04의 미니 TTL버스가 비활성화되고 OpenCM 485 EXP의 다이나믹셀 버스가 활성화 됩니다.)
7. 업데이트 & 테스트 메뉴를 다시 실행하여 X시리즈가 정상적으로 검색되는지 확인합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_34_kr.jpg)

8. 설정이 완료되면 사용하는 프로그램에서 다이나믹셀-X 시리즈를 사용할 수 있게 됩니다.(R+ Task 2.0 v2.1.0, R+ Motion 2.0 v2.4.0 이상 버전에서 지원)


## [도면](#도면)

![](/assets/images/parts/controller/opencm904/floor_plan.png)

{% include kr/dxl/download_center_notice.md %}

[MOLEX 53253-0370]: https://www.molex.com/molex/products/datasheet.jsp?part=active/0532530370_PCB_HEADERS.xml
[MOLEX 22-03-5035]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0022035035_PCB_HEADERS.xml
[악세서리 구매하기]: http://www.robotis.com/shop/item.php?it_id=902-0084-030
[OpenCM9.04 C Type 펌웨어 복구하기]: /docs/kr/edu/mini/#로보티즈-미니-제어기-펌웨어-업데이트
[아두이노 IDE]: #아두이노-ide
[OpenCM IDE]: /docs/kr/software/opencm_ide/getting_started/
[LN-101]: /docs/kr/parts/interface/ln-101/
[ZIG-110]: /docs/kr/parts/communication/zig-110/
[BT-110]: /docs/kr/parts/communication/bt-110/
[BT-210]: /docs/kr/parts/communication/bt-210/
[BT-410]: /docs/kr/parts/communication/bt-410/
[다이나믹셀 SDK]: /docs/kr/software/dynamixel/dynamixel_sdk/overview/
[DynamixelWorkbench]: /docs/kr/software/dynamixel/dynamixel_workbench/
[아두이노 라이브러리]: /docs/kr/parts/controller/opencm904/#라이브러리-api
[컨트롤 테이블 확인하기]: /docs/kr/software/rplus2/manager/#다이나믹셀-컨트롤-테이블
[OpenCM9.04_manual_ko.zip]: http://www.robotis.com/download/doc/controller/OpenCM9.04_ko/OpenCM9.04_manual_ko.zip
[SCHEMATIC-OpenCM9.04.pdf]: http://support.robotis.com/ko/baggage_files/opencm/opencm904_rev_10_final_schematic.pdf
[OpenCM9.04_REV_1.-(131009)-TOP.pdf]: http://support.robotis.com/ko/baggage_files/opencm/opencm9.04__rev_1.0(131009)-top.pdf
[OpenCM9.04_REV_1.-(131009)-BOTTOM.pdf]: http://support.robotis.com/ko/baggage_files/opencm/opencm9.04__rev_1.0(131009)-bottom.pdf
[OpenCM9.04_REV_1.-(131009)-Gerber.pdf]: http://support.robotis.com/ko/baggage_files/opencm/opencm9.04__rev_1.0(131009)-gerber.pdf
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
[USB 드라이버 설치]: /docs/kr/popup/usb_driver_install/
