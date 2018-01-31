# 플랫폼 포팅

Dynamixel SDK는 사용자가 직접 다양한 플랫폼에 포팅할 수 있도록 소스를 제공하고 있습니다.

`download ` [DXL_SDK_Porting_ v1_01.zip](http://support.robotis.com/ko/baggage_files/dynamixel_sdk/dxl_sdk_porting_v1_01.zip)

### 소스 구조

- 플랫폼 독립적인 소스
 플랫폼 독립적인 소스는 모든 C언어 컴파일러에서 컴파일 될 수 있도록 H/W 의존적인 루틴이 없이 표준 C로 작성되어 있습니다. 이 소스에는 오직 Instruction packet을 만들고 Status packet을 분석하는 프로토콜 관련 내용만 구현되어있습니다. 사용자는 특별한 경우가 아니라면 이 소스의 내용을 수정할 필요가 없습니다.

  - 관련 소스 파일: dynamixel.h, dynamixel.c
  - Build시 필요한 파일: dxl_hal.h, dxl_hal.c

- 플랫폼 의존적인 소스
플랫폼 의존적인 소스에는 제어기에서 실제로 작동할 수 있도록  H/W 의존적인 루틴이 포함되어야 합니다. 만약, 지원하지 않는 다른 플랫폼에서 Dynamixel SDK를 사용하려면 이 소스를 수정해야 합니다.

  - 관련 소스 파일: dxl_hal.h, dxl_hal.c

### 포팅방법

포팅을 하려면 플랫폼에 맞게 아래의 함수를 구현해야 합니다.

- [dxl_hal_open]
- [dxl_hal_close]
- [dxl_hal_clear]
- [dxl_hal_tx]
- [dxl_hal_rx]
- [dxl_hal_set_timeout]
- [dxl_hal_timeout]

## dxl_hal_open

실제로 제어기의 통신장치를 초기화시켜서 사용 가능하도록 만들어주는 루틴을 구현합니다.
dxl_initialize는 이 함수를 통해 제어기의 통신장치를 활성화시킵니다.

```
int dxl_hal_open(
     int devIndex ,
     float baudrate
  )
```

### Parameters

- devIndex  
현재 연결된 통신장치의 번호 입니다.(플랫폼에 따라 다를수 있습니다.)
예를 들어 Windows의 경우 COM 포트로 장치를 구분합니다.
- baudrate
실제 baudrate 값 입니다. 예) 57600

### Return Values
- 함수는 성공하면 1, 실패하면 0을 반환합니다.

## dxl_hal_close

제어기의 통신장치를 종료시켜서 다른 응용 프로그램이 사용할 수 있도록 만들어주는 루틴을 구현합니다.
dxl_terminate는 이 함수를 통해 제어기의 통신장치를 종료시킵니다.

```
void dxl_hal_close()
```

### Parameters

- 없음

### Return Values

- 없음

## dxl_hal_clear

제어기 통신장치의 수신 버퍼를 모두 비워주는 루틴을 구현합니다.

```
void dxl_hal_clear()
```

### Parameters

- 없음

### Return Values

- 없음

## dxl_hal_rx

제어기 통신장치의 수신 버퍼로부터 Packet을 꺼내오는 루틴을 구현합니다.

[dxl_rx_packet]은 이 함수를 사용해서 수신된 데이터를 꺼내온 후 Status packet을 만들어냅니다.

### Parameters

- pPacket
꺼내온 데이터를 저장할 배열의 포인터

- numPacket
꺼내올 데이터의 갯수

### Return Values

- 실제로 꺼내온 데이터의 갯수를 반환합니다.

## dxl_hal_tx

제어기의 통신장치를 통해 Packet을 송신하는 루틴을 구현합니다.
[dxl_tx_packet]은 Instruction packet을 이 함수를 통해서  다이나믹셀로 전송합니다.

```
int dxl_hal_tx(
    unsigned char *pPacket,
    int numPacket
)
```

### Parameters

- pPacket
전송할 데이터가 들어있는 배열의 포인터

- numPacket
전송할 데이터의 갯수

### Return Values

- 실제로 전송한 데이터의 개수를 반환합니다.

## dxl_hal_set_timeout

다이나믹셀로부터 응답을 기다리기 위해서는 제한된 시간이 지나면 Timeout을 알 수 있는 메커니즘이 필요합니다. 이 함수는 마치 Stopwatch처럼 응답을 기다리는 시작 시간을 설정하는 역할을 합니다. 인자로 기다릴 데이터의 Byte수를 입력 받아서 실제 Baud rate에 기반하여 기다릴 시간을 계산한 뒤 시작 시간을 설정합니다.

```
void dxl_hal_set_timeout (
     int NumRcvByte
)
```

### Parameters

- NumRcvByte
기다릴 데이터의 Byte수

### Return Values

- 없음

## dxl_hal_timeout

이 함수는 dxl_hal_set_timeout으로 설정된 시작 시간을 기반으로 기다릴 시간이 지났는지 확인합니다.

```
int dxl_hal_timeout()
```

### Parameters

- 없음

### Return Values

- 반환 값이 1이면 Timeout이 발생한 것이고, 0이면 그렇지 않은 것입니다.


[dxl_hal_open]: ??
[dxl_hal_close]: ??
[dxl_hal_clear]: ??
[dxl_hal_tx]: ??
[dxl_hal_rx]: ??
[dxl_hal_set_timeout]: ??
[dxl_hal_timeout]: ??
[dxl_rx_packet]: ??
[dxl_tx_packet]: ??
