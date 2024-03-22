Determines how the Status Packet is returned.

| Value |          Responding Command            |                     Description                                      |
|:--:|:-----------------------------------------:|:--------------------------------------------------------------------:|
|  0 |              PING Instruction             | Status Packet is returned only in response to the PING command       |
|  1 |   PING Instruction<br />Read Instruction  | Status Packet is returned only in response to PING and READ commands |
|  2 |              All Instruction              | Status Packet is returned for all commands                           |

**Note**: When the Instruction Packet's ID is the Broadcast ID (0xFE), Status Packets for Read Instruction or Write Instruction will not be returned regardless of the setting of Status Return Level (15). For more detailed information, please refer to the [Status Packet] section in Protocol 2.0.
{: .notice}

[Status Packet]: /docs/en/dxl/protocol2/#status-packet