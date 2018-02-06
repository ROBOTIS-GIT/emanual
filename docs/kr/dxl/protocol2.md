---
layout: archive
lang: kr
ref: protocol2
read_time: true
share: true
author_profile: false
permalink: /docs/kr/dxl/protocol2/
sidebar:
  title: Protocol 2.0
  nav: "protocol2"
---

# [개요](#개요)

- 프로토콜 2.0을 지원하는 다이나믹셀: MX-28, MX-64, MX-106(펌웨어 v39 이상), X 시리즈, Pro 시리즈
- 프로토콜 2.0을 지원하는 제어기: CM-150 , CM-200
- 프로토콜 2.0을 지원하는 소프트웨어: 로보플러스 스마트 앱, 로보플러스 2.0

# [Instruction Packet](#instruction-packet)
Instruction Packet은 Main Controller가 장치(Device)로 보내는 명령 데이터 입니다.

|Header1|Header2|Header3|Reserved|Packet ID|Length1|Length2|Instruction|Param|Param|Param|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|ID|Len_L|Len_H|Instruction|Param 1|...|Param N|CRC_L|CRC_H|

## [Header](#header)
Packet의 시작을 나타내는 필드

## [Reserved](#reserved)
0x00 (0xFD 는 사용할 수 없음)

## [Packet ID](#packet-id)
Instruction Packet을 받아 처리해야 할 장치의 ID를 나타내는 필드

  1. 범위 : 0 ~ 252 (0x00 ~ 0xFC) 까지 253 개 사용 가능
  2. Broadcast ID : 254 (0xFE), 연결된 모든 장치가 Instruction Packet 을 실행하도록 함.
  3. 253(0xFD), 255(0xFF) : Header와 중복을 피하기 위해 사용하지 않음

## [Packet Length](#packet-length)
Packet Length 이후의 길이(Instruction, Parameter, CRC 필드)  
`Packet Length = Parameter 갯수 + 3`

## [Instruction](#instruction)
Packet의 용도를 정의하는 필드

|값|명령|상세 설명|
|:---:|:---:|:---:|
|0x01|Ping|Packet ID와 동일한 ID를 갖은 장치에 Packet이 도달했는지 여부 확인을 위한 Instruction|
|0x02|Read|장치로부터 데이터를 읽어오기 위한 Instruction|
|0x03|Write|장치에 데이터를 쓰기 위한 Instruction|
|0x04|Reg Write|Instruction Packet을 대기 상태로 등록하는 Instruction, Action 명령에 의해 실행됨|
|0x05|Action|Reg Write 로 미리 등록한 Packet을 실행하는 Instruction|
|0x06|Factory Reset|컨트롤테이블을 공장 출하 상태의 초기값으로 되돌리는 Instruction|
|0x08|Reboot|장치를 재부팅 시키는 Instruction|
|0x55|Status(Return)|Instruction Packet 에 대한 Return Instruction|
|0x82|Sync Read|다수의 장치에 대해서, 동일한 Address에서 동일한 길이의 데이터를 한 번에 읽기 위한 Instruction|
|0x83|Sync Write|다수의 장치에 대해서, 동일한 Address에 동일한 길이의 데이터를 한 번에 쓰기 위한 Instruction|
|0x92|Bulk Read|다수의 장치에 대해서, 서로 다른 Address에서 서로 다른 길이의 데이터를 한 번에 읽기 위한 Instruction|
|0x93|Bulk Write|다수의 장치에 대해서, 서로 다른 Address에 서로 다른 길이의 데이터를 한번에 쓰기 위한 Instruction|

## [Parameters](#parameters)

  1. Instruction의 보조 데이터 필드로써, Instruction 마다 용도가 다름.
  2. 음수 데이터의 표현 방법 : 제품별로 차이가 있으므로, 해당 제품의 eManual 참고

## [CRC](#crc)
16bit CRC : Packet이 통신 중에 파손되었는지를 점검하기 위한 필드.  
[CRC 계산 코드](/docs/kr/dxl/crc/)를 참고하세요.


# [Status Packet](#status-packet)
기본구성(Header, Reserved, Packet ID, Packet Length, 16bit CRC) : Instruction Packet 과 동일

|Header1|Header2|Header3|Reserved|Packet ID|Length1|Length2|Instruction|ERR|PARAM|PARAM|PARAM|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|ID|Len_L|Len_H|Instruction|Error|Param 1|...|Param N|CRC_L|CRC_H|

## Instruction
Status Packet의 Instruction은 0x55 (Status) 로 고정

## [Error](#error)
Instruction Packet 의 처리 결과를 나타냄

|Bit 7|Bit 6 ~ Bit 0|
|:---:|:---:|
|Alert|Error Number|

  - Alert : 장치에 문제가 발생한 경우 1 로 Setting 됨. 이 경우 Control Table 의 Hardware error status 값을 읽어 보면 문제의 원인을 알 수 있음.
  - Error Number : Instruction Packet 의 처리에 Error 가 발생한 경우

|Value|Error           |설명|
|:---:|:---            |:---------|
|0x01|Result Fail       |전송된 Instruction Packet 을 처리하는데 실패한 경우|
|0x02|Instruction Error |정의되지 않은 Instruction 을 사용한 경우<br />Reg Write 없이 Action 을 사용한 경우|
|0x03|CRC Error         |전송된 Packet 의 CRC 값이 맞지 않는 경우|
|0x04|Data Range Error  |해당 Address 에 쓰려는 Data 가 최소/최대값의 범위를 벗어난 경우|
|0x05|Data Length Error |해당 Address 의 데이터 길이보다 짧은 데이터를 적으려고 한 경우<br />(예: 4 byte로 정의된 항목의 2 byte 만 쓰려고 하는 경우)|
|0x06|Data Limit Error  |해당 Address 에 쓰려는 Data 가 Limit 값을 벗어난 경우|
|0x07|Access Errer      |Read Only 혹은 정의되지 않은 Address 에 값을 쓰려고 한 경우<br />Write Only 혹은 정의되지 않은 Address 에 값을 읽으려고 한 경우<br />Torque Enable(ROM Lock) 상태에서 ROM 영역에 값을 쓰려고 한 경우|

## Parameter

1. Instruction의 보조 데이터 필드로써, Instruction 마다 용도가 다름.
2. 음수 데이터의 표현 방법 : 제품별로 차이가 있으므로, 해당 제품의 eManual 참고

# [Packet 처리](#packet-처리)

## 전송 시 처리 순서

1. Packet 기본 형태 생성 후, Byte Stuffing(0xFD)
    - 검사 범위 : Instruction 필드부터 Parameter 필드 전체(CRC 제외)
    - 처리 방법 : “0xFF 0xFF 0xFD” 패턴이 나타날 경우, Byte Stuffing (0xFD) 을 추가  
      (“0xFF 0xFF 0xFD” 가 존재하면, 0xFD를 추가해서 “0xFF 0xFF 0xFD 0xFD”로 변경)
2. Packet Length : Byte Stuffing이 적용된 Packet Length로 수정
3. CRC : Byte Stuffing이 적용된 상태에서 CRC 계산

## 수신 시 처리 순서

1. Header(0xFF 0xFF 0xFD) 검색 : Byte Stuffing(“0xFF 0xFF 0xFD 0xFD”)은 무시.
2. Packet ID : Packet ID가 유효하면, Packet Length 만큼 추가로 수신
3. CRC : Byte Stuffing이 포함된 수신 Packet 상태에서 계산, CRC가 일치하면 Byte Stuffing을 제거

# [Instruction의 종류](#instruction의-종류)

## [Ping](#ping)
### 설명
  - 장치의 존재 여부 및 기본 정보를 얻기 위한 Instruction
  - 장치는 Status Return Level에 관계없이, Ping Instruction에는 무조건 Status Packet을 전송함.
  - Packet ID 필드가 0xFE(Broadcast ID)인 경우 : 모든 장치는 정해진 순서에 따라 자신의 Status Packet 을 전송함.

### Packet Parameters

`Note` Status Packet is received from each Device.
{: .notice}

|Status Packet|상세 설명|
|:---:|:---:|
|Parameter 1|모델번호 LSB |
|Parameter 2|모델번호 MSB|
|Parameter 3|펌웨어 Version|

### 예제 1
#### 예제 설명
- ID1(XM430-W210) : Model Number 1030(0x0406), Version of Firmware 38(0x26)인 경우
- Instruction Packet ID : 1

#### Ping Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x03|0x00|0x01|0x19|0x4E|

#### ID 1 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|PARAM1|PARAM2|PARAM3|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x07|0x00|0x55|0x00|0x06|0x04|0x26|0x65|0x5D|

### 예제 2
#### 예제 설명
- ID1(XM430-W210) : Model Number 1030(0x0406), Version of Firmware 38(0x26)인 경우
- ID2(XM430-W210) : Model Number 1030(0x0406), Version of Firmware 38(0x26)인 경우
- Instruction Packet ID : 254(Broadcast ID)

#### Ping Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0xFE|0x03|0x00|0x01|0x31|0x42|

#### ID 1 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|PARAM1|PARAM2|PARAM3|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x07|0x00|0x55|0x00|0x06|0x04|0x26|0x65|0x5D|

#### ID 2 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|PARAM1|PARAM2|PARAM3|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x02|0x07|0x00|0x55|0x00|0x06|0x04|0x26|0x6F|0x6D|

## [Read](#read)

### 설명
  - Control Table 의 값을 읽어오기 위한 Instruction
  - 음수 데이터의 표현 방법 : 제품별로 차이가 있으므로, 해당 제품의 e-manual 참고

### Packet Parameters

|Instruction Packet|상세 설명|
|:---:|:---:|
|Parameter 1| 시작 주소의 하위 바이트|
|Parameter 2|시작 주소의 상위 바이트|
|Parameter 3|데이터 길이(X)의 하위 바이트|
|Parameter 4|데이터 길이(X)의 상위 바이트|

|Status Packet|상세 설명|
|:---:|:---:|
|Parameter 1|첫 번째 바이트|
|Parameter 2|두 번째 바이트|
|...|...|
|Parameter X|X 번째 바이트|

### 예제

#### 예제 설명
- ID1(XM430-W210) : Present Position(132, 0x0084, 4[byte])이 166(0x000000A6)인 경우

#### Read Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|PARAM1|PARAM2|PARAM3|PARAM4|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x07|0x00|0x02|0x84|0x00|0x04|0x00|0x1D|0x15|

#### ID 1 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|PARAM1|PARAM2|PARAM3|PARAM4|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x08|0x00|0x55|0x00|0xA6|0x00|0x00|0x00|0x8C|0xC0|

## [Write](#write)

### 설명
  - Control Table 에 값을 쓰기 위한 Instruction
  - 음수 데이터의 표현 방법 : 제품별로 차이가 있으므로, 해당 제품의 e-manual 참고

### Packet Parameters

|Instruction Packet|상세 설명|
|:---:|:---:|
|Parameter 1|시작 주소의 하위 바이트|
|Parameter 2|시작 주소의 상위 바이트|
|Parameter 2+1|첫번째 바이트|
|Parameter 2+2|두번째 바이트|
|...|...|
|Parameter 2+X|X번째 바이트|

### 예제

#### 예제 설명
- ID1(XM430-W210) : Goal Position(116, 0x0074, 4[byte])를 512(0x00000200)로 변경하려는 경우

#### Write Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|P1|P2|P3|P4|P5|P6|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x09|0x00|0x03|0x74|0x00|0x00|0x02|0x00|0x00|0xCA|0x89|

#### ID 1 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x04|0x00|0x55|0x00|0xA1|0x0C|

## [Reg Write](#reg-write)

### 설명
  - Write Instruction과 유사하지만, 동기화 특성이 향상된 Instruction
  - Write Instruction은 Instruction Packet 을 받으면 즉시 실행됨.
  - Reg Write Instruction은 Instruction Packet 을 대기 상태로 등록하고, Control table Registered Instruction을 ‘1’로 설정함.
  - Action Instruction 을 수신하면, 등록된 Packet을 실행하고, Control Table Registered Instruction을 ‘0’으로 변경함.

### Packet Parameters

|Instruction Packet|상세 설명|
|:---:|:---:|
|Parameter 1|시작 주소의 하위 바이트|
|Parameter 2|시작 주소의 상위 바이트|
|Parameter 2+1|첫번째 바이트|
|Parameter 2+2|두번째 바이트|
|...|...|
|Parameter 2+X|X번째 바이트|

### 예제

#### Condition
- ID1(XM430-W210) : Goal Velocity(104, 0x0068, 4[byte])를 200(0x000000C8)로 변경하려는 경우

#### Reg Write Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|P1|P2|P3|P4|P5|P6|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x09|0x00|0x04|0x68|0x00|0xC8|0x00|0x00|0x00|0xAE|0x8E|

#### ID 1 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x04|0x00|0x55|0x00|0xA1|0x0C|

## [Action](#action)

### 설명
  - Reg Write Instruction으로 등록된 Packet을 실행하라는 Instruction
  - Write Instruction으로 다수의 장치를 제어할 경우, Packet을 최초로 수신한 장치와 마지막으로 수신한 장치는 실행 시점에 차이가 발생함.
  - Reg Write 와 Action Instruction을 사용하면, 다수의 장치를 동시에 구동할 수 있음.

### 예제

#### Condition
- ID1(XM430-W210) : Reg Write Instruction에 의해 Instruction이 등록된 경우

#### Action Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x03|0x00|0x05|0x02|0xCE|

#### ID 1 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x04|0x00|0x55|0x00|0xA1|0x0C|

## [Factory Reset](#factory-reset)

### 설명
  - Control Table 을 공장 출하 시의 초기값으로 되돌리는 Instruction

### Parameters

|Instruction Packet| 상세 설명|
|:---:|:---|
|Parameter 1|0xFF : 모든 값 초기화<br />0x01 : ID를 제외한 모든 값 초기화<br />0x02 : ID와 통신속도를 제외한 모든 값 초기화|

### 예제

#### 예제 설명
- ID1(XM430-W210) : Option 0x01(ID를 제외한 모든 값 초기화)

#### Factory Reset Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|P1|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x04|0x00|0x06|0x01|0xA1|0xE6|

#### ID 1 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|P1|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x04|0x00|0x55|0x00|0xA1|0x0C|

## [Reboot](#reboot)

### 설명
- 장치를 재부팅 시키는 Instruction

### 예제

#### 예제 설명
- ID1(XM430-W210)를 Reboot 시킬 경우

#### Reboot Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x03|0x00|0x08|0x2F|0x4E|

#### ID 1 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|P1|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x04|0x00|0x55|0x00|0xA1|0x0C|

## [Sync Read](#sync-read)

### 설명
- 하나의 Instruction Packet 으로 동시에 여러 개 장치의 데이터를 읽을 때 사용하는 Instruction
- 데이터의 Address와 Data Length가 모두 동일해야 함.
- 데이터의 주소가 연속적이지 않을 경우, Indirect Address를 사용할 수 있음.
- Packet ID 필드 : 0xFE (Broadcast ID)

### Parameters

|Instruction Packet|상세 설명|
|:---:|:---:|
|Parameter 1|시작 주소의 하위 바이트|
|Parameter 2|시작 주소의 상위 바이트|
|Parameter 3|데이터 길이(X)의 하위 바이트|
|Parameter 4|데이터 길이(X)의 상위 바이트|
|Parameter 4+1|첫번째 장치의 ID|
|Parameter 4+2|두번째 장치의 ID|
|...|...|
|Parameter 4+X|X번째 장치의 ID|


|Status Packet|상세 설명|
|:---:|:---:|
|Parameter 1|Frist Byte|
|Parameter 2|Second Byte|
|...|...|
|Parameter X|X번째 바이트|

### 예제

#### 예제 설명
- ID1(XM430-W210) : Present Position(132, 0x0084, 4[byte])이 166(0x000000A6)인 경우
- ID2(XM430-W210) : Present Position(132, 0x0084, 4[byte])이 2,079(0x0000081F)인 경우

#### Sync Read Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|P1|P2|P3|P4|P5|P6|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0xFE|0x09|0x00|0x82|0x84|0x00|0x04|0x00|0x01|0x02|0xCE|0xFA|

#### ID 1 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|PARAM1|PARAM2|PARAM3|PARAM4|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x08|0x00|0x55|0x00|0xA6|0x00|0x00|0x00|0x8C|0xC0|

#### ID 2 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|PARAM1|PARAM2|PARAM3|PARAM4|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x02|0x08|0x00|0x55|0x00|0x1F|0x08|0x00|0x00|0xBA|0xBE|

## [Sync Write](#sync-write)

### 설명
- 하나의 Instruction Packet 으로 동시에 여러 개 장치를 제어하기 위해 사용하는 Instruction
- 데이터의 Address와 Data Length가 모두 동일해야 함.
- 데이터의 주소가 연속적이지 않을 경우, Indirect Address를 사용할 수 있음.
- Packet ID 필드 : 0xFE (Broadcast ID)

### Parameters

|Instruction Packet|상세 설명|
|:---:|:---|
|Parameter 1|시작 주소의 하위 바이트|
|Parameter 2|시작 주소의 상위 바이트|
|Parameter 3|데이터 길이(X)의 하위 바이트|
|Parameter 4|데이터 길이(X)의 상위 바이트|
|Parameter 5|`첫번째 장치` ID|
|Parameter 5+1|`첫번째 장치` 첫번째 바이트|
|Parameter 5+2|`첫번째 장치` 두번째 바이트|
|...|`첫번째 장치`...|
|Parameter 6+X|`두번째 장치` X번째 바이트|
|Parameter 6|`두번째 장치` ID|
|Parameter 6+1|`두번째 장치` 첫번째 바이트|
|Parameter 6+2|`두번째 장치` 두번째 바이트|
|...|`두번째 장치`...|
|Parameter 6+X|`두번째 장치` X번째 바이트|
|...|...|

### 예제

#### 예제 설명
- ID1(XM430-W210) : Goal Position(116, 0x0074, 4[byte])을 150(0x00000096)로 변경하려는 경우
- ID2(XM430-W210) : Goal Position(116, 0x0074, 4[byte])을 170(0x000000AA)로 변경하려는 경우

#### Sync Write Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|P1|P2|P3|P4|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0xFE|0x11|0x00|0x83|0x74|0x00|0x04|0x00|

|P5|P6|P7|P8|P9|P10|P11|P12|P13|P14|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0x01|0x96|0x00|0x00|0x00|0x02|0xAA|0x00|0x00|0x00|0x82|0x87|

## [Bulk Read](#bulk-read)

### 설명
- Sync Read 와 유사하게, 하나의 Instruction Packet 으로 동시에 여러 개 장치의 데이터를 읽을 때 사용하는 Instruction
- 데이터의 Address와 Data Length가 장치별로 달라도 사용 가능.
- Parameter에 동일한 아이디가 여러 번 사용될 수 없음. 즉, 하나의 장치에서는 한 번만 읽을 수 있음.
- 데이터의 주소가 연속적이지 않을 경우, Indirect Address를 사용할 수 있음.
- Packet ID 필드 : 0xFE (Broadcast ID)

### Parameters

|Instruction Packet|상세 설명|
|:---:|:---|
|Parameter 1|`첫번째 장치` ID|
|Parameter 2|`첫번째 장치` 시작 주소 하위 바이트|
|Parameter 3|`첫번째 장치` 시작 주소 상위 바이트|
|Parameter 4|`첫번째 장치` 데이터 길이 하위 바이트|
|Parameter 5|`첫번째 장치` 데이터 길이 상위 바이트|
|Parameter 6|`두번째 장치` ID|
|Parameter 7|`두번째 장치` 시작 주소 하위 바이트|
|Parameter 8|`두번째 장치` 시작 주소 상위 바이트|
|Parameter 9|`두번째 장치` 데이터 길이 하위 바이트|
|Parameter 10|`두번째 장치` 데이터 길이 상위 바이트|
|...|...|


|Status Packet|상세 설명|
|:---:|:---:|
|Parameter 1|첫번째 바이트|
|Parameter 2|두번째 바이트|
|...|...
|Parameter X|X번째 바이트|

### 예제

#### Condition
- ID1(XM430-W210) : Present Voltage(144, 0x0090, 2[byte])이 119(0x0077)인 경우
- ID2(XM430-W210) : Present Temperature(146, 0x0092, 1[byte])이 36(0x24)인 경우

#### Bulk Read Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|P1|P2|P3|P4|P5|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0xFE|0x0D|0x00|0x92|0x01|0x90|0x00|0x02|0x00|

|P6|P7|P8|P9|P10|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0x02|0x92|0x00|0x01|0x00|0x1A|0x05|

#### ID 1 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|PARAM1|PARAM2|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x01|0x06|0x00|0x55|0x00|0x77|0x00|0xC3|0x69|

#### ID 2 Status Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|ERR|PARAM1|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0x02|0x05|0x00|0x55|0x00|0x24|0x8B|0x21|

## [Bulk Write](#bulk-write)

### 설명
- Sync Write 와 유사하게, 하나의 Instruction Packet 으로 여러 개 장치를 제어하기 위해 사용하는 Instruction.
- 데이터의 Address와 Data Length가 장치별로 달라도 사용 가능.
- Parameter에 동일한 아이디가 여러 번 사용될 수 없음. 즉, 하나의 장치에서는 한 번만 읽을 수 있음.
- 데이터의 주소가 연속적이지 않을 경우, Indirect Address를 사용할 수 있음.
- Packet ID 필드 : 0xFE (Broadcast ID)

### Parameters

|Instruction Packet|상세 설명|
|:---:|:---|
|Parameter 1|`첫번째 장치` ID|
|Parameter 2|`첫번째 장치` 시작 주소 하위 바이트|
|Parameter 3|`첫번째 장치` 시작 주소 상위 바이트|
|Parameter 4|`첫번째 장치` 데이터 길이 하위 바이트|
|Parameter 5|`첫번째 장치` 데이터 길이 상위 바이트|
|Parameter 5+1|`첫번째 장치` 첫번째 바이트|
|Parameter 5+2|`첫번째 장치` 두번째 바이트|
|...|...|
|Parameter 5+X|`첫번째 장치` X번째 바이트|
|Parameter 6+X|`두번째 장치` ID|
|Parameter 7+X|`두번째 장치` 시작 주소 하위 바이트|
|Parameter 8+X|`두번째 장치` 시작 주소 상위 바이트|
|Parameter 9+X|`두번째 장치` 데이터 길이 하위 바이트|
|Parameter 10+X|`두번째 장치` 데이터 길이 상위 바이트|
|Parameter 10+X+1|`두번째 장치` 첫번째 바이트|
|Parameter 10+X+2|`두번째 장치` 두번째 바이트|
|...|...|
|Parameter 10+X+Y|`두번째 장치` Y번째 바이트|
|...|...|

### 예제

#### Condition
- ID1(XM430-W210) : Max Voltage Limit(32, 0x0020, 2[byte])을 160(0x00A0) 로 변경하려는 경우
- ID2(XM430-W210) : Temperature Limit(31, 0x001F, 1[byte])를 80(0x50)으로 쓸 경우

#### Bulk Write Instruction Packet

|H1|H2|H3|RSRV|ID|LEN1|LEN2|INST|P1|P2|P3|P4|P5|P6|P7|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|0xFE|0x10|0x00|0x93|0x01|0x20|0x00|0x02|0x00|0xA0|0x00|

|P8|P9|P10|P11|P12|P13|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0x02|0x1F|0x00|0x01|0x00|0x50|0xB7|0x68|
