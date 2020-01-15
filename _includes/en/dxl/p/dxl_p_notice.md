{% if page.product_group=='thormang3' %}

{% capture dxl_p_notice_01 %}
**NOTE**: The name of DYNAMIXEL-PRO is revised to DYNAMIXEL-P
- Revised Date: Jan 2th, 2020.
- Revised Product: DYNAMIXEL PRO+ > DYNAMIXEL-P
- Revised Model Name: See the table below.

  | Previous        | New             |
  |:----------------|:----------------|
  | H54P-200-S500-R | PH54-200-S500-R |
  | H54P-100-S500-R | PH54-100-S500-R |
  | H42P-020-S300-R | PH42-020-S300-R |
  | M54P-060-S250-R | PM54-060-S250-R |
  | M54P-040-S250-R | PM54-040-S250-R |
  | M42P-010-S260-R | PM42-010-S260-R |

{% endcapture %}
<div class="notice">{{ dxl_p_notice_01 | markdownify}}</div>

{% else %}
{% capture dxl_p_notice_02 %}
**Product Name Change Announcement.**  
Dear, All ROBOTIS users.  
We would like to announce that a product model name is changed.  
The name change does not affect features and specifications of the product.  
Please see the following to prevent any confusion by the name change.
- Revised Date: Jan 2th, 2020.  
- Revised Product: DYNAMIXEL PRO+ > DYNAMIXEL-P
- Revised Model Name: See the table below.  

  | Previous        | New             |
  |:----------------|:----------------|
  | H54P-200-S500-R | PH54-200-S500-R |
  | H54P-100-S500-R | PH54-100-S500-R |
  | H42P-020-S300-R | PH42-020-S300-R |
  | M54P-060-S250-R | PM54-060-S250-R |
  | M54P-040-S250-R | PM54-040-S250-R |
  | M42P-010-S260-R | PM42-010-S260-R |

{% endcapture %}
<div class="notice">{{ dxl_p_notice_02 | markdownify}}</div>

{% endif %}
