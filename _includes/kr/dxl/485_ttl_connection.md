<!-- 485 + TTL 통신 통합. -->

## [통신 회로](#통신-회로)
다이나믹셀을 제어하기 위해서는 제어기의 UART 신호를 Half duplex type으로 변환시켜 주어야 합니다. 다음은 그 권장 회로도입니다.

{% if page.product_group=='dxl_ax' %}

### [TTL 통신](#ttl-통신)
![](/assets/images/dxl/ttl_circuit.png)

**참고**: 위 회로는 5V 전원을 사용하는 MCU를 사용하거나 IO가 5V tolerant한 경우 사용가능합니다. 그 외의 경우, Level Shifter를 사용하세요.
{: .notice}

{% else %}

### [TTL 통신](#ttl-통신)
![](/assets/images/dxl/ttl_circuit.png)

**참고**: 위 회로는 5V 전원을 사용하는 MCU를 사용하거나 IO가 5V tolerant한 경우 사용가능합니다. 그 외의 경우, Level Shifter를 사용하세요.
{: .notice}

### [RS-485 통신](#rs485-통신)
![](/assets/images/dxl/x/x_series_485_circuit.jpg)

**참고**: 위 회로는 5V 전원을 사용하는 MCU를 사용하거나 IO가 5V tolerant한 경우 사용가능합니다. 그 외의 경우, Level Shifter를 사용하세요.
{: .notice}

전원은 Pin1(-), Pin2(+)를 통하여 다이나믹셀로 공급됩니다.(다이나믹셀 전용 Controller에는 위의 회로가 내장되어 있습니다.)  
위의 회로도에서 TTL Level의 TxD와 RxD는 TX_Enable_5V의 Level에 따라 다음과 같이 Data 신호의 방향이 결정됩니다.  
- TX_Enable_5V =High인 경우: TxD의 신호가 D+, D-로 출력
- TX_Enable_5V =Low인 경우: D+, D-의 신호가 RxD로 입력

{% endif %}

{% include kr/dxl/pinout_warning.md %}
