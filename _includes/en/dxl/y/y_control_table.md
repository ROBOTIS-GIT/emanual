
# [Control Table](#control-table)

The DYNAMIXEL control table is how the servo stores and represents its current state, as well as all of the data required for DYNAMIXEL configuration and control. DYNAMIXEL instruction packets allow users to read and write data to and from the control table to control the servo as well as monitor the device status.

## [Control Table, Data, Address](#control-table-data-address)
The Control Table is a structure that consists of multiple Data fields to store status or to control the device.  
Each control table address is a unique value specified in Instruction Packets to access specific data in the Control Table. To read or write device data, you need to specify the corresponding address of the intended data in the Instruction Packet. For more detailed information about DYNAMIXEL packet structure, please refer to the [DYNAMIXEL Protocol 2.0] eManual page.  

**Note**: The representation of negative numbers follows the Two’s complement rule. For a detailed ㄷexplanation of Two’s complement, please refer to Wikipedia's article on "[Two's complement]."
{: .notice}


### [Area (EEPROM, RAM, Hybrid)](#area-eeprom-ram)
The control table is divided into three areas: EEPROM, RAM, and Hybrid. Here are the characteristics of each area:

<!-- 분홍 : #fef1e9, 파랑 : #deebf6, 초록 : #e2efd9 -->

<table>
    <tr bgcolor= "#f2f3f3">
        <td align="center"><b>Area</b></td>
        <td><b>Detai</b></td>
    </tr>
    <tr>
        <td align="center" bgcolor= "#fef1e9" >EEPROM</td>
        <td>
            Values in the EEPROM area are preserved even when the power is turned off. (Memory is Non-Volatile). The values in this area can only be altered when the value of Torque Enable (512) is '0' (Torque OFF).
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor= "#deebf6" >RAM</td>
        <td>
            The RAM area resets to its default values whenever power is applied (Memory is Volatile). The values in this area can be changed regardless of the value of Torque      Enable.
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor= "#e2efd9" >Hybrid</td>
        <td>The Hybrid area retains its values even when power is turned off, and changes can be made regardless of the Torque Enable value.<br />
            When torque is disabled (Torque Enable = 0), it behaves like the EEPROM area. Values are immediately stored when changed.<br />
            When torque is enabled (Torque Enable = 1), it behaves like the RAM area. Changes are possible but not immediately stored. To save changes made in this state, use Hybrid Save (170) when torque has been disabled.
        </td>
    </tr>
</table>


### [Size](#size)
Data consisting of 2 bytes or more may occupy multiple sequential control table registers up to 4 bytes long. When addressing control table data, the size of the control table item to be modified must be specified in the Instruction Packet to ensure proper data access.  
Serial data with 2 bytes or more is represented in the control table using the [Little Endian] rule.

### [Access Authorization](#access-authorization)
Data in the control table has two access attributes. 'RW' indicates that both reading and writing are possible. 'R' indicates a read-only attribute. Data with a read-only attribute cannot have its value changed using WRITE Instructions.  
Read-only attributes ('R') are primarily used for measurement or monitoring purposes, while read-write attributes ('RW') are used for device configuration and control.


### [Default Values](#default-values)
The default values in the EEPROM area as indicated in the manual are the initial settings of the product (factory default settings). When using the Factory Reset Instruction, any changes made by the user to the EEPROM will be reset to their default values.  
The default values in the RAM area are the values set when power is supplied to the device.


[DYNAMIXEL Protocol 2.0]: /docs/en/dxl/protocol2/
[Two's complement]: https://en.wikipedia.org/wiki/Two%27s_complement
[Little Endian]: https://en.wikipedia.org/wiki/Endianness#Little
