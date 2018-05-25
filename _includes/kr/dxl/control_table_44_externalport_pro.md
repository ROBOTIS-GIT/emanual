다이나믹셀 프로에는 다용도의 외부확장포트가 있습니다.

|항목|범위|
| :---: | :---: |
|전압| 0 ~ 3.3 [V]|
|전류| 0 ~ 5 [mA]|

- Analog input mode: 외부 포트에 연결된 analog 값을 digital 값으로 변환해줍니다. 이 값은 외부 포트 데이터(626 ~ 632) 에 자동으로 업데이트 됩니다.
- Output mode: 외부 포트의 전압을 0 [V] 또는 3.3 [V]로 조절할 수 있습니다. 외부 포트 데이터에 0을 쓰면 0 [V], 1을 쓰게 되면 3.3 [V]가 나옵니다.
- Pull-up input mode: 외부포트의 값이 0인지 1인지 확인 할 수 있습니다. 외부 확장포트에 들어오는 전압에 따라서, External port data의 값이 변합니다. 0 [V]일땐 0. 3.3 [V]일땐 1이 됩니다. 이 포트는 week pull-up 됩니다. 필요에 따라 외부에 추가로 Strong pull-up 회로를 추가하셔도 됩니다.
- Pull-up output mode: 외부포트의 값이 0인지 1인지 확인 할 수 있습니다. 외부 확장포트에 들어오는 전압에 따라서, External port data의 값이 변합니다. 0 [V]일땐 0. 3.3 [V]일땐 1이 됩니다. 이 포트는 week pull-down 됩니다. 필요에 따라 외부에 추가로 Strong pull-down 회로를 추가하셔도 됩니다.

#### 외부 확장 포트의 위치 및 핀 기능
아래와 같이 나사를 제거하고 커버를 들어내면 외부 확장 포트가 드러납니다.

![](/assets/images/dxl/pro/pro_external_port.png)

![](/assets/images/dxl/pro/pro_external_port_pinout.png)

|핀 1|핀 2|핀 3|핀 4|핀 5|핀 6|
| :---: | :---: | :---: | :---: | :---: | :---: |
|GND|3.3V|PORT1|PORT2|PORT3|PORT4|
