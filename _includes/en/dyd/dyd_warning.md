{% capture dyd_product_check %}
**PRODUCT CHECK**
- Please verify product's model and number to ensure correct shipment of the product ordered.
- Please verify all components are included in original packaging.
- Please verify to see if there might be any damage on the product's surface or general appearance.
{% endcapture %}
<div class="notice--info">{{ dyd_product_check | markdownify }}</div>

{% capture dyd_danger %}
![](/assets/images/icon_warning.png)  
**WARNING**  
(May cause injury or damage to product)
- Do not disassemble or reassemble the product. If the product is disassembled and reassembled, the original performance cannot be guaranteed.
- Be careful not to apply a load more than its Permissible peak torque.
- Do not use the product when it is dropped or subjected to strong impact.
- Please familiarize yourself with the contents of the manual before using the product. If the product is operated without correct assembly, it may cause vibration, shortened life, and/or permanent damage.
- Use at an ambient temperature of -5° to 55° degrees Celsius.
- Do not operate the product in an environment exposed to water, oil or explosive gas.
- Exercise caution to the internal components are not exposed to dust and chips.
- High quality oil seals are applied to the input/output shaft, however the product is subject to leakage. Please provide oil protection treatment as needed according to your application.
- This product is coated with anti-rust treatment at the time of shipment, however rust may appear depending on storage and environmental conditions.
- This product is coated with surface treatment, however rust protection is not guaranteed.
- This product is pre-packed with lubricant, do not mix with other lubricants.
- Please follow local government guidelines when disposing of the lubricant.
{% endcapture %}
<div class="notice--warning">{{ dyd_danger | markdownify }}</div>

{% capture dyd_warning %}
![](/assets/images/icon_warning.png)  
**CAUTION**  
- Avoid coming into contact with the lubricant as this may cause irritation when in contact with your skin and eyes.
- In the case your eyes come in contact with the lubricant, wash your eyes immediately with clean water and seek medical advice.
- In the case your skin comes into contact with the lubricant, wash your skin thoroughly with water and soap.
{% endcapture %}
<div class="notice--danger">{{ dyd_warning | markdownify }}</div>

{% capture dyd_warranty %}
**WARRANTY**
- This product is covered under warranty for 1 year after purchase or up to 2,000 hours of operational time. (\* Product must be used under normal operating conditions)
- If there are any issues due to a manufacturing defect within the warranty period, we will repair or replace the product.
- Warranty will be void if the product is used or handled improperly by user.
- Warranty will be void if the product is repaired or modified in any way.
- Warranty will be void if the product is damaged by any external components (ie. motor)
- Warranty will be void in the case the product is affected by natural disasters and/or uncontrollable circumstances.
- ROBOTIS is not responsible for any damages or injuries that may occur by the failure of the product mid operation.
{% endcapture %}
<div class="notice--success">{{ dyd_warranty | markdownify }}</div>
