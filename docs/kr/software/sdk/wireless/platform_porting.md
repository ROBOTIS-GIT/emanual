# 플랫폼 포팅

Zigbee SDK는 사용자가 직접 다양한 플랫폼에 포팅할 수 있도록 소스를 제공하고 있습니다.

`download` [ZIGBEE_SDK_Porting_v1_00.zip](http://support.robotis.com/ko/baggage_files/zigbee_sdk/zigbee_sdk_porting_v1_00.zip)

### 소스 구조

- 플랫폼 독립적인 소스
 플랫폼 독립적인 소스는 모든 C언어 컴파일러에서 컴파일 될 수 있도록 H/W 의존적인 루틴이 없이 표준 C로 작성되어 있습니다. 이 소스에는 오직 패킷을 만들고 받은 패킷을 분석하는 프로토콜 관련 내용만 구현되어있습니다. 사용자는 특별한 경우가 아니라면 이 소스의 내용을 수정할 필요가 없습니다.
  -  관련 소스 파일: zigbee.h, zigbee.c
  - Build시 필요한 파일: zgb_hal.h, zgb_hal.c

- 플랫폼 의존적인 소스
 플랫폼 의존적인 소스에는 제어기에서 실제로 작동할 수 있도록  H/W 의존적인 루틴이 포함되어야 합니다. 만약, 지원하지 않는 다른 플랫폼에서 Zigbee SDK를 사용하려면 이 소스를 수정해야 합니다.
  - 관련 소스 파일: zgb_hal.h, zgb_hal.c

### 포팅방법

포팅을 하려면 플랫폼에 맞게 아래의 함수를 구현해야 합니다.

- [zgb_hal_open]
- [zgb_hal_close]
- [zgb_hal_tx]
- [zgb_hal_rx]

## zgb_hal_open

실제로 제어기의 통신장치를 초기화시켜서 사용 가능하도록 만들어주는 루틴을 구현합니다.
[zgb_initialize]는 zgb_hal_open을 통해 제어기의 통신장치를 활성화시킵니다.

```
 int zgb_hal_open(
     int devIndex ,
     float baudrate
  )
```

### Parameters

- devIndex  

현재 연결된 통신장치의 번호 입니다.(플랫폼에 따라 다를수 있습니다.)

예를 들어 Windows의 경우 COM 포트로 장치를 구분합니다.

- baudrate

실제 baudrate 값 입니다.

### Return Values

- 함수는 성공하면 1, 실패하면 0을 반환합니다.

## zgb_hal_close

제어기의 통신장치를 종료시켜서 다른 응용 프로그램이 사용할 수 있도록 만들어주는 루틴을 구현합니다.
zgb_terminate는 이 함수를 통해 제어기의 통신장치를 종료시킵니다.

```
void zgb_hal_close();
```

### Parameters

- 없음

### Return Values

- 없음

## zgb_hal_rx

제어기 통신장치의 수신 버퍼로부터 Packet을 꺼내오는 루틴을 구현합니다.

```
int zgb_hal_rx(
unsigned char *pPacket ,
int numPacket
 );
```

### Parameters

- pPacket
꺼내온 데이터를 저장할 배열의 포인터

- numPacket
꺼내올 데이터의 갯수

#### Return Values

- 실제로 꺼내온 데이터의 갯수를 반환합니다.

## zgb_hal_tx

제어기의 통신장치를 통해 Packet을 송신하는 루틴을 구현합니다.

```
int zgb_hal_tx(
unsigned char *pPacket ,
int numPacket
);
```

### Parameters

- pPacket
전송할 데이터가 들어있는 배열의 포인터

- numPacket
전송할 데이터의 갯수

### Return Values

- 실제로 전송한 데이터의 개수를 반환합니다.

[zgb_hal_open]: ??
[zgb_hal_close]: ??
[zgb_hal_tx]: ??
[zgb_hal_rx]: ??
[zgb_initialize]: ??
