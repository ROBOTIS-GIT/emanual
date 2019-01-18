# [Control Table](#control-table)
The Control Table is a structure of data implemented in the device. Users can read a specific Data to get status of the device with Read Instruction Packets, and modify Data as well to control the device with WRITE Instruction Packets.

{% assign protocol= "Protocol 2.0" %}
{% assign data_size= "1 ~ 4" %}

{% if page.product_group=='dxl_pro_plus' %}
**WARNING** : PRO+ series use different Control Table from PRO series. Please pay attention when replacing PRO with PRO+.
{: .notice--warning}
{% assign torque_enable= "512" %}

{% elsif page.product_group=='dxl_pro_a' %}
**WARNING** : PRO(A) series use different Control Table from PRO series. Please pay attention when upgrading PRO to PRO(A).
{: .notice--warning}
{% assign torque_enable= "512" %}

{% elsif page.product_group=='dxl_pro' %}
{% assign torque_enable= "562" %}

{% elsif page.product_group=='dxl_mx2' %}
{% capture mx2_control_table %}
**CAUTION**
1. MX(2.0) Firmware is different from MX series' control table and address. Please check the control table address before usage.
2. MX(2.0) Firmware inherits Dynamixel X's function. Therefore, it supports [Protocol 1.0](/docs/en/dxl/protocol1/) and [Protocol 2.0](/docs/en/dxl/protocol2/), and various Operating Modes, Secondary ID, Drive Mode, Bus Watchdong, etc. Please refer to the control table for more details.
{% endcapture %}

<div class="notice--warning">{{ mx2_control_table | markdownify }}</div>
{% assign torque_enable= "64" %}

{% elsif page.product_group=='dxl_x' %}
{% assign torque_enable= "64" %}

{% elsif page.product_group=='dxl_xl320' %}
{% assign torque_enable= "24" %}
{% assign protocol= "Protocol 2.0" %}
{% assign data_size= "1 ~ 2" %}

{% elsif page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_mx' or page.product_group=='dxl_rx' %}
{% assign torque_enable= "24" %}
{% assign protocol= "Protocol 1.0" %}
{% assign data_size= "1 ~ 2" %}

{% endif %}

## [Control Table, Data, Address](#control-table-data-address)
The Control Table is a structure that consists of multiple Data fields to store status or to control the device. Users can check current status of the device by reading a specific Data from the Control Table with Read Instruction Packets. WRITE Instruction Packets enable users to control the device by changing specific Data in the Control Table. The Address is a unique value when accessing a specific Data in the Control Table with Instruction Packets. In order to read or write data, users must designate a specific Address in the Instruction Packet. Please refer to [{{ protocol }}] for more details about Instruction Packets.

**NOTE** : Two's complement is applied for the negative value. For more information, please refer to [Two's complement] from Wikipedia.
{: .notice}

### [Area (EEPROM, RAM)](#area-eeprom-ram)
The Control Table is divided into 2 Areas. Data in the RAM Area is reset to initial values when the power is reset(Volatile). On the other hand, data in the EEPROM Area is maintained even when the device is powered off(Non-Volatile).  
**Data in the EEPROM Area can only be written to if Torque Enable({{ torque_enable }}) is cleared to ‘0’(Off).**

### [Size](#size)
The Size of data varies from {{ data_size }} bytes depend on their usage. Please check the size of data when updating the data with an Instruction Packet. For data larger than 2 bytes will be saved according to [Little Endian].

### [Access](#access)
The Control Table has two different access properties. ‘RW’ property stands for read and write access permission while ‘R’ stands for read only access permission. Data with the read only property cannot be changed by the WRITE Instruction. Read only property(‘R’) is generally used for measuring and monitoring purpose, and read write property(‘RW’) is used for controlling device.

### [Initial Value](#initial-value)
Each data in the Control Table is restored to initial values when the device is turned on. Default values in the EEPROM area are initial values of the device (factory default settings). If any values in the EEPROM area are modified by a user, modified values will be restored as initial values when the device is turned on. Initial Values in the RAM area are restored when the device is turned on.

[Protocol 1.0]: /docs/en/dxl/protocol1/
[Protocol 2.0]: /docs/en/dxl/protocol2/
[Two's complement]: https://en.wikipedia.org/wiki/Two%27s_complement
[Little Endian]: https://en.wikipedia.org/wiki/Endianness#Little
