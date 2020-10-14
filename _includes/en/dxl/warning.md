{% if page.product_group== 'xl330' %}
**NOTE**: Though the communication bus of XL330 series is 3.3 V TTL logic level unlike other DYNAMIXELs, the XL330 series can be also compatible with 5V TTL logic level.
{: .notice}
{% endif %}

{% capture dxl_danger %}  
![](/assets/images/icon_warning.png)  
**DANGER**  
(May cause serious injury or death)

- {% if page.product_group=='dxl_xw540' %} Never place flammables near the product. {% else %} Never place items containing water, flammables, and solvents near product. {% endif %}
- Never place fingers, arms, toes, and other body parts near product during operation.
- Cut power off if product emits strange odors or smoke.
- Keep product out of reach of children.
- Check the power's polarity before wiring.
{% endcapture %}
<div class="notice--danger">{{ dxl_danger | markdownify }}</div>

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' %}
{% assign target_file = 'dxl_info' %}
{% elsif page.product_group=='dxl_mx' %}
{% assign target_file = 'dxl_mx_info' %}
{% elsif page.product_group=='dxl_p' %}
{% assign target_file = 'dxl_p_info' %}
{% elsif page.product_group=='dxl_pro_a' %}
{% assign target_file = 'dxl_proa_info' %}
{% elsif page.product_group=='dxl_pro' %}
{% assign target_file = 'dxl_pro_info' %}
{% elsif page.product_group=='dxl_x430' or page.product_group=='dxl_xl430' or page.product_group=='dxl_x540' or page.product_group=='dxl_xw540' or page.product_group=='dxl_xl320' or page.product_group=='xl330' %}
{% assign target_file = 'dxl_x_info' %}
{% elsif page.product_group=='rh_p12_rn' or page.product_group=='rh_p12_rna' %}
{% assign target_file = 'rh_p12_rn_info' %}
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
{% if page.product_group=='dxl_xw540' %} - Comply with the operating environment. (Depth 1 m, 24 hr in normal fresh water) {% endif %}

- Do not disassemble or modify product.
- Do not drop or apply strong shock to product.
  {% if page.product_group== 'xl330' %}
- To ensure a stable power supply, it is recommended using a ROBOTIS controller, or [LB-041 battery](http://en.robotis.com/shop_en/item.php?it_id=903-0220-001).
- Do not connect or disconnect DYNAMIXEL when power is being supplied.
{% else %}
{% endif %}
{% endcapture %}
<div class="notice--warning">{{ dxl_attention | markdownify }}</div>
