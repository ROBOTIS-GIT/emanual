{% if page.product_group == 'dxl_ax' or page.product_group == 'dxl_ex' or page.product_group == 'dxl_rx' or page.product_group == 'dxl_mx' %}

{% assign stauts_return_lv = "Stuatus Return Level (16)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign stauts_return_lv = "Stuatus Return Level (17)" %}

{% else %} 

{% assign stauts_return_lv = "Stuatus Return Level (68)" %}  <!-- X / MX 2.0  -->

{% endif %}

Instruction Packet으로 장치를 식별하기 위한 고유 번호입니다.  
0~252 (0xFC) 까지 사용 가능하며, 254(0xFE)는 브로드캐스트(Broadcast) ID로 특수하게 사용됩니다.  
브로드캐스트 ID(254, 0xFE)로 Instruction Packet을 전송하면 모든 장치에 명령을 내릴 수 있습니다.

**참고** : 연결된 장치의 ID가 중복되지 않도록 주의해야 합니다. 장치의 ID가 중복되면, 통신 오류 및 고유의 ID를 가지는 다이나믹셀 검색에 실패합니다.
{: .notice}

**참고** : Instruction packet의 ID가 Broadcast ID(0xFE)인 경우, {{ stauts_return_lv }}의 설정값과 무관하게 Read Instruction 또는 Write Instruction에 대한 Status Packet은 반환되지 않습니다. 더 자세한 설명은 [Protocol 1.0] 와 [Protocol 2.0]의 `Status Packet` 항목을 참조하심시오.
{: .notice}

 
