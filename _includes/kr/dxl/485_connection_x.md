<!-- 485 통신, X만 사용. -->

## [통신 회로](#통신-회로)
다이나믹셀을 제어하기 위해서는 제어기의 UART 신호를 Half duplex type으로 변환시켜 주어야 합니다. 다음은 그 권장 회로도입니다.

### [RS-485 통신](#rs485-통신)
![](/assets/images/dxl/x/x_series_485_circuit.jpg)

**참고**: 위 회로는 5V 전원을 사용하는 MCU를 사용하거나 IO가 5V tolerant한 경우 사용 가능합니다. 그 외의 경우, Level Shifter를 사용하세요.
{: .notice}

![](/assets/images/dxl/x/x_series_485_pin.png)

전원은 Pin1(-), Pin2(+)를 통하여 다이나믹셀로 공급됩니다.(다이나믹셀 전용 Controller에는 위의 회로가 내장되어 있습니다.)  

{% include kr/dxl/pinout_warning.md %}
