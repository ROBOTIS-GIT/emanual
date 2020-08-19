The Min and Max Position Limit(48, 52) limit maximum and minimum desired positions for Position Control Mode(Joint Mode) within the range of 1 rotation(0 ~ 4,095).  
Therefore, [Goal Position(116)] should be configured within the position limit range.  
These values are not used in Extended Position Control Mode{% if page.product_group!='dxl_xl430' %} and Current-based Position Control Mode{% else %}{% endif %}.

|     Unit      |      Value Range      |
|:-------------:|:---------------------:|
| 0.088 [&deg;] | 0 ~ 4,095(1 rotation) |

**NOTE** : Max Position Limit(48) and Min Position Limit(52) are only used in Position Control Mode with a single turn.
{: .notice}
