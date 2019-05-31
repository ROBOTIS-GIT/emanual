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

|항목|사양|
|:---:|:---:|
|동작 전압|7.4V (XL-320) ~ 12V (X Series)|
|허용전류|1A(아두이노), 10A(터미널 전원 커넥터)|

# [각 부 명칭](#각-부-명칭)

![](/assets/images/parts/interface/dynamixel_shield/pinmap.png)

|핀 번호|핀 이름|설명|
|:---:|:---:|:---:|
|0|HW UART RX|DXL_RX|
|1|HW UART TX|DXL_TX|
|7|SW UART RX|`주의2` SoftwareSerial|
|8|SW UART TX|`주의2` SoftwareSerial|

|항목|핀 이름|설명|
|:---:|:---:|:---:|
|다이나믹셀 포트|TTL, TTL(XL-430), RS485|`주의3`|
|전원 스위치|Power SW (다이나믹셀 포트 전원 스위치)|-|
|UART 스위치|UART SW (업로드 또는 다이나믹셀 선택 스위치)|`주의1`|
|Jumper Cap|전원 선택|'전원 연결 방법'|

-	아두이노 핀 0번 / 1번이 다이나믹셀 제어를 위한 시리얼 포트
-	아두이노 핀 2번은 방향 제어를 위한 제어핀
-	다이나믹셀 제어를 위해서 하드웨어 시리얼 포트를 사용하기 때문에 아두이노 핀 7/8번을 이용하여 소프트웨어 시리얼로 RC100 혹은 LN101을 연결하여 시리얼 통신 수행

{% capture shield_01 %}
`주의1` UART SW(SW_2)를 Upload로 세팅해야, 펌웨어를 USB 포트를 통해서 업로드 할 수 있다. Dynamixel로 세팅해야만, 다이나믹셀을 활용할 수 있다. 이 때는, USB 포트를 사용하지 못하므로, 펌웨어를 업로드 할 수 없다.  
`주의2` SoftwareSerial을 지원하지 않는 보드를 사용한다면, 핀 7번과 8번을 UART 통신으로 사용하지 못한다.  
`주의3` TTL, TTL (XL-430) and RS485 커넥터들은 병렬로 연결되어 하나의 serial을 사용한다.
{% endcapture %}

<div class="notice--warning">{{ shield_01 | markdownify }}</div>

# [전원 연결 방법](#전원-연결-방법)

|VIN 전원 공유|VIN 전원 분리|
|:---:|:---:|
|![](/assets/images/parts/interface/dynamixel_shield/power_01.png)|![](/assets/images/parts/interface/dynamixel_shield/power_02.png)|

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
-	업로드가 완료된 후에는 다이나믹셀 제어를 위해서 스위치를 Dynamixel 위치로 이동 시켜야한다. 이동 시키지 않는다면 다이나믹셀 구동이 되지 않는다

## [다이나믹셀 전원 스위치](#다이나믹셀-전원-스위치)

-	다이나믹셀 커넥터의 전원을 별도로 On/Off 할수 있는 스위치이다.


# [아두이노 쉴드 라이브러리](#아두이노-쉴드-라이브러리)

## [특징](#특징)

-	다이나믹셀 프로토콜 1.0/2.0 지원
-	최대 16개 다이나믹셀 제어 가능

(일반적으로 XL-320, XL430-W250은 각 모터당 0.4 ~ 0.6A를 소모한다.)
-	SynWrite 지원
-	RC100 라이브러리 지원
-	소프트 시리얼 라이브러리를 이용한 시리얼 통신

## [라이브러리 설치](#라이브러리-설치)

아두이노 IDE에서 라이브러리를 추가하는 세가지 방법이 있다.

- 라이브러리 매니저를 활용하는 방법
- Zip파일로 압축된 라이브러리를 불러오는 방법
- 수동으로 설치하는 방법

각각의 방법에 대한 자세한 설명은 [Arduino Official Guide]에서 찾을 수 있다.  
다음은 라이브러리 매니저를 활용하는 예이다.

![](/assets/images/parts/interface/dynamixel_shield/library_manager.png)

라이브러리를 설치하였다면, examples 항목에 DynamixelShield가 생기고 사용 가능한 예제를 볼 수 있다.

![](/assets/images/parts/interface/dynamixel_shield/examples.png)


# [라이브러리 API](#라이브러리-api)

## [라이브러리 초기화](#라이브러리-초기화)

라이브러리를 사용하기 위해서는 통신 포트의 속도와 프로토콜을 설정하여 begin 함수로 초기화 한다.

```c
dxl.begin(1000000, DXL_PACKET_VER_2_0);
```

> 1Mbps 통신 속도에 프로토콜 2.0 으로 설정


## [다이나믹셀 연결](#다이나믹셀-연결)

쉴드 라이브러리는 다이나믹셀의 모델을 기반으로 하여 자동으로 주소값을 참조하도록 되어 있기 때문에 연결된 다이나믹셀이 무엇인지 알기 위해서 연결된 다이나믹셀의 ID와 모델을 추가해야 한다.

-	자동 추가
  ```c
  dxl.ping();
  ```

  > ping 함수를 이용하여 자동으로 1번 부터 31번까지 검색을 해서 연결된 다이나믹셀이 있으면 추가한다.

-	수동 추가
  ```c
  dxl.begin(1000000);
  delay(1000);
  dxl.addMotor(1, M_XL430);
  dxl.addMotor(2, M_XL430);
  dxl.addMotor(15, M_AX12);
  ```

  > addMotor 함수를 이용하여 추가한다.


## [사용 가능한 API 목록](#사용-가능한-api-목록)

### [DynamixelShield(v0.0.5)](dynamixelshieldv005)

**주의** : 이 API는 더이상 지원되지 않으며 단종될 예정입니다. [DYNAMIXEL2Arduino](#dynamixel2arduino)를 참고해주시기 바랍니다.
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

### [DYNAMIXEL2Arduino](#dynamixel2arduino)

**참고** : 이 라이브러리는 현재 [GitHub repository]{: .blank}를 통해 다운로드 받을 수 있습니다.
{: .notice}

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
