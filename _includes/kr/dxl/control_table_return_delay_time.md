{% if page.product_group=='dxl_mx2' or page.product_group=='xl330' or page.product_group=='dxl_x430' or page.product_group=='dxl_xl430' or page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' or page.product_group=='dxl_x540' or page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' or page.product_group=='rh_p12_rn' or page.product_group=='rh_p12_rna' %}
{% assign return_delay = "9" %}
{% else %}
{% assign return_delay = "5" %}
{% endif %}


다이나믹셀은 Instruction Packet을 수신하면, Return Delay Time({{ return_delay }}) 만큼 대기한 후 Status Packet을 반환 합니다.  
0 ~ 254 (0xFE) 까지 사용 가능하며 단위는 2 [μsec] 입니다.  
예를 들어, 값이 10일 경우 20 [μsec] 만큼 시간이 지난 후에 Status Packet을 반환합니다.

|   단위   |  범위   | 설명                                            |
|:--------:|:-------:|:----------------------------------------------------|
| 2 [μsec] | 0 ~ 254 | 기본값: ‘250’(500 [μsec]) <br> 최대값: '508' [μsec] |
