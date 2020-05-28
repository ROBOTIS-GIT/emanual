
다이나믹셀의 Secondary ID를 설정합니다. Secondary ID(12)는 ID(7)과 동일하게 장치를 식별하기 위한 번호로 사용됩니다.  

- 다수의 장치가 동일한 Secondary ID 값을 가질 수 있습니다. 동일한 Secondary ID 값을 갖은 장치들은 하나의 그룹을 형성하게 됩니다.
- Secondary ID(12)보다 ID(7)의 우선순위가 높습니다. 따라서 Secondary ID(12)와 ID(7)의 값이 같을 경우, ID(7)가 우선적으로 적용됩니다.
- Secondary ID(12)는 컨트롤테이블의 EEPROM 영역에서 설정된 값을 변경할 수 없습니다. RAM 영역만 변경이 가능합니다.
- Instruction Packet의 ID가 Sencodary ID(12)와 같은 경우, Status Packet을 반환하지 않습니다.
- Secondary ID(12)의 값이 253 이상인 경우, Secondary ID 기능은 비활성화 됩니다.

|    값     |                 세부 설명                 |
|:---------:|:-----------------------------------------:|
|  0 ~ 252  |         Secondary ID 기능 활성화          |
| 253 ~ 255 | Secondary ID 기능 비활성화, 초기값: ‘255’ |

#### [동작 예시](#동작-예시)

{% if page.product_group=='dxl_xw540' %}

다음은 Secondary ID가 5로 설정된 5개 장치의 동작 예시입니다. 각 장치의 설정된 ID(7)의 값은 모두 다릅니다.

1. 5개 장치의 Secondary ID(12)를 모두 ‘5’로 동일하게 설정합니다.
2. Write Instruction Packet(ID = 1, Torque Enable(64) = 1)을 전송합니다.
3. ID(7)가 ‘1’인 장치는 Torque를 활성화 시킨 후, Status Packet을 반환합니다.
4. Write Instruction Packet(ID = 5, Torque Enable(64) = 1)을 전송합니다.
5. 5개의 장치는 모두 Torque를 활성화 합니다. 단, Status Packet은 ID가 ‘5’인 장치만 반환합니다.
6. 5개 장치의 Secondary ID(12)를 모두 ‘100’으로 동일하게 설정합니다.
7. Write Instruction Packet(ID = 100, Torque Enable(64) = 0)을 전송합니다.
8. 5개의 장치는 모두 Torque를 비활성화 합니다. 단, 실제 ID가 ‘100’인 장치가 없으므로 Status Packet은 반환되지 않습니다.

{% else %}

다음은 Secondary ID가 5로 설정된 5개 장치의 동작 예시입니다. 각 장치의 설정된 ID(7)의 값은 모두 다릅니다.

1. 5개 장치의 Secondary ID(12)를 모두 ‘5’로 동일하게 설정합니다.
2. Write Instruction Packet(ID = 1, LED(65) = 1)을 전송합니다.
3. ID가 ‘1’인 장치는 LED를 켠 후, Status Packet을 반환합니다.
4. Write Instruction Packet(ID = 5, LED(65) = 1)을 전송합니다.
5. 5개의 장치는 모두 LED를 켭니다. 단, Status Packet은 ID가 ‘5’인 장치만 반환합니다.
6. 5개 장치의 Secondary ID(12)를 모두 ‘100’으로 동일하게 설정합니다.
7. Write Instruction Packet(ID = 100, LED(65) = 0)을 전송합니다.
8. 5개의 장치는 모두 LED를 끕니다. 단, 실제 ID ‘100’인 장치가 없으므로 Status Packet은 반환되지 않습니다.

{% endif %}
