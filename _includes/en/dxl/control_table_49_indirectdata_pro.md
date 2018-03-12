Indirect Address and Indirect Data are useful when accessing two remote addresses in the Control Table as sequential addresses. Sequential addresses increase Instruction Packet efficiency. Addresses that can be defined as Indirect Address is limited to RAM area(Address 562 ~ 892).
If specific address is allocated to Indirect Address, Indirect Address inherits features and properties of the Data from the specific Address. Property includes Size(Byte length), value range, and Access property(Read Only, Read/Write). For instance, if address 563(LED Red) is allocated to Indirect Address 1(49), Indirect Data 1(634) will have the exactly same value of LED Red(563).

#### Example 1
Allocating 1 byte LED(563) to Indirect Data 1(634).
1. Indirect Address 1(49) : change the value to '563' which is the address of LED Red.
2. Set Indirect Data 1(634) to ‘1’ : LED Red(563) also becomes '1' and Red LED will be turned on.
3. Set Indirect Data 1(634) to ‘0’ : LED Red(563) also becomes ‘0’ and Red LED will be turned off.

#### Example 2
Allocating Size 4 byte Goal Position(596) to Indirect Data 2(635), 4 sequential bytes have to be allocated.
1. Indirect Address 2(51) : change the value to '596' which is the first address of Goal Position.
2. Indirect Address 3(53) : change the value to '597' which is the second address of Goal Position.
3. Indirect Address 4(55) : change the value to '598' which is the third address of Goal Position.
4. Indirect Address 5(57) : change the value to '599' which is the fourth address of Goal Position.
5. Set 4 byte value 305,419,896(0x12345678) to Indirect Data 2 : Goal Position(596) also becomes 305,419,896(0x12345678) as below.

| Indirect Data Address | Goal Position Address | Saved HEX Value |
|:---------------------:|:---------------------:|:---------------:|
|          635          |          596          |      0x78       |
|          636          |          597          |      0x56       |
|          637          |          598          |      0x34       |
|          638          |          599          |      0x12       |


`Note` In order to allocate Data in the Control Table longer than 2[byte] to Indirect Address, all address must be allocated to Indirect Address like the above Example 2.
{: .notice}

`Note` Indirect Address 29 ~ 56 and Indirect Data 29 ~ 56 can only be accessed with Protocol 2.0.
{: .notice}
