{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign shutdown = "Alarm LED(17)/Shutdown(18)" %}
{% assign torque_limit = "Torque Limit(34)" %}
{% assign max_torque = "Max Torque(14)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign shutdown = "Shutdown(18)" %}
{% assign torque_limit = "Torque Limit(35)" %}
{% assign max_torque = "Max Torque(15)" %}

{% else %}

{% assign shutdown = "Alarm LED(17)/Shutdown(18)" %} 
{% assign torque_limit = "Torque Limit(34)" %}
{% assign max_torque = "Max Torque(14)" %}

{% endif %}


모터의 최대 출력 제한 값입니다.  
0 ~ 1,023 (0x3FF)까지 사용 가능하며, 단위는 약 0.1 [%]입니다.  
예를 들어, 값이 512이면 약 50 [%]이고 최대 출력 대비 50 [%]만 사용하겠다는 의미입니다.  
전원이 켜지면 {{ torque_limit }}은 [{{ max_torque }}](#max-torque) 값으로 초기화 됩니다  

**참고** : [{{ shutdown }}](#shutdown)의 기능이 발휘되면 {{ torque_limit }}가 '0'이 되어 모터의 힘이 없어지게 됩니다. {{ shutdown }} 조건이 해제되고 {{ torque_limit }}을 0이 아닌 값으로 바꾸면 다시 모터의 출력이 발휘되어 사용할 수 있습니다.
{: .notice}
