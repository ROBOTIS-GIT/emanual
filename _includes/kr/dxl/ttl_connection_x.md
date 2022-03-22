<!-- TTL 통신, X만 사용. -->

## [통신 회로](#통신-회로)
다이나믹셀을 제어하기 위해서는 제어기의 UART 신호를 Half duplex type으로 변환시켜 주어야 합니다. 다음은 그 권장 회로도입니다.

{% if page.product_group=='xl330' or page.ref == 'xc330-m288' or page.ref == 'xc330-m181'%}

### [TTL 통신 (3.3V Logic, 5V Compatible)](#ttl-통신-33v-logic-5v-compatible)
![](/assets/images/dxl/3v3_ttl_circuit.png)

**참고**: {{ page.product_group | upcase }}의 통신 버스의 전압은 다른 다이나믹셀과 달리 3.3V 이지만, 5V 통신 버스와도 호환됩니다.
{: .notice}

{% else %}

### [TTL 통신](#ttl-통신)
![](/assets/images/dxl/ttl_circuit.png)

**참고**: 위 회로는 5V 전원을 사용하는 MCU를 사용하거나 IO가 5V tolerant한 경우 사용가능합니다. 그 외의 경우, Level Shifter를 사용하세요.
{: .notice}

{% endif %}

{% if page.ref=='2xl430-w250' or page.ref=='2xc430-w250' %} ![](/assets/images/dxl/x/2xl/2x_series_ttl_pin.png) {% else %}![](/assets/images/dxl/x/x_series_ttl_pin.png) {% endif %} 
