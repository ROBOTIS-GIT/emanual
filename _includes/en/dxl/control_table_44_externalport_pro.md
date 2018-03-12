External ports that can be used for various purposes are provided.  
The property of each port is configured by the External Port Mode (44, 45, 46, 47) and data of external port is controlled by the External Port Data(626, 628, 630, 632).

|External Port Mode|Mode|Description|
| :---: | :---: | :---: |
|0|AI(Analogue Input)|Converts External Port signal to 12[bit] digital value|
|1|DO_PP(Digital Output Push-Pull)|Use External Port as a digital output port(3.3V level)|
|2|DI_PU(Digital Input Pull-Up)|Use External Port as a digital input port<br />Floating connection will be considered as '1'|
|3(default)|DI_PD(Digital Input Pull-Down)|Use External Port as a digital input port<br />Floating connection will be considered as '0'|

|External Port Mode|Access|Details|Electrical Characteristics|
| :---: | :---: | :---: | :---: |
|Common|-|-|0 ~ 3.3[V], 0 ~ 5[mA]<br />VESD(HBM) : 2[kV]|
|0(AI)|Read|Converts External Port signal to digital value<br />External Data = signal x (4,095 / 3.3)|Resolution : 12[bit] (0 ~ 4,095)|
|1(DO_PP)|Write|0 : Set External Port output to 0[V]<br />1 : Set External Port output to 3.3[V]|Output High level(VOH) : 2.4 [V] (min)<br />Output Low level(VOL) : 0.5 [V] (max)|
|2(DI_PU)<br />3 (DI_PD)|Read|0: External Port input is 0[V]<br />1 : External Port input is 3.3[V]|Input High level(VIH) : 2.3 [V] (min)<br />Input Low level(VIL) : 1.0 [V] (max)<br />Pull-Up/Down : 40 [kΩ] (typ)|

※ VESD(HBM) : ESD(Electrostatic Discharge) Voltage(human body model)

{% capture control_table_externalportdata_warning %}
The External Port is not electrically insulated, therefore, abide by the electrical specifications.  
If the electrical specification is exceeded or there is a problem with the signal connection, special caution is required because DYNAMIXEL can be damaged.  
- Be careful not to cause electric shock by static electricity (ESD), short circuit, open circuit.
- Be careful not to let water or dust get into the External Port connector.
- If you are not using the External Port, remove the cable.
- To connect or disconnect the External Port, proceed with power off.
- Do not connect the GNDext pin of External Port directly to the GND pin of DYNAMIXEL connector. Noise from power may affect on the External Port.
{% endcapture %}

<div class="notice--warning">{{ control_table_externalportdata_warning | markdownify }}</div>

#### External expansion port location and pin function
Remove bolts and cover plate to reveal External Port connector.

![](/assets/images/dxl/pro/pro_external_port.png)

![](/assets/images/dxl/pro/pro_external_port_pinout.png)

|Pin 1|Pin 2|Pin 3|Pin 4|Pin 5|Pin 6|
| :---: | :---: | :---: | :---: | :---: | :---: |
|GND|3.3V|PORT1|PORT2|PORT3|PORT4|
