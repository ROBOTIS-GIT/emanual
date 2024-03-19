
{% capture common_danger %}  
![](/assets/images/icon_warning.png)  
**위험**  
(심각한 상해 또는 사망에 이르게 할 수 있습니다.)
- 제품 주위에 가연성 물질, 계면활성제, 음료수, 물을 분사하거나 흡입시키지 마세요.
- 작동 중인 제품에 손, 발과 같은 신체 또는 신체의 일부를 넣지 마세요.
- 제품에서 이상한 냄새가 나거나, 연기가 발생하면 전원 연결을 즉시 끊어주세요.
- 아이들이 제품으로 장난치지 않도록 하세요.
- 전원의 극성을 반드시 확인 후 배선하세요.
{% if page.product_group == 'dxl_y_r' or page.product_group == 'dxl_y_a' %}정확히 조립하지 않고 운전하는 경우 진동, 수명저하, 파손등의 원인이 됩니다.
- 윤활제가 눈 또는 피부에 닿을 경우 염증을 일으킬 수 있으니 주의하시기 바랍니다.
- 윤활제가 눈에 들어간 경우, 깨끗한 물로 씻고 의사의 진단을 받으십시오.
- 윤활제가 피부에 닿은 경우 물과 비누로 깨끗이 씻으십시오.
{% endif %}
{% endcapture %}
<div class="notice--danger">{{ common_danger | markdownify }}</div>

{% capture dxl_caution %}  
![](/assets/images/icon_warning.png)  
**경고**  
(상해나 제품 손상의 원인이 됩니다.)
- 제품의 사용 환경을 준수하세요. 제품의 사용 환경을 준수하세요. (온도 : -5 ~ +80 [°C])
- 작동 중인 제품 내부로 칼날, 압정, 불씨 등을 흡입시키지 마세요.
{% endcapture %}
<div class="notice--warning">{{ dxl_caution | markdownify }}</div>

{% capture dxl_attention %}  
![](/assets/images/icon_warning.png)  
**주의**  
(상해나 제품 손상의 원인이 됩니다.)
- 제품의 분해 및 재조립을 하지 마십시오. 제품을 분해 및 재조립 하는 경우, 기존의 성능을 재현할 수 없습니다.
- 제품을 떨어뜨리거나 강한 충격이 가해진 경우 사용하지 마십시오.
- 제품 사용전 메뉴얼의 내용을 숙지하십시오. {% if page.product_group == 'dxl_y_r' or page.product_group == 'dxl_y_a' %}정확히 조립하지 않고 운전하는 경우 진동, 수명저하, 파손등의 원인이 됩니다.
- 허용 피크 토크 (비상 정지) 이상의 부하를 가하지 않도록 주의하십시오
- 주위온도 -5~55도에서 사용하십시오.
- 먼지, 칩등이 제품 내부로 들어가지 않도록 주의하십시오.
- 입/출력축에는 고신뢰성의 오일씰이 적용되어 있지만, 누유를 완전히 보장하지 않습니다. 용도에 따라 유분 방호처리를 해주시기 바랍니다.
- 출하시에 방청 처리를 하지만 보관 및 환경에 따라 일찍 녹이 스는 경우가 있으니 주의해 주십시오
- 일부 제품은 표면처리가 되어 있지만 방청을 보장하지는 않습니다.
- 본 제품은 조립상에서 윤활제가 봉입되어 있으며, 다른 윤활제를 혼입하여 사용하지 마십시오.
- 윤활제 처리방법은 법령으로 의무화 되어 있으며, 법령에 따라 적절하게 처리하시기 바랍니다.
{% endif %}
{% endcapture %}
<div class="notice--warning">{{ dxl_attention | markdownify }}</div>

{% capture pawer_danger %}
**주의: 전원 공급 시 주의사항**
- 전원이 꺼진 상태에서 다이나믹셀과 전원을 연결하시고 스위치로 ON/OFF를 해주세요
{% endcapture %}

<div class="notice--danger">{{ pawer_danger | markdownify }}</div>