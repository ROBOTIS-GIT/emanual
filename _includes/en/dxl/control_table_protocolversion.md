Users can select Dynamixel protocol version (1.0 and 2.0).  
Even if Protocol 1.0 is selected, Protocol 2.0 Control Table will be used.  
It is recommended to use an identical protocol version for multiple Dynamixels.

|   Value    | Protocol Version |                             Compatible Dynamixels                             |
|:----------:|:----------------:|:-----------------------------------------------------------------------------:|
|     1      |       1.0        | AX Series, DX Series, RX Series, EX Series, MX Series with Firmware below v39 |
| 2(default) |       2.0        |         MX-28/64/106 with Firmware v39 or above, X Series, Pro Series         |


**WARNING** : In order to change the Protocol Type to Protocol 1.0, please use DYNAMIXEL Wizard 2.0 as R+ Manager 2.0 does not support Protocol 1.0.
{: .notice--warning}


**NOTE** : The protocol 2.0 is greatly enhanced from the protocol 1.0. Accessing some of the Control Table area might be denied if protocol 1.0 is selected. This manual complies with protocol 2.0. Please refer to the [Protocol 1.0] and [Protocol 2.0] of e-Manual for more details about the protocol.
{: .notice}

**NOTE** : Please refer to the [Protocol Compatibility table]{: .popup} for product.
{: .notice}

[Protocol 1.0]: /docs/en/dxl/protocol1/
[Protocol 2.0]: /docs/en/dxl/protocol2/
[Protocol Compatibility table]: /docs/en/popup/faq_protocol_compatibility_table/
