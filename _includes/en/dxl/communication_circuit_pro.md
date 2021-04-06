To control {% if page.product_group=='dxl_p' %}DYNAMIXEL-P{% else %}DYNAMIXEL PRO{% endif %} with a custom made Main Controller, the signal of Main Controller UART should be converted into RS-485 signal.
The following is a recommended conversion circuit diagram.

![](/assets/images/dxl/x/x_series_485_circuit.jpg)

**NOTE**: Above circuit is designed for 5V or 5V tolerant MCU. Otherwise, use a Level Shifter to match the voltage of MCU.
{: .notice}

The power is supplied via Pin1(-) and Pin2(+) of DYNAMIXEL. (The above circuit is built into DYNAMIXEL-only controllers)

In the above circuit diagram, the direction of data signal of TxD and RxD in the TTL Level is determined according to the level of `TX_Enable_5V` as follows:
- If `TX_Enable_5V` = **High** : The `TXD_5V` signal is transferred to `D+` and `D-`.
- If `TX_Enable_5V` = **Low** : The `D+` and `D-` signals are transferred to `RXD_5V`.

## [Pin Arrangement](#pin-arrangement)
Connector pin arrangement is shown below.
{% if page.product_group=='dxl_p' %}DYNAMIXEL-P{% else %}DYNAMIXEL PRO{% endif %} has two 4-pin connectors arranged in pin-2-pin configuration.
In this arrangement there's no priority in the connector order and {% if page.product_group=='dxl_p' %}DYNAMIXEL-P{% else %}DYNAMIXEL PRO{% endif %} can be driven like the MX-series.  
Additionally there is a 2-pin connector dedicated for power input for high-current operations.

{% if page.product_group=='dxl_p' %}
![](/assets/images/dxl/p/pin_name.png)

![](/assets/images/dxl/p/connection.png)

![](/assets/images/dxl/p/wiring.png)
{% else %}
![](/assets/images/dxl/pro/clip_image003.png)

![](/assets/images/dxl/pro/clip_image005.jpg)

![](/assets/images/dxl/pro/clip_image007.png)
{% endif %}

**WARNING** : When wiring please pay attention to the pin arrangement. Incorrectly connected {% if page.product_group=='dxl_p' %}DYNAMIXEL-P{% else %}DYNAMIXEL PRO{% endif %} may be damaged severely.
{: .notice--warning}
