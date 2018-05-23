The ID is a unique value in the network to identify each DYNAMIXEL with an Instruction Packet.
0~252 (0xFC) values can be used as an ID, and 254(0xFE) is occupied as a broadcast ID. The Broadcast ID(254, 0xFE) can send an Instruction Packet to all connected DYNAMIXELs simultaneously.

**NOTE** : Please avoid using an identical ID for multiple DYNAMIXELs. You may face communication failure or may not be able to detect Dynamixels with an identical ID.
{: .notice}
