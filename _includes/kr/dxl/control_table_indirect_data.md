{% if page.product_group=='xl330' or page.product_group=='xc330'%}

Indirect Address와 Indirect Data 용도는 서로 떨어져있는 [컨트롤 테이블](#컨트롤-테이블)의 Address를 연속된 Address로 사용하기 위함입니다.  
- 연속된 Address는 Instruction Packet의 효율성을 향상 시킬 수 있습니다.
- Indirect Address로 설정할 수 있는 Address는 [RAM 영역(Address 64 ~ 227)](#ram-영역)으로 한정 됩니다.  
- Indirect Address에 특정 Address를 설정하면, Indirect Data는 특정한 Address에 해당하는 Data의 기능과 동일한 속성을 모두 상속받습니다. 동일한 속성이란 Size(Byte 길이), 값의 범위 그리고 Access(읽기 전용 속성, 읽기 쓰기 속성)를 모두 포함합니다. 
- 예를들어 Indirect Address 1(168)에 65(LED의 Address)를 설정하면, Indirect Data 1(224)은 [LED(65)]와 동일한 기능을 수행하게 됩니다. 

| Indirect Address 범위 | 설명                                                                    |
|:----------------------:|:------------------------------------------------------------------------|
| 64 ~ 227              | Indirection Address는 [EEPROM](#eeprom-영역) 영역을 지정할 수 없습니다. |

#### [동작 예시](#동작-예시)

`예제 1` 1 byte인 [LED(65)]를 Indirect Data 1(208)로 사용할 경우
1. Indirect Address 1(168) : LED의 주소 ‘65’로 변경
2. Indirect Data 1(208)를 ‘1’로 변경 : LED(65) 역시 ‘1’로 변경되면서 LED가 켜집니다.
3. Indirect Data 1(208)를 ‘0’로 변경 : LED(65) 역시 ‘0’로 변경되면서 LED가 꺼집니다.

`예제 2` 4 byte인 [Goal Position(116)]을 Indirect Data 2(225)로 사용할 경우, 4 byte 모두 변경 해야함
1. Indirect Address 2(170) : Goal Position의 첫 번째 주소 ‘116’으로 변경
2. Indirect Address 3(172) : Goal Position의 두 번째 주소 ‘117’으로 변경
3. Indirect Address 4(174) : Goal Position의 세 번째 주소 ‘118’으로 변경
4. Indirect Address 5(176) : Goal Position의 네 번째 주소 ‘119’으로 변경
5. Indirect Data 2에서 4 byte 값을 ‘1024’ 변경 : [Goal Position(116)] 역시 ‘1024’로 변경되고 장치가 구동됩니다.

**참고** : 2 byte 이상의 길이를 갖는 [컨트롤 테이블](#컨트롤-테이블)의 Data를 Indirect Address로 설정할 경우에는 `예제 2`와 같이 [컨트롤 테이블](#컨트롤-테이블)의 Data가 포함된 모든 Address를 Indirect Address로 설정해 주어야 정상동작합니다.
{: .notice}

{% else %}

Indirect Address와 Indirect Data 용도는 서로 떨어져있는 [컨트롤 테이블](#컨트롤-테이블)의 Address를 연속된 Address로 사용하기 위함입니다.  
- 연속된 Address는 Instruction Packet을 효율성을 향상 시킬 수 있습니다.
- Indirect Address로 설정할 수 있는 Address는 RAM 영역(Address 64 ~ 661)으로 한정 됩니다.  
- Indirect Address에 특정 Address를 설정하면, Indirect Data는 특정한 Address에 해당하는 Data의 기능과 동일한 속성을 모두 상속받습니다. 동일한 속성이란 Size(Byte 길이), 값의 범위 그리고 Access(읽기 전용 속성, 읽기 쓰기 속성)를 모두 포함합니다. 
- 예를들어 Indirect Address 1(168)에 65(LED의 Address)를 설정하면, Indirect Data 1(224)은 LED(65)와 동일한 기능을 수행하게 됩니다.

| Indirect Address 범위 | 설명                                                                    |
|:----------------------:|:------------------------------------------------------------------------|
| 64 ~ 661              | Indirection Address는 [EEPROM](#eeprom-영역) 영역을 지정할 수 없습니다. |

#### [동작 예시](#동작-예시)

`예제 1` 1 byte인 [LED(65)]를 Indirect Data 1(224)로 사용할 경우
1. Indirect Address 1(168) : LED의 주소 ‘65’로 변경
2. Indirect Data 1(224)를 ‘1’로 변경 : LED(65) 역시 ‘1’로 변경되면서 LED가 켜집니다.
3. Indirect Data 1(224)를 ‘0’로 변경 : LED(65) 역시 ‘0’로 변경되면서 LED가 꺼집니다.

{% if page.product_group=='dxl_xw540' %}
**참고**: XW 모델은 [LED(65)]를 사용하지 않습니다.
{: .notice}
{% endif %}

`예제 2` 4 byte인 [Goal Position(116)]을 Indirect Data 2(225)로 사용할 경우, 4 byte 모두 변경 해야함
1. Indirect Address 2(170) : Goal Position의 첫 번째 주소 ‘116’으로 변경
2. Indirect Address 3(172) : Goal Position의 두 번째 주소 ‘117’으로 변경
3. Indirect Address 4(174) : Goal Position의 세 번째 주소 ‘118’으로 변경
4. Indirect Address 5(176) : Goal Position의 네 번째 주소 ‘119’으로 변경
5. Indirect Data 2에서 4 byte 값을 ‘1024’ 변경 : [Goal Position(116)] 역시 ‘1024’로 변경되고 장치가 구동됩니다.


**참고** : 2 byte 이상의 길이를 갖는 [컨트롤 테이블](#컨트롤-테이블)의 Data를 Indirect Address로 설정할 경우에는 `예제 2`와 같이 [컨트롤 테이블](#컨트롤-테이블)의 Data가 포함된 모든 Address를 Indirect Address로 설정해 주어야 정상동작합니다.
{: .notice}

**참고** : Indirect Address 29 ~ 56과 Indirect Data 29 ~ 56은 프로토콜 2.0으로만 접근할 수 있습니다.
{: .notice}

{% endif %}
