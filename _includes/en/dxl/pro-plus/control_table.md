# [Control Table](#control-table)
The Control Table is a structure of data implemented in the device. Users can read a specific Data to get status of the device with Read Instruction Packets, and modify Data as well to control the device with WRITE Instruction Packets.

## [Control Table, Data, Address](#control-table-data-address)
The Control Table is a structure that consists of multiple Data fields to store status or to control the device. Users can check current status of the device by reading a specific Data from the Control Table with Read Instruction Packets. WRITE Instruction Packets enable users to control the device by changing specific Data in the Control Table. The Address is a unique value when accessing a specific Data in the Control Table with Instruction Packets. In order to read or write data, users must designate a specific Address in the Instruction Packet. Please refer to [Protocol 2.0] for more details about Instruction Packets.

**NOTE** : Two's complement is applied for the negative value. For more information, please refer to [Two's complement] from Wikipedia.
{: .notice}

### [Area (EEPROM, RAM)](#area-eeprom-ram)
The Control Table is divided into 2 Areas. Data in the RAM Area is reset to initial values when the power is reset(Volatile). On the other hand, data in the EEPROM Area is maintained even when the device is powered off(Non-Volatile). **Data in the EEPROM Area can only be written to if Torque Enable(512) is cleared to ‘0’(Off).**

### [Size](#size)
The Size of data varies from 1 to 4 bytes depend on their usage. Please check the size of data when updating the data with an Instruction Packet. For data larger than 2 bytes will be saved according to [Little Endian].

### [Access](#access)
The Control Table has two different access properties. ‘RW’ property stands for read and write access permission while ‘R’ stands for read only access permission. Data with the read only property cannot be changed by the WRITE Instruction. Read only property(‘R’) is generally used for measuring and monitoring purpose, and read write property(‘RW’) is used for controlling device.

### [Initial Value](#initial-value)
Each data in the Control Table is restored to initial values when the device is turned on. Default values in the EEPROM area are initial values of the device (factory default settings). If any values in the EEPROM area are modified by a user, modified values will be restored as initial values when the device is turned on. Initial Values in the RAM area are restored when the device is turned on.

[Protocol 2.0]: /docs/en/dxl/protocol2/
[Two's complement]: https://en.wikipedia.org/wiki/Two%27s_complement
[Little Endian]: https://en.wikipedia.org/wiki/Endianness#Little
