{% capture present_pos_notice_01 %}
**참고**: {% if page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Present Position(580)](#present-position) {% elsif page.product_group=='dxl_pro' %} [Present Position(611)](#present-position) {% else %} [Present Position(132)](#present-position) {% endif %}은, 토크가 꺼져 있을 때 [Operating Mode(11)](#operating-mode)에 상관없이 4 byte(-2,147,483,648 ~ 2,147,483,647)의 범위를 연속적으로 표현 합니다.  
{% if page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Present Position(580)](#present-position) {% elsif page.product_group=='dxl_pro' %} [Present Position(611)](#present-position) {% else %} [Present Position(132)](#present-position) {% endif %}값은 다음의 경우에 **한 바퀴의 절대위치값(1 rev)으로 초기화** 됩니다. {% if page.product_group=='dxl_pro' %} [Homing Offset(13)](#homing-offset) {% else %} [Homing Offset(20)](#homing-offset) {% endif %}에 의해 초기화 되는 값은 변경될 수 있습니다.
1. [Operating Mode(11)](#operating-mode)가 위치 제어 모드로 변경 될 때. 
2. 위치 제어 모드에서 Torque OFF 에서 Torque ON 으로 변경 될 때.
3. 전원을 끄고 킬 때.
{% endcapture %}
<div class="notice">{{ present_pos_notice_01 | markdownify }}</div>
