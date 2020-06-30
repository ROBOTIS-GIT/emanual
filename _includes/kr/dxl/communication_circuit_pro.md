{% if page.ref=='dxl_pro' or page.ref=='dxl_p' %}## [UART 연결 회로도](#uart-연결-회로도) {% else %}### [UART 연결 회로도](#uart-연결-회로도) {% endif %}
Main Controller를 직접 제작하여 {% if page.product_group=='dxl_p' %}다이나믹셀-P 시리즈{% else %}다이나믹셀 PRO 시리즈{% endif %}를 제어하기 위해서는 Main Controller UART의 신호를 RS485 type으로 변환시켜 주어야 합니다. 다음은 권장 회로도 입니다.

![](/assets/images/dxl/pro/485_circuit_pro.png)

[MAX485 Datasheet](http://ecee.colorado.edu/~mcclurel/max485ds.pdf)

전원은 Pin1(-), Pin2(+)를 통하여 다이나믹셀로 공급됩니다. (다이나믹셀 전용 제어기에는 위의 회로가 내장되어 있습니다)

위의 회로도에서 TTL Level의 TxD와 RxD는 DIRECTION 485의 Level에 따라 다음과 같이 Data 신호의 방향이 결정됩니다.
- DIRECTION485 Level =High인 경우: TxD의 신호가 D+, D-로 출력
- DIRECTION485 Level =Low인 경우: D+, D-의 신호가 RxD로 입력

## [핀 배열](#핀-배열)
커넥터의 핀 배열은 아래 그림과 같습니다. {% if page.product_group=='dxl_p' %}다이나믹셀-P 시리즈{% else %}다이나믹셀 PRO 시리즈{% endif %}에 있는 두 개의 4P 커넥터는 내부에서 서로 연결되어 있으므로 두 개 중 어떠한 커넥터에 연결해도 {% if page.product_group=='dxl_p' %}다이나믹셀-P 시리즈{% else %}다이나믹셀 PRO 시리즈{% endif %} 를 구동시킬 수 있습니다. 또한, 2Pin 커넥터는 파워 커넥터 전용으로, 높은 전류를 사용할 때에는, 이 커넥터를 통해서 전원을 공급해주는 것을 권장합니다.

{% if page.product_group=='dxl_p' %}
![](/assets/images/dxl/p/pin_name.png)

![](/assets/images/dxl/p/connection.png)

![](/assets/images/dxl/p/wiring.png)
{% else %}
![](/assets/images/dxl/pro/clip_image003.png)

![](/assets/images/dxl/pro/clip_image005.jpg)

![](/assets/images/dxl/pro/clip_image007.png)
{% endif %}

**경고** : 배선 시에는 핀 배열이 틀리지 않도록 각별히 주의하십시오. 올바르게 연결되지 않을 경우 다이나믹셀의 심각한 손상을 초래할 수 있습니다.
{: .notice--warning}

### [연결 확인](#연결-확인)

배선을 통하여 다이나믹셀에 전원이 올바르게 공급되었다면 다이나믹셀의 LED가 한 번 깜박입니다.
