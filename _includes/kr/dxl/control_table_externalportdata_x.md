External Port Data를 통해서 External Port의 신호를 제어하거나, External Port 신호의 상태를 확인할 수 있습니다.  
External Port는 전기적으로 절연되어 있지 않기 때문에, 전기적 사양을 준수하시기 바랍니다.  
쉴드 케이블(Shield cable)이나 트위스트 케이블(Twist pair cable)을 사용하실 경우, 보다 정밀한 측정이 가능합니다.  케이블 길이는 짧을수록 정밀한 측정에 유리합니다.

![](/assets/images/dxl/x/x-series_external_port_data.png)

|External Port Mode|Access|상세|전기적 특성|
| :---: | :---: | :---: | :---: |
|Common|-|-|0 ~ 3.3 [V], 0 ~ 5 [mA]<br />V<sub>ESD(HBM)</sub> : 2 [kV]|
|0(AI)|Read|External Port 신호(signal)를 Digital로 변환<br />External Data = signal x (4,095 / 3.3)|Resolution : 12Bit (0 ~ 4,095)|
|1(DO_PP)|Write|0 : External Port의 출력을 0 [V]로 변경<br />1 : External Port의 출력을 3.3 [V]로 변경|Output High level(VOH) : 2.4 [V] (min)<br />Output Low level(VOL) : 0.5 [V] (max)|
|2(DI_PU)<br />3 (DI_PD)|Read|0 : External Port의 입력이 0 [V]<br />1 : External Port의 입력이 3.3 [V]|Input High level(VIH) : 2.3 [V] (min)<br />Input Low level(VIL) : 1.0 [V] (max)<br />Pull-Up/Down : 40 [kΩ] (typ)|

※ V<sub>ESD(HBM)</sub> : ESD(Electrostatic Discharge) Voltage(human body model)

{% capture control_table_externalportdata_warning %}
**주의** : External Port는 전기적으로 절연되어 있지 않기 때문에, 전기적 사양을 준수하시기 바랍니다. 전기적 사양을 초과하거나 신호 연결에 문제가 있는 경우, 장치가 손상될 수 있으므로 각별한 주의가 요구됩니다. External Port를 사용할 때 다음 사항들을 주의하시기 바랍니다.
- 정전기(ESD), 단락(Short circuit), 단선(Open circuit) 등에 의한 전기적인 충격이 발생되지 않도록 주의해 주십시오.
- External Port 커넥터로 물이나 먼지가 유입되지 않도록 주의해 주십시오.
- External Port를 사용하지 않을 때는, 케이블을 제거해 주십시오.
- External Port에 신호를 연결/해제는, 전원이 꺼진 상태에서 진행해주십시오.
- External Port의 GND<sub>ext</sub> 핀과 커넥터의 GND핀을 직접 연결하지 마십시오. 전원 노이즈가 External Port로 유입될 수 있습니다.
{% endcapture %}

<div class="notice--warning">{{ control_table_externalportdata_warning | markdownify }}</div>
