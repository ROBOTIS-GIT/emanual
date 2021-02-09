PID 제어기의 블럭다이어그램은 다음과 같습니다.
- `P Gain`은 Propotional Gain값 입니다.
- `I Gain`은 Integral Gain값 입니다.
- `D Gain`은, Derivative Gain값 입니다.
값의 범위는 0 ~ 254 입니다.

![](/assets/images/dxl/mx/mx-12_pid_control.png)

- **K<sub>p</sub>** = P Gain / 8
- **K<sub>i</sub>** = I Gain * 1,000 / 2,048
- **K<sub>d</sub>** = D Gain * 4 / 1,000

**PID 와 컴플라이언스 슬로프와의 관계**

| Slope | P Gain |
|:-----:|:------:|
|   8   |  128   |
|  16   |   64   |
|  32   |   32   |
|  64   |   16   |
|  128  |   8    |

P Gain이 작을수록 유격이 커지고 목표위치 근처에서의 출력이 약해집니다.  
즉, Margin과 Slope를 합친 것과 같은 개념입니다.  
구형 다이나믹셀의 Compliance의 개념과 매칭되지 않습니다.  

**참고**: PID 제어론은 단순히 모터 제어에만 국한되지 않고, 모든 제어에 적용할 수 있는 일반적인 이론입니다. PID 제어에 대한 자세한 정보는 [PID Controller](http://en.wikipedia.org/wiki/PID_controller)를 참고하세요.
{: .notice}
