{% if page.product_group=='xl330' or page.product_group=='xc330' %}
The Indirect Address registers allow the assignment of other RAM area control table items to registers in the Indirect Data region. This allows users to map multiple control table items needed for their application to sequential memory addresses to improve Instruction Packet efficiency.
If a specific address is allocated an Indirect Address, the corresponding Indirect Data register inherits all the features and properties of the assigned control table address. These properties include Size (Byte length), value range, and Access properties (Read Only, Read/Write). For instance, if 65 (LED) is allocated to Indirect Address 1(168), Indirect Data 1(208) will take on the properties of the [LED(65)] register. 

**NOTE**: Only addresses in the [RAM area (Address 64 ~ 227)](#control-table-of-ram-area) of the control table may be assigned to Indirect Addresses.
{: .notice}

| Indirect Address Range | Description                                                                           |
|:-----------------------:|:--------------------------------------------------------------------------------------|
| 64 ~ 227               | [EEPROM](#control-table-of-eeprom-area) addresses can't be assigned an Indirect Address |

#### [Indirect Address and Indirect Data Examples](#indirect-address-and-indirect-data-examples)

`Example 1` Allocating [LED(65)] to Indirect Data 1(208).
1. Indirect Address 1(168) : change the value to '65.
2. Set Indirect Data 1(208) to ‘1’ : LED(65) is also set to '1' and the LED turns on.
3. Set Indirect Data 1(208) to ‘0’ : LED(65) is also set to ‘0’ and the LED turns off.

`Example 2` Allocating [Goal Position(116)] to Indirect Data 2(225), 4 sequential bytes have to be allocated.
1. Indirect Address 2(170) : change the value to '116' which is the first address of Goal Position.
2. Indirect Address 3(172) : change the value to '117' which is the second address of Goal Position.
3. Indirect Address 4(174) : change the value to '118' which is the third address of Goal Position.
4. Indirect Address 5(176) : change the value to '119' which is the fourth address of Goal Position.
5. Write the 4 byte value '1,024' to Indirect Data 2 : [Goal Position(116)] also becomes '1024' and the DYNAMIXEL moves.

**NOTE** : In order to allocate Data in the Control Table longer than 2[byte] to Indirect Addresses, all addresses must be allocated to Indirect Address like Example 2 above.
{: .notice}

{% else %}

The Indirect Address registers allow the assignment of other RAM area control table items to registers in the Indirect Data region. This allows users to map multiple control table items needed for their application to sequential memory addresses to improve Instruction Packet efficiency.
If a specific address is allocated an Indirect Address, the corresponding Indirect Data register inherits all the features and properties of the assigned control table address. These properties include Size (Byte length), value range, and Access properties (Read Only, Read/Write). For instance, if 65 (LED) is allocated to Indirect Address 1(168), Indirect Data 1(208) will take on the properties of the [LED(65)] register. 

**NOTE**: Only addresses in the [RAM area (Address 64 ~ 227)](#control-table-of-ram-area) of the control table may be assigned to Indirect Addresses.
{: .notice}

| Indirect Address Range | Description                                                                           |
|:-----------------------:|:--------------------------------------------------------------------------------------|
| 64 ~ 661               | [EEPROM](#control-table-of-eeprom-area) addresses can't be assigned an Indirect Address |

#### [Indirect Address and Indirect Data Examples](#indirect-address-and-indirect-data-examples)

<<<<<<< HEAD
`Example 1` Allocating [LED(65)] to Indirect Data 1(224).
1. Change the value of Indirect Address 1(168) to '65' which is the address used for LED control.
2. Set Indirect Data 1(224) to ‘1’, LED(65) also changes to '1' and the LED is turned on.
3. Set Indirect Data 1(224) to ‘0’, LED(65) also changes to ‘0’ and the LED is turned off.

`Example 2` Allocating [Goal Position(116)] to Indirect Data 2(225), 4 sequential bytes have to be allocated.
=======
`Example 1` Allocating Size 1 byte [LED(65)] to Indirect Data 1(224).
1. Indirect Address 1(168) : change the value to '65' which is the address of LED.
2. Set Indirect Data 1(224) to ‘1’ : LED(65) also becomes '1' and LED is turned on.
3. Set Indirect Data 1(224) to ‘0’ : LED(65) also becomes ‘0’ and LED is turned off.

{% if page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430'%}
**NOTE**: XW series does not use [LED(65)].
{: .notice}
{% endif %}

`Example 2` Allocating Size 4 byte [Goal Position(116)] to Indirect Data 2(225), 4 sequential bytes have to be allocated.
>>>>>>> aae312bc64c47aeeed478e1d589438e2bc5883ee
1. Indirect Address 2(170) : change the value to '116' which is the first address of Goal Position.
2. Indirect Address 3(172) : change the value to '117' which is the second address of Goal Position.
3. Indirect Address 4(174) : change the value to '118' which is the third address of Goal Position.
4. Indirect Address 5(176) : change the value to '119' which is the fourth address of Goal Position.
5. Set 4 byte value '1,024' to Indirect Data 2 : [Goal Position(116)] also becomes '1024' and DYNAMIXEL moves.


**NOTE** : In order to allocate Data in the Control Table longer than 2[byte] to Indirect Address, all address must be allocated to Indirect Address like the above Example 2.
{: .notice}

**NOTE** : Indirect Address 29 ~ 56 and Indirect Data 29 ~ 56 can only be accessed with [Protocol 2.0].
{: .notice}

{% endif %}
