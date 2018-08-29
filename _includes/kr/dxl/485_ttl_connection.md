## [통신 회로](#통신-회로)
다이나믹셀을 제어하기 위해서는 제어기의 UART 신호를 Half duplex type으로 변환시켜 주어야 합니다. 다음은 그 권장 회로도입니다.

### [TTL 통신](#ttl-통신)
![](/assets/images/dxl/ttl_circuit.png)

### [RS-485 통신](#rs485-통신)
![](/assets/images/dxl/485_circuit.png)

전원은 Pin1(-), Pin2(+)를 통하여 다이나믹셀로 공급됩니다.(Dynamixel 전용 Controller에는 위의 회로가 내장되어 있습니다.)  
위의 회로도에서 TTL Level의 TxD와 RxD는 DIRECTION 485의 Level에 따라 다음과 같이 Data 신호의 방향이 결정됩니다.  
- DIRECTION485 Level =High인 경우: TxD의 신호가 D+, D-로 출력
- DIRECTION485 Level =Low인 경우: D+, D-의 신호가 RxD로 입력

**주의**: 커넥터 제조사의 PIN 순서와 상이할 수 있으니 반드시 PIN 순서를 확인하시기 바랍니다.
{: .notice}
