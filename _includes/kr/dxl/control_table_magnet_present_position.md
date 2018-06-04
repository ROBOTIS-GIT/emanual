장치의 현재 위치 값입니다. 값의 범위는 0 ~ 4,095 (0xFFF)이며 단위는 0.088 [&deg;] 입니다.

![](/assets/images/dxl/mx/mx_position.png)

> 위 그림은 장치를 정면에서 바라본 그림입니다.

다중 회전 모드일 때 값의 범위는 -28,672 ~ 28,672 이며 단위는 Resolution Divider 값에 따라 (0.088 * Resolution Divider)도로 변화 합니다.

**NOTE** : 다중 회전 모드(Multi-turn Mode)일 때 실제 위치와 Present Position의 관계는 Resolution Divider와 Multi Turn offset의 값에 따라 달라 질 수 있습니다. 더 자세한 내용은 Multi Turn offset과 Resolution Divider를 참고 하시기 바랍니다.
{: .notice}
