<<<<<<< HEAD
Baud Rate determines serial communication speed between a DYNAMIXEL and it's controller.
=======
Baud Rate determines serial communication speed between a controller and DYNAMIXEL.
Available value range is 0 ~ 254(0xFE), and below is the equation for BPS calculation.  
**Baudrate(BPS) = 2,000,000 / (Value + 1)**
>>>>>>> aae312bc64c47aeeed478e1d589438e2bc5883ee

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

**NOTE** : A margin of error of less than 3% will not affect UART communication.
{: .notice}

**NOTE** : For stable communication with higher Baudrates, configure [USB Latency Settings](/docs/en/software/dynamixel/dynamixel_wizard2/#usb-latency-setting) to the lowest value supported by your hardware.  
{: .notice}
