---
layout: archive
lang: kr
ref: ax-s1
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/sensor/ax-s1/
sidebar:
  title: Integrated Sensor(AX-S1)
  nav: "ax-s1"
---

![](/assets/images/parts/sensors/ax-s1_product.png)

> 통합 센서(AX-S1)

# [개요](#introduction)

`Warning` AX-S1은 현재 단종되어 더 이상 판매되지 않습니다.
{: .notice--warning}

- AX-S1 은 센서 장치로서 로봇의 눈과 귀의 역할을 합니다. 물체의 거리 감지, 주변의 밝기 감지, 소리 감지 기능이 내장되어 있으며, 적외선 리모컨 수신부도 내장되어 있습니다. 또한 소리를 발생시키는 기능도 있습니다.  
- AX-S1 은 AX-12+ 와 외형 및 통신 방식은 동일하나 서보 모터로 동작하지는 않습니다.

# [주요사양](#specifications)

| 항목 | 사양|
|:---:|:----:|
|무게 | 37g|
|해상도 | 10bit(1024)|
|동작 온도|-5℃ ~ +85℃|
|사용 전압|9  ~ 12V (권장 전압 11.1V)|
|최대 전류|40mA|
|Command Signal|Digital Packet|
|Protocol Type|Half duplex Asynchronous Serial Communication(8bit,1stop,No Parity)|
|Link(Physical)|TTL Level Multi Drop (daisy chain type Connector)|
|ID|254 ID (0~253)|
|통신 속도|7843bps ~ 1 Mbps|
|Feedback| Infra-red Sensor, Internal Mic, Temperature, Input Voltage,  IR Remocon Tx/Rx Data, etc.|
|Material|Engineering Plastic|

# [통신방법](#how-to-communicate)
AX-S1의 통신 방법과 통신과 관련된 하드웨어 구성은 다이나믹셀 AX시리즈와 동일합니다.

- 통신 방법, 패킷 구성에 관한 내용은 [다이나믹셀 통신]을 참조하시기 바랍니다.
- 통신 하드웨어에 관한 내용은 AX시리즈의 [하드웨어 구성 통신]을 참조하시기 바랍니다.

# [컨트롤 테이블](#컨트롤-테이블)
Control Table은 다이나믹셀 내부에 존재하는 값으로서 다이나믹셀의 현재 상태와 구동에 관한 Data로 구성되어 있습니다.  
사용자는 Instruction Packet을 통해 Control Table의 data를 변경하는 방식으로 다이나믹셀을 제어할 수 있습니다.

## [EEPROM and RAM](#eeprom-and-ram)
RAM Area의 Data는 전원이 인가될 때마다 다시 초기값으로 설정됩니다. 그러나 EEPROM Area Data의 경우 값을 설정하면 전원이 Off되어도 그 값이 보존됩니다.

## [Address](#Address)
Address는Data의 위치 입니다. Dynamixel 에 Data를 쓰거나 읽기 위해서는 Packet에 그 Data가 위치해 있는 Address를 지정해 주어야 합니다.

## [접근](#access)
다이나믹셀 Data 에는 읽기 전용(R)과 읽고 쓰기가 가능한 것(RW), 두 가지가 있습니다. 읽기 전용(R)은 주로 센싱용으로 사용되는 data 이며 읽고 쓰기 가능한 것(RW)은 구동을 위한 Data 입니다.

## [초기값](#initial-value)
Control Table에서 우측에 표시된 초기값들은 EEPROM 영역 Data인 경우 공장출하 값이고, RAM Area Data인 경우는 전원이 인가되었을 때 갖는 초기값입니다.

## [상위바이트/하위바이트](#highest-lowest-byte)
Control Table 에는 명칭이 같지만 (L) 과 (H) 가 뒤에 붙어서 Address가 구분되어 있는 것들이 있습니다. 이것은 16bit가 요구되는 Data를 8bit씩 각 Address (low, High)에 나누어 표현한 것입니다. 이 두 개의 Address 는 하나의 Instruction Packet으로 동시에 write 되어야 합니다.

## [EEPROM Area](#eeprom-area)

| Address  |                  Data Name                  |      Description      | Access | Initial Value |
|:--------:|:-------------------------------------------:|:---------------------:|:------:|:-------------:|
| 0(0x00)  |      [Model Number(L)](#model-number)       | 모델번호의 하위바이트 |   R    |   13(0x0D)    |
| 1(0x01)  |      [Model Number(H)](#model-number)       | 모델번호의 상위바이트 |   R    |    0(0x00)    |
| 2(0x02)  |    [Firmware Version](#firmware-version)    |      펌웨어 버젼      |   R    |       -       |
| 3(0x03)  |                  [ID](#id)                  |     다이나믹셀 ID     |   RW   |   100(0x64)   |
| 4(0x04)  |           [Baud Rate](#baud-rate)           | 다이나믹셀 통신 속도  |   RW   |    1(0x0x)    |
| 5(0x05)  |   [Return Delay Time](#return-delay-time)   |    응답 지연 시간     |   RW   |   250(0xFA)   |
| 16(0x10) | [Status Return Level](#status-return-level) |    응답 레벨 선택     |   RW   |    2(0x02)    |

## [RAM Area](#ram-area)

|   주소    |                    데이터명                     |             설명             | 접근 |  초기값  |
|:---------:|:-----------------------------------------------:|:----------------------------:|:----:|:--------:|
| 26 (0X1A) |       [IR Left Fire Data](#distance-data)       |      왼쪽 적외선 센서값      |  R   |    -     |
| 27 (0X1B) |      [IR Center Fire Data](#distance-data)      |      중앙 적외선 센서값      |  R   |    -     |
| 28 (0X1C) |      [IR Right Fire Data](#distance-data)       |     오른쪽 적외선 센서값     |  R   |    -     |
| 29 (0X1D) |       [Light Left Data](#brightness-data)       |       왼쪽 조명 센서값       |  R   |    -     |
| 30 (0X1E) |      [Light Center Data](#brightness-data)      |       중앙 조명 센서값       |  R   |    -     |
| 31 (0X1F) |      [Light Right Data](#brightness-data)       |      오른쪽 조명 센서값      |  R   |    -     |
| 32 (0X20) |      [IR Obstacle Detected](#ir-obstacle)       |    적외선 물체 감지 유무     |  R   |    -     |
| 33 (0X21) |        [Light Detected](#light-detected)        |        조명 감지 유무        |  R   |    -     |
| 35 (0X23) |            [Sound Data](#sound-data)            |       현재 소리 크기값       |  R   |    -     |
| 36 (0X24) |     [Sound Data Max Hold](#sound-max-data)      |       최대 소리 감지값       |  RW  |    -     |
| 37 (0X25) |     [Result of Sound Counter](#sound-count)     |     최종 소리 감지 횟수      |  RW  |    -     |
| 38 (0X26) |      [Sound Detected Time(L)](#sound-time)      |  소리 감지 시간 하위 바이트  |  RW  |    -     |
| 39 (0X27) |      [Sound Detected Time(H)](#sound-time)      |  소리 감지 시간 상위 바이트  |  RW  |    -     |
| 40 (0X28) |          [Buzzer Data 0](#buzzer-data)          |          버저 음계           |  RW  |    -     |
| 41 (0X29) |          [Buzzer Data 1](#buzzer-ring)          |        버저 울림 시간        |  RW  |    -     |
| 44 (0X2C) |            [Registered](#registered)            |   Instruction의 등록 여부    |  RW  | 0 (0X00) |
| 46 (0X2E) |     [IR Remocon Data Received](#ir-arrived)     |    새 리모콘 데이터 도착     |  R   | 0 (0X00) |
| 47 (0X2F) |            [Lock](#Ax_S1_Address_2F)            |         EEPROM 잠금          |  RW  | 0 (0X00) |
| 48 (0X30) |      [Remocon RX Data 0](#remote-rx-data)       | 수신 데이터 패킷 하위 바이트 |  R   |    -     |
| 49 (0X31) |      [Remocon RX Data 1](#remote-rx-data)       | 수신 데이터 패킷 상위 바이트 |  R   |    -     |
| 50 (0X32) |      [Remocon TX Data 0](#remote-tx-data)       | 송신 데이터 패킷 하위 바이트 |  RW  |    -     |
| 51 (0X33) |      [Remocon TX Data 1](#remote-tx-data)       | 송신 데이터 패킷 상위 바이트 |  RW  |    -     |
| 52 (0X34) |  [IR Obstacle Detect CompareRD](#ir-reference)  |   적외선 물체 감지 기준값    |  RW  |    -     |
| 53 (0X35) | [Light Detect CompareRD](#brightness-reference) |       조명 감지 기준값       |  RW  |    -     |

## [컨트롤 테이블 설명](#control-table-description)

### <a name="model-number"></a>Model Number(0)
다이나믹셀의 모델 번호입니다.

## <a name="firmware-version"></a>펌웨어 버젼 (2)
다이나믹셀 펌웨어 버전입니다.

## <a name="id"></a>ID (3)
{% include en/dxl/control_table_id.md %}

### <a name="baud-rate"></a>전송속도 (4)
{% include en/dxl/control_table_baudrate.md %}

### <a name="return-delay-time"></a>Return Delay Time (5)
{% include kr/dxl/control_table_return_delay_time.md %}

### <a name="status-return-level"></a>Status Return Level(16)
{% include kr/dxl/control_table_status_return_lv.md %}

### <a name="ir-reference"></a>IR 거리감지 기준값
Dynamixel Sensor Module의 적외선 센서값에서 센서 방향에 물체가 있다고 판단하는 기준값을 설정합니다. 적외선 센서값이 이 기준값보다 크면 물체가 일정 거리 내에 있는 것이므로 물체감지 유무값(IR Obstacle Detected,Address 0x20)의 그 센서에 해당하는 비트가 ‘1’로 셋팅되며, 기준값보다 작으면 일정 거리 밖에 있는 것이므로‘0’으로 셋팅됩니다.

거리감지 기준값(IR Obstacle Detect Compare Value)은 ROM(Address 0x14)과 RAM(Address 0x34) 두 곳에 할당이 되어 있는데, 전원이 On될 때 EEPROM의 값이 RAM으로 복사됩니다.

### <a name="brightness-reference"></a>빛감지 기준값
Dynamixel Sensor Module의 조명밝기 센서값에서 조명이 켜져 있다고 판단하는 기준값을 설정합니다. 조명밝기 센서값이 이 빛감지 기준값보다 크면 조명의 밝기가 일정 밝기 이상 밝은 것이므로 조명감지 유무(Light Detected)의 그 센서에 해당하는 비트가 ‘1’로 셋팅되며, 기준값보다 작으면 조명이 기준보다 어두운 것이므로‘0’으로 셋팅됩니다.

빛감지 기준값(Light Detect Compare Value)은 ROM(Address 0x15)과 RAM(Address 0x35) 두 곳에 할당이 되어 있는데, 전원이 On될 때 EEPROM의 값이 RAM으로 복사됩니다.

### <a name="distance-data"></a>적외선 거리센서 값 (Left/Center/Right)
Dynamixel Sensor Module의 거리측정용 적외선 센서값입니다. AX-S1에 있는 적외선 발광부에서 강하게 적외선을 쏘면, 벽이나 물체에 적외선이 반사되어 되돌아오게 되는데, AX-S1에 있는 적외선 수광부 센서에서 이 반사되는 적외선의 양을 측정한 것으로, 벽이나 물체가 가까이 있을수록 높은 값으로 측정됩니다. 측정된 값은 0~255의 범위를 가지며, 일정거리 안에 들어오면
255만 나올 수 있습니다.

적외선 측정 방식이기 때문에 벽이나 물체의 색상이나 표면 질감에 따라 적외선 반사율이 차이가 있으므로 측정값에 차이가 생길 수 있습니다.

### <a name="brightness-data"></a>조명밝기 센서값 (Left/Center/Right)
Dynamixel Sensor Module의 조명감지 센서값입니다. 적외선 센서값과 동일한 개념이나, 적외선 발광부를 켜주지 않고 측정한 것으로, 조명에서 나오는 적외선만을 측정할 수 있습니다. 따라서 백열전구 같은 적외선이 많이 나오는 조명에서 조명감지 센서값이 측정될 수 있으며, 라이터나 촛불과 같은 불도 근거리에서 측정이 가능합니다. 측정된 값은 0~255의 범위를 가집니다.

### <a name="ir-obstacle"></a>물체감지 유무
AX-S1의 적외선 거리센서 값이 거리감지 기준값보다 크면 물체가 감지되었다고 판단하여 물체감지 유무값의 특정 Bit을 1로 셋팅해 줍니다. 각 센서가 나타내는 Bit은 아래 표를 참고하십시오.

|Bit   | 명칭|
|----- | -----------------|
|Bit 2 | 우측 센서 물체감지/조명감지 됨|
|Bit 1 | 중앙 센서 물체감지/조명감지 됨|
|Bit 0 | 좌측 센서 물체감지/조명감지 됨|

### <a name="light-detected"></a>조명감지 유무
AX-S1의 조명밝기 센서값이 빛감지 기준값보다 크면 빛이 감지되었다고 판단하여 조명감지 유무값의 특정 Bit을 1로 셋팅해 줍니다. 각 센서가 나타내는 Bit은 물체감지 유무값의 경우와 동일합니다. (위 Address 0x20을 참고)

### <a name="sound-data"></a>소리 크기
AX-S1의 마이크로 입력되는 소리의 크기를 측정하여 수치로 나타내어 줍니다. 소리 크기는 아래 그림과 같이 상하로 크기가 변하기 때문에, 소음이 없을 때 127~128 (0x7F~0x80) 정도의 수치가 나오며 소리가 클수록 0이나 255 (0xFF) 에 가까워진다. 소리 크기는 1초에 약 3800회 정도 입력됩니다.

![](/assets/images/parts/sensors/ax-s1_sound1.png)

### <a name="sound-max-data"></a>최대 소리 크기
AX-S1의 소리 크기 중에서 가장 큰 값을 따로 저장해 줍니다. 즉, 현재 소리 크기가 최대 소리 크기에 저장되어 있는 값보다 더 클 경우에 현재 소리 크기를 최대 소리 크기로 복사합니다.

따라서 128보다 낮은 쪽으로의 소리크기는 사실상 무시되며, 더 큰 소리가 날수록 그때의 소리 크기가 누적되어 저장된다고 보면 됩니다. 아래 그림을 보면 이해하기 쉬울 것입니다.

![](/assets/images/parts/sensors/ax-s1_sound2.png)

주의할 점은, 최대 소리 크기가 누적이 되다가 255 (0xFF)가 되어 버리면 더 이상 큰 값이 나올 수 없으므로 값이 계속 255로 유지가 됩니다. 따라서 최대 소리 크기를 측정해야 하는 상황일 때 최대 소리 크기에 ‘0’을 써주고 측정을 해주어야 합니다.

### <a name="sound-count"></a>소리감지 횟수
AX-S1은 일정 수준 이상의 큰 소리가 날 경우 1회씩 카운트 해 주 는 기능이 있습니다. 대표적인 예로 박수소리의 횟수를 카운트 하는 것이 가능합니다. 하지만 한번의 박수 소리를 여러 번으로 오인식 하는 것을 막기 위해 1회 카운트 되면 약 80msec동안은 더 이상 카운트 하지 않으며, 마지막으로 카운트한 후 800msec이 지나면 소리감지 횟수에 카운트한 값이 저장됩니다.

소리감지 횟수가 증가된 시점을 알 수 있도록 하기 위해 내부적으로 카운트를 하고 있다가, 800msec가 지난 후 소리감지 횟수에 값을 저장해 주면서 내부 카운트는 0으로 초기화됩니다. 아래 그림을 보면 좀더 이해하기 쉬울 것입니다.

![](/assets/images/parts/sensors/ax-s1_sound3.png)

### <a name="sound-time"></a>소리발생 시간
센서 모듈 AX-S1에는 소리감지 횟수를 카운트 할 때마다 그 순간의 시간을 저장해 주는 기능이 있습니다. 이 기능은 소리의 방향 탐지를 위해 제공되는 것으로, 최소한 2개의 AX-S1이 필요하며, 소리의 속도 (음속, 섭씨 20도에서 약 343m/sec)를 이용하여 두 AX-S1의 마이크에 소리가 들어오기까지의 시간차를 이용한 것입니다.

소리발생 시간은 내부적으로 시간을 세다가 (0~65535를 반복하여 카운트 한다.), 소리감지 횟수가 증가할 때 현재 카운트 값을 저장합니다. 따라서, 2개의 AX-S1을 적당한 거리를 띄워 놓고, 소리발생 시간을 Broadcasting 명령을 이용하여 동시에 0으로 초기화 시킨 후, 소리가 발생하면 두 AX-S1에는 소리의 방향에 따라 시간차가 발생하게 됩니다.

정면일 경우에는 거의 같은 시간으로 감지되겠지만, 측면에 음원이 있을 경우 AX-S1의 떨어진 거리에 비례하는 시간차가 발생합니다. 이것을 가지고 음원의 방향을 대략적으로 추정할 수 있습니다. 아래 그림을 보면 쉽게 이해할 수 있습니다.

![](/assets/images/parts/sensors/ax-s1_sound4.png)

이 AX-S1의 소리발생시간은 약 4.096 msec마다 모두 카운트하여 0부터 다시 카운트하게 된다. 따라서 소리의 속도를 이용하여 계산해 보면, 소리는 이 카운트 1당 0.02mm 정도의 거리를 이동하며, 두 AX-S1간의 거리는 70cm안에 있어야 합니다. 예를들어 두 AX-S1이 10cm 떨어져 있을 경우 위의 방식을 이용하여 측정할 경우 두 AX-S1의 소리발생 시간은 최대 5000 까지 차이가 날
수 있습니다. (5000정도 차이가 날 경우 음원이 완전히 90도 좌 혹은 우측에 있는 것이다.)

### <a name="buzzer-data"></a>버저 음계
센서 모듈 AX-S1에는 버저가 장착되어 있어서, 간단한 비프음을 낼 수 있습니다. 버저 음계는 총 52개의 음을 낼 수 있는데, 각 옥타브별로 온음, 반음이 있기 때문에 다양한 음계를 재생할 수 있습니다. 버저 음계값은 다음표와 같이 할당되어 있습니다.

![](/assets/images/parts/sensors/ax-s1_sound5.png)

### <a name="buzzer-ring"></a>버저 울림 시간
AX-S1은 버저의 울림 시간을 조절하는 기능이 있습니다. 0.1초 단위로 조절이 가능한데, 최소 길이는 0.3초로 되어 있으며, 최대로 길게 하면 5초까지 재생할 수 있습니다. 즉, 0~3을 넣으면 0.3초간 버저가 울리며, 50 이상의 값을 넣으면 그와 무관하게 5초까지만 버저가 울립니다. 또한, 버저 울림이 끝나면 자동으로 버저 울림 시간이 0으로 초기화 됩니다.

AX-S1의 버저 울림 시간에는 두 가지의 특별한 기능이 있습니다. 첫번째로, 버저를 계속  울려주는 기능입니다. 버저 울림 시간에 254를 써주고 나서 버저 음계에 원하는 음계의 번호를 써주면 버저가 멈추지 않고 계속 울리게 됩니다. 버저 울림을 멈추기 위해서는 버저 울림 시간에 0을 써주면 됩니다.

두번째 기능은 특수 멜로디를 재생해주는 기능입니다. 버저 울림 시간에 255의 값을 써 주고 버저 음계에 0~26의 값을 써 주면, 각 번호에 해당되는 27 가지의 다양한 멜로디를 재생할 수 있습니다. 멜로디 재생이 끝나면 버저울림 시간이 자동으로 0으로 초기화 됩니다.

### <a name="registered"></a>Registered Instruction

| 값    | 의미                       |
| ---- | ------------------------ |
| 0    | REG_WRITE로 전달된 명령이 없습니다. |
| 1    | REG_WRITE로 전달된 명령이 있습니다. |

`Note` ACTION 명령을 수행하면 이 값이 0으로 바뀝니다.
{: .notice}

### <a name="ir-arrived"></a>새 리모콘 데이터 도착
센서 모듈 AX-S1은 전방에 적외선 리모콘 센서 모듈이 장착되어 있기 때문에, AX-S1끼리 적외선 리모콘 통신을 할 수 있다. 2 바이트 단위로 전송이 가능합니다.

주의할 점은 AX-S1의 적외선 발광부는 전방/좌/우 3방향에 장착되어 있기 때문에 어느 방향으로든 적외선 리모콘 데이터를 전송할 수 있지만, 적외선 리모콘 센서는 전방에만 장착되어 있기 때문에 리모콘 데이터 수신은 한정된 각도에서만 가능합니다.

적외선 리모콘 데이터가 센서에 수신되면 새 리모콘 데이터 도착 값이 2로 변합니다. 2 바이트가 수신되었다는 뜻이다. 받은 리모콘 데이터를 읽어가면 자동으로 0으로 초기화 됩니다.

### <a name="lock">Lock

| 값    | 의미                    |
| ---- | --------------------- |
| 0    | EEPROM영역을 수정할 수 있습니다. |
| 1    | EEPROM영역을 수정하지 못합니다.  |
 
`주의` Lock이 1로 설정되면 전원을 껐다 켜야 0으로 바꿀 수 있습니다.
 {: notice--warning}

### <a name="remote-rx-data"></a>받은 리모콘 데이터
적외선 리모콘 센서에 수신된 데이터가 저장되는 곳입니다. 이 값을 읽어가면자동으로 새 리모콘 데이터 도착 값이 0으로 초기화 됩니다.

### <a name="remote-rx-data"></a>보낼 리모콘 데이터
적외선 발광부를 통해서 전송하고자 하는 리모콘 데이터를 써주는 곳입니다. 2바이트의 값을 써주는 즉시 리모콘 데이터가 전송됩니다.

### <a name="remote-tx-data"></a>거리감지 기준값
Address 0x14의 거리감지 기준값을 Control Table의 RAM영역에 저장하는 곳입니다.
현재 AX-S1의 적외선 센서의 경우 원거리까지 감지하기 위해 적외선을 강하게 발사하고 있기 때문에 약 5cm이내의 근거리에서는 항상 값이 최대치가 나오는 등, 근거리에서 정상적인 감지가 불가능합니다.
따라서 AX-S1은 근거리에서의 정확한 감지를 위해 저감도 모드도 지원하는데, 만약 거리감지 기준값에 0을 써줄 경우, 저감도 모드로 전환됩니다. 저감도 모드에서는 원거리 센서 성능이 많이 떨어지지만 근거리 감지의 경우 최대치로 포화 되지 않기 때문에 정확하고 섬세한 감지가 가능합니다.

### 빛감지 기준값
Address 0x15의 빛감지 기준값을 Control Table의 RAM영역에 저장하는 곳입니다.

# [조립하기](#조립하기)

아래는 옵션 프레임과 혼을 이용한 결합구조의 예입니다.

![](/assets/images/parts/sensors/ax-12_of.png)

![](/assets/images/parts/sensors/ax-12_of-12sh.png)

![](/assets/images/parts/sensors/ax-12_of_combination.png)

 
# [참고자료](#참고자료)

## [Drawings](#drawings)

![](/assets/images/parts/sensors/ax-12_dimension.png)


[다이나믹셀 통신]: /docs/kr/dxl/protocol1/#communication-overview
[하드웨어 구성 통신]: /docs/kr/dxl/ax/ax-12w/#pin-assignment
