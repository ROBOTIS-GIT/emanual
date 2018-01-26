# gcc

Linux gcc 를 이용한 예제입니다.

## 환경 설정

#### Zigbee API 사용하기

STEP1)  Header 파일 지정
소스 파일에 #include <zigbee.h>을 추가합니다.

STEP2) 함수호출
소스 상에서 필요한 함수를 호출하면 됩니다. 각 함수의 사용법은 [API Reference]를 참고하시기 바랍니다.

## Send/Receive Example

Zigbee의 Send / Receive 예제입니다.  

### 준비

USB2Dynamixel에 Zig2Serial과 ZIG-100이 연결 되어 있어야 합니다.
또한, Zig2Serial에 연결된  ZIG-100 통신 모듈과 통신할 수 있는 제어기, 혹은 다른 통신 장치가 있어야 합니다.

### 소스

#### 초기화

```
if( zgb_initialize(DEFAULT_DEVICEINDEX) == 0 )
{
  printf( "Failed to open Zig2Serial!\n" );
  printf( "Press any key to terminate...\n" );
  getchar();
  return 0;
}
else
  printf( "Succeed to open Zig2Serial!\n" );
```

위 소스는 초기화가 제대로 되었는지를 확인합니다.
초기화가 성공하였으면 1, 실패할경우엔 0이 반환 되므로 if문에는 실패했을 경우에 대한 소스가 들어가게 되고, else문 안에는 성공했을 경우의 소스가 들어가게 됩니다.

zigbee API 중 [zgb_initialize] 함수를 호출 합니다.
DEFAULT_DEVICEINDEX는 리눅스 통신장치 Device Index입니다. 기본값으로 1을 사용합니다.
DEFAULT_DEVICEINDEX는 사용자의 상황에 맞게 설정하셔야 합니다.
Baud Rate는 57600으로 고정되어 있습니다.

#### 종료

```
// Close device
zgb_terminate();
```

위 소스는 종료하는 소스입니다.
zigbee API 중 [zgb_teminate] 함수를 호출하여 연결을 종료 시킵니다.

#### 데이터 전송하기

```
// Wait user's input
printf( "Input number to transmit: " );
if(scanf("%d", &TxData));
// Transmit data
if(zgb_tx_data(TxData) == 0)
printf( "Failed to transmit\n" );
```

위 소스는 zigbee를 통해 사용자가 입력한 값을 전송하는 소스입니다.
zigbee API 중 [zgb_tx_data] 함수를 호출 합니다.

#### 데이터 수신하기

```
for( i=0; i<TIMEOUT_TIME; i++)
{
  // Verify data recieved
  if(zgb_rx_check() == 1)
  {
    // Get data verified
    RxData = zgb_rx_data();
    printf( "Recieved: %d\n", RxData );
    break;
  }
  sleep(1);
}
```

위 소스는 TIMEOUT 시간 전 까지 데이터를 받아오는 소스입니다.
zigbee API 중 [zgb_rx_check] 와 [zgb_rx_data]함수를 호출합니다.

[API Reference]: ??
[zgb_initialize]: ??
[zgb_teminate]: ??
[zgb_rx_check]: ??
[zgb_rx_data]: ??
