# Visual C++

Visual C++용 예제입니다.

본 예제들은  Visual Studio 2005에서 테스트 되었습니다.

## 환경 설정

예제를 실행하기 위해서는 C++에서 환경 설정을 해주어야 합니다.

#### 경로 등록하기

Visual Studio에 Zigbee SDK의 위치를 등록합니다.

1. 메뉴에서 도구->옵션을 선택합니다.
![img](/assets/images/sw/sdk/c++_config.png)

2. 프로젝트 및 솔루션 -> VC++ 디렉터리를 클릭 합니다.
![img](/assets/images/sw/sdk/c++_config1.png)

3. 다음 파일의 디렉터리 표시 부분을 포함 파일(include) 로 바꾼 후 2번 표시가 있는 부분을 클릭하여,
ZigbeeSDK가 설치 된 폴더를 추가 시킵니다.

    > (예, C:\ZigbeeSDK\import)

    ![img](/assets/images/sw/sdk/c++_config.png)

4. 다음 파일의 디렉터리 표시 부분을 라이브러리 파일(library) 로 바꾼 후 2번 표시가 있는 부분을 클릭하여,ZigbeeSDK가 설치 된 폴더를 추가 시킵니다.

    > (예, C:\ZigbeeSDK\import)

    ![img](/assets/images/sw/sdk/c++_config1.png)

#### Zigbee SDK 사용하기

STEP1)  Header 파일을 포함시킵니다.
소스 파일에 #include "zigbee.h"을 추가합니다.

STEP2) Library 파일을 포함시킵니다.
소스 파일에 #pragma comment(lib, "zigbee.lib")를 추가하거나, 프로젝트 속성에서 Link 탭의 Input에서 Module에 zigbee.lib를 추가합니다

STEP3) 함수를 사용합니다.

소스 상에서 필요한 함수를 호출하면 됩니다. 각 함수의 사용법은 [API Reference]를 참고하시기 바랍니다.

![img](/assets/images/sw/sdk/c++_config2.png)

## Send/Recieve 예제

### 준비

사용하는 Zigbee 모듈은 서로 1:1통신으로 설정합니다.
제어기가 응답할 수 있도록 제어기 타입에 맞는 tsk파일을 다운로드 합니다.

`download` [CM100_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm100_echo.tsk)
`download`[CM5_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm5_echo.tsk)
`download`[CM510_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm510_echo.tsk)
`download`[CM700_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm700_echo.tsk)

### 소스

#### 초기화

```
초기화
// Open device
if( zgb_initialize(DEFAULT_PORTNUM) == 0 )
{
  printf( "Failed to open Zig2Serial!\n" );
}
else
{
  printf( "Succeed to open Zig2Serial!\n" );
}
```

위 소스는 초기화가 제대로 되었는지를 확인합니다.

초기화가 성공하였으면 1, 실패할경우엔 0이 반환 되므로 if문에는 실패했을 경우에 대한 소스가 들어가게 되고,else문 안에는 성공했을 경우의 소스가 들어가게 된빈다.

Zigbee API 함수중 [zgb_initialize]를 호출합니다.
DEFAULT_PORTNUM는 통신장치가 연결되어 있는 번호를 의미 합니다.
DEFAULT_PORTNUM 은 사용자의 시스템 상황에 맞게 설정해야 하며 COM3으로 기본 셋팅이 되어있습니다.

#### 종료

```
// Close device
zgb_terminate();
```

위 소스는 제어기 통신장치와 통신을 종료하는 소스입니다.
Zigbee API 함수중 [zgb_terminate] 를 호출합니다.

#### 패킷 보내기

```
if (zgb_tx_data(TxData) == 0)
{
  printf( "Failed to transmit\n" );
}
```

위 소스는 Zigbee 모듈이 제어기 쪽으로 패킷을 전달 하는 소스 입니다.
Zigbee API 함수중 [zgb_tx_data] 함수를 이용하여 패킷을 전달하고 전송 결과를 리턴 받는다.
리턴 값이 1이면 전송성공, 0이면 전송실패를 의미 합니다.
TxData는 사용자가 제어기에 전달하는 값을 의미합니다.

#### 패킷 받기

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
    Sleep(1);
}
```

위 소스는 Zigbee 모듈이 제어기로부터  패킷을 받는 소스입니다.
[zgb_rx_check] 함수를 이용하여 패킷이 수신되었는지를 체크를 합니다.
리턴 값이 1이면 수신성공, 0이면 수신실패를 의미 합니다.
패킷이 수신되면 (리턴값이 1이 되면) [zgb_rx_data] 함수를 이용해 RxData 변수에 전송받은 패킷을 저장합니다.

패킷을 수신받지 못하면 Sleep() 함수를 이용하여 1ms의 딜레이 시간을 준 후 TIMEOUT_TIME 시간 만큼 루프를 돌게 됩니다.

TIMEOUT_TIME 는 1000으로 초기셋팅이 되어 예제 소스에서는 1초의 시간동안 패킷이 도착하기를 기다리게 됩니다.

[API Reference]: ??
[zgb_initialize]: ??
[zgb_terminate]: ??
[zgb_tx_data]: ??
[zgb_rx_check]: ??
[zgb_rx_data]: ??
