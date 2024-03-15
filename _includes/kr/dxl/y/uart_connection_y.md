

### [RS-485 통신](#rs-485-통신)
Main Controller를 직접 제작하여 DYNAMIXEL-Y를 제어하기 위해서는 Main Controller UART의 신호를 RS485 type으로 변환시켜 주어야 합니다. 다음은 권장 회로도 입니다.

![](/assets/images/dxl/y/uart_connection.PNG)

**참고**: 위 회로는 5V 전원을 사용하는 MCU를 사용하거나 IO가 5V tolerant한 경우 사용 가능합니다. 그 외의 경우, Level Shifter를 사용하세요.
{: .notice}

다이나믹셀 전용 제어기에는 위의 회로가 내장되어 있습니다. 위의 회로도에서 TTL Level의 TxD와 RxD는 TX_Enable_5V의 Level에 따라 다음과 같이 Data 신호의 방향이 결정됩니다.
- TX_Enable_5V =High인 경우: TxD의 신호가 D+, D-로 출력
- TX_Enable_5V =Low인 경우: D+, D-의 신호가 RxD로 입력

