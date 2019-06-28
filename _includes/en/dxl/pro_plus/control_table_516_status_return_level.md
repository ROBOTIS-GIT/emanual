This value decides how to return Status Packet when the device receives an Instruction Packet.

| Value |        Responding Instructions         |                       Description                        |
|:-----:|:--------------------------------------:|:--------------------------------------------------------:|
|   0   |            PING Instruction            | Status Packet will not be returned for all Instructions  |
|   1   | PING Instruction<br />READ Instruction | Status Packet will be returned only for READ Instruction |
|   2   |            All Instructions            |   Status Packet will be returned for all Instructions    |

**NOTE** : If the ID of Instruction Packet is set to Broad Cast ID(0xFE), Status Packet will not be returned for READ and WRITE Instructions regardless of Status Return Level. For more details, please refer to the [Status Packet] section of [Protocol 2.0].
{: .notice}

**WARNING** : Modebus-RTU dose not support Status Return Level(516).    
{: .notice--warning}

[Status Packet]: /docs/en/dxl/protocol2/#status-packet
[Protocol 2.0]: /docs/en/dxl/protocol2/
