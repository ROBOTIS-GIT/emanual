{% capture dxl_led_policy %}  
**WARNING** :  
The LED indicates present status of the device.

| Status  | LED Representation |
|:-------:|:------------------:|
| Booting | LED flickers once  |

{% endcapture %}
<div class="notice--warning">{{ dxl_led_policy | markdownify }}</div>
