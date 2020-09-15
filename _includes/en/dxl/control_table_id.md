The ID is a unique value in the network to identify each DYNAMIXEL with an Instruction Packet.
0~252 (0xFC) values can be used as an ID, and 254(0xFE) is occupied as a broadcast ID. The Broadcast ID(254, 0xFE) can send an Instruction Packet to all connected DYNAMIXEL simultaneously.

**NOTE** : Please avoid using an identical ID for multiple DYNAMIXEL. You may face communication failure or may not be able to detect DYNAMIXEL with an identical ID.
{: .notice}

**NOTE** : If the Instruction Packet ID is set to the Broadcast ID(0xFE), Status Packets will not be returned for READ and WRITE Instructions. For more details, please refer to the `Status Packet` section for [Protocol 1.0](#status-packetreturn-packet) or [Protocol 2.0](#status-packet).
{: .notice}
