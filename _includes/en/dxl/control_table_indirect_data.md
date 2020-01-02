Indirect Address and Indirect Data are useful when accessing two remote addresses in the Control Table as sequential addresses. Sequential addresses increase Instruction Packet efficiency. Addresses that can be defined as Indirect Address is limited to RAM area(Address 64 ~ 661).
If specific address is allocated to Indirect Address, Indirect Address inherits features and properties of the Data from the specific Address. Property includes Size(Byte length), value range, and Access property(Read Only, Read/Write). For instance, allocating 65(Address of LED) to Indirect Address 1(168), Indirect Data 1(224) can perform exactly same as LED(65).

`Example 1` Allocating Size 1 byte LED(65) to Indirect Data 1(224).
1. Indirect Address 1(168) : change the value to '65' which is the address of LED.
2. Set Indirect Data 1(224) to ‘1’ : LED(65) also becomes '1' and LED is turned on.
3. Set Indirect Data 1(224) to ‘0’ : LED(65) also becomes ‘0’ and LED is turned off.

`Example 2` Allocating Size 4 byte Goal Position(116) to Indirect Data 2(225), 4 sequential bytes have to be allocated.
1. Indirect Address 2(170) : change the value to '116' which is the first address of Goal Position.
2. Indirect Address 3(172) : change the value to '117' which is the second address of Goal Position.
3. Indirect Address 4(174) : change the value to '118' which is the third address of Goal Position.
4. Indirect Address 5(176) : change the value to '119' which is the fourth address of Goal Position.
5. Set 4 byte value '1,024' to Indirect Data 2 : Goal Position(116) also becomes '1024' and DYNAMIXEL moves.

| Indirect Address Range | Description     |
| :------------- | :------------- |
| 64 ~ 661 | EEPROM address can't be assigned to Indirect Address |

**NOTE** : In order to allocate Data in the Control Table longer than 2[byte] to Indirect Address, all address must be allocated to Indirect Address like the above Example 2.
{: .notice}

**NOTE** : Indirect Address 29 ~ 56 and Indirect Data 29 ~ 56 can only be accessed with Protocol 2.0.
{: .notice}
