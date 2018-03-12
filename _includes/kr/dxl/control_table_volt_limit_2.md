
동작 전압의 상한 값과 하한 값입니다.  
다이나믹셀에 현재 인가된 전압을 나타내는 Present Input Voltage(144)가 Max Voltage Limit(32)와 Min Voltage Limit(34)의 범위를 벗어날 경우, Hardware Error Status(70)의 Voltage Range Error Bit(0x01)이 설정되고, Status Packet은 Error 필드를 통해서 Hardware Error Bit(0x80)을 전송합니다.  
Shutdown(63)에 Input Voltage Error Bit(0x10)가 설정된 경우, Torque Enable(64)은 ‘0’이 되고 Torque가 OFF 됩니다.  
자세한 설명은 [Shutdown(63)](#shutdown63)을 참고하세요.

|단위|범위|상세 설명|
| :---: | :---: | :---: |
|약 0.1V|95 ~ 160|9.5 ~ 16.0V|
