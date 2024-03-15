Goal Position(532)을 통해 목표 위치를 설정 할 수 있습니다.  
위치 제어 모드 일 때 [Min Position limit(84)] 에서 [Max position limit(76)] 까지 입력 가능합니다. [Min Position limit(84)] 에서 [Max position limit(76)] 값을 변경하여 -2,147,483,648 에서 2,147,483,647 까지 사용 가능합니다. 

| 단위                        | 범위                                           |  제어  모드                              |               설명                  |
|:---------------------------:|:-----------------------------------------------:| :-------------------------------------|:-------------------------------------|
| 1 [pulse] (약 0.006866 deg) | Min Position limit(84) ~ Max position limit(76) | 전류 제어<br />속도 제어<br />위치 제어 |사용 안함<br />사용 안함<br />16,000 = 16,000 [pulse] 위치로 이동

**참고** : 전자 기어비 [Gear Ratio Num(96)/Den(100)] 값이 1이 아닌 경우 Goal Position(532) 값에 해당 값을 곱하여 제어기에 반영됩니다.
{: .notice}

[Gear Ratio Num(96)/Den(100)]: #electronic-gear-ratio-numeratorDenominator96-100
