{% capture dxl_danger %}  
![](/assets/images/icon_warning.png)  
**위험**  
(심각한 상해 또는 사망에 이르게 할 수 있습니다.)
- 제품 주위에 가연성 물질, 계면 화성제, 음료수, 물을 분사하거나 흡입시키지 마세요.
- 작동 중인 제품에 손, 발과 같은 신체 또는 신체의 일부를 넣지 마세요.
- 제품에서 이상한 냄새가 나거나, 연기가 발생하면 전원 연결을 즉시 끊어주세요.
- 아이들이 제품으로 장난치지 않도록 하세요.
- 전원의 극성을 반드시 확인 후 배선하세요.
{% endcapture %}
<div class="notice--danger">{{ dxl_danger | markdownify }}</div>

{% if page.ref contains 'ax' or page.ref contains 'dx' or page.ref contains 'ex' or page.ref contains 'rx' %}
  {% assign target_file = 'dxl_info' %}
{% elsif page.ref contains 'mx' %}
  {% assign target_file = 'dxl_mx_info' %}
{% elsif page.ref contains 'h54p' or page.ref contains 'h42p' %}
  {% assign target_file = 'dxl_pro_plus_info' %}
{% elsif page.ref contains 'ra' %}
  {% assign target_file = 'dxl_proa_info' %}
{% elsif page.ref contains '-s' %}
  {% assign target_file = 'dxl_pro_info' %}
{% elsif page.ref contains 'xl' or page.ref contains 'xm' or page.ref contains 'xh' %}
  {% assign target_file = 'dxl_x_info' %}
{% else %}
{% endif %}

{% capture dxl_caution %}  
![](/assets/images/icon_warning.png)  
**경고**  
(상해나 제품 손상의 원인이 됩니다.)
- 제품의 사용 환경을 준수하세요. (온도 : {{ site.data[target_file][page.ref].temperature }})
- 작동 중인 제품 내부로 칼날, 압정, 불씨 등을 흡입시키지 마세요.
{% endcapture %}
<div class="notice--warning">{{ dxl_caution | markdownify }}</div>

{% capture dxl_attention %}  
![](/assets/images/icon_warning.png)  
**주의**  
(상해나 제품 손상의 원인이 됩니다.)
- 제품을 사용자 임의로 분해 또는 개조하지 마세요.
- 제품에 강한 충격을 가하거나 떨어드리지 마세요.
{% endcapture %}
<div class="notice--warning">{{ dxl_attention | markdownify }}</div>
