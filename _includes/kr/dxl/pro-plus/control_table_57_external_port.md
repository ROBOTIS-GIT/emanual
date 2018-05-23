다이나믹셀 프로에는 다용도의 외부확장포트가 있습니다.

|항목   | 범위      |
| :---: | :---:    |
|전압   | 0 ~ 3.3 [V] |
|전류   | 0 ~ 5 [mA]  |

|External Port Mode| 명칭                     |설명|
| :---:            | :---:                    | :---: |
|0                 | Analogue Input           | External Port 신호를 12[bit] Digital로 변환|
|1                 | Digital Output Push-Pull | External Port를 0[V] 또는3.3[V]로 출력|
|2                 | Digital Input Pull-Up    | External Port 신호를 '0' 또는 '1'의 Digital 신호로 변경<br />External Port에 신호가 연결되어 있지 않을 경우 '1'|
|3(초기값)          | Digital Input Pull-Down  | External Port 신호를 '0' 또는 '1'의 Digital 신호로 변경<br />External Port에 신호가 연결되어 있지 않을 경우 '0'|

#### 외부 확장 포트의 위치 및 핀 기능
아래와 같이 나사를 제거하고 커버를 들어내면 외부 확장 포트가 드러납니다.

![](/assets/images/dxl/pro/pro_external_port.png)

![](/assets/images/dxl/pro/pro_external_port_pinout.png)

|핀 1|핀 2|핀 3|핀 4|핀 5|핀 6|
| :---: | :---: | :---: | :---: | :---: | :---: |
|GND|3.3V|PORT1|PORT2|PORT3|PORT4|
