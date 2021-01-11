{% if page.product_group == 'dxl_ax' or page.product_group == 'dxl_ex' or page.product_group == 'dxl_rx' or page.product_group == 'dxl_mx' %}

{% assign registed_instruction = "Registered Instruction (44)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign registed_instruction = "Registered Instruction (47)" %}

{% else %}

{% assign registed_instruction = "Registered Instruction (69)" %}

{% endif %}

| Value | Description                                  |
|:-----:|:---------------------------------------------|
|   0   | No instruction registered by REG_WRITE.      |
|   1   | Instruction registered by REG_WRITE exsists. |

**NOTE** : If ACTION instruction is executed, the {{ registed_instruction }} will be changed to 0.
{: .notice}
