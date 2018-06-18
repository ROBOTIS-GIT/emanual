{% capture dxl_led_policy %}  
**NOTE** :  
The LED indicates present status of the device.

|       Status       |  LED Representation  |
|:------------------:|:--------------------:|
|      Booting       |  LED flickers once   |
|       Reset        | LED flickers 4 times |
|       Alarm        |     LED flickers     |
| Slave Mode(MX-106) |        LED On        |
|     Boot Mode      |        LED On        |

{% endcapture %}
<div class="notice">{{ dxl_led_policy | markdownify }}</div>
