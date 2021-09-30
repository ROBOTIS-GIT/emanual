The Baud Rate(8) determines serial communication speed between a controller and DYNAMIXEL.

{% if page.product_group=='xl330' or page.product_group=='xc330' %}

|   Value    |   Baud Rate   | Margin of Error |
|:----------:|:-------------:|:---------------:|
|     6      |   4M [bps]    |    0.000 [%]    |
|     5      |   3M [bps]    |    0.000 [%]    |
|     4      |   2M [bps]    |    0.000 [%]    |
|     3      |   1M [bps]    |    0.000 [%]    |
|     2      | 115,200 [bps] |   0.0064 [%]    |
| 1(Default) | 57,600 [bps]  |   0.0016 [%]    |
|     0      |  9,600 [bps]  |    0.000 [%]    |

{% else %}

|   Value    |   Baud Rate   | Margin of Error |
|:----------:|:-------------:|:---------------:|
|     7      |  4.5M [bps]   |    0.000 [%]    |
|     6      |   4M [bps]    |    0.000 [%]    |
|     5      |   3M [bps]    |    0.000 [%]    |
|     4      |   2M [bps]    |    0.000 [%]    |
|     3      |   1M [bps]    |    0.000 [%]    |
|     2      | 115,200 [bps] |    0.000 [%]    |
| 1(Default) | 57,600 [bps]  |    0.000 [%]    |
|     0      |  9,600 [bps]  |    0.000 [%]    |

{% endif %}

**NOTE** : Less than 3% of the baud rate error margin will not affect to UART communication.
{: .notice}

**NOTE** : For the stable communication with higher Baudrate using U2D2, configure USB Latency value to the lower.  
[USB Latency Setting](/docs/en/software/dynamixel/dynamixel_wizard2/#usb-latency-setting) 
{: .notice}
