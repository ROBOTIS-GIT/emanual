Baud Rate determines serial communication speed between a controller and DYNAMIXEL.

| Value     | Baud Rate     | Margin of Error     |
| :------------: | :------------: | :------------: |
|7|4.5M|0.000%|
|6|4M|0.000%|
|5|3M|0.000%|
|4|2M|0.000%|
|3|1M|0.000%|
|2|115,200| 0.000%|
|1(Default)|57,600| 0.000%|
|0|9,600| 0.000%|

**NOTE** : Less than 3% of the baud rate error margin will not affect to UART communication.
{: .notice}

**NOTE** : For the stable communication with higher Baudrate, configure USB Latency value to the lower.  
[USB Latency Setting](/docs/en/software/dynamixel/dynamixel_wizard2/#usb-latency-setting) 
{: .notice}
