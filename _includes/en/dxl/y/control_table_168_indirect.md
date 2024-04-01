By utilizing this function, users can collect and use the necessary control tables.  
If you set a specific address in the Indirect Address Table, the Indirect Data Table will have the same function as the specified address.  
For example, if you input ‘513’ in Indirect Address 1(256) and ‘1’ in Indirect Data 1(634), the LED lights up. The value of the [LED(513)] is also written as ‘1’.  
Additionally, when a value is written to the [LED(513)], the value of Indirect Data 1 also changes correspondingly. If you set a specific address in the Indirect Address, Indirect Data becomes the same table.  
One thing to note is when setting a Control Table with a length of 2 bytes or more as an Indirect Address.  
For normal operation, all bytes of the Control Table Item must be designated as an Indirect Address. For instance, if you wish to use Indirect Data 2 as [Goal Position(532)], you must configure it as follows.

{% capture indirect_ex1 %}
**Example 1** : Allocating 1 byte LED(513) to Indirect Data 1(634).
1. Indirect Address 1(256) : Change the address value of the LED to ‘513’.
2. Change Indirect Data 1(634) to ‘1’ : The LED(513) value also changes to ‘1’, and the LED turns on.
3. Change Indirect Data 1(634) to ‘0’ : The LED(513) value also changes to ‘0’, and the LED turns on.
{% endcapture %}

<div class="notice--success">{{ indirect_ex1 | markdownify }}</div>

{% capture indirect_ex2 %}
**Example 2** : To allocate 4 byte Goal Position(532) to Indirect Data 2(635), all 4 consecutive bytes must be allocated.
1. Indirect Address 2(257) : Write 532 which is the first address of Goal Position.
2. Indirect Address 3(258) : Write 533 which is the second address of Goal Position.
3. Indirect Address 4(259) : Write 534 which is the third address of Goal Position.
4. Indirect Address 5(260) : Write 535 which is the fourth address of Goal Position.
5. Write 4 byte desired position value of 250,961(0x0003D451) to Indirect Data 2 ~ 5 : The value of Goal Position(532) will reflect these changes and set as 250,961(0x0003D451).

| Indirect Data Address | Goal Position Address | Saved HEX Value |
| :-------------------: | :-------------------: | :-------------: |
| 635                   | 532                   | 0x51            |
| 636                   | 533                   | 0xD4            |
| 637                   | 534                   | 0x03            |
| 638                   | 535                   | 0x00            |
{% endcapture %}

<div class="notice--success">{{ indirect_ex2 | markdownify }}</div>

**Note** : In order to allocate more than 2 bytes of data to an indirect address, the addresses of all data must be assigned to the indirect address, as shown in 'Example 2'.
{: .notice}

[LED(513)]: #led513