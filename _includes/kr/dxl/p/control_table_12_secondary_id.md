Secondary ID(12)는 ID(7)과 동일하게 장치를 식별하기 위한 번호로 사용됩니다.  
다만, Secondary ID(12)는 ID(7)과 달리 고유한 번호가 아닙니다.  
따라서 동일한 Secondary ID 값을 갖은 장치들은 하나의 그룹을 형성하게 됩니다.  

Secondary ID(12)와 ID(7)의 차이는 다음과 같습니다.
1. Secondary ID(12)는 ID(7)과 달리 고유 번호가 아닙니다. 즉, 다수의 장치가 동일한 Secondary ID 값을 가질 수 있습니다.
2. Secondary ID(12)보다 ID(7)의 우선순위가 높습니다. 따라서 Secondary ID(12)와 ID(7)가 같을 경우, ID(7)가 우선적으로 적용됩니다.
3. Secondary ID(12)로는 컨트롤테이블의 EEPROM 영역을 변경할 수 없습니다. RAM 영역만 변경이 가능합니다.
4. Instruction Packet의 ID가 Sencodary ID(12)와 같은 경우, Status Packet을 반환하지 않습니다.
5. Secondary ID(12)의 값이 253 이상인 경우, Secondary ID 기능은 비활성화 됩니다.

|    값     | 세부 설명                                 |
|:---------:|:------------------------------------------|
|  0 ~ 252  | Secondary ID 기능 활성화                  |
| 253 ~ 255 | Secondary ID 기능 비활성화, 초기값: ‘255’ |

다음은 ID(7)가 1부터 5로 설정된 5개의 장치가 있는 경우에 대한 동작 예시입니다.

{% capture secondary_id_ex1 %}
1. 5개 장치의 Secondary ID(12)를 모두 ‘5’로 동일하게 설정합니다.
2. Write Instruction Packet(ID = 1, LED Red(513) = 255)을 전송합니다.
3. ID가 ‘1’인 장치는 LED를 켠 후, Status Packet을 반환합니다.
4. Write Instruction Packet(ID = 5, LED Red(513) = 255)을 전송합니다.
5. 5개의 장치들은 모두 LED를 켭니다. 단, Status Packet은 ID가 ‘5’인 장치만 반환합니다.
6. 5개 장치의 Secondary ID(12)를 모두 ‘100’으로 동일하게 설정합니다.
7. Write Instruction Packet(ID = 100, LED Red(513) = 0)을 전송합니다.
8. 5개의 장치들은 모두 LED를 끕니다. 단, ID ‘100’인 장치가 없으므로 Status Packet은 반환되지 않습니다.
{% endcapture %}

<div class="notice--success">{{ secondary_id_ex1 | markdownify }}</div>

**주의** : Secondary ID(12)은 Modbus-RTU 프로토콜에서 동작되지 않습니다.   
{: .notice--warning}
