{% capture inspection %}
**Before Using the Product**
- Please familiarize yourself with the contents of the manual before using the product. If the product is operated with incorrect assembly, it may cause vibration, shortened lifespan, and/or permanent damage.
- Please verify that the model number and format match the product you ordered.
- Ensure that all components are included in the product package.
- Check for any damage to the surface and appearance of the product.
- Before operating, connect the included battery and perform a Multi-turn initialization.

{% endcapture %}
<div class="notice--info">{{ inspection | markdownify }}</div>

{% capture common_danger %}  
![](/assets/images/icon_warning.png)  
**Danger**  
(May cause serious injury or death.)
- Do not splash or pour flammable substances, surfactants, beverages, or water on or around the product.
- Do not insert hands, feet, or any body parts into the product during operation.
- If an unusual odor or smoke comes from the product, disconnect the power immediately.
- Do not allow children to play with the product.
- Always check the polarity of the power source before connecting or supplying power.
{% if page.product_group == 'dxl_y_r' or page.product_group == 'dxl_y_a' %}
- Avoid making contact of the skin and eyes with the lubricant, as it may cause irritation.
- In case you make contact of eyes with the lubricant, wash eyes immediately with clean water and seek medical advice.
- In case of contact of the skin with the lubricant, wash skin thoroughly with water and soap.
{% endif %}
{% endcapture %}
<div class="notice--danger">{{ common_danger | markdownify }}</div>

{% capture dxl_caution %}  
![](/assets/images/icon_warning.png)  
**Warning**  
(May cause injury or damage to the product.)
- Please adhere to the product's operating environment limitations. (Temperature: -5 ~ +55 [°C])
- Do not allow blades, sharp objects, sparks, and the like to be inserted or applied to the product during operation.
{% endcapture %}
<div class="notice--warning">{{ dxl_caution | markdownify }}</div>

{% capture dxl_attention %}  
![](/assets/images/icon_warning.png)  
**Warning**  
(May cause injury or damage to the product.)
- The product is not intended to be disassembled or modified by the user.
- Do not subject the product to strong impacts or drops.
- Please review the contents of the manual before using the product. {% if page.product_group == 'dxl_y_r' or page.product_group == 'dxl_y_a' %}If you operate it without assembling it correctly, it may cause vibration, reduce its lifespan, or cause damage.
- Be careful not to apply a load exceeding the allowable peak torque (emergency stop).
- Use at an ambient temperature of -5 to 55 degrees Celsius.
- Prevent dust, chips, etc., from entering the product.
- While lubricant leakage prevention has been applied, the product may still be subject to leakage. Provide protection treatment as needed according to your application.
- While anti-rust treatment has been applied, rust may appear depending on storage and environmental conditions.
- While the product is coated with surface treatment, rust protection is not guaranteed.
- This product is pre-packed with lubricant; do not mix with other lubricants.
- Please follow local government guidelines when disposing of the lubricant.
{% endif %}
{% endcapture %}
<div class="notice--warning">{{ dxl_attention | markdownify }}</div>

{% capture guarantee %}
**Warranty Coverage**
- This product is covered under warranty for 1 year after the purchase date. (* Product must be used under normal operating conditions)
- If there are any issues due to a manufacturing defect within the warranty period, ROBOTIS will repair or replace the product at no additional cost.
- Warranty will be void if the product is deemed to be used or handled improperly by the user.
- Warranty will be void if the product is taken apart, repaired, or modified in any way.
- Warranty will be void if the product is damaged by any external components.
- Warranty will be void in the case the product is affected by natural disasters and/or uncontrollable circumstances.
- ROBOTIS is not responsible for any damages or injuries resulting from product failure. Use at your own discretion.
{% endcapture %}
<div class="notice--success">{{ guarantee | markdownify }}</div>
