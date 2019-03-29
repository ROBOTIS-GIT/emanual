External ports that can be used for various purposes are provided.  
The property of each port is configured by the External Port Mode (56 ~ 59) and data of external port is controlled by the External Port Data(600 ~ 607).  
The signal of External Port can be controlled or checked via External Port Data.  
The External Port is not electrically insulated, therefore, abide by the electrical specifications.  
Shielded cable or twisted paired cable reduces signal noise and error.  
Shorter cable increases accuracy of the measurement.

| Item  | Description                               |
| :---: | :--------------------------------: |
| Voltage  | 0 ~ 3.3 [V]<br />VESD(HBM) : 2[kV] |
| Current  | 0 ~ 5 [mA]                         |

※ VESD(HBM) : ESD(Electrostatic Discharge) Voltage(human body model)

| Function                     | External Port Mode      | External Port Data                                                                      | Access  | Details                                                                                                            |
| :----------------------  | :---------------------: | :-------------------------------------------------------------------------------------  | :----: | :-------------------------------------------------------------------------------------------------------------: |
| Analogue Input           | 0                       | Converts External Port signal to digital value<br />External Data = signal x (4,095 / 3.3) | R      | Resolution : 12[bit] (0 ~ 4,095)                                                                                |
| Digital Output Push-Pull | 1                       | 0 : Set External Port output to 0[V]<br />1 : Set External Port output to 3.3[V]    | W      | Output High level(VOH) : 2.4 [V] (min)<br />Output Low level(VOL) : 0.5 [V] (max)                               |
| Digital Input Pull-Up    | 2                       | 0 : External Port input is 0[V]<br />1 : External Port input is 3.3[V] or Open        | R      | Input High level(VIH) : 2.3 [V] (min)<br />Input Low level(VIL) : 1.0 [V] (max)<br />Pull-Up : 40 [k&Omega;] (typ)   |
| Digital Input Pull-Down  | 3 (Default)              | 0 : External Port input is 0[V] or Open <br />1 : External Port input is 3.3[V]       | R      | Input High level(VIH) : 2.3 [V] (min)<br />Input Low level(VIL) : 1.0 [V] (max)<br />Pull-Down : 40 [k&Omega;] (typ) |

{% capture control_table_externalportdata_warning %}
**WARNING** : The External Port is not electrically insulated, therefore, abide by the electrical specifications.  
If the electrical specification is exceeded or there is a problem with the signal connection, special caution is required because DYNAMIXEL can be damaged.  
- Be careful not to cause electric shock by static electricity (ESD), short circuit, open circuit.
- Be careful not to let water or dust get into the External Port connector.
- If you are not using the External Port, remove the cable.
- To connect or disconnect the External Port, proceed with power off.
- Do not connect the GNDext pin of External Port directly to the GND pin of DYNAMIXEL connector. Noise from power may affect on the External Port.
{% endcapture %}

<div class="notice--danger">{{ control_table_externalportdata_warning | markdownify }}</div>

#### External expansion port location and pin function
Remove bolts and cover plate to reveal External Port connector.

{% if page.ref=='rh_p12_rn' or page.ref=='rh_p12_rna' %}
![](/assets/images/platform/rh_p12_rn/rh_p12_rn_external_port.png)
{% elsif page.product_group=='dxl_pro_a' %}
![](/assets/images/dxl/pro/pro_external_port.png)
{% else %}
![](/assets/images/dxl/pro_plus/external_port.png)
{% endif %}

![](/assets/images/dxl/pro_plus/external_port_pinout.png)

| Pin 1 | Pin 2 | Pin 3 | Pin 4 | Pin 5 | Pin 6 |
|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|  GND  | 3.3V  | PORT1 | PORT2 | PORT3 | PORT4 |
