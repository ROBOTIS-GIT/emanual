
모터의 해상도를 변경 할 수 있습니다.  
초기값은 1이며 1 ~ 4까지 사용 가능합니다.  
모터의 해상도를 낮추고 CW, CCW 방향으로 회전 횟수를 늘릴 수 있습니다.  
각 방향으로 최대 28바퀴까지 회전 가능 합니다.  

```
Present Position = 실제 위치 / Resolution Divider
```

예를 들어, 실제 위치 값이 2,048 일 때 Resolution Divider의 값이 2이면 2,048/2 = 1,024 즉 Present Position의 값은 1,024가 됩니다.  
이렇게 Resolution Divider의 값을 2로 변경하면 모터의 한 바퀴의 해상도는 2,048이 됩니다.  
Multi Turn offset과 Resolution Divider를 같이 사용한다면 Present Position은 아래와 같은 식을 통해 구할 수 있습니다.  

```
Present Position = (실제 위치/ Resolution Divider) + Multi Turn offset
```

모터의 실제 위치가 2,048값에 있을 때 Multi Turn offset = 1,024, Resolution Divider = 4 를 적용하면 모터는 회전하지 않지만 Present Position의 값은 1,535가 됩니다.

![](/assets/images/dxl/mx/mx-12_res_divider.jpg)

**참고** : 다중 회전 모드(Multi-Turn Mode) 일 때 만 이 값이 적용되며, 그 외의 모드에서는 이 값은 무시 됩니다.
{: .notice}
