---
layout: archive
lang: kr
ref: dynamixel_shield
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/interface/dynamixel_shield/
sidebar:
  title: 다이나믹셀 쉴드
  nav: "dynamixel_shield"
---

# [개요](#개요)
![](/assets/images/parts/interface/dynamixel_shield/with_arduino.png)

아두이노 보드에서 다이나믹셀과 RC100을 사용하기위한 쉴드 보드이며 다이나믹셀 제어를 위한 라이브러리를 제공함.

**본 제품은 아두이노 Uno를 포함하지 않습니다. 아두이노 관련 제품은 별도로 구매를 해야합니다.**
{: .notice--warning}

# [제품 사양](#제품-사양)

|   항목    |                 사양                  |
|:---------:|:-------------------------------------:|
| 동작 전압 | 7.4V (XL-320) ~ 24V (PRO / X Series)  |
| 허용전류  | 1A(아두이노), 10A(터미널 전원 커넥터) |

## [지원되는 다이나믹셀](#지원되는-다이나믹셀)

| 다이나믹셀 시리즈 |                                |                                |                                |                                |                 |
|:------------------|:-------------------------------|:-------------------------------|:-------------------------------|:-------------------------------|:----------------|
| **AX**            | [AX-12W]                       | [AX-12+/12A]                   | [AX-18F/18A]                   |                                |                 |
| **RX** `1`        | [RX-10]                        | [RX-24F]                       | [RX-28]                        | [RX-64]                        |                 |
| **DX** `1`        | [DX-113]                       | [DX-116]                       | [DX-117]                       |                                |                 |
| **EX** `1`        | [EX-106+]                      |                                |                                |                                |                 |
| **MX**            | [MX-12W]                       | [MX-28], [MX-28(2.0)]          | [MX-64], [MX-64(2.0)]          | [MX-106], [MX-106(2.0)]        |                 |
| **XL**            | [XL320]                        | [XL430-W250]                   |                                |                                |                 |
| **XM**            | [XM430-W210]                   | [XM430-W350]                   | [XM540-W150]                   | [XM540-W270]                   |                 |
| **XH**            | [XH430-W210]<br/> [XH430-W350] | [XH430-V210]<br/> [XH430-V350] | [XH540-W150]<br/> [XH540-W270] | [XH540-V150]<br/> [XH540-V270] |                 |
| **PRO H**         | [H42-20-S300-R]                | [H54-100-S500-R]               | [H54-200-S500-R]               |                                |                 |
| **PRO M**         | [M42-10-S260-R]                | [M54-40-S250-R]                | [M54-60-S250-R]                |                                |                 |
| **PRO L** `1`     | [L42-10-S300-R]                | [L54-30-S500-R]                | [L54-30-S400-R]                | [L54-50-S500-R]                | [L54-50-S290-R] |
| **PRO H(A)**      | [H42-20-S300-R(A)]             | [H54-100-S500-R(A)]            | [H54-200-S500-R(A)]            |                                |                 |
| **PRO M(A)**      | [M42-10-S260-R(A)]             | [M54-40-S250-R(A)]             | [M54-60-S250-R(A)]             |                                |                 |
| **PRO+ H**        | [PH42-020-S300-R]              | [PH54-100-S500-R]              | [PH54-100-S500-R]              |                                |                 |
| **PRO+ M**        | [PM54-060-S250-R]              | [PM54-040-S250-R]              | [PM42-010-S260-R]              |                                |                 |

`1` RX, DX, EX, PRO L 시리즈를 사용하려면 소스 코드에서 별도의 설정이 필요합니다.

# [각 부 명칭](#각-부-명칭)

![](/assets/images/parts/interface/dynamixel_shield/pinmap.png)

| 핀 번호 |  핀 이름   |          설명          |
|:-------:|:----------:|:----------------------:|
|    0    | HW UART RX |         DXL_RX         |
|    1    | HW UART TX |         DXL_TX         |
|    7    | SW UART RX | `주의2` SoftwareSerial |
|    8    | SW UART TX | `주의2` SoftwareSerial |

|      항목       |                   핀 이름                    |       설명       |
|:---------------:|:--------------------------------------------:|:----------------:|
| 다이나믹셀 포트 |           TTL, TTL(XL-430), RS485            |     `주의3`      |
|   전원 스위치   |    Power SW (다이나믹셀 포트 전원 스위치)    |        -         |
|   UART 스위치   | UART SW (업로드 또는 다이나믹셀 선택 스위치) |     `주의1`      |
|   Jumper Cap    |                  전원 선택                   | '전원 연결 방법' |

-	아두이노 핀 0번 / 1번이 다이나믹셀 제어를 위한 시리얼 포트
-	아두이노 핀 2번은 방향 제어를 위한 제어핀
-	다이나믹셀 제어를 위해서 하드웨어 시리얼 포트를 사용하기 때문에 아두이노 핀 7/8번을 이용하여 소프트웨어 시리얼로 RC100 혹은 LN101을 연결하여 시리얼 통신 수행

{% capture shield_01 %}
`주의1` UART SW(SW_2)를 Upload로 세팅해야, 펌웨어를 USB 포트를 통해서 업로드 할 수 있다. 다이나믹셀로 세팅해야만, 다이나믹셀을 활용할 수 있다. 이 때는, USB 포트를 사용하지 못하므로, 펌웨어를 업로드 할 수 없다.  
`주의2` SoftwareSerial을 지원하지 않는 보드를 사용한다면, 핀 7번과 8번을 UART 통신으로 사용하지 못한다.  
`주의3` TTL, TTL (XL-430) and RS485 커넥터들은 병렬로 연결되어 하나의 serial을 사용한다.
{% endcapture %}

<div class="notice--warning">{{ shield_01 | markdownify }}</div>

# [전원 연결 방법](#전원-연결-방법)

|                           VIN 전원 공유                           |                           VIN 전원 분리                           |
|:-----------------------------------------------------------------:|:-----------------------------------------------------------------:|
| ![](/assets/images/parts/interface/dynamixel_shield/power_01.png) | ![](/assets/images/parts/interface/dynamixel_shield/power_02.png) |

- 전원 입력은 점퍼캡의 설치 유무에 따라 다음과 같이 나뉜다.
  1. VIN 전원 공유 : 아두이노의 SMPS 커넥터를 이용한 전원 사용
  2. VIN 전원 분리 : 다이나믹셀 쉴드의 전원 입력 커텍터를 이용한 전원 사용

- 아두이노 보드의 USB 전원으로는 다이나믹셀 전원 연결이 되지 않기 때문에 반드시 외부 전원을 연결 해야 한다.
-	전원 입력 커넥터를 사용할 때는 **반드시 전원의 극성을 확인** 하고 연결해서 사용해야한다.

  ![](/assets/images/parts/interface/dynamixel_shield/power_polarity.png)


# [스위치](#스위치)

![](/assets/images/parts/interface/dynamixel_shield/switches_kr.png)

## [업로드 스위치](#업로드-스위치)

-	다이나믹셀 제어를 위해서 아두이노 보드의 하드웨어 시리얼 포트를 사용하는데 같은 포트로 업로드가 진행 되기 때문에 두 포트가 충돌이 날 수 있다.
-	따라서 업로드를 위해서는 시리얼 포트 스위치를 이용하여 Upload 위치로 이동 시킨 후 업로드를 한다.
-	업로드가 완료된 후에는 다이나믹셀 제어를 위해서 스위치를 다이나믹셀 위치로 이동 시켜야한다. 이동 시키지 않는다면 다이나믹셀 구동이 되지 않는다.

## [다이나믹셀 전원 스위치](#다이나믹셀-전원-스위치)

-	다이나믹셀 커넥터의 전원을 별도로 On/Off 할수 있는 스위치이다.


# [다이나믹셀 쉴드 라이브러리](#다이나믹셀-쉴드-라이브러리)

## [특징](#특징)

- 아두이노 보드 호환
-	다이나믹셀 프로토콜 1.0/2.0 지원
-	최대 16개 다이나믹셀 제어 가능(일반적으로 XL-320, XL430-W250은 각 모터당 0.4 ~ 0.6A를 소모함)
-	SynWrite 지원
-	RC100 라이브러리 지원
-	소프트 시리얼 라이브러리를 이용한 시리얼 통신
- 다이나믹셀 쉴드 라이브러리 버전 0.1.0부터 DYNAMIXEL2Arduino 라이브러리를 기반으로 사용

## [라이브러리 설치](#라이브러리-설치)

아두이노 IDE에서 라이브러리를 추가하는 세가지 방법이 있다.

- 라이브러리 매니저를 활용하는 방법
- Zip파일로 압축된 라이브러리를 불러오는 방법
- 수동으로 설치하는 방법

각각의 방법에 대한 자세한 설명은 [Arduino Official Guide]에서 찾을 수 있다.  
다음은 라이브러리 매니저를 활용하는 예이다.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_01.png)

다이나믹셀 쉴드 라이브러리(v0.1.0 이상)를 사용하기 위해서는 DYNAMIXEL2Arduino 라이브러리를 먼저 설치해야 한다.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

![](/assets/images/parts/interface/dynamixel_shield/library_manager_03.png)

라이브러리를 설치하였다면, examples 항목에 DynamixelShield가 생기고 사용 가능한 예제를 볼 수 있다.

![](/assets/images/parts/interface/dynamixel_shield/examples.png)


## [라이브러리 API](#라이브러리-api)

### [다이나믹셀 쉴드(v0.1.0 이상)](#다이나믹셀-쉴드v010-이상)

**주의** : DYNAMIXEL Shield 라이브러리(v0.1.0 이상)를 사용하기 위해서는 [DYNAMIXEL2Arduino 라이브러리](#라이브러리-설치)를 설치해야 합니다.
{: .notice--warning}

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

#### [RobotisRemoteController 클래스](#robotisremotecontroller-클래스)

- [begin()][rc100_begin]{: .popup}
- [availableData()]{: .popup}
- [readData()]{: .popup}
- [availableEvent()]{: .popup}
- [readEvent()]{: .popup}
- [flushRx()]{: .popup}
- [available()]{: .popup}
- [read()]{: .popup}
- [peek()]{: .popup}
- [flush()]{: .popup}
- [write()]{: .popup}

### [다이나믹셀 쉴드(v0.0.5)](#다이나믹셀-쉴드v005)

**주의** : 이 버전의 API는 더이상 지원되지 않습니다.
{: .notice--warning}

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


[AX-12W]: /docs/kr/dxl/ax/ax-12w/
[AX-12+/12A]: /docs/kr/dxl/ax/ax-12a/
[AX-18F/18A]: /docs/kr/dxl/ax/ax-18a/
[DX-113]: /docs/kr/dxl/dx/dx-113/
[DX-116]: /docs/kr/dxl/dx/dx-116/
[DX-117]: /docs/kr/dxl/dx/dx-117/
[EX-106+]: /docs/kr/dxl/ex/ex-106+/
[RX-10]: /docs/kr/dxl/rx/rx-10/
[RX-24F]: /docs/kr/dxl/rx/rx-24f/
[RX-28]: /docs/kr/dxl/rx/rx-28/
[RX-64]: /docs/kr/dxl/rx/rx-64/
[MX-12W]: /docs/kr/dxl/mx/mx-12w/
[MX-28]: /docs/kr/dxl/mx/mx-28/
[MX-28(2.0)]: /docs/kr/dxl/mx/mx-28-2/
[MX-64]: /docs/kr/dxl/mx/mx-64/
[MX-64(2.0)]: /docs/kr/dxl/mx/mx-64-2/
[MX-106]: /docs/kr/dxl/mx/mx-106/
[MX-106(2.0)]: /docs/kr/dxl/mx/mx-106-2/
[XL320]: /docs/kr/dxl/x/xl320/
[XL430-W250]: /docs/kr/dxl/x/xl430-w250/
[XM430-W210]: /docs/kr/dxl/x/xm430-w210/
[XM430-W350]: /docs/kr/dxl/x/xm430-w350/
[XH430-W210]: /docs/kr/dxl/x/xh430-w210/
[XM540-W150]: /docs/kr/dxl/x/xm540-w150/
[XM540-W270]: /docs/kr/dxl/x/xm540-w270/
[XH430-W350]: /docs/kr/dxl/x/xh430-w350/
[XH430-V210]: /docs/kr/dxl/x/xh430-v210/
[XH430-V350]: /docs/kr/dxl/x/xh430-v350/
[XH540-W150]: /docs/kr/dxl/x/xh540-w150/
[XH540-W270]: /docs/kr/dxl/x/xh540-w270/
[XH540-V150]: /docs/kr/dxl/x/xh540-v150/
[XH540-V270]: /docs/kr/dxl/x/xh540-v270/
[H54-200-S500-R]: /docs/kr/dxl/pro/h54-200-s500-r/
[H54-100-S500-R]: /docs/kr/dxl/pro/h54-100-s500-r/
[H42-20-S300-R]: /docs/kr/dxl/pro/h42-20-s300-r/
[M54-60-S250-R]: /docs/kr/dxl/pro/m54-60-s250-r/
[M54-40-S250-R]: /docs/kr/dxl/pro/m54-40-s250-r/
[M42-10-S260-R]: /docs/kr/dxl/pro/m42-10-s260-r/
[H54-200-S500-R(A)]: /docs/kr/dxl/pro/h54-200-s500-ra/
[H54-100-S500-R(A)]: /docs/kr/dxl/pro/h54-100-s500-ra/
[H42-20-S300-R(A)]: /docs/kr/dxl/pro/h42-20-s300-ra/
[M54-60-S250-R(A)]: /docs/kr/dxl/pro/m54-60-s250-ra/
[M54-40-S250-R(A)]: /docs/kr/dxl/pro/m54-40-s250-ra/
[M42-10-S260-R(A)]: /docs/kr/dxl/pro/m42-10-s260-ra/
[L54-50-S500-R]: /docs/kr/dxl/pro/l54-50-s500-r/
[L54-50-S290-R]: /docs/kr/dxl/pro/l54-50-s290-r/
[L54-30-S500-R]: /docs/kr/dxl/pro/l54-30-s500-r/
[L54-30-S400-R]: /docs/kr/dxl/pro/l54-30-s400-r/
[L42-10-S300-R]: /docs/kr/dxl/pro/l42-10-s300-r/
[PH42-020-S300-R]: /docs/kr/dxl/p/ph42-020-s300-r/
[PH54-100-S500-R]: /docs/kr/dxl/p/ph54-100-s500-r/
[PH54-200-S500-R]: /docs/kr/dxl/p/ph54-200-s500-r/
[PM54-060-S250-R]: /docs/kr/dxl/p/pm54-060-s250-r/
[PM54-040-S250-R]: /docs/kr/dxl/p/pm54-040-s250-r/
[PM42-010-S260-R]: /docs/kr/dxl/p/pm42-010-s260-r/

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
[rc100_begin]: /docs/en/popup/arduino_api/rc100_begin/
[availableData()]: /docs/en/popup/arduino_api/availableData/
[readData()]: /docs/en/popup/arduino_api/readData/
[availableEvent()]: /docs/en/popup/arduino_api/availableEvent/
[readEvent()]: /docs/en/popup/arduino_api/readEvent/
[flushRx()]: /docs/en/popup/arduino_api/flushRx/
[available()]: /docs/en/popup/arduino_api/available/
[read()]: /docs/en/popup/arduino_api/read/
[peek()]: /docs/en/popup/arduino_api/peek/
[flush()]: /docs/en/popup/arduino_api/flush/
[write()]: /docs/en/popup/arduino_api/write/
