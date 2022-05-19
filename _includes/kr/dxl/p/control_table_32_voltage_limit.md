동작 전압의 상한 값과 하한 값입니다.  
현재 인가된 전압을 나타내는 [Present Input Voltage(592)]가 Max Voltage Limit(32)와 Min Voltage Limit(34)의 범위를 벗어날 경우, [Hardware Error Status(518)]의 Input Voltage Error Bit(0x01)이 설정되고, Status Packet은 Error 필드를 통해서 Alert Bit(0x80)을 전송합니다.  
[Shutdown(63)]에 Input Voltage Error Bit(0x10)가 설정된 경우, [Torque Enable(512)]은 '0'(Torque OFF)으로 변경됩니다.  
자세한 설명은 [Shutdown(63)]을 참고하세요.


{% if page.ref == 'rh_p12_rna' %}
|    단위    |   범위    |
|:----------:|:---------:|
| 약 0.1 [V] | 150 ~ 300 | 
{% else %}
|    단위    |   범위    |
|:----------:|:---------:|
| 약 0.1 [V] | 150 ~ 350 | 
{% endif %}
