---
layout: archive
lang: kr
ref: ir-array
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/sensor/ir-array/
sidebar:
  title: 적외선 센서 어레이
  nav: "ir-array"
---

![](/assets/images/parts/sensors/_mg_8531.jpg)

![](/assets/images/parts/sensors/_mg_8530.jpg)

> 적외선 센서 어레이 (IR ARRAY)

# [개요](#개요)

- 적외선 센서 어레이는 센서 장치로서 일곱개의 적외선 센서가 장착되여 있습니다. 각 적외선 센서는 흰 색/검은 색 을 구분 할 수 있습니다. 또한 소리를 발생시키는 기능도 있습니다.
- 적외선 센서 어레이는 근거리에서의 적합한 감지를 위한 센서입니다. 적외선의 발/수신부 끝단에서 0 ~ 5cm 이내에서 사용하도록 최적화되였습니다.

# [사양](#사양)

| 항목           | 사양 |
| :------------: | :------------: |
|무게|18g|
|해상도|10bit(1024)|
|동작 온도|-5&deg;C ~ +85&deg;C|
|사용 전압|7  ~ 15V (권장 전압 11.1V)|
|최대 전류|100mA|
|Command Signal|Digital Packet|
|Protocol Type|Half duplex Asynchronous Serial Communication (8bit,1stop,No Parity)|
|Link (Physical)|TTL Level Multi Drop (daisy chain type Connector)|
|ID|254 ID (0~253)|
|통신 속도|7843bps ~ 1 Mbps|
|Feedback|Input Voltage,  IR Sensor data (x7)|

# [사용법](#사용법)

## [LED](#led)

![](/assets/images/parts/sensors/ir-array_01.png)

적외선 센서 감지 값이 검은 색 감지 기준값보다 작을 경우 해당 LED가 켜집니다.

## [자동으로 검은색 감지 기준값 찾기](#자동으로-검은색-감지-기준값-찾기)

![](/assets/images/parts/sensors/ir-array_02.png)

- 3Pin 커넥터를 통해 전원이 공급되는 상태에서 정면 우측 버튼을 한번 누르면 일곱 LED가 반짝이면서 검은 색 감지 기준값 자동 찾기를 진행합니다.  
- 버튼을 다시 한번 누르면 검은 색 감지 기준값 자동 찾기가 끝나면서 일곱 적외선 센서의 검은 색 감지 기준값이 자동으로 설정됩니다. 
- 자동설정된 기준값 = (MAX_VALUE + 2 * MIN_VALUE) / 3 입니다. 
- 그중 MAX_VALUE는 버튼이 두번 눌린 사이 적외선 센서 최대 감지값 이고 MIN_VALUE는 버튼이 두번 눌린 사이 적외선 센서 최소 감지값입니다.

## [RESET](#reset)

3Pin 커넥터를 통해 전원이 공급되는 상태에서 정면 좌측 버튼을 한번 누르면 적외선 센서 어레이가 RESET됩니다. (검은 색 감지 기준값이 달라지지 않습니다.)

## [통신 방법](#통신-방법)

적외선 어레이의 통신 방법 및 통신과 관련된 하드웨어 구성은 다이나믹셀 AX시리즈와 동일합니다.

- 통신 방법, 패킷 구성에 관한 내용은 [다이나믹셀의 통신]을 참조하시기 바랍니다.
- 통신 하드웨어에 관한 내용은 AX시리즈의 [통신 하드웨어 구성]을 참조하시기 바랍니다.

# [컨트롤 테이블](#컨트롤-테이블)

Control Table은 다이나믹셀 내부에 존재하는 값으로서 다이나믹셀의 현재 상태와 구동에 관한 Data로 구성되어 있습니다. 사용자는 Instruction Packet을 통해 Control Table의 data를 변경하는 방식으로 다이나믹셀을 제어할 수 있습니다.

## [EEPROM and RAM](#eeprom-and-ram)
RAM Area의 Data는 전원이 인가될 때마다 다시 초기값으로 설정됩니다. 그러나 EEPROM Area Data의 경우 값을 설정하면 전원이 Off되어도 그 값이 보존됩니다.

## [Address](#address)
Address는Data의 위치 입니다. Dynamixel 에 Data를 쓰거나 읽기 위해서는 Packet에 그 Data가 위치해 있는 Address를 지정해 주어야 합니다.

## [접근](#접근)
다이나믹셀 Data 에는 읽기 전용(R)과 읽고 쓰기가 가능한 것(RW), 두 가지가 있습니다. 읽기 전용(R)은 주로 센싱용으로 사용되는 data 이며 읽고 쓰기 가능한 것(RW)은 구동을 위한 Data 입니다.

## [초기값](#초기값)
Control Table에서 우측에 표시된 초기값들은 EEPROM 영역 Data인 경우 공장출하 값이고, RAM Area Data인 경우는 전원이 인가되었을 때 갖는 초기값입니다.

## [상위바이트/하위바이트](#상위바이트하위바이트)

Control Table 에는 명칭이 같지만 (L) 과 (H) 가 뒤에 붙어서 Address 가 구분되어 있는 것들이 있습니다. 이것은 16bit가 요구되는 Data를8bit씩 각Address (low, High)에 나누어 표현한 것입니다. 이 두 개의 Address는 하나의 Instruction Packet으로 동시에 write 되어야 합니다.

## [EEPROM 영역](#eeprom-영역)

| 주소      | 데이터명                                  | 설명                                     | 접근 | 초기값     |  |
|:----------|:------------------------------------------|:-----------------------------------------|:-----|:-----------|:-|
| 0 (0X00)  | [Model Number(L)](#Ax_S1_Address_00)      | 모델 번호의 하위 바이트                  | R    | 74 (0X4A)  |  |
| 1 (0X01)  | [Model Number(H)](#Ax_S1_Address_02)      | 모델 번호의 상위 바이트                  | R    | 1 (0X01)   |  |
| 2 (0X02)  | [Version of Firmware](#Ax_S1_Address_03)  | 펌웨어 버전 정보                         | R    | -          |  |
| 3 (0X03)  | [ID](#Ax_S1_Address_03)                   | 다이나믹셀 ID                            | RW   | 100 (0X64) |  |
| 4 (0X04)  | [Baud Rate](#Ax_S1_Address_04)            | 다이나믹셀 통신 속도                     | RW   | 1 (0X01)   |  |
| 5 (0X05)  | [Return Delay Time](#Ax_S1_Address_05)    | 응답 지연 시간                           | RW   | 250 (0XFA) |  |
| 6 (0X06)  | [IR Threshold_L 1](#IR_ARRAY_Address_06) | 1번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10)  |  |
| 7 (0X07)  | [IR Threshold_H 1](#IR_ARRAY_Address_06)  | 1번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)   |  |
| 8 (0X08)  | [IR Threshold_L 2](#IR_ARRAY_Address_06) | 2번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10)  |  |
| 9 (0X09)  | [IR Threshold_H 2](#IR_ARRAY_Address_06)  | 2번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)   |  |
| 10 (0X0A) | [IR Threshold_L 3](#IR_ARRAY_Address_06) | 3번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10)  |  |
| 11 (0X0B) | [IR Threshold_H 3](#IR_ARRAY_Address_06)  | 3번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)   |  |
| 12 (0X0C) | [IR Threshold_L 4](#IR_ARRAY_Address_06) | 4번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10)  |  |
| 13 (0X0D) | [IR Threshold_H 4](#IR_ARRAY_Address_06)  | 4번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)   |  |
| 14 (0X0E) | [IR Threshold_L 5](#IR_ARRAY_Address_06) | 5번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10)  |  |
| 15 (0X0F) | [IR Threshold_H 5](#IR_ARRAY_Address_06)  | 5번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)   |  |
| 16 (0X10) | [Status Return Level](#Ax_S1_Address_10)  | 응답 레벨                                | RW   | 2 (0X02)   |  |
| 17 (0X11) | [IR Threshold_L 6](#IR_ARRAY_Address_06) | 6번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10)  |  |
| 18 (0X12) | [IR Threshold_H 6](#IR_ARRAY_Address_06)  | 6번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)   |  |
| 20 (0X14) | [ IR Threshold_L 7](#IR_ARRAY_Address_06) | 7번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10)  |  |
| 21 (0X15) | [IR Threshold_H 7](#IR_ARRAY_Address_06)  | 7번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)   |  |

## [RAM 영역](#ram-영역)

| 주소      | 데이터명                                     | 설명                                     | 접근 | 초기값    |  |
|:----------|:---------------------------------------------|:-----------------------------------------|:-----|:----------|:-|
| 24 (0X18) | [IR Fire Data_L 1](#IR_ARRAY_Address_24)     | 1번 적외선 센서값의 하위 바이트          | R    | -         |  |
| 25 (0X19) | [IR Fire Data_H 1](#IR_ARRAY_Address_24)     | 1번 적외선 센서값의 상위 바이트          | R    | -         |  |
| 26 (0X1A) | [IR Fire Data_L 2](#IR_ARRAY_Address_24)     | 2번 적외선 센서값의 하위 바이트          | R    | -         |  |
| 27 (0X1B) | [IR Fire Data_H 2](#IR_ARRAY_Address_24)     | 2번 적외선 센서값의 상위 바이트          | R    | -         |  |
| 28 (0X1C) | [IR Fire Data_L 3](#IR_ARRAY_Address_24)     | 3번 적외선 센서값의 하위 바이트          | R    | -         |  |
| 29 (0X1D) | [IR Fire Data_H 3](#IR_ARRAY_Address_24)     | 3번 적외선 센서값의 상위 바이트          | R    | -         |  |
| 30 (0X1E) | [IR Fire Data_L 4](#IR_ARRAY_Address_24)     | 4번 적외선 센서값의 하위 바이트          | R    | -         |  |
| 31 (0X1F) | [IR Fire Data_H 4](#IR_ARRAY_Address_24)     | 4번 적외선 센서값의 상위 바이트          | R    | -         |  |
| 32 (0X20) | [IR Fire Data_L 5](#IR_ARRAY_Address_24)     | 5번 적외선 센서값의 하위 바이트          | R    | -         |  |
| 33 (0X21) | [IR Fire Data_H 5](#IR_ARRAY_Address_24)     | 5번 적외선 센서값의 상위 바이트          | R    | -         |  |
| 34 (0X22) | [IR Fire Data_L 6](#IR_ARRAY_Address_24)     | 6번 적외선 센서값의 하위 바이트          | R    | -         |  |
| 35 (0X23) | [IR Fire Data_H 6](#IR_ARRAY_Address_24)     | 6번 적외선 센서값의 상위 바이트          | R    | -         |  |
| 36 (0X24) | [IR Fire Data_L 7](#IR_ARRAY_Address_24)     | 7번 적외선 센서값의 하위 바이트          | R    | -         |  |
| 37 (0X25) | [IR Fire Data_H 7](#IR_ARRAY_Address_24)     | 7번 적외선 센서값의 상위 바이트          | R    | -         |  |
| 40 (0X28) | [Buzzer Data 0](#Ax_S1_Address_28)           | 버저 음계                                | RW   | -         |  |
| 41 (0X29) | [Buzzer Data 1](#Ax_S1_Address_29)           | 버저 울림 시간                           | RW   | -         |  |
| 42 (0X2A) | [AUTO Threshold](#IR_ARRAY_Address_42)       | 자동으로 물체감지 기준값 찾는 모드       | RW   | 0 (0X00)  |  |
| 43 (0X2B) | [IR Obstacle Detected](#IR_ARRAY_Address_43) | 적외선 물체 감지 유무                    | R    |           |  |
| 44 (0X2C) | [Registered](#Ax_S1_Address_2C)              | Instruction의 등록 여부                  | RW   | 0 (0X00)  |  |
| 47 (0X2F) | [Lock](#Ax_S1_Address_2F)                    | EEPROM 잠금                              | RW   | 0 (0X00)  |  |
| 48 (0X30) | [IR Threshold_L 1](#IR_ARRAY_Address_48)     | 1번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10) |  |
| 49 (0X31) | [IR Threshold_H 1](#IR_ARRAY_Address_48)     | 1번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)  |  |
| 50 (0X32) | [IR Threshold_L 2](#IR_ARRAY_Address_48)     | 2번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10) |  |
| 51 (0X33) | [IR Threshold_H 2](#IR_ARRAY_Address_48)     | 2번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)  |  |
| 52 (0X34) | [IR Threshold_L 3](#IR_ARRAY_Address_48)     | 3번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10) |  |
| 53 (0X35) | [IR Threshold_H 3](#IR_ARRAY_Address_48)     | 3번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)  |  |
| 54 (0X36) | [IR Threshold_L 4](#IR_ARRAY_Address_48)     | 4번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10) |  |
| 55 (0X37) | [IR Threshold_H 4](#IR_ARRAY_Address_48)     | 4번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)  |  |
| 56 (0X38) | [IR Threshold_L 5](#IR_ARRAY_Address_48)     | 5번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10) |  |
| 57 (0X39) | [IR Threshold_H 5](#IR_ARRAY_Address_48)     | 5번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)  |  |
| 58 (0X3A) | [IR Threshold_L 6](#IR_ARRAY_Address_48)     | 6번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10) |  |
| 59 (0X3B) | [IR Threshold_H 6](#IR_ARRAY_Address_48)     | 6번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)  |  |
| 60 (0X3C) | [IR Threshold_L 7](#IR_ARRAY_Address_48)     | 7번 적외선 물체감지 기준값의 하위 바이트 | RW   | 16 (0X10) |  |
| 61 (0X3D) | [IR Threshold_H 7](#IR_ARRAY_Address_48)     | 7번 적외선 물체감지 기준값의 상위 바이트 | RW   | 3 (0X03)  |  |


## [컨트롤 테이블 설명](#컨트롤-테이블-설명)

### <a name="model-number"></a>모델명 (0)
다이나믹셀의 모델 번호입니다.

### <a name="firmware-version"></a>펌웨어명 (2)
다이나믹셀 펌웨어 버전입니다.

### <a name="id"></a>ID (3)
{% include kr/dxl/control_table_id.md %}

### <a name="baud-rate"></a>전송속도(4)
{% include kr/dxl/control_table_baudrate.md %}

### <a name="return-delay-time"></a>Return Delay Time (5)
{% include kr/dxl/control_table_return_delay_time.md %}

### <a name=ir-threshold"></a>검은 색 감지 기준값

IR #1 ~ #7의 검은색 값을 설정합니다.
적외선 센서값과  검은색 감지 기준값에 따라, 아래와 같이 행동합니다.

| 값 | 검은색 감지 | LED |
| ----------- | -------- | ---|
| 센서값 \<= 기준값 | 해당 BIT 1 | ON |
| 센서값 \> 기준값  | 해당 BIT 0 | OFF |

전원이 켜지면 검은 색 감지 기준값-RAM은 이 값을 초기 값으로 사용합니다.

### <a name="ir-data"></a>적외선 센서 값 (1 ~ 7)
IR ARRAY의 적외선 센서값입니다. IR ARRAY에 있는 적외선 발광부에서 강하게 적외선을 쏘면, 벽이나 물체에 적외선이 반사되어 되돌아오게 되는데, IR ARRAY에 있는 적외선 수광부 센서에서 이 반사되는 적외선의 양을 측정한 것으로, 벽이나 물체가 가까이 있을수록, 물체 표면의 색이 밝을 수록 높은 값으로 측정됩니다. 측정된 값은 0~1023의 범위를 가집니다.

적외선 측정 방식이기 때문에 벽이나 물체의 표면 질감에 따라 적외선 반사율이 차이가 있으므로 측정값에 차이가 생길 수 있습니다.

### <a name="buzzer-data"></a>버저 음계
센서 모듈 IR ARRAY에는 버저가 장착되어 있어서, 간단한 비프음을 낼 수 있습니다. 버저 음계는 총 52개의 음을 낼 수 있는데, 각 옥타브별로 온음, 반음이 있기 때문에 다양한 음계를 재생할 수 있습니다. 버저 음계값은 다음 표와 같이 할당되어 있습니다.

![](/assets/images/parts/sensors/ax-s1_sound5.png)

### <a name="buzzer-ring"></a>버저 울림 시간
IR ARRAY은 버저의 울림 시간을 조절하는 기능이 있습니다. 0.1초 단위로 조절이 가능한데, 최소 길이는 0.3초로 되어 있으며, 최대로 길게 하면 5초까지 재생할 수 있습니다. 즉, 0~3을 넣으면 0.3초간 버저가 울리며, 50 이상의 값을 넣으면 그와 무관하게 5초까지만 버저가 울립니다. 또한, 버저 울림이 끝나면 자동으로 버저 울림 시간이 0으로 초기화 됩니다.

IR ARRAY의 버저 울림 시간에는 두 가지의 특별한 기능이 있습니다. 첫번째로, 버저를 계속  울려주는 기능입니다. 버저 울림 시간에 254를 써주고 나서 버저 음계에 원하는 음계의 번호를 써주면 버저가 멈추지 않고 계속 울리게 됩니다. 버저 울림을 멈추기 위해서는 버저 울림 시간에 0을 써주면 됩니다.

두번째 기능은 특수 멜로디를 재생해주는 기능입니다. 버저 울림 시간에 255의 값을 써 주고 버저 음계에 0~26의 값을 써 주면, 각 번호에 해당되는 27 가지의 다양한 멜로디를 재생할 수 있습니다. 멜로디 재생이 끝나면 버저 울림 시간이 자동으로 0으로 초기화 됩니다.

### <a name="auto-threshold"></a>자동으로 검은 색 감지 기준값 찾는 모드
검은 색 감지 기준값 자동 찾기의 시작/마침 을 설정하는 파라미터입니다. '0'에서 '1'로 변할 때 자동찾기를 시작하고 '1'에서 '0'으로 변할 때 자동찾기를 마칩니다.

IR ARRAY의 각 적외선 센서의 감지 값이 검은 색 감지 기준값보다 작으면 검은 색을 감지하였다고 판단하여 아래와 같이 검은 색 감지 유무값의 특정 Bit을 1로 셋팅해 줍니다. 동시에 해당 LED가 켜집니다.

| BIT   | 명칭                 |
| ----- | ------------------ |
| Bit 0 | 1번 적외선 센서에 검은 색 감지 |
| Bit 1 | 2번 적외선 센서에 검은 색 감지 |
| Bit 2 | 3번 적외선 센서에 검은 색 감지 |
| Bit 3 | 4번 적외선 센서에 검은 색 감지 |
| Bit 4 | 5번 적외선 센서에 검은 색 감지 |
| Bit 5 | 6번 적외선 센서에 검은 색 감지 |
| Bit 6 | 7번 적외선 센서에 검은 색 감지 |

### <a name="registered"></a>Registered Instruction

| 값    | 의미                       |
| ---- | ------------------------ |
| 0    | REG_WRITE로 전달된 명령이 없습니다. |
| 1    | REG_WRITE로 전달된 명령이 있습니다. |

`Note` ACTION 명령을 수행하면 이 값이 0으로 바뀝니다. {: .notice}

### <a name="lock"></a>Lock

| 값    | 의미                    |
| ---- | --------------------- |
| 0    | EEPROM영역을 수정할 수 있습니다. |
| 1    | EEPROM영역을 수정하지 못합니다.  |

`주의` Lock이 1로 설정되면 전원을 껐다 켜야 0으로 바꿀 수 있습니다. 
{: .notice--warning}

[다이나믹셀의 통신]: /docs/kr/dxl/protocol1/#communication-overview
[통신 하드웨어 구성]: /docs/kr/dxl/ax/ax-12w/#pin-assignment
