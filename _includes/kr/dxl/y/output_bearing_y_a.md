
## [출력부 베어링 사양 (Table.B1)](#출력부-베어링-사양-tableb1)


| Model             | Basic dynamic load rating, C [N] |  Offset from flange, df [m] | Roller pitch circle diameter, Dp [m] | Allowable Dynamic equivalent radial load, Pc_max [N]<sup>1)</sup> | Allowable moment load, M_max [N.m]<sup>2)</sup> |
|:-----------------:|:-----:|:------:|:------:|:------:|:----:|
| YM070-210-A051-RH | 5,182 | 0.0086 | 0.0498 | 1677.1 | 44.5 |
| YM070-210-A099-RH | 5,182 | 0.0086 | 0.0498 | 2046.4 | 54.4 |
| YM080-230-A051-RH | 6,842 | 0.0093 | 0.0569 | 2091.3 | 63.0 |
| YM080-230-A099-RH | 6,842 | 0.0093 | 0.0569 | 2551.7 | 76.9 |


{% capture output_bearing_notice1 %}  
**참고 :**  
1&#41; 허용 동등가 하중값 (Pc_max)을 초과하여 사용하지 마십시오.  
2&#41; 허용모멘트 하중, M_max는 Lr+df=0, La=0 입니다.
{% endcapture %}

<div class="notice">{{ output_bearing_notice1 | markdownify }}</div>

## [베어링 수명](#베어링-수명)
Dynamixel-Y 출력부의 베어링 수명은 다음식으로 결정할 수 있습니다.

![](/assets/images/dxl/y/bearing_formula/r_1.png)  

- L<sub>10</sub> - Bearing life [hour]
- N<sub>a</sub> - Average output speed [rpm]
- C - Basic dynamic load rating [N]
- P<sub>c</sub> - Dynamic equivalent load [N]
- T<sub>f</sub> - Temperature factor (Tf=1.0 less 100℃)
- L<sub>f</sub> - Load factor (Table.B2)


## [허용 동등가 하중, Pc_max](#허용-동등가-하중-pc_max)

![](/assets/images/dxl/y/bearing_formula/r_2.png)   

- L<sub>10</sub> - Bearing life [hour] @ 7,000 hour
- N<sub>n</sub> - Nominal output speed [rpm] @ input speed 2,000rpm ÷ gear ratio
- C- Basic dynamic load rating [N]
- T<sub>f</sub> - Temperature factor (Tf=1.0 less 100℃) @ Tf = 1.0
- L<sub>f</sub> - Load factor (Table.B2) @ Lf=1.0
- P<sub>c_max</sub> - Allowable dynamic equivalent load [N]


## [동등가 하중, Pc](#동등가-하중-pc)
Dynamixel-Y 출력부 베어링의 동등가 하중은 다음식으로 결정할 수 있습니다.

![](/assets/images/dxl/y/bearing_formula/r_3.png) 

- P<sub>c</sub> - dynamic equivalent load [N]
- F<sub>r</sub> - Radial load [N]
- F<sub>a</sub> - Axial load [N]
- M - Moment [N.m]
- X - Dynamic radial factor (Table.B3)
- Y - Dynamic axial factor (Table.B3)
- D<sub>p</sub> - Roller pitch circle diameter [m]

![](/assets/images/dxl/y/bearing_formula/r_4.png) 


## [허용 반경방향 하중, Fr_max](#허용-반경방향-하중-fr_max)

![](/assets/images/dxl/y/bearing_formula/r_5.png) 

- P<sub>c_max</sub> - Allowable dynamic equivalent load [N]
- F<sub>a</sub> - Axial load [N]
- M - Moment [N.m]
- X - Dynamic radial factor (Table.B3)
- Y - Dynamic axial factor (Table.B3)
- D<sub>p</sub> - Roller pitch circle diameter [m] (Table.B1)
- d<sub>f</sub> - Offset from flange [m]
- L<sub>r</sub> - Distance of radial load [m]
- F<sub>r_max</sub> - Allowable radial load [N]

## [테이블](#테이블)

Table.B2 Load factor

| Conditions                   | Lf        |
|:-----------------------------|:---------:|
| Smooth motion without impact | 1.0 ~ 1.2 |
| Normal motion                | 1.2 ~ 1.5 |
| Motion with severe impact    | 1.5 ~ 3.0 |  


Table.B3 Dynamic radial/axial factor

| Classification                            | X    | Y    |
|:------------------------------------------|:----:|:----:|
| F_a/(F_r+2M/Dp)≤1.5                       | 1.0  | 0.45 |
| F_a/(F_r+2M/Dp)≤1.5                       | 0.67 | 0.67 |

- If, Fr=0 and M=0, assuming X=0.67, Y=0.67