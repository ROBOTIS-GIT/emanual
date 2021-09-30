## [혼과 기어 교체](#혼과-기어-교체)

혼은 다이나믹셀 정면의 출력축에 부착되어 있으며 베어링은 후면에 부착되어 있습니다.

### [혼 조립하기](#혼-조립하기)

아래 그림과 같이 혼과 기어의 마킹 위치에 맞추어 혼을 조립합니다.

{% if page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' %}

![](/assets/images/dxl/x/xw/xw540_marking.png)

혼을 끼워넣을 때 혼의 중심부를 밀면서 조립합니다.

{% else %}

![](/assets/images/dxl/x/x430_marking.png)

혼을 끼워넣을 때 혼의 중심부를 밀면서 조립합니다.

### [기어 교체하기](#기어-교체하기)

기어가 손상되거나 오랜 사용으로 닳게 되면 교체해야 합니다.
아래 동영상을 참조해서 교체하시기 바랍니다.

<iframe width="560" height="315" src="https://www.youtube.com/embed/wKxcZNMrrCQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [다이나믹셀 캘리브레이션](#다이나믹셀-캘리브레이션)

다이나믹셀의 내부 기어를 교체 후, 기어의 초기 위치를 정렬하는 캘리브레이션이 필요합니다. 다음 영상을 참고하여, 캘리브레이션을 진행하세요.

<iframe width="560" height="315" src="https://www.youtube.com/embed/uK--PBy88Mo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

{% capture dynamixel_calibration %}
**참고**: 
- USB2Dynamixel은 단종되었습니다. PC와 다이나믹셀에서 통신하기위해서는 [U2D2](https://emanual.robotis.com/docs/kr/parts/interface/u2d2/)를 사용하세요.
- 다이나믹셀 MX 또는 X 시리즈를 사용하는 유저는 [다이나믹셀 위자드 2.0](https://emanual.robotis.com/docs/kr/software/dynamixel/dynamixel_wizard2/#캘리브레이션)을 통해서도, 다이나믹셀 캘리브레이션을 진행 할 수있습니다. 
{% endcapture %}

<div class="notice">{{ dynamixel_calibration | markdownify }}</div>

{% endif %}
