---
layout: archive
lang: kr
ref: protocol1
read_time: true
share: true
author_profile: false
permalink: /docs/kr/dxl/protocol1/
sidebar:
  title: Protocol 1.0
  nav: "protocol1"
---

# [개요](#개요)

다이나믹셀을 제어하기 위해서는 다이나믹셀의 프로토콜에 맞추어 통신을 해야 합니다.  
다이나믹셀은 binary 형태의 데이터를 받아 구동됩니다.  
이러한 데이터를 전송하기 위한 프로그램 예제는 다이나믹셀 전용 Controller 또는 USB2DYNAMIXEL, U2D2 의 사용자 설명서에 자세히 기술되어 있습니다.  
따라서 본 다이나믹셀의 사용자 설명서에서는 Main controller 가binary 형태의 데이터를 전송할 수 있다는 가정하에 다이나믹셀에서 사용하는 통신 방식에 대한 설명과 통신 프로토콜에 대한 설명만을 기술하였습니다.

## [Packet](#packet)

Main Controller와 다이나믹셀은 Packet이라고 불리는 데이터를 주고 받으며 통신합니다. Packet에는 두 가지 종류가 있습니다. Main Controller가 다이나믹셀을 제어하기 위해 전송하는 Instruction Packet과 다이나믹셀이 Main Controller로 답변하는 Status Packet이 그것입니다.

## [ID](#id)

ID는 한 개의 버스에 여러 개의 다이나믹셀이 연결되었을 때 각각의 다이나믹셀들을 구별하기 위해 만든 고유 번호입니다.  
Instruction Packet과 Status Packet에 ID를 넣음으로써 Main Controller는 제어하고자 하는 다이나믹셀만을 제어할 수 있습니다.

## [Protocol](#protocol)

다이나믹셀은 8 bit, 1 Stop bit, None Parity의 Asynchronous Serial 통신을 합니다.

만약 같은 ID 를 가진 다이나믹셀이 연결되었을 경우 Packet 충돌이 일어나서 통신에 문제를 일으키게 됩니다.  
그러므로 ID가 같은 다이나믹셀이 존재하지 않도록 ID설정을 해야 합니다.

다이나믹셀의 ID 는 변경 가능합니다. 변경 방법은 [다이나믹셀 ID설정]을 참고하시기 바랍니다.  
공장 출하시 초기 ID 는 1번 입니다.

## [Half Duplex](#half-duplex)

Half Duplex란 TxD, RxD를 하나의 선으로 공유하는 통신 방식으로 다이나믹셀은 Half Duplex 방식을 사용하고 있습니다.  
보통 하나의 BUS에 여러 개의 통신 장치를 연결할 경우에 사용합니다.  
여러 개의 장치가 송신하는 동안 그 외의 다른 모든 장치들은 입력 상태이어야 하기 때문에 통신 방향을 제어하는 Direction Port가 필요합니다.  
다이나믹셀을 제어하는 Main Controller는 통신 방향을 입력으로 설정해 놓고 있다가 Instructon Packet을 전송하는 동안만 통신 방향을 출력으로 설정해야 합니다.

![](/assets/images/dxl/halfduplex.png)

## [Tx, Rx Direction](#tx-rx-direction)

Half Duplex 통신 방식을 사용하기 위해 필요한 제어 방법입니다.  
RS485 UART 에서는 송신이 끝나는 Timing 을 잘 맞춰서 Direction 을 수신 Mode 로 바꾸어야 합니다.  
CPU 에서는 일반적으로 UART_STATUS 를 표시해주는 REGISTER 내에 다음과 같은 의미의 BIT 가 있습니다.

- **TXD_BUFFER_READY_BIT**: Transmission DATA 를 Buffer 에 적재할 수 있는 상태임을 뜻합니다. 상태는 SERIAL TX BUFFER 가 비어 있다는 의미이지, 이전에 전송한 데이터가 모두 CPU 밖으로 배출된 상태를 의미하는 것은 아닙니다.
- **TXD_SHIFT_REGISTER_EMPTY_BIT**: Transmission Data 가 모두 CPU 밖으로 배출되었을 때 SET 됩니다.


TXD_BUFFER_READY_BIT 의 경우는 Serial 통신에서 한 Byte 를 송신할 때 사용되며 그 예는 다음과 같습니다.

```c
TxDByte(byte bData)
{
  while(!TXD_BUFFER_READY_BIT); //wait until data can be loaded.
  SerialTxDBuffer = bData; //data load to TxD buffer
}
```

Direction을 전환하는 시점에서는 TXD_SHIFT_REGISTER_EMPTY_BIT를 확인해야 합니다. 다음은 Instruction packet을 전송하는 예제 프로그램입니다.

```c
DIRECTION_PORT = TX_DIRECTION;
TxDByte(0xff);
TxDByte(0xff);
TxDByte(bID);
TxDByte(bLength);
TxDByte(bInstruction);
TxDByte(Parameter0); TxDByte(Parameter1); ...
DisableInterrupt(); // interrupt should be disable
TxDByte(Checksum); //last TxD
while(!TXD_SHIFT_REGISTER_EMPTY_BIT); //Wait till last data bit has been sent
DIRECTION_PORT = RX_DIRECTION; //Direction change to RXD
EnableInterrupt(); // enable interrupt again
```

**주의**: 주의할 부분은 LINE 8부터 LINE 12입니다. LINE 8이 필요한 이유는 그 시점에서 Interrupt 가 발생하여 Return Delay Time 보다 긴 시간 동안 Interrupt routine이 수행될 경우 Status Packet의 앞부분이 손상되기 때문입니다.
{: .notice}

## [Byte to Byte Time](#byte-to-byte-time)

Instruction Packet을 전송할 때 Byte와 Byte사이의 Delay Time을 의미하는데, 이 시간이 100msec가 넘을 경우 RX-64는 전송 장해가 발생한 것으로 간주하고, 다시 Packet의 header(0xff 0xff)를 기다립니다.

![](/assets/images/dxl/byte2bytetime.png)

# [Instruction Packet](#instruction-packet)
Instruction Packet은 제어기가 다이나믹셀에게 보내는 명령 데이터입니다. Instruction Packet의 구조는 아래와 같습니다.

| Header1 | Header2 | ID | Length | Instruction | Param 1 | ... | Param N | Checksum |
|:-------:|:-------:|:--:|:------:|:-----------:|:-------:|:---:|:-------:|:--------:|
|  0xFF   |  0xFF   | ID | Length | Instruction | Param 1 | ... | Param N |  CHKSUM  |

## [Header](#header)
Packet의 시작을 알리는 신호입니다.

## [Packet ID](#packet-id)
Instruction Packet을 받을 다이나믹셀의 ID입니다.

  1. 일반 ID : 0 ~ 253 (0x00~0xFD), 254개를 사용할 수 있습니다.
  2. Broadcast ID : 254 (0xFE), 연결된 모든 다이나믹셀이 Instruction Packet의 명령을 수행하며 Status Packet은 반환되지 않습니다.

## [Length](#length)
Packet의 길이로서 Instruction, Parameter, Checksum 항목의 데이터 길이를 포함합니다.
`Length = Parameter 개수(N) + 2`

## [Instruction](#instruction)

다이나믹셀에 지시하는 명령으로 아래와 같은 종류가 있습니다.

|  값  |    명령어     |                                                     세부 설명                                                     | 파라미터 갯수 |
|:----:|:-------------:|:-----------------------------------------------------------------------------------------------------------------:|:--------------|
| 0x01 |     Ping      |                            수행 내용 없음. 제어기가 Status Packet을 받고자할 경우 사용                            | 0             |
| 0x02 |     Read      |                                          다이나믹셀의 데이터를 읽는 명령                                          | 2             |
| 0x03 |     Write     |                                          다이나믹셀의 데이터를 쓰는 명령                                          | >2            |
| 0x04 |   Reg Write   |                   WRTE_DATA와 내용은 유사하나, 대기상태로 있다가 ACTION 명령이 도착해야 수행됨                    | >2            |
| 0x05 |    Action     |                                     REG WRITE로 등록된 동작을 시작하라는 명령                                     | 0             |
| 0x06 | Factory Reset |                               다이나믹셀의 상태를 공장 출하 상태로 복귀시키는 명령                                | 0             |
| 0x08 |    Reboot     |                                         장치를 재부팅 시키는 Instruction                                          | 0             |
| 0x83 |  Sync Write   |                        한번에 여러 개의 다이나믹셀을 동시에 제어하고자 할때 사용되는 명령                         | >4            |
| 0x92 |   Bulk Read   | 한번의 명령으로 여러 개의 다이나믹셀의 데이터를 순차적으로 읽음.<br>(이명령은 MX시리즈에서만 사용할 수 있습니다.) | >4            |

## [Parameters](#parameters)
보조 데이터가 필요한 INSTRUCTION일 경우 PARAMETER를 사용합니다.

## [Instruction Checksum](#instruction-checksum)
Check Sum 은 Packet이 통신 중에 파손되었는지를 점검하기 위해 사용됩니다. 아래의 방법에 따라 Check Sum을 계산하여 작성하십시오.

**Instruction Checksum = ~( ID + Length + Instruction + Parameter1 + ... Parameter N )**

`~` 은 Not Bit 연산자입니다.
위 식에서 괄호 안의 계산 결과가 255(0xFF) 보다 클 경우 하위 byte 만 사용합니다.

예를 들면 아래와 같은 Instruction Packet 을 쓰고 싶을 경우

ID=1(0x01), Length=5(0x05), Instruction=3(0x03),
Parameter1=12(0x0C), Parameter2=100(0x64), Parameter3=170(0xAA)

Checksum = ~ ( ID + Length + Instruction + Parameter1 + ... Parameter 3 )
= ~ [ 0x01 + 0x05 + 0x03 + 0x0C + 0x64 + 0xAA ]
= ~ [ 0x123 ] // 하위 byte인 0x23만 Not 연산을 수행합니다.
= 0xDC

따라서, Instruction Packet 은 0x01 0x05 0x03 0x0C 0x64 0xAA 0xDC 가 되어야 합니다.


# [Status Packet(Return Packet)](#status-packetreturn-packet)
다이나믹셀은 Main Controller로부터 받은 명령을 수행한 뒤 그 결과를 Main Controller에게 Return합니다. 이 때 Return 되는 데이터를 Status Packet이라고 합니다. Status Packet의 구조는 아래와 같습니다.

| Header1 | Header2 | ID | Length | Error | Param 1 | ... | Param N | Checksum |
|:-------:|:-------:|:--:|:------:|:-----:|:-------:|:---:|:-------:|:--------:|
|  0xFF   |  0xFF   | ID | Length | Error | Param 1 | ... | Param N |  CHKSUM  |

## [Header](#header)
Packet의 시작을 알리는 신호입니다.

## [Packet ID](#packet-id)
Status Packet을 전송하는 다이나믹셀의 ID입니다.

  1. 일반 ID : 0 ~ 253 (0x00~0xFD), 254개를 사용할 수 있습니다.
  2. Broadcast ID : 254 (0xFE), 연결된 모든 다이나믹셀이 Instruction Packet의 명령을 수행하며 Status Packet은 반환되지 않습니다.

## [Length](#length)
Status Packet의 길이로서 Error, Parameter, Checksum 항목의 데이터 길이를 포함합니다.
`Length = Parameter 개수(N) + 2`

## [Error](#error)
다이나믹셀의 동작 중에 발생된 오류 상태를 나타내며, 각 Bit별 의미는 다음 표와 같습니다.

|  Bit  |        명령         |                                              세부 설명                                              |
|:-----:|:-------------------:|:---------------------------------------------------------------------------------------------------:|
| Bit 7 |          0          |                                                  -                                                  |
| Bit 6 |  Instruction Error  | 정의되지 않은 Instruction이 전송된 경우, 또는 reg_write명령없이 action명령이 전달된 경우 1로 설정됨 |
| Bit 5 |   Overload Error    |                     설정된 Torque로 현재의 하중을 제어할 수 없을 때 1로 설정됨                      |
| Bit 4 |   Checksum Error    |                   전송된 Instruction Packet의 Checksum이 맞지 않을 때 1로 설정됨                    |
| Bit 3 |     Range Error     |                              사용범위를 벗어난 명령일 경우 1로 설정됨                               |
| Bit 2 |  Overheating Error  |         다이나믹셀 내부 온도가 Control Table에 설정된 동작온도 범위를 벗어났을 때 1로 설정          |
| Bit 1 |  Angle Limit Error  |    Goal Position이 CW Angle Limit ~ CCW Angle Limit 범위 밖의 값으로 Writing 되었을때 1로 설정됨    |
| Bit 0 | Input Voltage Error |         Error인가된 전압이 Control Table에 설정된 동작전압 범위를 벗어났을 경우 1로 설정됨          |

예를 들어 Status Packet이 아래와 같이 Return 되었을 경우  

```
0xFF 0xFF 0x01 0x02 0x24 0xD8
```

ID 가 01 번인 RX-64로부터 0x24 의 Error가 발생했다는 것을 의미합니다.  
0x24는 2 진수로 00100100 이므로 `Bit 5` 와 `Bit 2` 가 `1`이 된 것입니다.  
즉, Overload Error 와 Overheating Error 가 발생되었다는 것을 알 수 있습니다.

**주의**: 위 테이블에 나와있는 에러 종류는 액츄에이터와 관련된 사항이며, 다이나믹셀의 종류에 따라 내용이 다를 수 있습니다.
{: .notice}

## [Parameter]

ERROR 외의 Data 를 Return 합니다. 사용 방법은 [Instruction의 종류](#instruction의-종류)를 참고하시기 바랍니다.

## [Status Checksum](#status-checksum)
It is used to check if packet is damaged during communication.
Status Checksum is calculated according to the following formula.

**Status Checksum = ~( ID + Length + Error + Parameter1 + ... Parameter N )**


# [Instruction의 종류](#instruction의-종류)
Instruction Packet은 7종류의 명령들이 있습니다.  
다이나믹셀을 구동시키기 위해서는 Main Controller에서 다이나믹셀에 Instruction Packet이라는 binary 형태의 데이터를 보내야 합니다.  
또한 다이나믹셀은 Instruction Packet을 받아 명령을 수행한 뒤 그 결과를 Status Packet으로 Main Controller 에 응답합니다.  
여기에서는 Instruction Packet의 각 명령 별로 사용 예를 기술하였습니다.

**주의**: 아래 예제는 다이나믹셀 액츄에이터 RX-64를 기반으로 작성된 예제입니다. AX-12A, DX 등 다른 다이나믹셀도 동일한 명령으로 구성되어 있으므로, 같은 Packet 형식으로 사용할 수 있습니다.
{: .notice}

## [Ping](#ping)
아무 것도 지시하지 않습니다.  
단지 Status Packet을 받고자 할 때나 특정 ID를 갖는 다이나믹셀의 존재를 확인하기 위해 사용됩니다.  
다이나믹셀의 Status Return Level(16)이 '0'으로 설정되어 있더라도 Ping 명령어에 응답하게 됩니다.  
단, PING instruction 을 사용하더라도 Check Sum Error가 발생한 경우에는 Status Packet을 반환하지 않습니다.

| Length | Instruction | Parameter |
|:------:|:-----------:|:---------:|
|  0x02  |    0x01     |     -     |

### 예제
#### 예제 설명
- ID 1(RX-64)가 동일한 통신속도를 사용하는 PC와 연결되어 있을것.

#### Ping Instruction Packet

|  H1  |  H2  |  ID  | LEN  | INST | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x01 | 0x02 | 0x01 | 0xFB |

#### ID 1 Status Packet

|  H1  |  H2  |  ID  | LEN  | ERR  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x01 | 0x02 | 0x00 | 0xFC |

## [Read](#read)
Control Table의 Data를 읽는 명령입니다.

| Length | Instruction |      Param 1       |    Param 2    |
|:------:|:-----------:|:------------------:|:-------------:|
|  0x04  |    0x02     | 데이터의 시작 주소 | 데이터의 길이 |

### 예제
#### 예제 설명
- ID 1(RX-64) : Present Temperature 읽어오기, 시작주소 43(0x2B)

#### Read Instruction Packet

|  H1  |  H2  |  ID  | LEN  | INST |  P1  |  P2  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x01 | 0x04 | 0x02 | 0x2B | 0x01 | 0xCC |

#### ID 1 Status Packet

|  H1  |  H2  |  ID  | LEN  | ERR  |  P1  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x01 | 0x03 | 0x00 | 0x20 | 0xDB |

## [Write](#write)
Control Table에 Data를 쓰는 명령입니다.

| Length | Instruction |      Param 1       |    Param 2    |    Param 3    |  Param N+1   |
|:------:|:-----------:|:------------------:|:-------------:|:-------------:|:------------:|
| N + 3  |    0x03     | 데이터의 시작 주소 | 첫번째 바이트 | 두번째 바이트 | N번째 바이트 |

### 예제
#### 예제 설명
- ID broadcast(RX-64) : 불특정 다이나믹셀의 ID를 '1'로 설정합니다.

#### Write Instruction Packet

|  H1  |  H2  |  ID  | LEN  | INST |  P1  |  P2  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFE | 0x04 | 0x03 | 0x03 | 0x01 | 0xF6 |

**주의**: Broadcast ID(0xFE)가 사용될 경우 Status Packet은 반환되지 않습니다.
{: .notice}

## [Reg Write](#reg-write)
REG_WRITE명령은 WRITE_DATA명령과 기능은 유사하나, 명령이 수행되는 시점이 다릅니다.  
1. Instruction Packet이 도착하면 그 값을 Buffer에 저장하고 Write 동작은 대기 상태로 남겨둡니다.  
2. 이때, Registered Instruction (Address 44 (0x2C)) 이 1로 설정됩니다.  
3. 이후에 Action Instruction Packet이 도착하면 Registered Instruction 이 0으로 바뀌면서 비로소 등록되어 있던 Write명령이 실행됩니다.

| Length | Instruction |      Param 1       |    Param 2    |  Param N+1   |
|:------:|:-----------:|:------------------:|:-------------:|:------------:|
|  N+3   |    0x04     | 데이터의 시작 주소 | 첫번째 바이트 | N번째 바이트 |

### 예제
#### 예제 설명
- ID 1(RX-64) : Reg Write을 이용해서 500(0x1F4)을 Goal Position(30)에 입력하고 Action 명령어를 기다렸다가 움직입니다.

#### Reg Write Instruction Packet

|  H1  |  H2  |  ID  | LEN  | INST |  P1  |  P2  |  P3|CKSM  |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:---------:|
| 0xFF | 0xFF | 0x01 | 0x05 | 0x04 | 0x1E | 0xF4 | 0x01|0xE2 |

#### ID 1 Status Packet

|  H1  |  H2  |  ID  | LEN  | ERR  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x01 | 0x02 | 0x00 | 0xFC |

## [Action](#action)
REG_WRITE로 등록된 WRITE 작업을 수행하라는 명령입니다.  
ACTION 명령은 여러 개의 다이나믹셀들을 동시에 움직여야 하는 경우 사용합니다.  
여러 개의 구동장치를 통신에 의해 제어할 때, 맨 처음 명령을 전달 받는 구동장치와 맨 마지막에 명령을 전달 받는 구동장치는 구동 시점에 약간의 시간 차이가 있는데, ACTION 명령은 이 문제를 해결합니다.  

**주의**: Action 명령어를 사용할 경우 Status Packet은 반환되지 않습니다.
{: .notice}

| Length | Instruction | Parameter |
|:------:|:-----------:|:---------:|
|  0x02  |    0x05     |     -     |

### 예제
#### 예제 설명
- 다이나믹셀이 미리 Reg Write를 이용해서 데이터를 수신해야 합니다.

#### Action Instruction Packet

|  H1  |  H2  |  ID  | LEN  | INST | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFE | 0x02 | 0x05 | 0xFA |

## [Factory Reset](#factory-reset)
Control Table의 Data를 공장 출하 값 상태로 되돌려 놓습니다. Broadcast ID(0xFE)로 RESET 명령을 사용할 수 없습니다
- 지원 모델 : MX-12W(V41), MX-28(V40), MX-64(V40), MX-106(V40), X 시리즈(XL-320 제외), MX(2.0) 시리즈

{% capture reset_warning_01 %}
**주의**: RESET 명령을 사용하면 사용자가 EEPROM에 설정했던 값이 지워지므로 사용에 주의하시기 바랍니다.<br>

{% endcapture %}

<div class="notice--warning">{{ reset_warning_01 | markdownify }}</div>

| Length | Instruction | Parameter |
|:------:|:-----------:|:---------:|
|  0x02  |    0x06     |     -     |

### 예제
#### 예제 설명
- ID 0(RX-64) : 다이나믹셀을 공장 출하시 설정으로 복구시킵니다.

#### Factory Reset Instruction Packet

|  H1  |  H2  |  ID  | LEN  | INST | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x00 | 0x02 | 0x06 | 0xF7 |

#### ID 0 Status Packet

|  H1  |  H2  |  ID  | LEN  | ERR  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x00 | 0x02 | 0x00 | 0xFD |

## [Reboot](#reboot)
장치를 재부팅 시킵니다.
- 지원 모델 : MX-12W(V41), MX-28(V40), MX-64(V40), MX-106(V40), X 시리즈(XL-320 제외), MX(2.0) 시리즈

### 예제
#### 예제 설명
- ID 1(XM430-W210)를 Reboot 시킬 경우

#### Reboot Instruction Packet

|  H1  |  H2  |  ID  | LEN  | INST | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x01 | 0x02 | 0x08 | 0xF4 |

#### ID 1 Status Packet

|  H1  |  H2  |  ID  | LEN  | ERR  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x01 | 0x02 | 0x00 | 0xFC |

## [Sync Write](#sync-write)
한번의 Instruction Packet전송으로 여러 개의 다이나믹셀들을 동시에 제어하고자 할 때 사용되는 명령어입니다.  
이 명령을 사용하면 여러 명령을 한번에 전달하므로 Reg_Write/Action에 비해 통신시간이 줄어듭니다.  
단, Write 하고자 하는 컨트롤 테이블의 주소와 길이가 모두 동일해야 SYNC WRITE 명령을 사용할 수 있습니다.  
또한 ID는 Broadcasting ID로 전송되어야 합니다.

|      항목      | 설명                                                 |
|:--------------:|:-----------------------------------------------------|
|  Instruction   | 0x83                                                 |
|     Length     | ((L + 1) * N) + 4 (L:데이터 길이, N:다이나믹셀 갯수) |
|  Parameter 1   | 시작주소                                             |
|  Parameter 2   | 데이터 길이                                          |
|  Parameter 3   | `첫번째 장치` ID                                     |
|  Parameter 4   | `첫번째 장치` 첫번째 데이터 바이트                   |
|  Parameter 5   | `첫번째 장치` 두번째 데이터 바이트                   |
|      ...       | ...                                                  |
| Parameter L+3  | `첫번째 장치` L번째 데이터 바이트                    |
| Parameter L+4  | `두번째 장치` ID                                     |
| Parameter L+5  | `두번째 장치` 첫번째 데이터 바이트                   |
| Parameter L+6  | `두번째 장치` 두번째 데이터 바이트                   |
|      ...       | ...                                                  |
| Parameter 2L+4 | `두번째 장치` L번째 데이터 바이트                    |

### 예제
#### 예제 설명
- ID 0(RX-64) : Goal Position(30, 0x1E)에 0x010을 입력하고 Moving Speed(32, 0x20)에 0x150을 입력함.
- ID 1(RX-64) : Goal Position(30, 0x1E)에 0x220을 입력하고 Moving Speed(32, 0x20)에 0x360을 입력함.

#### Sync Write Instruction Packet

|  H1  |  H2  |  ID  | LEN  | INST |  P1  |  P2  |  P3  |  P4  |  P5  |  P6  |  P7  |  P8  |  P9  | P10  | P11  | P12  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFE | 0x0E | 0x83 | 0x1E | 0x04 | 0x00 | 0x10 | 0x00 | 0x50 | 0x01 | 0x01 | 0x20 | 0x02 | 0x60 | 0x03 | 0x67 |

**주의**: Broadcast ID(0xFE)가 사용될 경우 Status Packet은 반환되지 않습니다.
{: .notice}

## [Bulk Read](#bulk-read)
한 번의 Instruction Packet 전송으로 여러 개의 다이나믹셀(MX시리즈)에서 동시에 값을 읽어오고자 할 때 사용되는 명령어입니다.  
여러 번의 READ 명령을 내리는 것에 비해 패킷의 길이가 줄어들고, 리턴 되는 상태 패킷들 사이에 유휴 시간이 줄어들어 통신 시간을 절약할 수 있습니다.  
단, 하나의 모듈에 여러 번 읽어 오도록 사용할 수는 없으며 동일한 모듈 ID 를 여러 번 지정할 경우 가장 먼저 지정된 파라미터만 처리됩니다.

|      항목      | 설명                                 |
|:--------------:|:-------------------------------------|
|  Instruction   | 0x92                                 |
|     Length     | 3N + 3                               |
|  Parameter 1   | 0x00                                 |
|  Parameter 2   | `첫번째 장치` 읽어들일 데이터의 길이 |
|  Parameter 3   | `첫번째 장치` ID                     |
|  Parameter 4   | `첫번째 장치` 시작주소               |
|      ...       | ...                                  |
| Parameter 3N+2 | `N번째 장치` 읽어들일 데이터의 길이  |
| Parameter 3N+3 | `N번째 장치` ID                      |
| Parameter 3N+4 | `N번째 장치` 시작주소                |

### 예제
#### 예제 설명
- ID 1(MX-64) : 2 바이트 Goal Position(30, 0x1E) 값을 읽어옵니다.
- ID 2(MX-64) : 2 바이트 Present Position(36, 0x24) 값을 읽어옵니다.

#### Bulk Read Instruction Packet

|  H1  |  H2  |  ID  | LEN  | INST |  P1  |  P2  |  P3  |  P4  |  P5  |  P6  |  P7  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFE | 0x09 | 0x92 | 0x00 | 0x02 | 0x01 | 0x1E | 0x02 | 0x02 | 0x24 | 0x1D |

이러한 동작을 지시하기 위한 명령 패킷은 다음과 같이 이루어집니다.  

```
0xFF 0xFF 0xFE 0x09 0x92 0x00 0x02 0x01 0x1E 0x02 0x02 0x24 0x1D
```

이 때 ID 2 인 모듈은 데이터 버스 상에 ID 1(바로 전 파라미터의 ID) 인 모듈의 상태 패킷이 전송되는 것을 감시하다가 ID 1 인 모듈의 상태 패킷이 전송 완료되는 즉시 자신의 상태 패킷을 전송하게 된다.  
리턴되는 상태 패킷은 아래와 같이 됩니다.  

```
0xFF 0xFF 0x01 0x04 0x00 0x00 0x80 0x7A 0xFF 0xFF 0x02 0x04 0x00 0x00 0x80 0x79
```

각각 모듈 ID 1 과 ID 2 에서 보낸 상태 패킷이 연달아 들어오는 형식이 됩니다.

#### ID 1 Status Packet

|  H1  |  H2  |  ID  | LEN  | ERR  |  P1  |  P2  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x01 | 0x04 | 0x00 | 0x00 | 0x80 | 0x7A |

#### ID 2 Status Packet

|  H1  |  H2  |  ID  | LEN  | ERR  |  P1  |  P2  | CKSM |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0x02 | 0x04 | 0x00 | 0x00 | 0x80 | 0x79 |

# [추가 예제](#추가-예제)

![](/assets/images/dxl/protocol1/protocol1_example_06.png)

![](/assets/images/dxl/protocol1/protocol1_example_07.png)

![](/assets/images/dxl/protocol1/protocol1_example_08.png)

![](/assets/images/dxl/protocol1/protocol1_example_09.png)

![](/assets/images/dxl/protocol1/protocol1_example_10.png)

![](/assets/images/dxl/protocol1/protocol1_example_11.png)

![](/assets/images/dxl/protocol1/protocol1_example_12.png)

![](/assets/images/dxl/protocol1/protocol1_example_13.png)

![](/assets/images/dxl/protocol1/protocol1_example_15.png)

![](/assets/images/dxl/protocol1/protocol1_example_16.png)

![](/assets/images/dxl/protocol1/protocol1_example_17.png)

![](/assets/images/dxl/protocol1/protocol1_example_18.png)

![](/assets/images/dxl/protocol1/protocol1_example_19.png)

![](/assets/images/dxl/protocol1/protocol1_example_20.png)

![](/assets/images/dxl/protocol1/protocol1_example_21.png)


[다이나믹셀 ID설정]: /docs/kr/software/rplus1/manager/#id-설정
