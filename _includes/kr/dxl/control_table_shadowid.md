다이나믹셀의 Secondary ID를 할당 합니다. 

다른 다이나믹셀과 겹치지 않아야 하는 [ID(7)]와 달리 Secondary ID (12)는 동일한 ID를 공유하여 다이나믹셀을 그룹화하고, 움직임을 동기화 할 수 있습니다.

- 다수의 다이나믹셀은 동일한 Secondary ID 값을 가지고, 하나의 그룹을 형성합니다.
- Secondary ID(12)보다 ID(7)의 우선순위가 높습니다. 따라서 Secondary ID(12)와 ID(7)의 값이 같을 경우, ID(7)가 우선적으로 적용됩니다.
- Secondary ID(12)는 [컨트롤테이블](#컨트롤-테이블)의 [EEPROM 영역](#eeprom-영역)에서 설정된 값을 변경할 수 없습니다. [RAM 영역](#ram-영역)만 변경이 가능합니다.
- Instruction Packet의 ID가 Sencodary ID(12)와 같은 경우, Status Packet을 반환하지 않습니다.
- Secondary ID(12)의 값이 253 이상인 경우, Secondary ID 기능은 비활성화 됩니다.

|    값     |                 세부 설명                 |
|:---------:|:-----------------------------------------:|
|  0 ~ 252  |         Secondary ID 기능 활성화          |
| 253 ~ 255 | Secondary ID 기능 비활성화, 초기값: ‘255’ |

#### [Secondary ID(12) 동작 예시](#secondary-id12-동작-예시)

{% if page.product_group=='dxl_xw540' %}

여러개의 다이나믹셀은 서로 같은 [ID(7)]를 가질 수 없지만, Secondary ID(12)는 같은 값을 가질 수 있습니다.

아래의 동작 예시를 참고 하여, ID(7)와 Secondary ID(12)의 차이점을 확인 하세요. 

1. 5개 다이나믹셀의 Secondary ID(12)를 모두 ‘5’로 동일하게 설정합니다.
2. Write Instruction Packet([ID(7)] = 1, [Torque Enable(64)] = 1)을 전송합니다.
3. ID(7)가 ‘1’인 다이나믹셀는 Torque를 활성화 시킨 후, Status Packet을 반환합니다.
4. Write Instruction Packet([ID(7)] = 5, [Torque Enable(64)] = 1)을 전송합니다.
5. 5개의 다이나믹셀는 모두 Torque를 활성화 합니다. 단, Status Packet은 ID가 ‘5’인 다이나믹셀만 반환합니다.
6. 5개 다이나믹셀의 Secondary ID(12)를 모두 ‘100’으로 동일하게 설정합니다.
7. Write Instruction Packet([ID(7)] = 100, [Torque Enable(64)] = 0)을 전송합니다.
8. 5개의 다이나믹셀는 모두 Torque를 비활성화 합니다. 단, 실제 ID가 ‘100’인 다이나믹셀가 없으므로 Status Packet은 반환되지 않습니다.

{% else %}

여러개의 다이나믹셀은 서로 같은 [ID(7])를 가질 수 없지만, Secondary ID(12)는 같은 값을 가질 수 있습니다.

아래의 동작 예시를 참고 하여, ID(7)와 Secondary ID(12)의 차이점을 확인 하세요. 

1. 5개 다이나믹셀의 Secondary ID(12)를 모두 ‘5’로 동일하게 설정합니다.
2. Write Instruction Packet([ID(7)] = 1, [LED(65)] = 1)을 전송합니다.
3. ID가 ‘1’인 다이나믹셀는 LED를 켠 후, Status Packet을 반환합니다.
4. Write Instruction Packet([ID(7)] = 5, [LED(65)] = 1)을 전송합니다.
5. 5개의 다이나믹셀는 모두 LED를 켭니다. 단, Status Packet은 ID가 ‘5’인 다이나믹셀만 반환합니다.
6. 5개 다이나믹셀의 Secondary ID(12)를 모두 ‘100’으로 동일하게 설정합니다.
7. Write Instruction Packet([ID(7)] = 100, [LED(65)] = 0)을 전송합니다.
8. 5개의 다이나믹셀은 모두 LED를 끕니다. 하지만 ID가 ‘100’인 다이나믹셀이 없으므로 Status Packet은 반환되지 않습니다.

{% endif %}
