{% capture dxl_danger %}  
![](/assets/images/icon_warning.png)  
**DANGER**  
(May cause serious injury or death)
- Never place items containing water, flammables, and solvents near product.
- Never place fingers, arms, toes, and other body parts near product during operation.
- Cut power off if product emits strange odors or smoke.
- Keep product out of reach of children.
- Check the power polarity before wiring.
{% endcapture %}
<div class="notice--danger">{{ dxl_danger | markdownify }}</div>

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' %}
  {% assign target_file = 'dxl_info' %}
{% elsif page.product_group=='dxl_mx' %}
  {% assign target_file = 'dxl_mx_info' %}
{% elsif page.product_group=='dxl_pro_plus' %}
  {% assign target_file = 'dxl_pro_plus_info' %}
{% elsif page.product_group=='dxl_pro_a' %}
  {% assign target_file = 'dxl_proa_info' %}
{% elsif page.product_group=='dxl_pro' %}
  {% assign target_file = 'dxl_pro_info' %}
{% elsif page.product_group=='dxl_x' or page.product_group=='dxl_xl320' %}
  {% assign target_file = 'dxl_x_info' %}
{% else %}
{% endif %}

{% capture dxl_caution %}  
![](/assets/images/icon_warning.png)  
**CAUTION**  
(May cause injury or damage to product)
- Do not operate the product at a temperature exceeding {{ site.data[target_file][page.ref].temperature }} range.
- Do not insert sharp blades nor pins during product operation.
{% endcapture %}
<div class="notice--warning">{{ dxl_caution | markdownify }}</div>

{% capture dxl_attention %}  
![](/assets/images/icon_warning.png)  
**ATTENTION**  
(May cause injury or damage to product)
- Do not disassemble or modify product.
- Do not drop or apply strong shock to product.
{% endcapture %}
<div class="notice--warning">{{ dxl_attention | markdownify }}</div>
