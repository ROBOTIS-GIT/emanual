The communication speed for communication between the controller and servo over the RS485 serial bus is called the "Baud Rate."

|      Value      |   Baud Rate<br>[bps]  | Actual Baud Rate<br>[bps] |  Error Rate<br>[%] |
|:---------------:|:---------------------:|:-------------------------:|:------------------:|
|        9        |         10.5M         |       10,500,000          |      0.000         |
|        8        |          6M           |        6,000,000          |      0.000         |
|        7        |         4.5M          |        4,421,053          |      -1.176        |
|        6        |          4M           |        4,000,000          |      0.000         |
|        5        |          3M           |        3,000,000          |      0.000         |
|        4        |          2M           |        2,000,000          |      0.000         |
|        3        |          1M           |        1,000,000          |      0.000         |
|        2        |        115,200        |         115,226           |      0.023         |
|    1 (Default)  |        57,600         |         57,613            |      0.023         |
|        0        |         9,600         |          9,600            |      0.000         |

**Caution** : Communication between the controller and the device requires a Baud rate error margin under 3[%].
{: .notice--warning}

**Note** : When using a U2D2, to ensure stable communication at higher Baud rates, please reduce the [response latency of the USB port](/docs/en/software/dynamixel/dynamixel_wizard2/#graph-optimization)
{: .notice}
