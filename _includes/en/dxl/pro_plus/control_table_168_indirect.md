Indirect Address and Indirect Data are useful when accessing multiple remote addresses in the Control Table as sequential addresses. Sequential address increases the efficiency of Instruction Packet. Addresses that can be defined as Indirect Address are limited to RAM area(Address 512 ~ 606).
If specific address is allocated to Indirect Address, Indirect Address inherits features and properties of the Data from the specific Address. Property includes Size(Byte length), value range, and Access property(Read Only, Read/Write).  
For instance, allocating 513(which is the Address of red LED) to Indirect Address 1(168) and writing 255 to the Indirect Data 1(634) will turn on the red LED. The actual value of LED Red(513) will also be set as 255.  
If a specific item has address longer than 2 byte, each address byte has to be sequentially configured in the Indirect Address.

{% capture indirect_ex1 %}
**Example 1** : Allocating 1 byte LED Red(513) to Indirect Data 1(634).
1. Indirect Address 1(168) : write `513` which is the address of LED Red.
2. Set Indirect Data 1(634) to `255` : The value of LED Red(513) will automatically set as `255` and LED will be turned on.
3. Set Indirect Data 1(634) to `0` : The value of LED Red(513) will automatically set as `0` and LED will be turned off.
{% endcapture %}

<div class="notice--success">{{ indirect_ex1 | markdownify }}</div>

{% capture indirect_ex2 %}
**Example 2** : To allocate 4 byte Goal Position(564) to Indirect Data 2(635), 4 sequential bytes have to be allocated.
1. Indirect Address 2(170) : Write `564` which is the first address of Goal Position.
2. Indirect Address 3(172) : Write `565` which is the second address of Goal Position.
3. Indirect Address 4(174) : Write `566` which is the third address of Goal Position.
4. Indirect Address 5(176) : Write `567` which is the fourth address of Goal Position.
5. Write 4 byte desired position value of 250,961(0x0003D451) to Indirect Data 2 ~ 5 : The value of Goal Position(564) will reflect these changes and set as 0x0003D451 as shown below(Little Endian).

| Indirect Data Address | Goal Position Address | Saved HEX Value |
|:---------------------:|:---------------------:|:---------------:|
|          635          |          564          |      0x51       |
|          636          |          565          |      0xD4       |
|          637          |          566          |      0x03       |
|          638          |          567          |      0x00       |
{% endcapture %}

<div class="notice--success">{{ indirect_ex2 | markdownify }}</div>

**NOTE** : In order to allocate Data in the Control Table longer than 2[byte] to Indirect Address, all address must be allocated to Indirect Address like the above Example 2.
{: .notice}
