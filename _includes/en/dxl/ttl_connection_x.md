<!-- TTL 통신, X만 사용. -->

## [Communication Circuit](#communication-circuit)
To control the DYNAMIXEL actuators, the main controller needs to convert its UART signals to the half duplex type. The recommended circuit diagram for this is shown below.

{% if page.product_group=='xl330' %}

### [TTL Communication (3.3V Logic)](#ttl-communication-33v-logic)
![](/assets/images/dxl/3v3_ttl_circuit.png)

{% else %}

### [TTL Communication](#ttl-communication)
![](/assets/images/dxl/ttl_circuit.png)

{% endif %}

{% if page.ref=='2xl430-w250' or page.ref== '2xc430-w250'%} ![](/assets/images/dxl/x/2xl/2x_series_ttl_pin.png) {% else %}![](/assets/images/dxl/x/x_series_ttl_pin.png) {% endif %}
