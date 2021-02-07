{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign registed_instruction = "Registered Instruction (44)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign registed_instruction = "Registered Instruction (47)" %}

{% else %}

{% assign registed_instruction = "Registered Instruction (69)" %}

{% endif %}

| Value | Description                         |
|:-----:|:------------------------------------|
|   0   | REG_WRITE에 의해 등록된 명령이 없습니다. |
|   1   | REG_WRITE에 의해 등록된 명령이 있습니다. |


**참고** : ACTION 명령을 수행하면 {{ registed_instruction }} 값이 '0'으로 바뀝니다.
{: .notice}
