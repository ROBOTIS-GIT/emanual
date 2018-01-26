# Visual Basic

Visual Basic용 예제입니다.
이 예제는 Visual Studio 2005에서 테스트 되었습니다.

## 환경 설정

예제를 실행하기 위해서는 Visual Basic에서 환경 설정을 해주어야 합니다.

### Zigbee SDK사용하기

1. 솔루션 탐색기에서 Projct File 이름 위 에서 마우스 우클릭을 하여 추가 - > 기존항목을 선택합니다.
![img](/assets/images/sw/sdk/vb_config.png)

2. zigbee.vb 파일을 추가시킵니다. zigbee.vb는 ZigbeeSDK가 저장되어 있는 폴더의  import폴더 안에 있습니다.

    > (예, C:\ZigbeeSDK\import\zigbee.vb)

    ![img](/assets/images/sw/sdk/vb_config.png)

3. zigbee.vb가 추가 된것을 확인 합니다.
![img](/assets/images/sw/sdk/vb_config1.png)

4. ZigbeeAPI 함수를 사용 합니다.
Zigbee 각 함수 사용법은 [API Reference]를 참고하시기 바랍니다.
![img](/assets/images/sw/sdk/vb_config2.png)

## Send/Recieve 예제

### 준비

사용하는 Zigbee 모듈은 서로 1:1통신으로 설정합니다.

제어기가 응답할 수 있도록 제어기 타입에 맞는 tsk파일을 다운로드 합니다.

`download` [CM100_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm100_echo.tsk)
`download`[CM5_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm5_echo.tsk)
`download`[CM510_Echo.tsk](http://support.robotis.com/ko/baggage_files/zigbee_sdk/cm510_echo.tsk)

### 소스

#### 초기화

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

#### 종료

```
'Close device
zgb_terminate()
```

위 소스는 제어기 통신장치와 통신을 종료하는 소스입니다.
Zigbee API 함수중 [zgb_terminate]를 호출합니다.

#### 패킷 보내기

```
If (zgb_tx_data(TxData) = 0) Then
                Console.WriteLine("Failed to transmit")
End If
```

위 소스는 Zigbee 모듈이 제어기 쪽으로 패킷을 전달 하는 소스 입니다.
Zigbee API 함수중 [zgb_tx_data] 함수를 이용하여 패킷을 전달하고 전송 결과를 리턴 받는다.
리턴 값이 1이면 전송성공, 0이면 전송실패를 의미 합니다.
TxData는 사용자가 제어기에 전달하는 값을 의미합니다.

#### 패킷 받기

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

[API Reference]: ??
[zgb_initialize]: ??
[zgb_terminate]: ??
[zgb_tx_data]: ??
[zgb_rx_check]: ??
[zgb_rx_data]: ??
