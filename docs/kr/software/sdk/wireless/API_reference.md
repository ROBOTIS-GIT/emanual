# API Reference

Reference는 C언어 호출 방식을 기반으로 설명을 합니다.

## Device Control Method

- 제어기의 통신장치를 제어하는 함수
  - [zgb_initialize]
  - [zgb_terminate]

## Communication Method

- 패킷을 전송하고 받는 함수
  - [zgb_tx_data]
  - [zgb_rx_check]
  - [zgb_rx_data]

### zgb_initialize

제어기의 통신장치를 초기화 하여 준비 상태로 만듭니다.

```
int zgb_initialize(
      int devIndex ,
);
```

#### Parameters

- devIndex  
  현재 연결된 통신장치의 번호 입니다.(플랫폼에 따라 다를수 있습니다.)
  예를 들어 Windows의 경우 COM 포트로 장치를 구분합니다.

#### Return Values
- 1이면 성공, 0이면 실패를 의미합니다.

#### Example

Windows 환경에서 COM3 포트로 초기화하는 예입니다.

```
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

### zgb_terminate

제어기의 통신장치 사용을 끝냅니다.

```
void zgb_terminate();
```

#### Parameters

- 없음

#### Return Values

- 없음

#### Example

```
zgb_terminate();
```

### zgb_tx_data

제어기의 통신장치를 초기화 하여 준비 상태로 만듭니다.

```
int zgb_tx_data(
      int data ,
);
```

#### Parameters

- data
  전송할 데이터의 값
  [RC-100]으로 조종하는 효과를 낼 경우 미리 선언된 버튼 값을 사용할 수 있습니다.

  | 값    | 명칭       | 내용              |
  | ---- | ----------- | ---------------- |
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

```

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

### zgb_rx_check

제어기의 통신장치에 데이터가 도착했는지 확인하는 함수 입니다.

```
int zgb_rx_check();
```

#### Parameters

- 없음

#### Return Values

- 1이면 수신된 데이터가 있음이고 , 0이면 수신된 데이터가 없음을 의미합니다.

#### Example

```
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

# zgb_rx_data

제어기의 통신장치로 부터 데이터를 수신 받는 함수 입니다. [zgb_rx_check]로 데이터의 수신여부를 먼저 확인해야 최신 데이터를 받을 수 있습니다.

```
int zgb_rxdata( );
```

#### Parameters

- 없음

#### Return Values

- 가장 최근에 수신 받은 데이터의 값
[RC-100]으로부터 버튼 값을 수신하려면 미리 선언된 버튼 값을 사용할 수 있습니다.

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

```
int RxData;

if(zgb_rx_check() == 1)
{
// Get data verified
RxData = zgb_rx_data();
}
```

[zgb_initialize]: ??
[zgb_terminate]: ??
[zgb_tx_data]: ??
[zgb_rx_check]: ??
[zgb_rx_data]: ??

[RC-100]: ??
