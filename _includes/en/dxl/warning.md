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

{% capture dxl_caution %}  
![](/assets/images/icon_warning.png)  
**CAUTION**  
(May cause injury or damage to product)
- Do not operate the product at a temperature exceeding {{ site.data.dxl_mx_info[page.ref].mcu }} range.
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
