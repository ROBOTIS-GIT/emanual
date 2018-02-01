# Dynamixel SDK

Dynamixel SDK는 다이나믹셀을 제어하는 S/W 개발을 위한 표준 프로그래밍 라이브러리입니다.
Dynamixel SDK의 특징은 다음과 같습니다.
C언어로 작성되어 플랫폼별 이식성이 뛰어납니다.
플랫폼 독립적인 소스와 의존적인 소스로 작성되어 플랫폼 포팅이 쉽습니다.
인터페이스를 표준화시켜서 제어기가 달라져도 개발된 S/W를 재사용할 수 있습니다.

## API Reference

Reference는 C언어 호출 방식을 기반으로 설명을 합니다.

### Device Control Method

- 제어기 통신장치를 제어하는 함수
	- dxl_initialize
	- dxl_terminate

### Set/Get Packet Method

- 패킷을 만들고 내용을 볼 수 있는  함수
	- dxl_set_txpacket_id
	- dxl_get_rxpacket_error
	- dxl_set_txpacket_instruction
	- dxl_get_rxpacket_length
	- dxl_set_txpacket_parameter
	- dxl_get_rxpacket_parameter
	- dxl_set_txpacket_length
	- dxl_makeword
	- dxl_get_lowbyte
	- dxl_get_highbyte

### Packet Communication Method

- 패킷을 전송하고 받는 함수
	- dxl_tx_packet
	- dxl_rx_packet
	- dxl_txrx_packet
	- dxl_get_result

### High Communication Method

- 자주 만들어 쓰는 패킷을 함수화 하여 사용하기 편리하게 만든 함수
	- dxl_ping
	- dxl_read_byte
	- dxl_write_byte
	- dxl_read_word
	- dxl_write_word

### Utility Method

- 기타 유용하게 쓰이는 함수
	- dxl_makeword
	- dxl_get_highbyte
	- dxl_get_lowbyte

## 플랫폼 포팅

Dynamixel SDK는 사용자가 직접 다양한 플랫폼에 포팅할 수 있도록 소스를 제공하고 있습니다.

`download` [DXL_SDK_Porting_ v1_01.zip](http://support.robotis.com/ko/baggage_files/dynamixel_sdk/dxl_sdk_porting_v1_01.zip)

### 소스 구조

- 플랫폼 독립적인 소스

  플랫폼 독립적인 소스는 모든 C언어 컴파일러에서 컴파일 될 수 있도록 H/W 의존적인 루틴이 없이 표준 C로 작성되어 있습니다. 이 소스에는 오직 Instruction packet을 만들고 Status packet을 분석하는 프로토콜 관련 내용만 구현되어있습니다. 사용자는 특별한 경우가 아니라면 이 소스의 내용을 수정할 필요가 없습니다.

  - 관련 소스 파일: dynamixel.h, dynamixel.c
  - Build시 필요한 파일: dxl_hal.h, dxl_hal.c

- 플랫폼 의존적인 소스
  플랫폼 의존적인 소스에는 제어기에서 실제로 작동할 수 있도록  H/W 의존적인 루틴이 포함되어야 합니다. 만약, 지원하지 않는 다른 플랫폼에서 Dynamixel SDK를 사용하려면 이 소스를 수정해야 합니다.

  - 관련 소스 파일: dxl_hal.h, dxl_hal.c

## 포팅방법

포팅을 하려면 플랫폼에 맞게 아래의 함수를 구현해야 합니다.

- dxl_hal_open
- dxl_hal_close
- dxl_hal_clear
- dxl_hal_tx
- dxl_hal_rx
- dxl_hal_set_timeout
- dxl_hal_timeout
