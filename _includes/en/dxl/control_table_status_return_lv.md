The Status Return Level(68) decides how to return Status Packet when DYNAMIXEL receives an Instruction Packet.

| Value |        Responding Instructions         |              Description              |
|:-----:|:--------------------------------------:|:-------------------------------------:|
|   0   |            PING Instruction            |     Returns PING Instuction only      |
|   1   | PING Instruction<br />READ Instruction | Returns PING and READ Instuctions only |
|   2   |            All Instructions            |       Returns all Instructions        |

**NOTE** : If the ID of Instruction Packet is set to Broad Cast ID(0xFE), Status Packet will not be returned for READ and WRITE Instructions regardless of Status Return Level. For more details, please refer to the `Status Packet` section for [Protocol 1.0] or [Protocol 2.0].
{: .notice}

[Protocol 1.0]: /docs/en/dxl/protocol1/#status-packet
[Protocol 2.0]: /docs/en/dxl/protocol2/#status-packet
