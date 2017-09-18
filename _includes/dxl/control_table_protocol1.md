# [Control Table](#control-table)
The Control Table is a structure of data implemented in the DYNAMIXEL. Users can read a specific Data to get status of the DYNAMIXEL with Read Instruction Packets, and modify Data as well to control DYNAMIXEL with WRITE Instruction Packets.

## [Control Table, Data, Address](#control-table-data-address)
The Control Table is a structure that consists of multiple Data fields to store status of the DYNAMIXEL or to control the DYNAMIXEL. Users can check current status of the DYNAMIXEL by reading a specific Data from the Control Table with Read Instruction Packets. WRITE Instruction Packets enable users to control the DYNAMIXEL by changing specific Data in the Control Table. The Address is a unique value when accessing a specific Data in the Control Table with Instruction Packets. In order to read or write data, users must designate a specific Address in the Instruction Packet. Please refer to [Protocol] for more details about Instruction Packets.

`Note` Two's complement is applied for the negative value. For more information, please refer to [Two's complement] from Wikipedia.
{: .notice}

### [Area (EEPROM, RAM)](#area-eeprom-ram)
The Control Table is divided into 2 Areas. Data in the RAM Area is reset to initial values when the DYNAMIXEL is turned on (Volatile). On the other hand, modified data in the EEPROM Area keeps their values even when the DYNAMIXEL is turned off (Non-Volatile). Data in the EEPROM Area can only be changed when the value of Torque Enable(64) is cleared to ‘0’.

### [Size](#size)
The Size of data varies from 1 to 4 bytes depend on their usage. Please check the size of data when updating the data with an Instruction Packet.

### [Access](#access)
The Control Table has two different access properties. ‘RW’ property stands for read and write access permission while ‘R’ stands for read only access permission. Data with the read only property cannot be changed by the WRITE Instruction. Read only property(‘R’) is generally used for measuring and monitoring purpose, and read write property(‘RW’) is used for controlling DYNAMIXEL.

### [Initial Value](#initial-value)
Each data in the Control Table is restored to initial values when the DYNAMIXEL is turned on. Default values in the EEPROM area are initial values of the DYNAMIXEL (factory default settings). If any values in the EEPROM area are modified by a user, modified values will be restored as initial values when the DYNAMIXEL is turned on. Initial Values in the RAM area are restored when the DYNAMIXEL is turned on.
