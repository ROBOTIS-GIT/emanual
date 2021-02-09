---
layout: archive
lang: kr
ref: protocol2
read_time: true
share: true
author_profile: false
permalink: /docs/kr/dxl/protocol2/
sidebar:
  title: DYNAMIXEL Protocol 2.0
  nav: "protocol2"
---

# [개요](#개요)

- 다이나믹셀 프로토콜 2.0을 지원하는 다이나믹셀: MX-28(2.0), MX-64(2.0), MX-106(2.0), X 시리즈 (2X 시리즈 포함), PRO 시리즈, P 시리즈.
- 다이나믹셀 프로토콜 2.0을 지원하는 제어기: CM-50, CM-150, CM-200, OpenCM7.0, OpenCM9.04, CM-550, OpenCR
- 다이나믹셀 프로토콜 2.0을 지원하는 소프트웨어: 로보플러스 스마트 앱, 로보플러스 2.0, 로보플러스 3.0, 다이나믹셀 위자드 2.0

**참고**: MX(2.0)은 프로토콜 2.0을 지원하는 MX 시리즈의 별도 펌웨어를 의미합니다. DYNAMIXEL Wizard2.0의 [펌웨어 복구](/docs/kr/software/dynamixel/dynamixel_wizard2/#펌웨어-복구) 기능을 활용하여 MX(2.0) 펌웨어로 업그레이드할 수 있습니다.
{: .notice}

# [Instruction Packet](#instruction-packet)
Instruction Packet은 Main Controller가 장치(Device)로 보내는 명령 패킷. 

| Header 1 | Header 2 | Header 3 | Reserved | Packet ID | Length 1 | Length 2 | Instruction |  Param  | Param |  Param  | CRC 1 | CRC 2 |
|:--------:|:--------:|:--------:|:--------:|:---------:|:--------:|:--------:|:-----------:|:-------:|:-----:|:-------:|:-----:|:-----:|
|   0xFF   |   0xFF   |   0xFD   |   0x00   | Packet ID |  Len_L   |  Len_H   | Instruction | Param 1 |  ...  | Param N | CRC_L | CRC_H |

## [Header](#header)
Packet의 시작을 나타내는 신호. 

## [Reserved](#reserved)
0x00으로 사용하며(0XFD는 사용할수 없음) Header와 동일한 기능을 함. 

예를 들어, [다이나믹셀 위자드 2.0](/docs/kr/software/dynamixel/dynamixel_wizard2/#패킷)의 [패킷 상세 정보](/docs/kr/software/dynamixel/dynamixel_wizard2/#패킷-창)에서, Reserved는 Header에 포함되어 사용.

![](/assets/images/dxl/protocol2/protocol20_packet_example_02.png)
> 다이나믹셀 위자드 2.0 패킷 상세정보

## [Packet ID](#packet-id)
Instruction Packet을 받아 처리해야 할 장치의 ID를 나타내는 필드.

  1. 범위 : 0 ~ 252 (0x00 ~ 0xFC) 까지 253 개 사용 가능
  2. Broadcast ID : 254 (0xFE), 연결된 모든 장치가 Instruction Packet 을 실행하도록 함.

## [Length](#length)
Packet의 길이를 나타냄.
  
  1. 하위 바이트와 상위 바이트를 [Instruction Packet](#instruction-packet)에서 나누어서 보냄.
  2. Length는 Instruction, Parameter, CRC 필드의 Byte Size를 나타내는 필드

- `Length = Parameter 갯수 + 3`
- Status Packet의 Length에는 ERROR 필드를 나타내는 1바이트가 추가됩니다.

## [Instruction](#instruction)
Packet의 용도를 정의하는 필드

|  값  |      명령       |                                                설명                                                 |
|:----:|:---------------:|:---------------------------------------------------------------------------------------------------:|
| 0x01 |     [Ping]      |       Packet ID와 동일한 ID를 가지는 장치에 Packet이 도달했는지 여부 확인을 위한 Instruction        |
| 0x02 |     [Read]      |                            장치로부터 데이터를 읽어오기 위한 Instruction                            |
| 0x03 |     [Write]     |                                장치에 데이터를 쓰기 위한 Instruction                                |
| 0x04 |   [Reg Write]   |          Instruction Packet을 대기 상태로 등록하는 Instruction, Action 명령에 의해 실행됨           |
| 0x05 |    [Action]     |                       Reg Write 로 미리 등록한 Packet을 실행하는 Instruction                        |
| 0x06 | [Factory Reset] |                   컨트롤테이블을 공장 출하 상태의 기본값으로 되돌리는 Instruction                   |
| 0x08 |    [Reboot]     |                                  장치를 재부팅 시키는 Instruction                                   |
| 0x10 |     [Clear]     |                               장치의 특정 상태를 해제하는 Instruction                               |
| 0x55 | Status(Return)  |                               Instruction Packet에 대한 Return packet                               |
| 0x82 |   [Sync Read]   |    다수의 장치에 대해서, 동일한 Address에서 동일한 길이의 데이터를 한 번에 읽기 위한 Instruction    |
| 0x83 |  [Sync Write]   |     다수의 장치에 대해서, 동일한 Address에 동일한 길이의 데이터를 한 번에 쓰기 위한 Instruction     |
| 0x92 |   [Bulk Read]   | 다수의 장치에 대해서, 서로 다른 Address에서 서로 다른 길이의 데이터를 한 번에 읽기 위한 Instruction |
| 0x93 |  [Bulk Write]   |  다수의 장치에 대해서, 서로 다른 Address에 서로 다른 길이의 데이터를 한번에 쓰기 위한 Instruction   |

## [Parameters](#parameters)

  1. Instruction의 보조 데이터 필드로써, Instruction 별로 용도가 다름.
  2. 음수 데이터의 표현 방법 : 제품별로 차이가 있으므로, 해당 제품의 e-Manual을 참고 할 것.

## [CRC](#crc)
Packet이 통신 중에 파손되었는지를 점검하기 위한 필드 (16bit CRC)  

  1. 하위 바이트와 상위 바이트를 [Instruction Packet](#instruction-packet)에서 나누어서 보냄.
  2. CRC 계산 방법 및 예제 : [CRC Calculation](/docs/kr/dxl/crc/)

# [Status Packet](#status-packet)

Status Packet은 장치(Device)가 Main Controller로 보내는 응답 패킷. ERROR 필드가 추가된 것 외에는 Instruction Packet과 구성이 동일

| Header 1 | Header 2 | Header 3 | Reserved | Packet ID | Length 1 | Length 2 | Instruction |  **ERR**{: .red}  |  PARAM  | PARAM |  PARAM  | CRC 1 | CRC 2 |
|:--------:|:--------:|:--------:|:--------:|:---------:|:--------:|:--------:|:-----------:|:-----------------:|:-------:|:-----:|:-------:|:-----:|:-----:|
|   0xFF   |   0xFF   |   0xFD   |   0x00   |    ID     |  Len_L   |  Len_H   | Instruction | **Error**{: .red} | Param 1 |  ...  | Param N | CRC_L | CRC_H |

## Instruction
Status Packet의 Instruction은 0x55 (Status Instruction: 0x55) 로 고정

## [Error](#error)
Instruction Packet 의 처리 결과를 나타냄

| Bit 7 | Bit 6 ~ Bit 0 |
|:-----:|:-------------:|
| Alert | Error Number  |

  - Alert : 장치에 하드웨어적인 문제가 발생한 경우 1 로 Setting 됨. 이 경우 Control Table 의 Hardware error status 값을 읽어 보면 문제의 원인을 알 수 있음.
  - Error Number : Instruction Packet 의 처리에 Error 가 발생한 경우.

| Error Number | Error             | 설명                                                                                                                                                                                                 |
|:------------:|:------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     0x01     | Result Fail       | 전송된 Instruction Packet 을 처리하는데 실패한 경우                                                                                                                                                  |
|     0x02     | Instruction Error | 정의되지 않은 Instruction 을 사용한 경우<br />Reg Write 없이 Action 을 사용한 경우                                                                                                                   |
|     0x03     | CRC Error         | 전송된 Packet 의 CRC 값이 맞지 않는 경우                                                                                                                                                             |
|     0x04     | Data Range Error  | 해당 Address 에 쓰려는 Data 가 최소/최대값의 범위를 벗어난 경우                                                                                                                                      |
|     0x05     | Data Length Error | 해당 Address 의 데이터 길이보다 짧은 데이터를 적으려고 한 경우<br />(예: 4 byte로 정의된 항목의 2 byte 만 쓰려고 하는 경우)                                                                          |
|     0x06     | Data Limit Error  | 해당 Address 에 쓰려는 Data 가 Limit 값을 벗어난 경우                                                                                                                                                |
|     0x07     | Access Error      | Read Only 혹은 정의되지 않은 Address 에 값을 쓰려고 한 경우<br />Write Only 혹은 정의되지 않은 Address 에 값을 읽으려고 한 경우<br />Torque Enable(ROM Lock) 상태에서 ROM 영역에 값을 쓰려고 한 경우 |

## Parameter

1. Instruction의 보조 데이터 필드로써, Instruction 마다 용도가 다름.
2. 음수 데이터의 표현 방법 : 제품별로 차이가 있으므로, 해당 제품의 e-Manual을 참고 할 것.

# [Packet 처리](#packet-처리)

## 전송 시 처리 순서

1. Packet 기본 형태 생성 후, Byte Stuffing(0xFD)
    - 검사 범위 : Instruction 필드부터 Parameter 필드 전체(CRC 제외)
    - 처리 방법 : “0xFF 0xFF 0xFD” 패턴이 나타날 경우, Byte Stuffing (0xFD) 을 추가  
      (“0xFF 0xFF 0xFD” 가 존재하면, 0xFD를 추가해서 “0xFF 0xFF 0xFD 0xFD”로 변경)
2. Length : Byte Stuffing이 적용된 Length로 수정
3. CRC : Byte Stuffing이 적용된 상태에서 CRC 계산

## 수신 시 처리 순서

1. Header(0xFF 0xFF 0xFD) 검색 : Byte Stuffing(“0xFF 0xFF 0xFD 0xFD”)은 무시.
2. Packet ID : Packet ID가 유효하면, Length 만큼 추가로 수신
3. CRC : Byte Stuffing이 포함된 수신 Packet 상태에서 계산, CRC가 일치하면 Byte Stuffing을 제거

# [Instruction의 종류](#instruction의-종류)

설명의 편의를 위하여, 다음과 같은 약어를 사용합니다.

- Header : H
- Reserved: RSRV
- Length: LEN
- Instruction: INST
- Error: ERR
- Param: P

## [Ping](#ping)

- 장치의 존재 여부 및 기본 정보를 얻기 위한 Instruction
- 장치는 Status Return Level에 관계없이, Ping Instruction에는 무조건 Status Packet을 전송
- Packet ID 필드가 0xFE(Broadcast ID)인 경우, 모든 장치는 정해진 순서에 따라 자신의 Status Packet 을 전송

### Packet Parameters

**참고**: Status Packet은 각 장치로부터 받음.
{: .notice}

| Status Packet |      설명      |
|:-------------:|:--------------:|
|  Parameter 1  |  모델번호 LSB  |
|  Parameter 2  |  모델번호 MSB  |
|  Parameter 3  | 펌웨어 Version |

### 예제 1

#### 예제 설명
- ID1(XM430-W210) : Model Number 1030(0x0406), Version of Firmware 38(0x26)인 경우
- Instruction Packet ID : 1

#### Ping Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x03 | 0x00 | 0x01 | 0x19  | 0x4E  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  |  P1  |  P2  |  P3  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x07 | 0x00 | 0x55 | 0x00 | 0x06 | 0x04 | 0x26 | 0x65  | 0x5D  |

### 예제 2
#### 예제 설명
- ID1(XM430-W210) : Model Number 1030(0x0406), Version of Firmware 38(0x26)인 경우
- ID2(XM430-W210) : Model Number 1030(0x0406), Version of Firmware 38(0x26)인 경우
- Instruction Packet ID : 254(Broadcast ID)

#### Ping Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0xFE    | 0x03 | 0x00 | 0x01 | 0x31  | 0x42  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  |  P1  |  P2  |  P3  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x07 | 0x00 | 0x55 | 0x00 | 0x06 | 0x04 | 0x26 | 0x65  | 0x5D  |

#### ID 2 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  |  P1  |  P2  |  P3  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x02    | 0x07 | 0x00 | 0x55 | 0x00 | 0x06 | 0x04 | 0x26 | 0x6F  | 0x6D  |

## [Read](#read)

### 설명
  - Control Table 의 값을 읽어오기 위한 Instruction
  - 음수 데이터의 표현 방법 : 제품별로 차이가 있으므로, 해당 제품의 e-Manual 을 참고 할 것.

### Packet Parameters

| Instruction Packet |             설명             |
|:------------------:|:----------------------------:|
|    Parameter 1     |   시작 주소의 하위 바이트    |
|    Parameter 2     |   시작 주소의 상위 바이트    |
|    Parameter 3     | 데이터 길이(X)의 하위 바이트 |
|    Parameter 4     | 데이터 길이(X)의 상위 바이트 |

| Status Packet |      설명      |
|:-------------:|:--------------:|
|  Parameter 1  | 첫 번째 바이트 |
|  Parameter 2  | 두 번째 바이트 |
|      ...      |      ...       |
|  Parameter X  | X 번째 바이트  |

### 예제

#### 예제 설명
- ID1(XM430-W210) : Present Position(132, 0x0084, 4[byte])이 166(0x000000A6)인 경우

#### Read Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x07 | 0x00 | 0x02 | 0x84 | 0x00 | 0x04 | 0x00 | 0x1D  | 0x15  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  |  P1  |  P2  |  P3  |  P4  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x08 | 0x00 | 0x55 | 0x00 | 0xA6 | 0x00 | 0x00 | 0x00 | 0x8C  | 0xC0  |

## [Write](#write)

### 설명
  - Control Table 에 값을 쓰기 위한 Instruction
  - 음수 데이터의 표현 방법 : 제품별로 차이가 있으므로, 해당 제품의 e-Manual을 참고 할 것.

### Packet Parameters

| Instruction Packet |          설명           |
|:------------------:|:-----------------------:|
|    Parameter 1     | 시작 주소의 하위 바이트 |
|    Parameter 2     | 시작 주소의 상위 바이트 |
|   Parameter 2+1    |      첫번째 바이트      |
|   Parameter 2+2    |      두번째 바이트      |
|        ...         |           ...           |
|   Parameter 2+X    |      X번째 바이트       |

### 예제

#### 예제 설명
- ID1(XM430-W210) : Goal Position(116, 0x0074, 4[byte])를 512(0x00000200)로 변경하려는 경우

#### Write Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |  P5  |  P6  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x09 | 0x00 | 0x03 | 0x74 | 0x00 | 0x00 | 0x02 | 0x00 | 0x00 | 0xCA  | 0x89  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  | CRC 1|CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:-----------:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x04 | 0x00 | 0x55 | 0x00 |  0xA1|0x0C  |

## [Reg Write](#reg-write)

### 설명
  - Write Instruction과 유사하지만, 동기화 특성이 향상된 Instruction
  - Write Instruction은 Instruction Packet 을 받으면 즉시 실행됨.
  - Reg Write Instruction은 Instruction Packet 을 대기 상태로 등록하고, Control table Registered Instruction을 ‘1’로 설정함.
  - Action Instruction 을 수신하면, 등록된 Packet을 실행하고, Control Table Registered Instruction을 ‘0’으로 변경함.

### Packet Parameters

| Instruction Packet |          설명           |
|:------------------:|:-----------------------:|
|    Parameter 1     | 시작 주소의 하위 바이트 |
|    Parameter 2     | 시작 주소의 상위 바이트 |
|   Parameter 2+1    |      첫번째 바이트      |
|   Parameter 2+2    |      두번째 바이트      |
|        ...         |           ...           |
|   Parameter 2+X    |      X번째 바이트       |

### 예제

#### Condition
- ID1(XM430-W210) : Goal Velocity(104, 0x0068, 4[byte])를 200(0x000000C8)로 변경하려는 경우

#### Reg Write Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |  P5  |  P6  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x09 | 0x00 | 0x04 | 0x68 | 0x00 | 0xC8 | 0x00 | 0x00 | 0x00 | 0xAE  | 0x8E  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1  | 0x0C  |

## [Action](#action)

### 설명
  - Reg Write Instruction으로 등록된 Packet을 실행하라는 Instruction
  - Write Instruction으로 다수의 장치를 제어할 경우, Packet을 최초로 수신한 장치와 마지막으로 수신한 장치는 실행 시점에 차이가 발생함.
  - Reg Write 와 Action Instruction을 사용하면, 다수의 장치를 동시에 구동할 수 있음.

### 예제

#### Condition
- ID1(XM430-W210) : Reg Write Instruction에 의해 Instruction이 등록된 경우

#### Action Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x03 | 0x00 | 0x05 | 0x02  | 0xCE  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1  | 0x0C  |


## [Factory Reset](#factory-reset)

### 설명
- Control Table 을 공장 출하 시의 기본값으로 되돌리는 Instruction
- Packet ID가 Broadcast ID(0xFE)이고 Option이 Reset all value(0xFF)일 경우, Factory Reset Instruction(0x06)은 동작하지 않음
  - MX(2.0) FW42, 다이나믹셀-X 시리즈 FW42 이상부터 적용

### Parameters

| Instruction Packet | 설명                                                                                                           |
|:------------------:|:---------------------------------------------------------------------------------------------------------------|
|    Parameter 1     | 0xFF : 모든 값 초기화<br />0x01 : ID를 제외한 모든 값 초기화<br />0x02 : ID와 통신속도를 제외한 모든 값 초기화 |

### 예제

#### 예제 설명
- ID1(XM430-W210) : Option 0x01(ID를 제외한 모든 값 초기화)

#### Factory Reset Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST |  P1  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x04 | 0x00 | 0x06 | 0x01 | 0xA1  | 0xE6  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1  | 0x0C  |

## [Reboot](#reboot)

### 설명
- 장치를 재부팅 시키는 Instruction

### 예제

#### 예제 설명
- ID1(XM430-W210)를 Reboot 시킬 경우

#### Reboot Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x03 | 0x00 | 0x08 | 0x2F  | 0x4E  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST |  ERR  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1  | 0x0C  |

## [Clear](#clear)

### 설명
- 장치의 특정 상태를 해제하는 Instruction
- 특이사항 : MX(2.0) FW42 이상, 다이나믹셀-X 시리즈 FW42 이상부터 지원

### Parameters

|  P1  | P2 ~ P5                           | 설명                                                                                                                                                                                                                  |
|:----:|:----------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x01 | 고정값<br />(0x44 0x58 0x4C 0x22) | 현재 위치(Present Position) 값을 1회전(0~4095) 이내의 절대위치 값으로 초기화.<br />정지된 상태에서만 Clear 가능. <br />구동중에 Clear Inst Packet을 전송할 경우, Status Packet의 Error 필드에 Result Fail(0x01) 발생. |
| 0x02 | -                                 | 사용하지 않음                                                                                                                                                                                                         |
| ...  | -                                 | 사용하지 않음                                                                                                                                                                                                         |
| 0xFF | -                                 | 사용하지 않음                                                                                                                                                                                                         |

### 예제

#### 예제 설명
- ID1(XM430-W210) : 다수의 회전 정보(멀티턴)을 초기화

#### Clear Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 |   INST   |    P1    |  P2  |  P3  |  P4  |  P5  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:--------:|:--------:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x08 | 0x00 | **0x10** | **0x01** | 0x44 | 0x58 | 0x4C | 0x22 | 0xB1  | 0xDC  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST |  ERR  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1  | 0x0C  |


## [Sync Read](#sync-read)

### 설명
- 하나의 Instruction Packet 으로 동시에 여러 개 장치의 데이터를 읽을 때 사용하는 Instruction
- 데이터의 Address와 Data Length가 모두 동일해야 함.
- 데이터의 주소가 연속적이지 않을 경우, Indirect Address를 사용할 수 있음.
- Packet ID 필드 : 0xFE (Broadcast ID)

### Parameters

| Instruction Packet |             설명             |
|:------------------:|:----------------------------:|
|    Parameter 1     |   시작 주소의 하위 바이트    |
|    Parameter 2     |   시작 주소의 상위 바이트    |
|    Parameter 3     | 데이터 길이(X)의 하위 바이트 |
|    Parameter 4     | 데이터 길이(X)의 상위 바이트 |
|   Parameter 4+1    |       첫번째 장치의 ID       |
|   Parameter 4+2    |       두번째 장치의 ID       |
|        ...         |             ...              |
|   Parameter 4+X    |       X번째 장치의 ID        |


| Status Packet |     설명     |
|:-------------:|:------------:|
|  Parameter 1  |  Frist Byte  |
|  Parameter 2  | Second Byte  |
|      ...      |     ...      |
|  Parameter X  | X번째 바이트 |

### 예제

#### 예제 설명
- ID1(XM430-W210) : Present Position(132, 0x0084, 4[byte])이 166(0x000000A6)인 경우
- ID2(XM430-W210) : Present Position(132, 0x0084, 4[byte])이 2,079(0x0000081F)인 경우

#### Sync Read Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |  P5  |  P6  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0xFE    | 0x09 | 0x00 | 0x82 | 0x84 | 0x00 | 0x04 | 0x00 | 0x01 | 0x02 | 0xCE  | 0xFA  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  |  P1  |  P2  |  P3  |  P4  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x08 | 0x00 | 0x55 | 0x00 | 0xA6 | 0x00 | 0x00 | 0x00 | 0x8C  | 0xC0  |

#### ID 2 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  |  P1  |  P2  |  P3  |  P4  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x02    | 0x08 | 0x00 | 0x55 | 0x00 | 0x1F | 0x08 | 0x00 | 0x00 | 0xBA  | 0xBE  |



## [Sync Write](#sync-write)

### 설명
- 하나의 Instruction Packet 으로 동시에 여러 개 장치를 제어하기 위해 사용하는 Instruction
- 데이터의 Address와 Data Length가 모두 동일해야 함.
- 데이터의 주소가 연속적이지 않을 경우, Indirect Address를 사용할 수 있음.
- Packet ID 필드 : 0xFE (Broadcast ID)

### Parameters

| Instruction Packet | 설명                         |
|:------------------:|:-----------------------------|
|    Parameter 1     | 시작 주소의 하위 바이트      |
|    Parameter 2     | 시작 주소의 상위 바이트      |
|    Parameter 3     | 데이터 길이(X)의 하위 바이트 |
|    Parameter 4     | 데이터 길이(X)의 상위 바이트 |
|    Parameter 5     | `첫번째 장치` ID             |
|   Parameter 5+1    | `첫번째 장치` 첫번째 바이트  |
|   Parameter 5+2    | `첫번째 장치` 두번째 바이트  |
|        ...         | `첫번째 장치`...             |
|   Parameter 5+X    | `첫번째 장치` X번째 바이트   |
|    Parameter 6     | `두번째 장치` ID             |
|   Parameter 6+1    | `두번째 장치` 첫번째 바이트  |
|   Parameter 6+2    | `두번째 장치` 두번째 바이트  |
|        ...         | `두번째 장치`...             |
|   Parameter 6+X    | `두번째 장치` X번째 바이트   |
|        ...         | ...                          |

### 예제

#### 예제 설명
- ID1(XM430-W210) : Goal Position(116, 0x0074, 4[byte])을 150(0x00000096)로 변경하려는 경우
- ID2(XM430-W210) : Goal Position(116, 0x0074, 4[byte])을 170(0x000000AA)로 변경하려는 경우

#### Sync Write Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0xFE    | 0x11 | 0x00 | 0x83 | 0x74 | 0x00 | 0x04 | 0x00 |

|  P5  |  P6  |  P7  |  P8  |  P9  | P10  | P11  | P12  | P13  | P14  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0x01 | 0x96 | 0x00 | 0x00 | 0x00 | 0x02 | 0xAA | 0x00 | 0x00 | 0x00 | 0x82  | 0x87  |

## [Bulk Read](#bulk-read)

### 설명
- Sync Read 와 유사하게, 하나의 Instruction Packet 으로 동시에 여러 개 장치의 데이터를 읽을 때 사용하는 Instruction
- 데이터의 Address와 Data Length가 장치별로 달라도 사용 가능.
- Parameter에 동일한 아이디가 여러 번 사용될 수 없음. 즉, 하나의 장치에서는 한 번만 읽을 수 있음.
- 데이터의 주소가 연속적이지 않을 경우, Indirect Address를 사용할 수 있음.
- Packet ID 필드 : 0xFE (Broadcast ID)

### Parameters

| Instruction Packet | 설명                                  |
|:------------------:|:--------------------------------------|
|    Parameter 1     | `첫번째 장치` ID                      |
|    Parameter 2     | `첫번째 장치` 시작 주소 하위 바이트   |
|    Parameter 3     | `첫번째 장치` 시작 주소 상위 바이트   |
|    Parameter 4     | `첫번째 장치` 데이터 길이 하위 바이트 |
|    Parameter 5     | `첫번째 장치` 데이터 길이 상위 바이트 |
|    Parameter 6     | `두번째 장치` ID                      |
|    Parameter 7     | `두번째 장치` 시작 주소 하위 바이트   |
|    Parameter 8     | `두번째 장치` 시작 주소 상위 바이트   |
|    Parameter 9     | `두번째 장치` 데이터 길이 하위 바이트 |
|    Parameter 10    | `두번째 장치` 데이터 길이 상위 바이트 |
|        ...         | ...                                   |


| Status Packet |     설명      |
|:-------------:|:-------------:|
|  Parameter 1  | 첫번째 바이트 |
|  Parameter 2  | 두번째 바이트 |
|      ...      |      ...      |
|  Parameter X  | X번째 바이트  |

### 예제

#### Condition
- ID1(XM430-W210) : Present Voltage(144, 0x0090, 2[byte])이 119(0x0077)인 경우
- ID2(XM430-W210) : Present Temperature(146, 0x0092, 1[byte])이 36(0x24)인 경우

#### Bulk Read Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |  P5  |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0xFE    | 0x0D | 0x00 | 0x92 | 0x01 | 0x90 | 0x00 | 0x02 | 0x00 |

|  P6  |  P7  |  P8  |  P9  | P10  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0x02 | 0x92 | 0x00 | 0x01 | 0x00 | 0x1A  | 0x05  |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  |  P1  |  P2  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x01    | 0x06 | 0x00 | 0x55 | 0x00 | 0x77 | 0x00 | 0xC3  | 0x69  |

#### ID 2 Status Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST | ERR  |  P1  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0x02    | 0x05 | 0x00 | 0x55 | 0x00 | 0x24 | 0x8B  | 0xA9  |


## [Bulk Write](#bulk-write)

### 설명
- Sync Write 와 유사하게, 하나의 Instruction Packet 으로 여러 개 장치를 제어하기 위해 사용하는 Instruction.
- 데이터의 Address와 Data Length가 장치별로 달라도 사용 가능.
- Parameter에 동일한 아이디가 여러 번 사용될 수 없음. 즉, 하나의 장치에는 한 번만 쓸 수 있음.
- 데이터의 주소가 연속적이지 않을 경우, Indirect Address를 사용할 수 있음.
- Packet ID 필드 : 0xFE (Broadcast ID)

### Parameters

| Instruction Packet | 설명                                  |
|:------------------:|:--------------------------------------|
|    Parameter 1     | `첫번째 장치` ID                      |
|    Parameter 2     | `첫번째 장치` 시작 주소 하위 바이트   |
|    Parameter 3     | `첫번째 장치` 시작 주소 상위 바이트   |
|    Parameter 4     | `첫번째 장치` 데이터 길이 하위 바이트 |
|    Parameter 5     | `첫번째 장치` 데이터 길이 상위 바이트 |
|   Parameter 5+1    | `첫번째 장치` 첫번째 바이트           |
|   Parameter 5+2    | `첫번째 장치` 두번째 바이트           |
|        ...         | ...                                   |
|   Parameter 5+X    | `첫번째 장치` X번째 바이트            |
|   Parameter 6+X    | `두번째 장치` ID                      |
|   Parameter 7+X    | `두번째 장치` 시작 주소 하위 바이트   |
|   Parameter 8+X    | `두번째 장치` 시작 주소 상위 바이트   |
|   Parameter 9+X    | `두번째 장치` 데이터 길이 하위 바이트 |
|   Parameter 10+X   | `두번째 장치` 데이터 길이 상위 바이트 |
|  Parameter 10+X+1  | `두번째 장치` 첫번째 바이트           |
|  Parameter 10+X+2  | `두번째 장치` 두번째 바이트           |
|        ...         | ...                                   |
|  Parameter 10+X+Y  | `두번째 장치` Y번째 바이트            |
|        ...         | ...                                   |

### 예제

#### Condition
- ID1(XM430-W210) : Max Voltage Limit(32, 0x0020, 2[byte])을 160(0x00A0) 로 변경하려는 경우
- ID2(XM430-W210) : Temperature Limit(31, 0x001F, 1[byte])를 80(0x50)으로 쓸 경우

#### Bulk Write Instruction Packet

|  H1  |  H2  |  H3  | RSRV | Packet ID | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |  P5  |  P6  |  P7  |
|:----:|:----:|:----:|:----:|:---------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 |   0xFE    | 0x10 | 0x00 | 0x93 | 0x01 | 0x20 | 0x00 | 0x02 | 0x00 | 0xA0 | 0x00 |


|  P8  |  P9  | P10  | P11  | P12  | P13  | CRC 1 | CRC 2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-----:|
| 0x02 | 0x1F | 0x00 | 0x01 | 0x00 | 0x50 | 0xB7  | 0x68  |

[Ping]: #ping     
[Read]: #read     
[Write]: #write
[Reg Write]: #reg-write   
[Action]: #action    
[Factory Reset]: #factory-reset 
[Reboot]: #reboot    
[Clear]: #clear     
[Sync Read]: #sync-read   
[Sync Write]: #sync-write  
[Bulk Read]: #bulk-read   
[Bulk Write]: #bulk-write
