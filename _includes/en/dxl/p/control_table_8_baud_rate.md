Baud Rate determines serial communication speed between controller and device.

|   Value    |   Baud Rate   | Actual Baud Rate | Margin of Error |
|:----------:|:-------------:|:----------------:|:---------------:|
|     9      |  10.5M [bps]  |    10,500,000    |     0.000%      |
|     8      |   6M [bps]    |    6,000,000     |     0.000%      |
|     7      |  4.5M [bps]   |    4,421,053     |     -1.176%     |
|     6      |   4M [bps]    |    4,000,000     |     0.000%      |
|     5      |   3M [bps]    |    3,000,000     |     0.000%      |
|     4      |   2M [bps]    |    2,000,000     |     0.000%      |
|     3      |   1M [bps]    |    1,000,000     |     0.000%      |
|     2      | 115,200 [bps] |     115,226      |     0.023%      |
| 1(Default) | 57,600 [bps]  |      57,613      |     0.023%      |
|     0      |  9,600 [bps]  |      9,600       |     0.000%      |

**NOTE** : Less than 3% of the baud rate error margin will not affect to UART communication.
{: .notice}

**NOTE** : For the stable communication with higher baudrate using U2D2, configure USB Latency value to the lower.  
[USB Latency Setting](/docs/en/software/dynamixel/dynamixel_wizard2/#usb-latency-setting) 
{: .notice}
