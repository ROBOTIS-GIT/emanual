Through External Port Data, signal on the External Port can be read or data can be written on the External Port.  
The External Port is not electrically insulated, therefore abide by the electrical specifications.  
For more accurate measurement, use shielded cable or twisted cable.  
The shorter the length, the better the result.  

![](/assets/images/dxl/x/x-series_external_port_data.png)

|   External Port Mode    | Access |                                          Details                                           |                                            Electrical Characteristics                                             |
|:-----------------------:|:------:|:------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------:|
|         Common          |   -    |                                             -                                              |                                   0 ~ 3.3[V], 0 ~ 5[mA]<br />VESD(HBM) : 2[kV]                                    |
|          0(AI)          |  Read  | Converts External Port signal to digital value<br />External Data = signal x (4,095 / 3.3) |                                         Resolution : 12[bit] (0 ~ 4,095)                                          |
|        1(DO_PP)         | Write  |      0 : Set External Port output to 0[V]<br />1 : Set External Port output to 3.3[V]      |                 Output High level(VOH) : 2.4 [V] (min)<br />Output Low level(VOL) : 0.5 [V] (max)                 |
| 2(DI_PU)<br />3 (DI_PD) |  Read  |           0: External Port input is 0[V]<br />1 : External Port input is 3.3[V]            | Input High level(VIH) : 2.3 [V] (min)<br />Input Low level(VIL) : 1.0 [V] (max)<br />Pull-Up/Down : 40 [kΩ] (typ) |

※ VESD(HBM) : ESD(Electrostatic Discharge) Voltage(human body model)

{% capture control_table_externalportdata_warning %}
The External Port is not electrically insulated, therefore, abide by the electrical specifications.  
If the electrical specification is exceeded or there is a problem with the signal connection, special caution is required because DYNAMIXEL can be damaged.  
- Be careful not to cause electric shock by static electricity (ESD), short circuit, open circuit.
- Be careful not to let water or dust get into the External Port connector.
- If you are not using the External Port, remove the cable.
- To connect or disconnect the External Port, proceed with power off.
- Do not connect the GNDext pin of External Port directly to the GND pin of DYNAMIXEL's connector. Noise from power may affect on the External Port.
{% endcapture %}

<div class="notice--warning">{{ control_table_externalportdata_warning | markdownify }}</div>
