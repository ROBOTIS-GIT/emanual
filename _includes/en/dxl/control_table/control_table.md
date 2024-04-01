{% if page.product_group=='dxl_p' %}
**WARNING** : DYNAMIXEL-P use different Control Table from DYNAMIXEL PRO series. Please pay attention when replacing DYNAMIXEL PRO with DYNAMIXEL-P.
{: .notice--warning}
{% assign torque_enable= "512" %}

{% elsif page.product_group=='dxl_pro_a' %}
**WARNING** : PRO(A) series use different Control Table from DYNAMIXEL PRO series. Please pay attention when upgrading DYNAMIXEL PRO to PRO(A).
{: .notice--warning}
{% assign torque_enable= "512" %}

{% elsif page.product_group=='dxl_y_m' %}
{% assign torque_enable= "[Torque Enable(512)]" %}
{% assign gain_save= "[Gain Save(170)]" %}


{% elsif page.product_group=='rh_p12_rna' %}
**WARNING** : RH-P12-RN(A) uses different Control Table from RH-P12-RN. Please pay attention when upgrading RH-P12-RN to RH-P12-RN(A).
{: .notice--warning}
{% assign torque_enable= "512" %}

{% elsif page.product_group=='dxl_pro' %}
{% assign torque_enable= "562" %}

{% elsif page.product_group=='dxl_mx2' %}
{% capture mx2_control_table %}
**CAUTION**
1. MX(2.0) Firmware is different from MX series' control table and address. Please check the control table address before usage.
2. MX(2.0) Firmware inherits DYNAMIXEL-X function. Therefore, it supports [DYNAMIXEL Protocol 1.0](/docs/en/dxl/protocol1/) and [DYNAMIXEL Protocol 2.0](/docs/en/dxl/protocol2/), and various Operating Modes, Secondary ID, Drive Mode, Bus Watchdog, etc. Please refer to the control table for more details.
{% endcapture %}

<div class="notice--warning">{{ mx2_control_table | markdownify }}</div>
{% assign torque_enable= "64" %}

{% elsif page.product_group=='dxl_x430' or page.product_group=='dxl_xl430' or page.product_group=='dxl_x540' or page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' %}
{% assign torque_enable= "64" %}

{% elsif page.product_group=='dxl_xl320' %}
{% assign torque_enable= "24" %}
{% assign protocol= "DYNAMIXEL Protocol 2.0" %}
{% assign data_size= "1 ~ 2" %}

{% elsif page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_mx' or page.product_group=='dxl_rx' %}
{% assign torque_enable= "24" %}
{% assign protocol= "DYNAMIXEL Protocol 1.0" %}
{% assign data_size= "1 ~ 2" %}

{% endif %}


# [Control Table](#control-table)

The DYNAMIXEL control table is how the servo stores and represents its current state, as well as all of the data required for DYNAMIXEL configuration and control. DYNAMIXEL instruction packets allow users to read and write data to and from the control table to control the servo as well as monitor device status.

## [Control Table, Data, Address](#control-table-data-address)
Each control table address is a unique value specified in Instruction Packets to access specific data in the Control Table. To read or write device data, you need to specify the corresponding address of the intended data in the Instruction Packet. For more detailed information about DYNAMIXEL packet structure, please refer to the [DYNAMIXEL Protocol 2.0] eManual page.  

**Note**: The representation of negative numbers follows the Two’s Complement rule. For a detailed explanation of Two’s Complement, please refer the Wikipedia article on "[Two's Complement]."
{: .notice}


{% if page.product_group=='dxl_y_m' %}
### [Area (EEPROM, RAM, Hybrid)](#area-eeprom-ram)
The control table is divided into three areas: EEPROM, RAM, and Hybrid. Here are the characteristics of each area:

<!-- 분홍 : #fef1e9, 파랑 : #deebf6, 초록 : #e2efd9 -->

<table>
    <tr bgcolor= "#f2f3f3">
        <td align="center"><b>Area</b></td>
        <td align="center"><b>Details</b></td>
    </tr>
    <tr>
        <td align="center" bgcolor= "#fef1e9" >EEPROM</td>
        <td>
            Values in the EEPROM area are preserved even when the power is turned off. (Memory is Non-Volatile). The values in this area can only be altered when the value of Torque Enable is set to 0.
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor= "#deebf6" >RAM</td>
        <td>
            The RAM area resets to its default values whenever power is lost (Memory is Volatile). The values in this area can be changed regardless of the value of the Torque Enable register.
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor= "#e2efd9" >Hybrid</td>
        <td>The Hybrid area retains its values even when power is turned off, and changes can be made regardless of the Torque Enable value.<br />
            When torque is disabled (Torque Enable = 0), it behaves like the EEPROM area, and values are immediately stored when changed.<br />
            When torque is enabled (Torque Enable = 1), it behaves like the RAM area. Changes are possible but not immediately stored, to save changes made in this state, use Gain Save when torque has been disabled.
        </td>
    </tr>
</table>
{% endif %}

### [Size](#size)
Data consisting of 2 bytes or more occupies multiple sequential control table registers up to 4 bytes long. When addressing control table data, the size of the control table item to be modified must be specified in the Instruction Packet to ensure proper data access.  
Serial data with 2 bytes or more is represented in the control table using the [Little Endian] rule.

### [Access Authorization](#access-authorization)
Data in the control table has two access attributes. 'RW' indicates that both reading and writing are possible. 'R' indicates a read-only attribute. Data with a read-only attribute cannot have its value changed using WRITE Instructions.  
Read-only attributes ('R') are primarily used for measurement or monitoring purposes, while read-write attributes ('RW') are used for device configuration and control.


### [Default Values](#default-values)
The default values in the EEPROM area as indicated in the manual are the initial settings of the product (factory default settings). When using the Factory Reset Instruction, any changes made by the user to the EEPROM will be reset to their default values.  
The default values in the RAM area are the values set when power is supplied to the device.

**Caution**: All data present in the EEPROM Area can only be modified when the value of {{ torque_enable }} is '0'.
{: .notice--warning}

[DYNAMIXEL Protocol 2.0]: /docs/en/dxl/protocol2/
[Two's complement]: https://en.wikipedia.org/wiki/Two%27s_complement
[Little Endian]: https://en.wikipedia.org/wiki/Endianness#Little
