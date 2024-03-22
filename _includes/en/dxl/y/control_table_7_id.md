The unique number used to identify devices on the DYNAMIXEL network. The acceptable ID range is from 0 to 252 (0xFC), with 254 (0xFE) being reserved for the Broadcast ID. Broadcast ID (254, 0xFE) is used specifically for sending Instruction Packets to all connected DYNAMIXEL devices simultaneously.


**Caution** : Each DYNAMIXEL servo connected to the network requires a unique ID. If device IDs are duplicated, communication errors can occur, and the searching for DYNAMIXELs with duplicated IDs will fail.
{: .notice}

**Note** : If the ID of the Instruction packet is set to the Broadcast ID (0xFE), the Status Packet for Read or Write Instruction will not be returned, regardless of the Status Return Level (68) setting value. For more detailed information, please refer to the Status Packet section of the [DYNAMIXEL Protocol 2.0](https://emanual.robotis.com/docs/en/dxl/protocol2/#status-packet) eManual page.
{: .notice}
