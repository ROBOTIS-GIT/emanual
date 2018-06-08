The ID is a unique value in the network to identify each device with an Instruction Packet.  
0~252 (0xFC) values can be used as an ID, and 254(0xFE) is occupied as a broadcast ID.  
The Broadcast ID(254, 0xFE) can send an Instruction Packet to all connected devices simultaneously.

**NOTE** : Please avoid using an identical ID for multiple devices. You may face communication failure or may not be able to detect devices with an identical ID. Also ID(7) is in the EEPROM area, Torque Enable(512) should be set to `0` to change the ID.
{: .notice}
