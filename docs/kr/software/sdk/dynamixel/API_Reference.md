# API Reference

Reference는 C언어 호출 방식을 기반으로 설명을 합니다.

### Device Control Method

- 제어기 통신장치를 제어하는 함수
	- [dxl_initialize]
	- [dxl_terminate]

### Set/Get Packet Method

- 패킷을 만들고 내용을 볼 수 있는  함수
	- [dxl_set_txpacket_id]
	- [dxl_get_rxpacket_error]
	- [dxl_set_txpacket_instruction]
	- [dxl_get_rxpacket_length]
	- [dxl_set_txpacket_parameter]
	- [dxl_get_rxpacket_parameter]
	- [dxl_set_txpacket_length]
	- [dxl_makeword]
	- [dxl_get_lowbyte]
	- [dxl_get_highbyte]

### Packet Communication Method

- 패킷을 전송하고 받는 함수
	- [dxl_tx_packet]
	- [dxl_rx_packet]
	- [dxl_txrx_packet]
	- [dxl_get_result]

### High Communication Method

- 자주 만들어 쓰는 패킷을 함수화 하여 사용하기 편리하게 만든 함수
	- [dxl_ping]
	- [dxl_read_byte]
	- [dxl_write_byte]
	- [dxl_read_word]
	- [dxl_write_word]

### Utility Method

- 기타 유용하게 쓰이는 함수
	- [dxl_makeword]
	- [dxl_get_highbyte]
	- [dxl_get_lowbyte]

## dxl_initialize

제어기의 통신장치를 초기화 하여 준비 상태로 만듭니다.
```
int dxl_initialize(
      int devIndex ,
      int baudnum
);
```
### Parameters
- devIndex  
  현재 연결된 통신장치의 번호 입니다.(플랫폼에 따라 다를수 있습니다.)
  예를 들어 Windows의 경우 COM 포트로 장치를 구분합니다.

- baudnum
  새로 설정할 Baud rate 번호 입니다. 다이나믹셀이 사용하는 것과 동일합니다.
  아래 표는 주요 Baudrate를 나타냅니다.


  | Address 4 | 설정 BPS    | 목표 BPS | 오차     |
  | --------- | --------- | --------- | -------- |
  | 1         | 1000000.0 | 1000000.0 | 0.000 %  |
  | 3         | 500000.0  | 500000.0  | 0.000 %  |
  | 4         | 400000.0  | 400000.0  | 0.000 %  |
  | 7         | 250000.0  | 250000.0  | 0.000 %  |
  | 9         | 200000.0  | 200000.0  | 0.000 %  |
  | 16        | 117647.1  | 115200.0  | -2.124 % |
  | 34        | 57142.9   | 57600.0   | 0.794 %  |
  | 103       | 19230.8   | 19200.0   | -0.160 % |
  | 207       | 9615.4    | 9600.0    | -0.160 % |

### Return Values
  - 1이면 성공, 0이면 실패를 의미합니다.

### Example
  Windows 환경에서 COM3 포트와 통신 속도 1Mbps로 초기화하는 예입니다.
```
#define DEFAULT_PORTNUM 3   // COM3
#define DEFAULT_BAUDNUM 1  //  1Mbps

int result;
result =  dxl_initialize( DEFAULT_PORTNUM, DEFAULT_BAUDNUM );

if( result == 1)
{
    // Succeed to open USB2Dynamixel
}
else if( result == 0 )
{
    // Failed to open USB2Dynamixel
}
```

## dxl_terminate

제어기의 통신장치를 종료합니다.
```
void dxl_terminate();
```

### Parameters

- 없음

### Return Values

- 없음

#### Example
```
dxl_terminate();
```

## dxl_set_txpacket_id

Instruction packet에 ID를 입력합니다.
```
void dxl_set_txpacket_id(
    int id
);
```

### Parameters

-  id

Instruction packet을 전달할 Dynamixel ID입니다.
BORADCAST_ID(254)를 사용하면 모든 Dynamixel이 Instruction packet을 전달 받습니다.

#### Return Values

- 없음

#### Example

```
dxl_set_txpacket_id( 1 );
```

## dxl_set_txpacket_instruction

Instruction packet에 명령 코드를 입력합니다.
```
void dxl_set_txpacket_instruction(
    int instruction
);
```

### Parameters

- instruction
 명령 코드입니다. 다음 중 하나의 값을 가질 수 있습니다.

  | 값    | 명칭            | 내용                                                     |
  | ---- | --------------- | -------------------------------------------------------- |
  | 1    | INST_PING       | 수행 내용 없음. 제어기가 Status Packet을 받고자할 경우 사용 |
  | 2    | INST_READ       | 다이나믹셀의 데이터를 읽는 명령                            |
  | 3    | INST_WRITE      | 다이나믹셀의 데이터를 쓰는 명령                            |
  | 4    | INST_REG_WRITE  | INST_WRITE와 내용은 유사하나, 대기상태로 있다가 ACTION 명령이 도착해야 수행됨 |
  | 5    | INST_ACTION     | REG WRITE 로 등록된 동작을 시작하라는 명령                         |
  | 6    | INST_RESET      | 다이나믹셀의 상태를 공장 출하 상태로 복귀시키는 명령                 |
  | 131  | INST_SYNC_WRITE | 한번에 여러 개의 다이나믹셀을 동시에 제어하고자 할때 사용되는 명령    |

#### Return Values

- 없음

#### Example

```
dxl_set_txpacket_instruction( INST_WRITE );
```

## dxl_set_txpacket_parameter

Instruction packet에 파라미터를 입력합니다.
```
void dxl_set_txpacket_instruction(
    int index,
    int value
);
```

### Parameters

-  index
파라미터 번호입니다. 0 ~ MAXNUM_TXPARAM-1 범위를 가집니다.

-  value
파라미터 값입니다. 0~255 범위를 가집니다.

### Return Values
- 없음

### Example

```
dxl_set_txpacket_parameter( 0, 10 );
dxl_set_txpacket_parameter( 1, 20 );
dxl_set_txpacket_parameter( 2, 30 );
```

## dxl_set_txpacket_length

Instruction packet에 길이를 입력합니다.
```
void dxl_set_txpacket_length(
    int length
);
```

### Parameters

-  length
Instruction packet의 길이입니다.

### Return Values

- 없음

### Example

```
dxl_set_txpacket_length( 10 );
```

## dxl_get_rxpacket_length

Status packet의 길이를 확인합니다.
```
int dxl_get_rxpacket_length( );
```

### Parameters

-  없음

### Return Values

- Status packet의 Length 값

### Example
```
length = dxl_get_rxpacket_length( );
```

## dxl_get_rxpacket_parameter

Status packet의 파라미터를 확인합니다.
```
int dxl_get_rxpacket_parameter(
   int index
);
```

#### Parameters

-  index
확인할 파라미터 번호

### Return Values
- Status packet의 index번째 파라미터 값

#### Example

```
Parameter0 = dxl_get_rxpacket_parameter( 0 );
Parameter1 = dxl_get_rxpacket_parameter( 1 );
Parameter2 = dxl_get_rxpacket_parameter( 2 );
Parameter3 = dxl_get_rxpacket_parameter( 3 );
```

## dxl_get_rxpacket_error

Status packet에 포함되어 있는 Error를 확인합니다.
```
 int dxl_get_rxpacket_error(
      int errbit
 );
```

### Parameters

- errbit  
Error 발생 유무를 확인할 Bit flag입니다. 다음 중 하나의 값을 가집니다.


| 값    | 명칭                 | 내용                                       |
| ---- | ------------------ | ---------------------------------------- |
| 1    | ERRBIT_VOLTAGE     | Error인가된 전압이 Control Table에 설정된 동작 전압범위를 벗어났을 경우 1로 설정됨 |
| 2    | ERRBIT_ANGLE       | Goal Position이 CW Angle Limit ~ CCW Angle Limit 범위 밖의 값으로 Writing 되었을때 1로 설정됨 |
| 4    | ERRBIT_OVERHEAT    | Dynamixel 내부 온도가 Control Table에 설정된 동작 온도 범위를 벗어났을 때 1로 설정됨 |
| 8    | ERRBIT_RANGE       | 사용범위를 벗어난 명령일 경우 1로 설정됨                  |
| 16   | ERRBIT_CHECKSUM    | 전송된 Instruction Packet의 Checksum이 맞지 않을 때 1로 설정됨 |
| 32   | ERRBIT_OVERLOAD    | 설정된 Torque로 현재의 하중을 제어할 수 없을 때 1로 설정됨    |
| 64   | ERRBIT_INSTRUCTION | 정의되지 않은 Instruction이 전송된 경우,또는 reg_write명령없이 action명령이 전달된 경우 1로 설정됨 |

### Return Values

- 1이면 Error 발생, 0이면 이상 없음입니다.

### Example
```
if( dxl_get_rxpacket_error(ERRBIT_VOLTAGE) == 1 )
{
  // Input voltage error occurred
}
if( dxl_get_rxpacket_error(ERRBIT_ANGLE ) == 1 )
{
  // Angle limit error occurred
}
if( dxl_get_rxpacket_error(ERRBIT_OVERHEAT) == 1 )
{
   // Overheating error occurred
}
if( dxl_get_rxpacket_error(ERRBIT_RANGE) == 1 )
{
   // Range error occurred
}
if( dxl_get_rxpacket_error(ERRBIT_CHECKSUM) == 1 )
{
    // Checksum error occurred
 }
if( dxl_get_rxpacket_error(ERRBIT_OVERLOAD) == 1 )
{
   // Overload error occurred
}
if( dxl_get_rxpacket_error(ERRBIT_INSTRUCTION) == 1 )
{
   // Instruction error occurred
}
```

## dxl_tx_packet

Instruction packet을 Dynamixel에 전달합니다.
```
void dxl_tx_packet( );
```

### Parameters

- 없음

### Return Values

- 없음

### Example

```
dxl_tx_packet( );
```

## dxl_rx_packet

Driver 버퍼로부터 Status packet을 추출합니다. 이 함수 호출 뒤에는 항상 [dxl_get_result]를 호출하여 결과를 확인해야 합니다.

```
void dxl_rx_packet( );
```

### Parameters

- 없음

#### Return Values

- 없음

### Example

```
dxl_rx_packet( );
result = dxl_get_result( );
```

## dxl_txrx_packet

[dxl_tx_packet]과 [dxl_rx_packet]을 일괄 처리합니다. 이 함수 호출 뒤에는 항상 [dxl_get_result]를 호출하여 결과를 확인해야 합니다.

```
void dxl_txrx_packet( );
```

### Parameters

- 없음

### Return Values

- 없음

### Example

```
dxl_txrx_packet( );
result = dxl_get_result( );
```

## dxl_get_result

Packet 통신 결과를 확인할 수 있습니다.

```
int dxl_get_result( );
```

### Parameters

- 없음

### Return Values

- 통신 결과값

| 값              | 의미                              |
| -------------- | ------------------------------- |
| COMM_TXSUCCESS | Instruction packet 전송 성공        |
| COMM_RXSUCCESS | Status packet 수신 성공             |
| COMM_TXFAIL    | 오류로 인해 Instruction packet 전송 실패 |
| COMM_RXFAIL    | 오류로 인해 Status packet 수신 실패      |
| COMM_TXERROR   | Instruction packet에 문제가 있음      |
| COMM_RXWAITING | Status packet이 아직 도착하지 않음       |
| COMM_RXTIMEOUT | 해당 다이나믹셀이 응답하지 않음               |
| COMM_RXCORRUPT | Status packet에 문제가 있음           |

### Example

```
result = dxl_get_result( );
if( result == COMM_TXSUCCESS )
{
}
else if( result == COMM_RXSUCCESS )
{
}
else if( result == COMM_TXFAIL )
{
}
else if( result == COMM_RXFAIL)
{
}
else if( result == COMM_TXERROR )
{
}
else if( result == COMM_RXWAITING )
{
}
```

## dxl_ping

선택한 ID를 가진 Dynamixel이 존재하는지 확인할 수 있습니다. 결과는 [dxl_get_result]로 확인합니다.

```
void dxl_ping(
   int id
);
```

### Parameters

-  id
연결을 확인할 Dynamixel ID

### Return Values

- 없음

### Example
```
dxl_ping( 2 );
if( dxl_get_result( ) == COMM_RXSUCCESS )
{
      // Succeed to verify ID 2
}
```

## dxl_write_byte

Dynamixel에 1byte의 정보를 쓸 수 있습니다. 통신 결과는 [dxl_get_result]로 확인할 수 있습니다.

```
void dxl_write_byte(
   int id,
   int address,
   int value
);
```

### Parameters

- id
정보를 쓸 Dynamixel ID

- address
정보의 주소 값

- value
Dynamixel에 쓸 정보의 값

### Return Values

- 없음

#### Example

```
dxl_write_byte( 2, 19, 1 );
if( dxl_get_result( ) == COMM_RXSUCCESS )
{
     // Succeed to write
}
```

## dxl_write_word

Dynamixel에 2byte의 정보를 쓸 수 있습니다. 통신 결과는 [dxl_get_result]로 확인할 수 있습니다.

```
void dxl_write_word(
   int id,
   int address,
   int value
);
```

### Parameters

- id
정보를 쓸 Dynamixel ID

- address
정보의 주소 값

- value
Dynamixel에 쓸 정보의 값

### Return Values

- 없음

### Example

```

dxl_write_word( 2, 30, 512 );
if( dxl_get_result( ) == COMM_RXSUCCESS )
{
     // Succeed to write
}
```

## dxl_read_byte

Dynamixel에서 1byte의 정보를 읽을 수 있습니다.  통신 결과  값은 [dxl_get_result]로 확인할 수 있습니다.

```
int dxl_read_byte(
   int id,
   int address
);
```

### Parameters

- id
정보를 읽을 Dynamixel ID

- address
정보의 주소 값

### Return Values

- 읽어온 데이터 값

### Example

```
data = dxl_read_byte( 2, 36 );
if( dxl_get_result( ) == COMM_RXSUCCESS )
{
     // data 사용
}
```

## dxl_read_word

Dynamixel 에서 2byte의 정보를 읽을 수 있습니다.  통신 결과 값은 [dxl_get_result]로 확인할 수 있습니다.

```
int dxl_read_word(
   int id,
   int address
);
```

### Parameters

- id
정보를 읽을 Dynamixel ID
- address
정보의 주소 값

### Return Values

- 읽어온 데이터 값

### Example
```
data = dxl_read_word( 2, 36 );
if( dxl_get_result( ) == COMM_RXSUCCESS )
{
     // data 사용
}
```

## dxl_makeword

2 byte를 WORD형 데이터로 변환해줍니다.

```
int dxl_makeword(
   int lowbyte,
   int highbyte
);
```

### Parameters

- lowbyte
WORD형으로 만들 Lower byte
- highbyte
WORD형으로 만들 Higher byte

### Return Values

- Lower byte와 Higher byte로 만든 WORD형 데이터

### Example

```
word = dxl_makeword( lowbyte, highbyte );
```

## dxl_get_highbyte

WORD형 데이터로부터 Higher byte를 추출합니다.

```
int dxl_get_highbyte(
   int word
);
```

### Parameters

- word
Higher byte를 추출할 WORD형 데이터

### Return Values

- WORD형 데이터로부터 추출된 Higher byte

### Example

```
highbyte = dxl_get_highbyte( word );
```

## dxl_get_lowbyte

WORD형 데이터로부터 Lower byte를 추출합니다.

```
int dxl_get_lowbyte(
   int word
);
```

### Parameters

-  word
Lower byte를 추출할 WORD형 데이터

### Return Values

- WORD형 데이터로부터 추출된 Lower byte

### Example

```
lowbyte = dxl_get_lowbyte( word );
```



[dxl_initialize]: ??
[dxl_terminate]: ??
[dxl_set_txpacket_id]: ??
[dxl_get_rxpacket_error]: ??
[dxl_set_txpacket_instruction]: ??
[dxl_get_rxpacket_length]: ??
[dxl_set_txpacket_parameter]: ??
[dxl_get_rxpacket_parameter]: ??
[dxl_set_txpacket_length]: ??
[dxl_makeword]: ??
[dxl_get_lowbyte]: ??
[dxl_get_highbyte]: ??
[dxl_tx_packet]: ??
[dxl_rx_packet]: ??
[dxl_txrx_packet]: ??
[dxl_get_result]: ??
[dxl_ping]: ??
[dxl_read_byte]: ??
[dxl_write_byte]: ??
[dxl_read_word]: ??
[dxl_write_word]: ??
[dxl_makeword]: ??
[dxl_get_highbyte]: ??
[dxl_get_lowbyte]: ??
