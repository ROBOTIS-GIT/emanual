{% capture dxl_led_policy %}  
**NOTE** : The LED indicates present status of the device.

| Status     | LED Representation      |
|:--------:|:-------------:|
| Booting     | Green LED flickers once |
| Reset   | Green LED flickers 4 times |
| Alarm     | Red LED flickers     |
| Boot Mode | Solid Purple LED  |

{% endcapture %}
<div class="notice">{{ dxl_led_policy | markdownify }}</div>
