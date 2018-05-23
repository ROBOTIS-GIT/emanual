
0점의 위치를 조절 할 수 있습니다. 이 값은 Present Position(36)에 더해지게 됩니다.  
Present Position = 실제 위치 + Multi Turn offset 이 됩니다.  
초기값은 0 값의 범위는 -24,576 ~ 24,576 까지 입니다.  
모터의 실제 위치가 2,048값에 있을 때 Multi Turn offset = 1,024를 적용하면 모터는 회전 하지 않지만 Present Position의 값은 3,072가 됩니다.

![](/assets/images/dxl/mx/mx-12_multiturn_offset.jpg)

**NOTE** : 다중 회전 모드(Multi-turn Mode)일 때 만 이 값이 적용되며, 그 외의 모드에서는 이 값은 무시 됩니다.
{: .notice}
