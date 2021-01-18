To control {% if page.product_group=='dxl_p' %}DYNAMIXEL-P series{% else %}DYNAMIXEL PRO{% endif %} with a custom made Main Controller, the signal of Main Controller UART should be converted into RS-485 signal.
The following is a recommended conversion circuit diagram.

![](/assets/images/dxl/pro/485_circuit_pro.png)

The power is supplied via Pin1(-) and Pin2(+) of DYNAMIXEL. (The above circuit is built into DYNAMIXEL-only controllers)

In the above circuit diagram, the direction of data signal of TxD and RxD in the TTL Level is determined according to the level of `DIRECTION485` as follows:
- If `DIRECTION485` = **High** : The `CPU_TXD` signal is transferred to `D+` and `D-`.
- If `DIRECTION485` = **Low** : The `D+` and `D-` signals are transferred to `CPU_RXD`.

## [Pin Arrangement](#pin-arrangement)
Connector pin arrangement is shown below.
{% if page.product_group=='dxl_p' %}DYNAMIXEL-P series{% else %}DYNAMIXEL PRO{% endif %} has two 4-pin connectors arranged in pin-2-pin configuration.
In this arrangement there's no priority in the connector order and {% if page.product_group=='dxl_p' %}DYNAMIXEL-P series{% else %}DYNAMIXEL PRO{% endif %} can be driven like the MX-series.  
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

**WARNING** : When wiring please pay attention to the pin arrangement. Incorrectly connected {% if page.product_group=='dxl_p' %}DYNAMIXEL-P series{% else %}DYNAMIXEL PRO{% endif %} may be damaged severely.
{: .notice--warning}
