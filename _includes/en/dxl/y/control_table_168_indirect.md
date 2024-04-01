Indirect Addresses allow users to restructure the layout of a DYNAMIXEL's control tables to better suit the needs of their application.
By assigning a control table item to an Indirect Address, the Indirect Data location associated with that address will represent the data in the assigned control table register.
For example, if you assign ‘513’ to Indirect Address 1(256) and write ‘1’ to Indirect Data 1(634), the LED will light up and the value of the [LED(513)] control table item will change to ‘1’. Additionally, when a value is written [LED(513)], the value of Indirect Data 1 will also be updated. In other words, by assigning an address to an Indirect Address, the Indirect Data for that address becomes a mirror of the assigned address.
{% capture indirect_ex1 %}
**Example 1** : Allocating LED(513) to Indirect Data 1(634).
1. Set Indirect Address 1(256) to ‘513’.
2. Change Indirect Data 1(634) to ‘1’ : The LED(513) value also changes to ‘1’, and the LED turns on.
3. Change Indirect Data 1(634) to ‘0’ : The LED(513) value also changes to ‘0’, and the LED turns off.

**Note** : In order to allocate more than 2 bytes of data to an indirect address, the addresses of all data must be assigned to the indirect address, as shown in 'Example 2'.
{: .notice}
{% endcapture %}

<div class="notice--success">{{ indirect_ex1 | markdownify }}</div>

One thing to note is when setting a Control Table with a length of 2 bytes or more as an Indirect Address all bytes of the Control Table Item must be designated to sequential Indirect Addresses. For instance, if you wish to set Indirect Data 2 to mirror [Goal Position(532)], you must configure it as follows:


{% capture indirect_ex2 %}
**Example 2** : To allocate 4 byte Goal Position(532) to Indirect Data 2(635), all 4 consecutive bytes must be allocated.
1. Indirect Address 2(257) : Write 532 which is the first address of Goal Position.
2. Indirect Address 3(258) : Write 533 which is the second address of Goal Position.
3. Indirect Address 4(259) : Write 534 which is the third address of Goal Position.
4. Indirect Address 5(260) : Write 535 which is the fourth address of Goal Position.
5. Write 4 byte desired position value of 250,961(0x0003D451) to Indirect Data 2 ~ 5 : The value of Goal Position(532) will reflect these changes and update to 250,961(0x0003D451).


| Indirect Data Address | Goal Position Address | Saved HEX Value |
| :-------------------: | :-------------------: | :-------------: |
| 635                   | 532                   | 0x51            |
| 636                   | 533                   | 0xD4            |
| 637                   | 534                   | 0x03            |
| 638                   | 535                   | 0x00            |
{% endcapture %}

<div class="notice--success">{{ indirect_ex2 | markdownify }}</div>


[LED(513)]: #led513
