
{% capture perform_graph_01 %}
**참고** : Stall torque와 Performance Graph의 Max torque의 차이는 측정 방식에 기인합니다.
Stall torque는 순간적인 최대토크를 측정하는 방식으로, 고전적인 RC Servo 제품에서 주로 사용하는 사양입니다.
Performance Graph는 N-T Curve라고도 불리며, 부하(load)를 점진적으로 증가시키면서 측정됩니다.
모터 구동되는 환경은 Stall torque 측정 방식보다는 Performance Graph 측정 방식에 가깝습니다.
이러한 이유로 Performance Graph가 산업전반에서 보다 폭넓게 사용됩니다.
일반적으로 Performance Graph의 Max torque는 Stall torque보다 적게 측정됩니다.
{% endcapture %}

<div class="notice">{{ perform_graph_01 | markdownify }}</div>

{% capture perform_graph_02 %}
**주의** : **전원 공급시 주의사항**
- 안정적인 전원공급을 위해 로보티즈 제어기나 SMPS2Dynamixel 통한 전원공급을 권장드립니다.
- 전원이 꺼진 상태에서 장치와 전원을 연결하시고 스위치로 ON/OFF를 해주세요.
{% if page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_pro_plus' or page.ref=='xh430-v210' or page.ref=='xh430-v350' or page.ref=='xh540-v150' or page.ref=='xh540-v270' %}
- 다이나믹셀 PRO 및 다이나믹셀-P 시리즈의 경우 반드시 전원포트를 통해 24V 전원을 공급해주세요.
{% else %}
{% endif %}

{% endcapture %}


<div class="notice--danger">{{ perform_graph_02 | markdownify }}</div>
