
현재 공급되고 있는 전압입니다.
이 값의 단위는 0.1 [V]입니다. 예를 들어, 값이 100(0x64)이면 10 [V]입니다.

만약 Present Voltage(42)값이 범위를 벗어나게 되면 Status Packet의 Voltage Range Error Bit(Bit0)이 '1'이 되며 Alarm(Address 17)이 '1'로 설정되고 Alarm Shutdown(Address 18)의 0번 비트가 1로 설정됩니다.
