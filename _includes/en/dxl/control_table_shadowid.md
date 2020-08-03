Set Secondary ID(12) of an unit. 

Unlike, ID(7) which should not overlap with other DYNAMIXELs, Secondary ID(12) can share the same ID to group DYNAMIXELs, and to synchronize the movement of units. 

The differences between Secondary ID(12) and ID(7) are as follows
- Secondary ID(12) is not a unique value. devices can share the same Secondary ID.
- ID(7) has a greater priority than the Secondary ID(12). If Secondary ID(12) and ID(7) has the same value, ID(7) will be applied first.
- The EEPROM area of the Control Table cannot be modified using Secondary ID(12). The RAM area can be modified only with the Secondary ID(12), .
- If Instruction Packet ID is the same as Secondary ID(12), a Status Packet will not be returned.
- If the value of Secondary ID(12) is 253 or higher, the Secondary ID function is deactivated.

|  Values   |                      Description                      |
|:---------:|:-----------------------------------------------------:|
|  0 ~ 252  |            Activate Secondary ID function             |
| 253 ~ 255 | Deactivate Secondary ID function, Default value ‘255’ |

#### [Secondary ID(12) Example](#secondary-id12-example)

See the following example of using Secondary ID(12). Note that all DYNAMAIXELs use a different ID (1 to 5)

{% if page.product_group=='dxl_xw540' %}

1. Set Secondary ID of all DYNAMIXELs to '5'.
2. Send Write Instruction Packet(ID(7) = 1, Torque Enable(64) = 1).
3. The DYNAMIXEL with ID '1' turns on its torque by the Instruction Packet, and Status Packet will be returned.
4. Send Write Instruction Packet(ID = 5, Torque Enable(64) = 1).
5. All DYNAMIXELs turns on their torque, but Status Packet of ID '5' will be returned only.
6. Set the Secondary ID of all DYNAMIXELs to ‘100’.
7. Send Write Instruction Packet(ID = 100, Torque Enable(64) = 0).
8. All DYNAMIXELs turns off their torque. As no DYNAMIXEL uses ID 100, but uses the same Secondary ID, the Status Packet will not be returned.

{% else %}

1. Set Secondary ID of all DYNAMIXELs to '5'.
2. Send Write Instruction Packet(ID(7) = 1, LED(65) = 1).
3. The DYNAMIXEL with ID '1' turns on its LED by the Instruction Packet, and Status Packet will be returned.
4. Send Write Instruction Packet(ID = 5, LED(65) = 1).
5. All DYNAMIXELs turns on their LED, but Status Packet of ID '5' will be returned only.
6. Set the Secondary ID of all DYNAMIXELs to ‘100’.
7. Send Write Instruction Packet(ID = 100, LED(65) = 0).
8. All DYNAMIXELs turns off their LED. As no DYNAMIXEL uses ID 100, but uses the same Secondary ID, the Status Packet will not be returned.

{% endif %}

<!-- 

{% if page.product_group=='dxl_xw540' %}

여러개의 다이나믹셀은 서로 같은 ID(7)를 가질 수 없지만, Secondary ID(12)는 같은 값을 가질 수 있습니다.

아래의 동작 예시를 참고 하여, ID(7)와 Secondary ID(12)의 차이점을 확인 하세요. 

1. 5개 다이나믹셀의 Secondary ID(12)를 모두 ‘5’로 동일하게 설정합니다.
2. Write Instruction Packet(ID = 1, Torque Enable(64) = 1)을 전송합니다.
3. ID(7)가 ‘1’인 다이나믹셀는 Torque를 활성화 시킨 후, Status Packet을 반환합니다.
4. Write Instruction Packet(ID = 5, Torque Enable(64) = 1)을 전송합니다.
5. 5개의 다이나믹셀는 모두 Torque를 활성화 합니다. 단, Status Packet은 ID가 ‘5’인 다이나믹셀만 반환합니다.
6. 5개 다이나믹셀의 Secondary ID(12)를 모두 ‘100’으로 동일하게 설정합니다.
7. Write Instruction Packet(ID = 100, Torque Enable(64) = 0)을 전송합니다.
8. 5개의 다이나믹셀는 모두 Torque를 비활성화 합니다. 단, 실제 ID가 ‘100’인 다이나믹셀가 없으므로 Status Packet은 반환되지 않습니다.

{% else %}

여러개의 다이나믹셀은 서로 같은 ID(7)를 가질 수 없지만, Secondary ID(12)는 같은 값을 가질 수 있습니다.

아래의 동작 예시를 참고 하여, ID(7)와 Secondary ID(12)의 차이점을 확인 하세요. 

1. 5개 다이나믹셀의 Secondary ID(12)를 모두 ‘5’로 동일하게 설정합니다.
2. Write Instruction Packet(ID = 1, LED(65) = 1)을 전송합니다.
3. ID가 ‘1’인 다이나믹셀는 LED를 켠 후, Status Packet을 반환합니다.
4. Write Instruction Packet(ID = 5, LED(65) = 1)을 전송합니다.
5. 5개의 다이나믹셀는 모두 LED를 켭니다. 단, Status Packet은 ID가 ‘5’인 다이나믹셀만 반환합니다.
6. 5개 다이나믹셀의 Secondary ID(12)를 모두 ‘100’으로 동일하게 설정합니다.
7. Write Instruction Packet(ID = 100, LED(65) = 0)을 전송합니다.
8. 8. 5개의 다이나믹셀은 모두 LED를 끕니다. 하지만 ID가 ‘100’인 다이나믹셀이 없으므로 Status Packet은 반환되지 않습니다.

{% endif %} 

-->
