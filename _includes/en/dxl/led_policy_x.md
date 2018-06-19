{% capture dxl_led_policy %}  
**NOTE** :  
The LED indicates present status of the device.

|      Status      |  LED Representation  |
|:----------------:|:--------------------:|
|     Booting      |  LED flickers once   |
|  Factory  Reset  | LED flickers 4 times |
|      Alarm       |     LED flickers     |
| Slave Mode(X540) | LED flickers 3 times |
|    Boot Mode     |        LED On        |

{% endcapture %}
<div class="notice">{{ dxl_led_policy | markdownify }}</div>
