{% if page.product_group== 'xl330' %}
{% capture x330_ttl %}  
**NOTE**: Though the XL330 series has a 3.3 V TTL logic level, the XL330 is tolerant of 5V TTL logic level communications.
{% endcapture %}
<div class="notice">{{ x330_ttl | markdownify }}</div>
{% endif %}

{% capture dxl_danger %}  
![](/assets/images/icon_warning.png)  
**DANGER**  
(Ignoring these warnings may cause serious injury or death)

- {% if page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' %} Never place flammable items or open flames near the product. {% else %} Never place items containing water, flammables/open flames, or solvents near the product. {% endif %}
- Never place fingers, arms, toes, and other body parts near product during operation.
- Cease operation and remove power from the product if the product begins to emit strange odors, noises, or smoke.
- Keep product out of reach of children.
- Check input polarity before installing or energizing wiring or cables.
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
{% elsif page.product_group=='dxl_x430' or page.product_group=='dxl_xl430' or page.product_group=='dxl_x540' or page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' or page.product_group=='xc330' or page.product_group=='dxl_xl320' or page.product_group=='xl330' %}
{% assign target_file = 'dxl_x_info' %}
{% elsif page.product_group=='rh_p12_rn' or page.product_group=='rh_p12_rna' %}
{% assign target_file = 'rh_p12_rn_info' %}
{% else %}
{% endif %}

{% capture dxl_caution %}  
![](/assets/images/icon_warning.png)  
**CAUTION**  
(Ignoring these warnings may cause mild injury or damage to the product)
{% if page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' %} - Always Comply with the product's official operating environment specifications: Submersion of up to 1m of depth for 24 hours in fresh water.{% elsif page.product_group=='opencm904' or page.product_group=='ln-101' or page.product_group=='u2d2' or page.product_group=='u2d2_power_hub' or page.product_group=='dynamixel_shield' or page.product_group=='cm-50' or page.product_group=='openrb-150' or page.product_group=='opencm485exp' %} {% else %} - Always comply with the product's offical operating environment specifications including input voltage, current, and operating temperature. {% endif %}
- Do not insert blades or other sharp objects during product operation.
{% endcapture %}
<div class="notice--warning">{{ dxl_caution | markdownify }}</div>

{% capture dxl_attention %}  
![](/assets/images/icon_warning.png)  
**ATTENTION**  
(Ignoring these warnings may cause minor injury or damage to the product)
- Do not disassemble or modify the product.
- Do not drop the product or apply strong impacts.
- Do not connect or disconnect DYNAMIXEL cables while power is being supplied.
{% if page.product_group== 'xl330' or page.ref == 'xc330-m181' or page.ref == 'xc330-m288' %}
- A ROBOTIS controller is recommended to ensure a stable power supply.
{% elsif page.ref == 'xc330-t288' or page.ref == 'xc330-t181' %}
- A ROBOTIS controller is recommended to ensure a stable power supply.
{% else %}
{% endif %}
{% endcapture %}
<div class="notice--warning">{{ dxl_attention | markdownify }}</div>
