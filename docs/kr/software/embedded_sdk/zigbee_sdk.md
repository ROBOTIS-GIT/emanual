---
layout: archive
lang: kr
ref: zigbee_sdk
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/embedded_sdk/zigbee_sdk/
sidebar:
  title: ZIGBEE SDk
  nav: "zigbee_sdk"
---

# [개요](#개요)

Zigbee SDK는 RoboPlus Task 코드와 통신하는 S/W 개발을 위한 표준 프로그래밍 라이브러리입니다.
Zigbee SDK의 특징은 다음과 같습니다.
- C언어로 작성되어 플랫폼별 이식성이 뛰어납니다.
- 플랫폼 독립적인 소스와 의존적인 소스로 작성되어 플랫폼 포팅이 쉽습니다.
- 인터페이스를 표준화시켜서 제어기가 달라져도 개발된 S/W를 재사용할 수 있습니다.
- 통신 모듈과 독립적으로 사용 가능한 SDK입니다.
- ZigBee 모듈뿐만 아니라 Bluetooth 모듈에서도 사용할 수 있습니다.

# [API Reference](#api-reference)

Reference는 C언어 호출 방식을 기반으로 설명을 합니다.

## [Device Control Method](#device-control-method)
제어기의 통신장치를 제어하는 함수

### [zgb_initialize](#zgb-initialize)

제어기의 통신장치를 초기화 하여 준비 상태로 만듭니다.

```c
int zgb_initialize(
      int devIndex ,
);
```

#### Parameters

- devIndex : 현재 연결된 통신장치의 번호 입니다.(플랫폼에 따라 다를수 있습니다.) 예를 들어 Windows의 경우 COM 포트로 장치를 구분합니다.

#### Return Values
- 1이면 성공, 0이면 실패를 의미합니다.

#### Example

Windows 환경에서 COM3 포트로 초기화하는 예입니다.

```c
#define DEFAULT_PORTNUM 3   // COM3

int result;
result =  dxl_initialize( DEFAULT_PORTNUM);

if( result == 1)
{
    // Succeed to open Zig2Serial
}
else if( result == 0 )
{
  // Failed to open Zig2Serial
}
```

### [zgb_terminate](#zgb-terminate)

제어기의 통신장치 사용을 끝냅니다.

```c
void zgb_terminate();
```

#### Parameters

- 없음

#### Return Values

- 없음

#### Example

```c
zgb_terminate();
```

## [Communication Method](#communication-method)
패킷을 전송하고 받는 함수

### [zgb_tx_data](#zgb-tx-data)
제어기의 통신장치를 초기화 하여 준비 상태로 만듭니다.

```c
int zgb_tx_data(
      int data ,
);
```

#### Parameters

- data : 전송할 데이터의 값. [RC-100]으로 조종하는 효과를 낼 경우 미리 선언된 버튼 값을 사용할 수 있습니다.

| 값    | 명칭       | 내용              |
|:---:|:---:|:---:|
| 1    | RC100_BTN_U | U 버튼을 누른키 값 |
| 2    | RC100_BTN_D | D 버튼을 누른키 값 |
| 4    | RC100_BTN_L | L 버튼을 누른키 값 |
| 8    | RC100_BTN_R | R 버튼을 누른키 값 |
| 16   | RC100_BTN_1 | 1 버튼을 누른키 값 |
| 32   | RC100_BTN_2 | 2 버튼을 누른키 값 |
| 64   | RC100_BTN_3 | 3 버튼을 누른키 값 |
| 128  | RC100_BTN_4 | 4 버튼을 누른키 값 |
| 256  | RC100_BTN_5 | 5 버튼을 누른키 값 |
| 512  | RC100_BTN_6 | 6 버튼을 누른키 값 |

#### Return Values

- 1이면 전송성공, 0이면 전송실패를 의미합니다.

#### Example

```c
int TxData;
int result
TxData = 1;

result = zgb_tx_data(TxData);

if( result == 0)
{
   // Failed to transmit
}

else if( result ==1)
{
   // Succeed to transmit
}
```

### [zgb_rx_check](#zgb-rx-check)
제어기의 통신장치에 데이터가 도착했는지 확인하는 함수 입니다.

```c
int zgb_rx_check();
```

#### Parameters

- 없음

#### Return Values

- 1이면 수신된 데이터가 있음이고 , 0이면 수신된 데이터가 없음을 의미합니다.

#### Example

```c
int resut;
result = zgb_rx_check();
if( result == 1 )
{
  // Succeed to data recieved
 }
else if( result == 0 )
{
   // Failed to data recieved
 }
```

### [zgb_rx_data](#zgb-rx-data)
제어기의 통신장치로 부터 데이터를 수신 받는 함수 입니다. [zgb_rx_check]로 데이터의 수신여부를 먼저 확인해야 최신 데이터를 받을 수 있습니다.

```c
int zgb_rxdata( );
```

#### Parameters

- 없음

#### Return Values

- 가장 최근에 수신 받은 데이터의 값. [RC-100]으로부터 버튼 값을 수신하려면 미리 선언된 버튼 값을 사용할 수 있습니다.

| 값    | 명칭        | 내용              |
| ---- | ----------- | ----------------- |
| 1    | RC100_BTN_U | U 버튼을 누른키 값 |
| 2    | RC100_BTN_D | D 버튼을 누른키 값 |
| 4    | RC100_BTN_L | L 버튼을 누른키 값 |
| 8    | RC100_BTN_R | R 버튼을 누른키 값 |
| 16   | RC100_BTN_1 | 1 버튼을 누른키 값 |
| 32   | RC100_BTN_2 | 2 버튼을 누른키 값 |
| 64   | RC100_BTN_3 | 3 버튼을 누른키 값 |
| 128  | RC100_BTN_4 | 4 버튼을 누른키 값 |
| 256  | RC100_BTN_5 | 5 버튼을 누른키 값 |
| 512  | RC100_BTN_6 | 6 버튼을 누른키 값 |

#### Example

```c
int RxData;

if(zgb_rx_check() == 1)
{
  // Get data verified
  RxData = zgb_rx_data();
}
```

# [플랫폼 포팅](#플랫폼-포팅)

Zigbee SDK는 사용자가 직접 다양한 플랫폼에 포팅할 수 있도록 소스를 제공하고 있습니다.

- [Download ZIGBEE_SDK_Porting_v1_00.zip](http://support.robotis.com/ko/baggage_files/zigbee_sdk/zigbee_sdk_porting_v1_00.zip)

## 소스 구조

- 플랫폼 독립적인 소스
 플랫폼 독립적인 소스는 모든 C언어 컴파일러에서 컴파일 될 수 있도록 H/W 의존적인 루틴이 없이 표준 C로 작성되어 있습니다. 이 소스에는 오직 패킷을 만들고 받은 패킷을 분석하는 프로토콜 관련 내용만 구현되어있습니다. 사용자는 특별한 경우가 아니라면 이 소스의 내용을 수정할 필요가 없습니다.
  -  관련 소스 파일: zigbee.h, zigbee.c
  - Build시 필요한 파일: zgb_hal.h, zgb_hal.c

- 플랫폼 의존적인 소스
 플랫폼 의존적인 소스에는 제어기에서 실제로 작동할 수 있도록  H/W 의존적인 루틴이 포함되어야 합니다. 만약, 지원하지 않는 다른 플랫폼에서 Zigbee SDK를 사용하려면 이 소스를 수정해야 합니다.
  - 관련 소스 파일: zgb_hal.h, zgb_hal.c

## 포팅방법

포팅을 하려면 플랫폼에 맞게 아래의 함수를 구현해야 합니다.

## [zgb_hal_open](#zgb-hal-open)

실제로 제어기의 통신장치를 초기화시켜서 사용 가능하도록 만들어주는 루틴을 구현합니다.
[zgb_initialize]는 zgb_hal_open을 통해 제어기의 통신장치를 활성화시킵니다.

```c
int zgb_hal_open(
  int devIndex ,
  float baudrate
)
```

### Parameters

- devIndex : 현재 연결된 통신장치의 번호 입니다.(플랫폼에 따라 다를수 있습니다.) 예를 들어 Windows의 경우 COM 포트로 장치를 구분합니다.
- baudrate : 실제 baudrate 값 입니다.

### Return Values

- 함수는 성공하면 1, 실패하면 0을 반환합니다.

## [zgb_hal_close](#zgb-hal-close)

제어기의 통신장치를 종료시켜서 다른 응용 프로그램이 사용할 수 있도록 만들어주는 루틴을 구현합니다.
zgb_terminate는 이 함수를 통해 제어기의 통신장치를 종료시킵니다.

```c
void zgb_hal_close();
```

### Parameters

- 없음

### Return Values

- 없음

## [zgb_hal_tx](#zgb-hal-tx)

제어기의 통신장치를 통해 Packet을 송신하는 루틴을 구현합니다.

```c
int zgb_hal_tx(
  unsigned char *pPacket ,
  int numPacket
);
```

### Parameters

- pPacket : 전송할 데이터가 들어있는 배열의 포인터
- numPacket : 전송할 데이터의 갯수

### Return Values

- 실제로 전송한 데이터의 개수를 반환합니다.

## [zgb_hal_rx](#zgb-hal-rx)

제어기 통신장치의 수신 버퍼로부터 Packet을 꺼내오는 루틴을 구현합니다.

```c
int zgb_hal_rx(
  unsigned char *pPacket ,
  int numPacket
 );
```

### Parameters

- pPacket : 꺼내온 데이터를 저장할 배열의 포인터
- numPacket : 꺼내올 데이터의 갯수

#### Return Values

- 실제로 꺼내온 데이터의 갯수를 반환합니다.


# [ZIG2Serial](#zig2serial)

## [윈도우즈용]

Windows용 Zigbee SDK를 다운로드 받을 수 있습니다.

- [Download ZIGBEE_SDK_Win32_ v1_02.zip](http://support.robotis.com/ko/baggage_files/zigbee_sdk/zigbee_sdk_win32_v1_02.zip)
- [Download ZIGBEE_SDK_Win64_ v1_02.zip](http://support.robotis.com/ko/baggage_files/zigbee_sdk/zigbee_sdk_win64_v1_02.zip)

### 시스템 요구 사항
- OS : Windows XP /Vista /7 (32/64bit)
- [Zig2Serial]이 반드시 필요
- DLL 로딩이 되지 않는 경우 : Microsoft Visual C++ 2005 재배포가능 패키지 설치 필요

### 폴더 구성

Zigbee SDK for Windows의 폴더 구조는 다음과 같습니다.

- /bin      : 윈도우용 DLL파일이 들어있습니다.
- /import   : 프로그래밍할때 필요한 파일들이 있습니다.
- /src      : DLL 소스가 들어있습니다.
- /example  : 사용자의 프로그래밍 환경에 맞게 Zigbee를  제어하는 예제들이 들어있는 곳입니다.

### 환경 변수 설정하기

Zigbee SDK로 개발된 프로그램이 실행하려면 zigbee.dll이 반드시 필요합니다.  
zigbee.dll은 Zigbee SDK안에 bin폴더에 들어있습니다.  
Windows의 환경 변수로 zigbee.dll의 위치를 등록하면 프로그램 실행시 dll이 필요하지 않게 됩니다.  
만약, 환경 변수로 dll 위치를 등록하지 않으려면 프로그램과 dll을 같이 배포해야 합니다.

1. 제어판 > 시스템 > 고급 탭에 들어가면 다음과 같이 환경 변수 버튼을 찾을 수 있습니다.

    ![img](/assets/images/sw/sdk/env1.png)

2. 시스템 변수에서 Path 항목을 찾고, 편집 버튼을 클릭합니다.

    ![img](/assets/images/sw/sdk/env2.png)

3. 예제 폴더 아래, bin 폴더를 기존 변수값 끝에 세미콜론과 함께 추가합니다. **기존 변수값이 변경되거나 삭제되지 않도록 주의하십시오.**  
  아래 예제는 DLL파일의 위치가 C:\Project\bin이라 가정하고 추가한 내용입니다.

    ![img](/assets/images/sw/sdk/env3.png)

## [리눅스용]

Linux용 Zigbee SDK를 다운로드 받을 수 있습니다.

- [Download ZIGBEE_SDK_LINUX_ v1_00.zip](http://support.robotis.com/ko/baggage_files/zigbee_sdk/zigbee_sdk_linux_v1_00.zip)

### 시스템 요구 사항
- OS : Linux Kernel 2.6.21 이상 권장
- [USB2DYNAMIXEL]과 [Zig2Serial]이 반드시 필요

### 폴더 구성

Zigbee SDK for Linux의 폴더 구조는 다음과 같습니다.

- /include : Zigbee SDK를 사용하기 위한 헤더 파일이 있습니다.
- /src     : Zigbee SDK 소스 파일이 있습니다.
- /lib     : 컴파일된 라이브러리 파일이 있습니다.
- /example : Zigbee를 제어하는 예제들이 들어있는 곳입니다.

### Zigbee SDK Build

ZigbeeSDK/src 폴더에서 make 명령어로 build 하면 library가 빌드되어 ZigbeeSDK/lib 폴더로 자동으로 복사됩니다.

## [Visual C++](#visual-c)

Visual C++용 예제입니다. 본 예제들은  Visual Studio 2005에서 테스트 되었습니다.

### 환경 설정

예제를 실행하기 위해서는 C++에서 환경 설정을 해주어야 합니다.

#### 경로 등록하기

Visual Studio에 Zigbee SDK의 위치를 등록합니다.

1. 메뉴에서 도구->옵션을 선택합니다.

    ![img](/assets/images/sw/sdk/c++_config.png)

2. 프로젝트 및 솔루션 > VC++ 디렉터리를 클릭 합니다.

    ![img](/assets/images/sw/sdk/c++_config1.png)

3. 다음 파일의 디렉터리 표시 부분을 포함 파일(include) 로 바꾼 후 2번 표시가 있는 부분을 클릭하여, ZigbeeSDK가 설치 된 폴더를 추가 시킵니다. (예: C:\ZigbeeSDK\import)

    ![img](/assets/images/sw/sdk/c++_config.png)

4. 다음 파일의 디렉터리 표시 부분을 라이브러리 파일(library) 로 바꾼 후 2번 표시가 있는 부분을 클릭하여,ZigbeeSDK가 설치 된 폴더를 추가 시킵니다. (예: C:\ZigbeeSDK\import)

    ![img](/assets/images/sw/sdk/c++_config1.png)

#### Zigbee SDK 사용하기

1. Header 파일을 포함시킵니다. 소스 파일에 #include "zigbee.h"을 추가합니다.
2. Library 파일을 포함시킵니다. 소스 파일에 #pragma comment(lib, "zigbee.lib")를 추가하거나, 프로젝트 속성에서 Link 탭의 Input에서 Module에 zigbee.lib를 추가합니다.
3. 함수를 사용합니다.

소스 상에서 필요한 함수를 호출하면 됩니다. 각 함수의 사용법은 [API Reference]를 참고하시기 바랍니다.

![img](/assets/images/sw/sdk/c++_config2.png)

### Send/Recieve 예제

#### 준비

사용하는 Zigbee 모듈은 서로 1:1통신으로 설정합니다.  
제어기가 응답할 수 있도록 제어기 타입에 맞는 tsk파일을 다운로드 합니다.

- [Download CM100_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm100_echo.tsk)
- [Download CM5_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm5_echo.tsk)
- [Download CM510_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm510_echo.tsk)
- [Download CM700_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm700_echo.tsk)

#### 소스

##### 초기화

```c
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
초기화가 성공하였으면 1, 실패할경우엔 0이 반환 되므로 if문에는 실패했을 경우에 대한 소스가 들어가게 되고, else문 안에는 성공했을 경우의 소스가 들어가게 됩니다.  
Zigbee API 함수중 [zgb_initialize]를 호출합니다.  
DEFAULT_PORTNUM는 통신장치가 연결되어 있는 번호를 의미 합니다.  
DEFAULT_PORTNUM 은 사용자의 시스템 상황에 맞게 설정해야 하며 COM3으로 기본 셋팅이 되어있습니다.

##### 종료

```c
// Close device
zgb_terminate();
```

위 소스는 제어기 통신장치와 통신을 종료하는 소스입니다. Zigbee API 함수중 [zgb_terminate] 를 호출합니다.

##### 패킷 보내기

```c
if (zgb_tx_data(TxData) == 0)
{
  printf( "Failed to transmit\n" );
}
```

위 소스는 Zigbee 모듈이 제어기 쪽으로 패킷을 전달 하는 소스 입니다.  
Zigbee API 함수중 [zgb_tx_data] 함수를 이용하여 패킷을 전달하고 전송 결과를 리턴 받는다.  
리턴 값이 1이면 전송성공, 0이면 전송실패를 의미 합니다.  
TxData는 사용자가 제어기에 전달하는 값을 의미합니다.

##### 패킷 받기

```c
for( i=0; i < TIMEOUT_TIME; i++)
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

## [Visual Basic](#visual-basic)

Visual Basic용 예제입니다. 이 예제는 Visual Studio 2005에서 테스트 되었습니다.

### 환경 설정

예제를 실행하기 위해서는 Visual Basic에서 환경 설정을 해주어야 합니다.

#### Zigbee SDK사용하기

1. 솔루션 탐색기에서 Projct File 이름 위 에서 마우스 우클릭을 하여 추가 - > 기존항목을 선택합니다.

    ![img](/assets/images/sw/sdk/vb_config.png)

2. zigbee.vb 파일을 추가시킵니다. zigbee.vb는 ZigbeeSDK가 저장되어 있는 폴더의  import폴더 안에 있습니다. (예: C:\ZigbeeSDK\import\zigbee.vb)

    ![img](/assets/images/sw/sdk/vb_config.png)

3. zigbee.vb가 추가 된것을 확인 합니다.

    ![img](/assets/images/sw/sdk/vb_config1.png)

4. ZigbeeAPI 함수를 사용 합니다. Zigbee 각 함수 사용법은 [API Reference]를 참고하시기 바랍니다.

    ![img](/assets/images/sw/sdk/vb_config2.png)

### Send/Recieve 예제

#### 준비

사용하는 Zigbee 모듈은 서로 1:1통신으로 설정합니다. 제어기가 응답할 수 있도록 제어기 타입에 맞는 tsk파일을 다운로드 합니다.

- [Download CM100_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm100_echo.tsk)
- [Download CM5_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm5_echo.tsk)
- [Download CM510_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm510_echo.tsk)

#### 소스

##### 초기화

```
'Open device
If (zgb_initialize(DEFAULT_PORTNUM) = 0) Then
  Console.WriteLine("Failed to open Zig2Serial!")
  Exit Sub
Else
  Console.WriteLine("Succeed to open Zig2Serial!")
End If
```

위 소스는 초기화가 제대로 되었는지를 확인합니다.  
초기화가 성공하였으면 1, 실패할경우엔 0이 반환 되므로 if문에는 실패했을 경우에 대한 소스가 들어가게 되고, else문 안에는 성공했을 경우의 소스가 들어가게 된빈다.  
Zigbee API 함수중 [zgb_initialize]를 호출합니다.  
DEFAULT_PORTNUM는 통신장치가 연결되어 있는 번호를 의미 합니다.  
DEFAULT_PORTNUM 은 사용자의 시스템 상황에 맞게 설정해야 하며 COM3으로 기본 셋팅이 되어있습니다.

##### 종료

```
'Close device
zgb_terminate()
```

위 소스는 제어기 통신장치와 통신을 종료하는 소스입니다. Zigbee API 함수중 [zgb_terminate]를 호출합니다.

##### 패킷 보내기

```
If (zgb_tx_data(TxData) = 0) Then
  Console.WriteLine("Failed to transmit")
End If
```

위 소스는 Zigbee 모듈이 제어기 쪽으로 패킷을 전달 하는 소스 입니다.  
Zigbee API 함수중 [zgb_tx_data] 함수를 이용하여 패킷을 전달하고 전송 결과를 리턴 받는다.  
리턴 값이 1이면 전송성공, 0이면 전송실패를 의미 합니다.  
TxData는 사용자가 제어기에 전달하는 값을 의미합니다.

##### 패킷 받기

```
For i = 1 To TIMEOUT_TIME
  'Verify data recieved
  If (zgb_rx_check() = 1) Then
    'Get data verified
    RxData = zgb_rx_data()
    Console.WriteLine("Recieved: " & RxData & "")
    Exit For
  End If
  Sleep(1)
Next i
```

위 소스는 Zigbee 모듈이 제어기로부터  패킷을 받는 소스입니다.  
[zgb_rx_check] 함수를 이용하여 패킷이 수신되었는지를 체크를 합니다.  
리턴 값이 1이면 수신성공, 0이면 수신실패를 의미 합니다.  

패킷이 수신되면 (리턴값이 1이 되면) [zgb_rx_data] 함수를 이용해 RxData 변수에 전송받은 패킷을 저장합니다.  
패킷을 수신받지 못하면 Sleep() 함수를 이용하여 1ms의 딜레이 시간을 준 후 TIMEOUT_TIME 시간 만큼 루프를 돌게 됩니다.  
TIMEOUT_TIME 는 1000으로 초기셋팅이 되어 예제 소스에서는 1초의 시간동안 패킷이 도착하기를 기다리게 됩니다.

## [Visual C Sharp(#)](#visual-c-sharp)

Visual C#용 예제입니다. 이 예제는 Visual Studio 2005에서 테스트 되었습니다.

### 환경 설정

예제를 실행하기 위해서는 C#에서 환경 설정을 해주어야 합니다.

#### Zigbee SDK 사용하기

1. 솔루션 탐색기에서 Projct File 이름 위 에서 마우스 우클릭을 하여 추가 > 기존항목을 선택합니다.

    ![img](/assets/images/sw/sdk/visual_cs/cs_config.png)

2. Zigbee.cs 파일을 추가시킵니다. Zigbee.cs는 ZigbeeSDK가 저장되어 있는 폴더의  import폴더 안에 있습니다. (예: C:\ZigbeeSDK\import\Zigbee.cs)

    ![img](/assets/images/sw/sdk/cs_config.png)

3. Zigbee.cs가 추가 된것을 확인 합니다.

    ![img](/assets/images/sw/sdk/cs_config1.png)

4. using ROBOTIS를 추가 하여 ZigbeeAPI 함수를 사용 합니다. Zigbee각 함수 사용법은 [API Reference] 를 참고하시기 바랍니다.

    ![img](/assets/images/sw/sdk/cs_config2.png)

### Send_Recieve

#### 준비

사용하는 Zigbee 모듈은 서로 1:1통신으로 설정합니다. 제어기가 응답할 수 있도록 제어기 타입에 맞는 tsk파일을 다운로드 합니다.

- [Download CM100_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm100_echo.tsk)
- [Download CM5_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm5_echo.tsk)
- [Download CM510_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm510_echo.tsk)

#### 소스

##### 초기화

```c
// Open device
if (zigbee.zgb_initialize(DEFAULT_PORTNUM) == 0)
{
  printf( "Failed to open Zig2Serial!\n" );
}
else
{
  printf( "Succeed to open Zig2Serial!\n" );
}
```

위 소스는 초기화가 제대로 되었는지를 확인합니다.  
초기화가 성공하였으면 1, 실패할경우엔 0이 반환 되므로 if문에는 실패했을 경우에 대한 소스가 들어가게 되고, else문 안에는 성공했을 경우의 소스가 들어가게 됩니다.

Zigbee API 함수중 [zgb_initialize]를 호출합니다.  
DEFAULT_PORTNUM는 통신장치가 연결되어 있는 번호를 의미합니다.  
DEFAULT_PORTNUM 은 사용자의 시스템 상황에 맞게 설정해야 하며 COM3으로 기본 셋팅이 되어있습니다.

##### 종료

```c
// Close device
zigbee.zgb_terminate();
```

위 소스는 제어기 통신장치와 통신을 종료하는 소스입니다. Zigbee API 함수중 [zgb_terminate]를 호출합니다.

##### 패킷 보내기

```c
if (zigbee.zgb_tx_data(TxData) == 0)
{
  Console.WriteLine("Failed to transmit");
}
```

위 소스는 Zigbee 모듈이 제어기 쪽으로 패킷을 전달 하는 소스 입니다.  
Zigbee API 함수중 [zgb_tx_data]함수를 이용하여 패킷을 전달하고 전송 결과를 리턴 받는다.  
리턴 값이 1이면 전송성공, 0이면 전송실패를 의미 합니다.  
TxData는 사용자가 제어기에 전달하는 값을 의미합니다.

##### 패킷 받기

```c
for( i=0; i < TIMEOUT_TIME; i++)
{
  // Verify data recieved
  if(zigbee.zgb_rx_check() == 1)
  {
    // Get data verified
    RxData = zigbee.zgb_rx_data();
    Console.WriteLine("Recieved: {0:d}", RxData);
    break;
  }
  Thread.Sleep(1);
}
```

위 소스는 Zigbee 모듈이 제어기로부터 패킷을 받는 소스입니다.  
[zgb_rx_check] 함수를 이용하여 패킷이 수신되었는지를 체크를 합니다.  
리턴 값이 1이면 수신성공, 0이면 수신실패를 의미 합니다.  

패킷이 수신되면 (리턴값이 1이 되면) [zgb_rx_data] 함수를 이용해 RxData 변수에 전송받은 패킷을 저장합니다.  
패킷을 수신받지 못하면 Sleep() 함수를 이용하여 1ms의 딜레이 시간을 준 후 TIMEOUT_TIME 시간 만큼 루프를 돌게 됩니다.  
TIMEOUT_TIME 는 1000으로 초기셋팅이 되어 예제 소스에서는 1초의 시간동안 패킷이 도착하기를 기다리게 됩니다.

## [gcc](#gcc)

Linux gcc 를 이용한 예제입니다.  
ZigbeeSDK/example 폴더 아래의 Send_Receive 폴더로 이동하여 make 명령어를 통해 빌드하면 됩니다.  
모든 예제는 `/dev/ttyUSB0`를 기본 device 로 사용하도록 되어 있습니다.  

### 환경 설정

#### Zigbee API 사용하기

1. Header 파일 지정. 소스 파일에 #include \<zigbee.h>을 추가합니다.
2. 함수호출. 소스 상에서 필요한 함수를 호출하면 됩니다. 각 함수의 사용법은 [API Reference]를 참고하시기 바랍니다.

### Send/Receive Example

Zigbee의 Send / Receive 예제입니다.  

#### 준비

USB2DYNAMIXEL에 Zig2Serial과 ZIG-100이 연결 되어 있어야 합니다.  
또한, Zig2Serial에 연결된  ZIG-100 통신 모듈과 통신할 수 있는 제어기, 혹은 다른 통신 장치가 있어야 합니다.

#### 소스

##### 초기화

```c
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

##### 종료

```c
// Close device
zgb_terminate();
```

위 소스는 종료하는 소스입니다. zigbee API 중 [zgb_teminate] 함수를 호출하여 연결을 종료 시킵니다.

##### 데이터 전송하기

```c
// Wait user's input
printf( "Input number to transmit: " );
if(scanf("%d", &TxData));
  // Transmit data
if(zgb_tx_data(TxData) == 0)
  printf( "Failed to transmit\n" );
```

위 소스는 zigbee를 통해 사용자가 입력한 값을 전송하는 소스입니다. zigbee API 중 [zgb_tx_data] 함수를 호출 합니다.

##### 데이터 수신하기

```c
for( i=0; i < TIMEOUT_TIME; i++)
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

위 소스는 TIMEOUT 시간 전 까지 데이터를 받아오는 소스입니다. zigbee API 중 [zgb_rx_check] 와 [zgb_rx_data]함수를 호출합니다.


# [CM-510/700용 Zigbee SDK](#cm-510710용-zigbee-sdk)

CM-510/700용 Zigbee SDK는 임베디드 C에 포함되어 있습니다. 예제 바로가기는 다음과 같습니다.
- [RC100과 ZigBee]

[RC100과 ZigBee]: /docs/kr/software/embedded_sdk/embedded_c_cm510/#rc100과-zigbee
