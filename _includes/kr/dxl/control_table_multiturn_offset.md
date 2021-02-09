
0점의 위치를 조절 할 수 있습니다. 이 값은 [Present Position(36)](#present-position)에 더해지게 됩니다.  
Present Position = 실제 위치 + Multi Turn offset 이 됩니다.  
기본값은 0 값의 범위는 -24,576 ~ 24,576 까지 입니다.  
모터의 실제 위치가 2,048값에 있을 때 Multi Turn offset = 1,024를 적용하면 모터는 회전 하지 않지만 Present Position의 값은 3,072가 됩니다.

![](/assets/images/dxl/mx/mx-12_multiturn_offset.jpg)

**참고** : 다중 회전 모드(Multi-turn Mode, CW 및 CCW가 모두 0인 조건, [CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8)의 동작모드 참고) 일 때 [Multiturn Offset(20)](#multi-turn-offset), [Resolution Divider(22)](#resolution-divider)이 적용되며, 그 외의 모드에서는 무시됩니다.
{: .notice}
