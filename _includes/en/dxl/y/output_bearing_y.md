
## [Output Bearing Specifications (L10=7,000hours@rated output speed)](#output-bearing-specifications-l107000hoursrated-output-speed)

| Model             | Basic dynamic load rating, C [N] |  Offset from flange, df [m] | Roller pitch circle diameter, Dp [m] | <sup>1</sup>Allowable Dynamic equivalent radial load, Pc_max [N] | <sup>2</sup>Allowable moment load, M_max [N.m] |
|:-----------------:|:-----:|:------:|:------:|:------:|:----:|
| YM070-210-R051-RH | 5,182 | 0.0086 | 0.0498 | 1677.1 | 44.5 |
| YM070-210-R099-RH | 5,182 | 0.0086 | 0.0498 | 2046.4 | 54.4 |
| YM080-230-R051-RH | 6,842 | 0.0093 | 0.0569 | 2091.3 | 63.0 |
| YM080-230-R099-RH | 6,842 | 0.0093 | 0.0569 | 2551.7 | 76.9 |


{% capture output_bearing_notice1 %}  
**note :**  
1&#41; Allow dynamic equivalent radial load (Pc_mac) must not exceed this value.  
2&#41; Allowable moment load, Ma is Lr + df = 0, and La = 0
{% endcapture %}

<div class="notice">{{ output_bearing_notice1 | markdownify }}</div>

## [Bearing Life](#bearing-life)

![](/assets/images/dxl/y/bearing_formula_1.jpg)  


- L<sub>10</sub> - Bearing life [hour]
- N<sub>a</sub> - Average output speed [rpm]
- C - Basic dynamic load rating [N]
- P<sub>c</sub> - Dynamic equivalent radial load [N]
- T<sub>f</sub> - Temperature factor (Tf=1.0 less 100℃)
- L<sub>f</sub> - Load factor (Table.B2)


## [Dynamic Equivalent Radial Load](#dynamic-equivalent-radial-load)

![](/assets/images/dxl/y/bearing_formula_2.jpg)   

- P<sub>c</sub> - Dynamic equivalent radial load [N]
- F<sub>r</sub> - Radial load [N]
- F<sub>a</sub> - Axial load [N]
- M - Moment [N.m]
- X - Dynamic radial factor (Table.B3)
- Y - Dynamic axial factor (Table.B3)
- D<sub>p</sub> - Roller pitch circle diameter [m]


## [Dynamic Equivalent Radial Allowable Load](#dynamic-equivalent-radial-allowable-load)

![](/assets/images/dxl/y/bearing_formula_3.jpg)  

- L<sub>10</sub> - Bearing life [hour] @ 7,000 hour
- N<sub>n</sub> - Nominal output speed [rpm] @ input speed 2,000rpm ÷ gear ratio
- C- Basic dynamic load rating [N]
- T<sub>f</sub> - Temperature factor (Tf=1.0 less 100℃) @ Tf = 1.0
- L<sub>f</sub> - Load factor (Table.B2) @ Lf=1.0
- P<sub>c_max</sub> - Allowable dynamic equivalent radial load [N]


## [Allowable Radial Load](#allowable-radial-load)

![](/assets/images/dxl/y/bearing_formula_4.jpg)  


- P<sub>c_max</sub> - Allowable dynamic equivalent radial load [N]
- F<sub>a</sub> - Axial load [N]
- M - Moment [N.m]
- X - Dynamic radial factor (Table.B3)
- Y - Dynamic axial factor (Table.B3)
- D<sub>p</sub> - Roller pitch circle diameter [m] (Table.B1)
- d<sub>f</sub> - Offset from flange [m]
- L<sub>r</sub> - Distance of radial load [m]
- F<sub>r_max</sub> - Allowable radial load [N]

## [Table](#table)

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
| If, Fr=0 and M=0, assuming X=0.67, Y=0.67 |      |      |