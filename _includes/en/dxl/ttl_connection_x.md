## [Communication Circuit](#communication-circuit)
To control the DYNAMIXEL actuators, the main controller needs to convert its UART signals to the half duplex type. The recommended circuit diagram for this is shown below.

### TTL Communication
![](/assets/images/dxl/ttl_circuit.png)

{% if page.ref=='2xl430-w250' or page.ref== '2xc430-w250'%} ![](/assets/images/dxl/x/2xl/2x_series_ttl_pin.png) {% else %}![](/assets/images/dxl/x/x_series_ttl_pin.png) {% endif %}

{% include en/dxl/pinout_warning.md %}
