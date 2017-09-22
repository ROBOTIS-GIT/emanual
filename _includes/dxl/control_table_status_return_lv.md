This value decides how to return Status Packet when Dynamixel receives an Instruction Packet.

| Value | Responding Instructions  | Description |
| :---: | :----------------------: | :---------: |
|0|PING Instruction|Status Packet will not be returned for all Instructions|
|1|PING Instruction<br />READ Instruction|Status Packet will be returned only for READ Instruction|
|2|All Instructions|Status Packet will be returned for all Instructions|

`Note` If the ID of Instruction Packet is set to Broad Cast ID(0xFE), Status Packet will not be returned for READ and WRITE Instructions regardless of Status Return Level. For more details, please refer to the [Protocol] section of e-Manual.
{: .notice}

[Protocol]: ???
