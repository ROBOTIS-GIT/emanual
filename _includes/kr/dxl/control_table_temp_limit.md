
동작 온도의 상한 값입니다.  
예를 들어, 값이 80이면 80 &deg;C 입니다.
내부 온도가 Temperature Limit(11)을 넘으면 Status Packet은 ERROR 필드를 통해서 Overheating Error Bit (Bit2)를 전송합니다. [Alarm LED(17)/Shutdown(18)](#alarm-led17-shutdown18)의 플래그(flag)중 과열(Overheating)이 설정되어 있다면 Alarm LED가 점멸하고, 모터 출력은 0 [%]로 변경됩니다.

|     단위      |  범위   |
|:-------------:|:-------:|
| 약 1 [&deg;C] | 0 ~ 100 |

**주의** : 온도 상한선을 기본값보다 높게 설정하지 마십시오. 온도 알람셧다운 발생시 20분이상 휴식하여 장치의 온도를 충분히 낮춘후 사용해 주세요. 온도가 높은상태에서 사용시 제품이 손상될 수 있습니다.
{: .notice--warning}
