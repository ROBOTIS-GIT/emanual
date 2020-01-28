
{% capture 2x_warning %}
**주의** : 컨트롤 테이블 사용 시 주의사항
- [EEPROM 영역](#eeprom-영역)의 Data는, 각 ID에 할당된 2개의 컨트롤테이블에서, [Torque Enable(64)](#torque-enable)의 값이 모두 `0' 일때만 변경할 수 있습니다.
- {% if page.ref=='2xc430-w250' %}2XC430{% else %}2XL430{% endif %}은 두 개의 모터가 각각 별도의 컨트롤 테이블을 갖고 있습니다. 하지만, 통신모듈은 하나이기 때문에 두 모터의 [Baud Rate(8)](#baud-rate)와 [Protocol Type(13)](#protocol-type)은 항상 동시에 변경됩니다.
{% endcapture %}
<div class="notice--warning">{{ 2x_warning | markdownify }}</div>
