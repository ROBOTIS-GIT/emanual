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

## [핀 배열](#핀-배열)
커넥터의 Pin배열은 아래 그림과 같습니다. MX시리즈에 있는 두 개의4P커넥터는 내부에서 Pin2Pin으로 연결되어 있으므로 두 개 중 어떠한 커넥터에 연결해도 MX 시리즈를 구동 시킬 수 있습니다.

![](/assets/images/dxl/connector_pin.png)

![](/assets/images/dxl/485_connector_pin.png)
