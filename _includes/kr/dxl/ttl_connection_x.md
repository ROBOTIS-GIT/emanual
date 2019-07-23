## [통신 회로](#통신-회로)
다이나믹셀을 제어하기 위해서는 제어기의 UART 신호를 Half duplex type으로 변환시켜 주어야 합니다. 다음은 그 권장 회로도입니다.

### [TTL 통신](#ttl-통신)
![](/assets/images/dxl/ttl_circuit.png)

{% if page.ref=='2xl430-w250' %} ![](/assets/images/dxl/x/2xl/2x_series_ttl_pin.png) {% else %}![](/assets/images/dxl/x/x_series_ttl_pin.png) {% endif %} 

{% include kr/dxl/pinout_warning.md %}
