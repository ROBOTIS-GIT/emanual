
## [Output bearing specifications (Table.B1)](#output-bearing-specifications-tableb1)

| Model             | Basic dynamic load rating, C [N] | Length between bearings 1 and 2, LC [m] | Length from output to bearing 2, df[m] | Allowable Dynamic equivalent load, Pc_max[N]<sup>1)</sup> |
|:-----------------:|:-----:|:------:|:------:|:----:|
| YM070-210-M001-RH | 1,091 | 0.0177 | 0.0085 | 61.4 |
| YM080-230-M001-RH | 1,143 | 0.0197 | 0.0099 | 78.2 |

{% capture output_bearing_notice1 %}  
**Note :**  
1. Allowable dynamic equivalent load (Pc_max)  must not exceed this value during operation.
{% endcapture %}

<div class="notice">{{ output_bearing_notice1 | markdownify }}</div>

## [Output bearing life](#output-bearing-life)
An estimate of the bearing life for the Dynamixel-Y output bearing can be calculated using the following equation:

![](/assets/images/dxl/y/bearing_formula/m_1.png)  


- L<sub>10</sub> - Bearing service life [hours]
- N<sub>a</sub> - Average output speed [rpm]
- C - Basic dynamic load rating [N]
- P<sub>c</sub> - Dynamic equivalent load [N]
- T<sub>f</sub> - Temperature factor (Tf=1.0 in environments of less than 100℃)
- L<sub>f</sub> - Load factor (Available in [Table.B2](#tables))
- P<sub>c_max</sub> - Allowable dynamic equivalent radial load [N]


## [Allowable dynamic equivalent load, Pc_max](#allowable-dynamic-equivalent-load-pc_max)

![](/assets/images/dxl/y/bearing_formula/m_2.png)   

- L<sub>10</sub> - Bearing service life [hour] @ 20,000 hour
- N<sub>n</sub> - Nominal output speed [rpm]
- C - Basic dynamic load rating [N]
- T<sub>f</sub> - Temperature factor (Tf=1.0 in environments of less than 100℃)
- L<sub>f</sub> - Load factor (Available in [Table.B2](#tables))
- P<sub>c_max</sub> - Allowable dynamic equivalent radial load [N]

## [Dynamic equivalent load, Pc](#dynamic-equivalent-load-pc)
The dynamic equivalent load of the Dynamixel-Y output bearing is obtained from the following equation.

![](/assets/images/dxl/y/bearing_formula/m_3.png) 

- P<sub>c</sub> - dynamic equivalent load[N]
- F<sub>a</sub> - Radial load[N]
- F<sub>a</sub> - Axial load [N]
- d<sub>f</sub> - Offset from flange [m] (Table.B1)
- L<sub>r</sub> - Distance of radial load [m]
- L<sub>c</sub> - Length between bearings 1 and 2 [m] (Available in [Table.B1](#output-bearing-specifications-tableb1))
- X - Dynamic radial factor (Available in [Table.B3](#tables))
- Y - Dynamic axial factor (Available in [Table.B3](#tables))

![](/assets/images/dxl/y/bearing_formula/m_4.png) 

## [Tables](#tables)

Table.B2 Load factor

| Conditions                           | Lf        |
|:-------------------------------------|:---------:|
| Smooth motion without impact         | 1.0 ~ 1.2 |
| Normal motion with occasional impact | 1.2 ~ 1.5 |
| Motion with severe impact            | 1.5 ~ 3.0 |

Table.B3 Dynamic radial/axial factor

| Fa/(ZD) | e    | Fa/Fr <= e<br>X &nbsp; &nbsp; Y  | Fa/Fr > e<br>X &nbsp; &nbsp; Y |
|:--------|:----:|:--------------------------------:|:------------------------------:|
| 0.172   | 0.19 | 1 &nbsp; &nbsp; 0                | 0.56 &nbsp; 2.30               |
| 0.345   | 0.22 | 1 &nbsp; &nbsp; 0                | 0.56 &nbsp; 1.99               |
| 0.689   | 0.26 | 1 &nbsp; &nbsp; 0                | 0.56 &nbsp; 1.71               |
| 1.03    | 0.28 | 1 &nbsp; &nbsp; 0                | 0.56 &nbsp; 1.55               |
| 1.38    | 0.30 | 1 &nbsp; &nbsp; 0                | 0.56 &nbsp; 1.45               |
| 2.07    | 0.34 | 1 &nbsp; &nbsp; 0                | 0.56 &nbsp; 1.31               |
| 3.45    | 0.38 | 1 &nbsp; &nbsp; 0                | 0.56 &nbsp; 1.15               |
| 5.17    | 0.42 | 1 &nbsp; &nbsp; 0                | 0.56 &nbsp; 1.04               |
| 6.89    | 0.44 | 1 &nbsp; &nbsp; 0                | 0.56 &nbsp; 1.00               |

 - where ZD : YM070=52.956, YM080=60.521
