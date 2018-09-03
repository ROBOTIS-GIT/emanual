
동작 온도의 상한 값입니다.  
장치의 현재 내부온도를 나타내는 Present Temperature(146)가 Temperature Limit(31)보다 높아지면 Hardware Error Status(70)의 Over Heating Error Bit(0x04)가 설정되고, Status Packet은 Error 필드를 통해서 Hardware Error Bit(0x80)을 전송합니다.  
Shutdown(63)에 Overheating Error Bit(0x04)가 설정된 경우, Torque Enable(64)은 ‘0’이 되고 Torque가 OFF됩니다.  
자세한 설명은 [Shutdown(63)](#shutdown63)을 참고하세요.

|단위|범위|상세 설명|
| :---: | :---: | :---: |
|약 1 [&deg;]|0 ~ 100|0 ~ 100 [&deg;]|

**주의** : 온도 상한선을 초기값보다 높게 설정하지 마십시오. 온도 알람셧다운 발생시 20분이상 휴식하여 장치의 온도를 충분히 낮춘후 사용해 주세요. 온도가 높은상태에서 사용시 제품이 손상될 수 있습니다.
{: .notice--warning}
