장치는 다용도로 사용 가능한 External Port를 제공합니다.  
External Port의 용도는 External Port Mode에 의해서 결정되고, External Port의 신호는 External Port Data(152 ~ 157)에 의해서 제어됩니다.  
자세한 사항은 External Port Data(152 ~ 157)을 참고하세요.

|External Port Mode|명칭|설명|
| :---: | :---: | :---: |
|0|AI(Analogue Input)|External Port 신호를 12[bit] Digital로 변환|
|1|DO_PP(Digital Output Push-Pull)|External Port를 0 [V] 또는3.3 [V]로 출력|
|2|DI_PU(Digital Input Pull-Up)|External Port 신호를 '0' 또는 '1'의 Digital 신호로 변경<br />External Port에 신호가 연결되어 있지 않을 경우 '1'|
|3(초기값)|DI_PD(Digital Input Pull-Down)|External Port 신호를 '0' 또는 '1'의 Digital 신호로 변경<br />External Port에 신호가 연결되어 있지 않을 경우 '0'|
