{% capture dxl_led_policy %}  
**WARNING** :  
The LED indicates present status of the device.

|      Status      |  LED Representation  |
|:----------------:|:--------------------:|
|     Booting      |  LED flickers once   |
|      Reset       | LED flickers 4 times |
|      Alarm       |     LED flickers     |
| Slave Mode(X540) | LED flickers 3 times |
|    Boot Mode     |        LED On        |

{% endcapture %}
<div class="notice--warning">{{ dxl_led_policy | markdownify }}</div>
