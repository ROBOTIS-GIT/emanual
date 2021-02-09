{% assign torque_enable= "64" %}
{% assign present_position="132" %}
{% assign homing_offset="20" %}

{% if page.product_group=='dxl_p' or page.product_group=='dxl_pro_a' or page.product_group=='rh_p12_rna' %}
{% assign torque_enable= "512" %}
{% assign present_position="580" %}
{% elsif page.product_group=='dxl_pro' or page.product_group=='rh_p12_rn' %}
{% assign torque_enable= "562" %}
{% assign present_position="611" %}
{% assign homing_offset="13" %}
{% elsif page.product_group=='dxl_xl320'' %}
{% assign torque_enable= "24" %}
{% assign present_position="37" %}
{% endif %}

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_mx' or page.product_group=='dxl_rx' %}

|    값    | 상세 설명                    |
|:--------:|:----------------------------|
| 0(기본값) | Torque OFF 상태로 변경합니다 |
|     1    | Torque ON 상태로 변경합니다. |

{% else %}
Torque ON/OFF를 제어합니다. ‘1’을 쓰면 Torque ON 상태가 되고, EEPROM 영역의 모든 Data는 잠김 상태로 변경됩니다.
|    값    | 상세 설명                                                         |
|:--------:|:----------------------------------------------------------------|
| 0(기본값) | Torque OFF 상태로 변경합니다                                        |
|     1    | Torque ON 상태로 변경하고 EEPROM 영역의 모든 데이터는 잠김상태로 변경됩니다 |
{% endif %}

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_mx' or page.product_group=='dxl_rx' or page.product_group=='dxl_xl320' %}
{% else %}
**참고** : [Present Position({{ present_position }})]은 [Operating Mode(11)]와 [Torque Enable({{ torque_enable }})]이 변경되는 시점에 초기화 될 수 있습니다. 자세한 사항은 [Homing Offset({{ homing_offset }})]과 [Present Position({{ present_position }})]를 참고하세요.
{: .notice}
{% endif %}
