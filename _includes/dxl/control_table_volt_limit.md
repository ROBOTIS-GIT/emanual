It is the operation range of voltage.
50 to 250 (0x32 ~ 0x96) can be used.  The unit is 0.1V.
For example, if the value is 80, it is 8V.
If Present Voltage (Address42) is out of the range, Voltage Range Error Bit (Bit0) of Status Packet is returned as ‘1’ and Alarm is triggered as set in the addresses 17 and 18.
