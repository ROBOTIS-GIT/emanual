{% if page.product_group=='xl330' %}

To communicate with DYANMIXEL, it is important to select a proper protocol type.

The following table lists available protocol types compatible with DYNAMIXEL for communication.

Select a desired DYNAMIXEL protocol type according to your application.

|   Value    |                       Type                        |                     Descriptions                      |
| :--------: | :-----------------------------------------------: | :---------------------------------------------------: |
| 2(default) | [DYNAMIXEL Protocol 2.0](#dynamixel-protocol-20)  |       [Protocol Compatibility table]{: .popup}        |
|     20     | [Experimental S.BUS](#experimental-sbus-protocol) | Compatible with S.BUS Protocol supported RC receivers |
|     21     | [Experimental iBUS](#experimental-ibus-protocol)  | Compatible with iBUS Protocol supported RC receivers  |
|     22     |            [RC-PWM](#rc-pwm-protocol)             |             PWM signal used by RC servos              |

**WARNING**  
`Experimental S.BUS` and `Experimental iBUS` are **partially** supporting S.BUS and iBUS as an experimental protocol, and may not fully compatible with other devices.  
Please use the experimental protocols at your own risk.
{: .notice--danger}

{% capture protocol_note_01 %}
**NOTE**

- In case that a RC Protocol type (Experimental S.BUS, Experimental iBUS, RC-PWM) is set, DYNAMIXEL will switch to DYNAMIXEL Protocol 2.0 on condition that RC protocol is not detected during booting. Therefore, it is possible for DYNAMIXEL to access to its Control Table in using software such as [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/).
- If RC protocol type is detected during the booting and operates as its RC mode, DYNAMIXEL will be automatically **Torque On** status.
{% endcapture %}
<div class="notice">{{ protocol_note_01 | markdownify }}</div>

#### [DYNAMIXEL Protocol 2.0](#dynamixel-protocol-20)

DYNAMIXEL Protocol 2.0 is a basic communication protocol to communicate between DYNAMIXELs. See [Protocol 2.0] for more detailed information.

#### [Experimental S.BUS Protocol](#experimental-sbus-protocol)

The `Experimental S.BUS` supports a **partial** S.BUS Protocol, and the supported features are described in the following.
{: .notice--warning}

The S.BUS Protocol is a communication protocol commonly used in RC products. XL330 series may not fully compatible with other S.BUS devices.

- Multiple DYNAMIXELs, the maximum is 16, can be wired via signal cables. Notice that S.BUS protocol only allows for use **the range of [ID(7)] from 1 to 16**.
- The available range of data transmission is from **0 to 2,047 (11 bits)**.
- If the [Operating Mode(11)] is **Position Control Mode**, data will be passed to the [Goal Position(116)].
- If the [Operating Mode(11)] is **Velocity Mode**, data will be pased to [Goal Velocity(104)]. For your understanding, see the next graph of the control reference by the passed data via the protocol.

<img src="/assets/images/dxl/x/xl330_temp/protocol_s_bus_graph.png" width="1100">

**NOTE**: The maximum speed at the Velocity Control Mode relies on its [Velocity Limit(44)]. By configuring [Moving Threshold(24)], it is possible to set a motionless point, where The [Goal Velocity(104)] is 0.
{: .notice}

#### [Experimental iBUS Protocol](#experimental-ibus-protocol)

The `Experimental iBUS` supports a **partial** iBUS Protocol, and the supported features are described in the following.
{: .notice--warning}

The iBUS Protocol is a communication protocol commonly used in RC products. XL330 series may not fully compatible with other iBUS devices.

- Multiple DYNAMIXELs, the maximum is 14, can be wired via signal cables. Notice that the iBUS protocol only allows for use **the range of [ID(7)] from 1 to 14**.
- The available range of data transmission is from **0 to 16,383 (16 bits)**.
- If the [Operating Mode(11)] is **Position Control Mode**, data will be passed to the [Goal Position(116)].
- If the [Operating Mode(11)] is **Velocity Mode**, data will be pased to [Goal Velocity(104)]. For your understanding, see the next graph of the control reference by the passed data via the protocol.

<img src="/assets/images/dxl/x/xl330_temp/protocol_ibus_graph.png" width="1100">

**NOTE**: The maximum speed at the Velocity Control Mode relies on its [Velocity Limit(44)]. By configuring [Moving Threshold(24)], it is possible to set a motionless point, where The [Goal Velocity(104)] is 0.
{: .notice}

#### [RC-PWM Protocol](#rc-pwm-protocol)

The RC-PWM Protocol is a PWM (Pulse Width Modulation) signal generally used by RC servo products. Even if it is not possible to wire multiple DYNAMIXELs with a signal cable, this is the most-used protocol to control RC servos. The RC-PWM is the analog data with respect to time as it is the way of transmitting data by proportion of time of signal pulse width.

<img src="/assets/images/dxl/x/xl330_temp/protocol_rc_pwm_duty.png" width="550">

- If the [Operating Mode(11)] is **Position Control Mode**, data will be passed to the [Goal Position(116)].
- If the [Operating Mode(11)] is **Velocity Mode**, data will be pased to [Goal Velocity(104)]. For your understanding, see the next graph of the control reference by the passed data via the protocol.

<img src="/assets/images/dxl/x/xl330_temp/protocl_rc_pwm_graph.png" width="1100">

**NOTE**: The maximum speed at the Velocity Control Mode relies on its [Velocity Limit(44)]. By configuring [Moving Threshold(24)], it is possible to set a motionless point, where The [Goal Velocity(104)] is 0.
{: .notice}

{% else %}

DYNAMIXEL protocol type (either DYNAMIXEL Protocol 1.0 or 2.0) can be selected using Protocol Type(13).

It is recommended to use an identical protocol type for multiple DYNAMIXEL.

|   Value    |      Description       |                             Compatible DYNAMIXEL                              |
| :--------: | :--------------------: | :---------------------------------------------------------------------------: |
|     1      | DYNAMIXEL Protocol 1.0 | AX Series, DX Series, RX Series, EX Series, MX Series with Firmware below v39 |
| 2(default) | DYNAMIXEL Protocol 2.0 |         MX-28/64/106 with Firmware v39 or above, X Series, PRO Series         |

**WARNING** : To modify the data of Protocol Type(13), use the [DYNAMIXEL Wizard 2.0] as R+ Manager 2.0 is not compatible with the Protocol 1.0 products.
{: .notice--warning}

**NOTE** : The protocol 2.0 is more stable and safety for use than Protocol 1.0. Accessing some of the Control Table area might be denied if protocol 1.0 is selected. This manual complies with protocol 2.0. Please refer to the [Protocol 1.0] and [Protocol 2.0] of e-Manual for more details about the protocol.
{: .notice}

**NOTE** : Please refer to the [Protocol Compatibility table]{: .popup} for product.
{: .notice}

{% endif %}

[protocol compatibility table]: /docs/en/popup/faq_protocol_compatibility_table/
[dynamixel wizard 2.0]: /docs/en/software/dynamixel/dynamixel_wizard2/
