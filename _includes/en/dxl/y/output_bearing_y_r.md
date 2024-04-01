
## [Output bearing specifications (Table.B1)](#output-bearing-specifications-tableb1)

| Model             | Basic dynamic load rating, C [N] |  Offset from flange, df [m] | Roller pitch circle diameter, Dp [m] | Allowable Dynamic equivalent radial load, Pc_max [N]<sup>1)</sup> | Allowable moment load, M_max [N.m]<sup>2)</sup> |
|:-----------------:|:-----:|:------:|:------:|:------:|:----:|
| YM070-210-R051-RH | 5,182 | 0.0086 | 0.0498 | 1677.1 | 44.5 |
| YM070-210-R099-RH | 5,182 | 0.0086 | 0.0498 | 2046.4 | 54.4 |
| YM080-230-R051-RH | 6,842 | 0.0093 | 0.0569 | 2091.3 | 63.0 |
| YM080-230-R099-RH | 6,842 | 0.0093 | 0.0569 | 2551.7 | 76.9 |


{% capture output_bearing_notice1 %}  
**note :**  
1&#41; Allowable dynamic equivalent load (Pc_max)  must not exceed this value   
2&#41; Allowable moment load, Ma is Lr+df=0 and La=0
{% endcapture %}

<div class="notice">{{ output_bearing_notice1 | markdownify }}</div>

## [Output bearing life](#output-bearing-life)
The bearing life of the Dynamixel-Y output bearing is obtained from the following equation.

![](/assets/images/dxl/y/bearing_formula/r_1.png)  

- L<sub>10</sub> - Bearing life [hour]
- N<sub>a</sub> - Average output speed [rpm]
- C - Basic dynamic load rating [N]
- P<sub>c</sub> - Dynamic equivalent load [N]
- T<sub>f</sub> - Temperature factor (Tf=1.0 less 100℃)
- L<sub>f</sub> - Load factor (Table.B2)


## [Allowable dynamic equivalent load, Pc_max](#allowable-dynamic-equivalent-load-pc_max)

![](/assets/images/dxl/y/bearing_formula/r_2.png)   

- L<sub>10</sub> - Bearing life [hour] @ 7,000 hour
- N<sub>n</sub> - Nominal output speed [rpm] @ input speed 2,000rpm ÷ gear ratio
- C- Basic dynamic load rating [N]
- T<sub>f</sub> - Temperature factor (Tf=1.0 less 100℃) @ Tf = 1.0
- L<sub>f</sub> - Load factor (Table.B2) @ Lf=1.0
- P<sub>c_max</sub> - Allowable dynamic equivalent radial load [N]


## [Dynamic equivalent load, Pc](#dynamic-equivalent-load-pc)
The dynamic equivalent load of the Dynamixel-Y output bearing is obtained from the following equation.

![](/assets/images/dxl/y/bearing_formula/r_3.png) 

- P<sub>c</sub> - Dynamic equivalent radial load [N]
- F<sub>r</sub> - Radial load [N]
- F<sub>a</sub> - Axial load [N]
- M - Moment [N.m]
- X - Dynamic radial factor (Table.B3)
- Y - Dynamic axial factor (Table.B3)
- D<sub>p</sub> - Roller pitch circle diameter [m]

![](/assets/images/dxl/y/bearing_formula/r_4.png) 


## [Allowable radial load, Fr_max](#allowable-radial-load-fr_max)

![](/assets/images/dxl/y/bearing_formula/r_5.png) 

- P<sub>c_max</sub> - Allowable dynamic equivalent radial load [N]
- F<sub>a</sub> - Axial load [N]
- M - Moment [N.m]
- X - Dynamic radial factor (Table.B3)
- Y - Dynamic axial factor (Table.B3)
- D<sub>p</sub> - Roller pitch circle diameter [m] (Table.B1)
- d<sub>f</sub> - Offset from flange [m]
- L<sub>r</sub> - Distance of radial load [m]
- F<sub>r_max</sub> - Allowable radial load [N]

## [Tables](#tables)

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