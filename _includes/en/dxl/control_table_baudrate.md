Baud Rate determines serial communication speed between a controller and DYNAMIXELs.

| Value     | Baud Rate(bps)     | Margin of Error     |
|:------------:|:------------:|:------------:|
{% if page.product_group=='dxl_mx' %}|0|2M|0.000 [%]|
{% else %}{% endif %}|1|1M|0.000 [%]|
|3|500,000| 0.000 [%]|
|4|400,000| 0.000 [%]|
|7|250,000| 0.000 [%]|
|9|200,000| 0.000 [%]|
|16|115200| -2.124 [%]|
|34(Default)|57600| 0.794 [%]|
|103|19200| -0.160 [%]|
|207|9600| -0.160 [%]|

**NOTE** : Less than 3% of the baud rate error margin will not affect to UART communication.
{: .notice}

**NOTE** : For the stable communication with higher Baudrate, configure USB Latency value to the lower.  
[USB Latency Setting](/docs/en/software/dynamixel/dynamixel_wizard2/#usb-latency-setting) 
{: .notice}
