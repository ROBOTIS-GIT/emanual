After the DYNAMIXEL receives an Instruction Packet, it delays transmitting the Status Packet for Return Delay Time (9). For instance, if the Return Delay Time(9) is set to ‘10’, the Status Packet will be returned after 20[μsec] when the Instruction Packet is received.

|Unit| Value Range    | Description     |
| :------------: | :------------: | :------------: |
| 2[μsec] | 0 ~ 254 | Default value ‘250’(500[μsec]), Maximum 508[μsec] |
