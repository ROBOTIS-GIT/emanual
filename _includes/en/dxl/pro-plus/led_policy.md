{% capture dxl_led_policy %}  
**WARNING** :  
The LED indicates present status of the device.

| Status     | LED Representation      |
|:--------:|:-------------:|
| Booting     | Green LED flickers once |
| Reset   | Green LED flickers 4 times |
| Alarm     | Red LED flickers     |
| Boot Mode | Solid Purple LED  |

{% endcapture %}
<div class="notice--warning">{{ dxl_led_policy | markdownify }}</div>
