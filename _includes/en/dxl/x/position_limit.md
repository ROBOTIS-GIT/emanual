The Min and Max Position Limit(48, 52) is used to configure the maximum movement range in Position Control Mode within a single rotation(0 ~ 4,095).  
Provided [Goal Position(116)] values must be within the configured position limit range.  

|     Unit      |      Value Range      |
|:-------------:|:---------------------:|
| 0.088 [&deg;] | 0 ~ 4,095(1 rotation) |

**NOTE** : Max Position Limit(48) and Min Position Limit(52) are only used in Position Control Mode within a single turn.
The angle limits set through this control table item do not apply in Extended Position Control Mode{% if page.product_group!='dxl_xl430' %} and Current-based Position Control Mode{% else %}{% endif %}.
{: .notice--warning}
