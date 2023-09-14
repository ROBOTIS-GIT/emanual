The Baud Rate setting determines the serial communication speed between your controller and DYNAMIXEL actuators.

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

**NOTE**: UART communications will remain stable with a margin of error of up to 3%. 
{: .notice}

**NOTE**: For stable high speed communication over USB serial connections, you may need to adjust the [USB latency settings](/docs/en/software/dynamixel/dynamixel_wizard2/#usb-latency-setting) in your PC's settings.
{: .notice}
