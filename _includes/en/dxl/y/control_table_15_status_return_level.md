Status Return Level is used to configure whether or the DYNAMIXEL will return status packets response to commands.

| Value |          Response Policy            |                     Description                                      |
|:--:|:-----------------------------------------:|:--------------------------------------------------------------------:|
|  0 |              PING Instruction             | Status Packet is returned only in response to the PING command       |
|  1 |   PING Instruction<br />Read Instruction  | Status Packet is returned only in response to PING and READ commands |
|  2 |              All Instructions              | Status Packet is returned for all commands                           |

**Note**: When the Instruction Packet is sent to the Broadcast ID (0xFE), Status Packets for Read Instruction or Write Instruction will not be returned regardless of the Status Return Level. For more detailed information, please refer to the [Status Packet] section of the DYNAMIXEL Protocol 2.0 eManual page.
{: .notice}

[Status Packet]: /docs/en/dxl/protocol2/#status-packet
