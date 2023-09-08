The DYNAMIXEL ID is used by the DYNAMIXEL network to identify individual actuators for instruction packets.
Values between 0 and 253 (0xFD) can be assigned to individual DYNAMIXEL actuators and address 254(0xFE) is is reserved for the global broadcast ID to send instruction packets to all connected devices simultaneously.

**NOTE**: DYNAMIXEL IDs must be unique for each device connected to a DYNAMIXEL network. Multiple devices sharing a single ID may cause communications issues or control failure.
{: .notice}
