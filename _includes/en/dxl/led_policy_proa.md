{% capture dxl_led_policy %}  
**NOTE** :  
The LED indicates present status of the device.

|      Status      |  LED Representation  |
|:----------------:|:--------------------:|
|     Booting      |  Green LED flickers once   |
|  Factory Reset   | Green LED flickers 4 times |
|      Alarm       |     Red LED flickers     |

{% endcapture %}
<div class="notice">{{ dxl_led_policy | markdownify }}</div>
