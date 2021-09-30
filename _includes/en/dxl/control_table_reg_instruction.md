{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign registered_instruction = "Registered Instruction (44)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign registered_instruction = "Registered Instruction (47)" %}

{% else %}

{% assign registered_instruction = "Registered Instruction (69)" %}

{% endif %}

Indicates whether the Write Instruction is registered by [Reg Write Instruction](https://emanual.robotis.com/docs/en/dxl/protocol2/#reg-write-0x04)

| Value | Description                                  |
|:-----:|:---------------------------------------------|
|   0   | No instruction registered by REG_WRITE.      |
|   1   | Instruction registered by REG_WRITE exists. |

**NOTE** : If ACTION instruction is executed, the {{ registered_instruction }} will be changed to 0.
{: .notice}
