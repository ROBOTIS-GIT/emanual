
{% if page.product_group== 'xl330' %}
{% capture x330_ttl %}  
**참고**: XL330의 통신 버스의 전압은 다른 다이나믹셀과 달리 3.3V 이지만, 5V 통신 버스에 호환됩니다.
{% endcapture %}
<div class="notice">{{ x330_ttl | markdownify }}</div>

{% endif %}

{% capture common_danger %}  
![](/assets/images/icon_warning.png)  
**위험**  
(심각한 상해 또는 사망에 이르게 할 수 있습니다.)
- {% if page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' %} 제품 주위에 가연성 물질을 분사하거나 흡입시키지 마세요. {% else %} 제품 주위에 가연성 물질, 계면활성제, 음료수, 물을 분사하거나 흡입시키지 마세요. {% endif %}
- 작동 중인 제품에 손, 발과 같은 신체 또는 신체의 일부를 넣지 마세요.
- 제품에서 이상한 냄새가 나거나, 연기가 발생하면 전원 연결을 즉시 끊어주세요.
- 아이들이 제품으로 장난치지 않도록 하세요.
- 전원공급 시 극성을 반드시 확인해 주세요.
{% endcapture %}
<div class="notice--danger">{{ common_danger | markdownify }}</div>

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' %}
  {% assign target_file = 'dxl_info' %}
{% elsif page.product_group=='dxl_mx'or page.product_group=='dxl_mx2' %}
  {% assign target_file = 'dxl_mx_info' %}
{% elsif page.product_group=='dxl_p' %}
  {% assign target_file = 'dxl_p_info' %}
{% elsif page.product_group=='dxl_pro_a' %}
  {% assign target_file = 'dxl_proa_info' %}
{% elsif page.product_group=='dxl_pro' %}
  {% assign target_file = 'dxl_pro_info' %}
{% elsif page.product_group=='dxl_x430' or page.product_group=='dxl_xl430' or page.product_group=='dxl_x540' or page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' or page.product_group=='xc330' or page.product_group=='dxl_xl320' or page.product_group=='xl330' %}
  {% assign target_file = 'dxl_x_info' %}
{% elsif page.product_group=='rh_p12_rn' or page.product_group=='rh_p12_rna' %}
  {% assign target_file = 'rh_p12_rn_info' %}
{% else %}
{% endif %}

{% capture dxl_caution %}  
![](/assets/images/icon_warning.png)  
**경고**  
(상해나 제품 손상의 원인이 됩니다.)
- {% if page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' %} 제품의 사용 환경을 준수하세요. (IP68, 담수에서 수심 1 m, 24 hr) {% elsif page.product_group=='opencm904' or page.product_group=='ln-101' or page.product_group=='u2d2' or page.product_group=='u2d2_power_hub' or page.product_group=='dynamixel_shield' %}{% else %} 제품의 사용 환경을 준수하세요. (전압, 온도 등){% endif %}
- 작동 중인 제품 내부로 칼날, 압정, 불씨 등을 흡입시키지 마세요.
{% endcapture %}
<div class="notice--warning">{{ dxl_caution | markdownify }}</div>

{% capture dxl_attention %}  
![](/assets/images/icon_warning.png)  
**주의**  
(상해나 제품 손상의 원인이 됩니다.)
- 제품을 사용자 임의로 분해 또는 개조하지 마세요.
- 제품에 강한 충격을 가하거나 떨어드리지 마세요.
{% if page.product_group== 'xl330' or page.ref == 'xc330-m181' or page.ref == 'xc330-m288' %}
- 안정적인 전원공급을 위해 로보티즈 제어기나 [리튬이온 배터리(LB-041)](https://www.robotis.com/shop/item.php?it_id=903-0220-001) 또는 별도의 파워 서플라이를 통한 전원공급을 권장합니다.
- 전원이 꺼진 상태에서 장치와 전원을 연결하시고 스위치로 ON/OFF를 해주세요.
{% elsif page.ref == 'xc330-t288' or page.ref == 'xc330-t181' %}
- 안정적인 전원공급을 위해 로보티즈 제어기나 [리튬이온 배터리(LB-020)](https://www.robotis.com/shop/item.php?it_id=903-0277-000) 또는 별도의 파워 서플라이를 통한 전원공급을 권장합니다.
- 전원이 꺼진 상태에서 장치와 전원을 연결하시고 스위치로 ON/OFF를 해주세요.
{% endif %}
{% endcapture %}
<div class="notice--warning">{{ dxl_attention | markdownify }}</div>
