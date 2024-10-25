{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign registered_instruction = "Registered Instruction (44)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign registered_instruction = "Registered Instruction (47)" %}

{% else %}

{% assign registered_instruction = "Registered Instruction (69)" %}

{% endif %}

Indicates whether an instruction has been registered by the [Reg Write Instruction](https://emanual.robotis.com/docs/en/dxl/protocol2/#reg-write-0x04) and is ready for execution. Following the execution of a registered action the {{ registered_instruction }} value will automatically be updated to 0.

| Value | Description                                  |
|:-----:|:---------------------------------------------|
|   0   | No instruction registered by REG_WRITE.      |
|   1   | Instruction registered by REG_WRITE. |
