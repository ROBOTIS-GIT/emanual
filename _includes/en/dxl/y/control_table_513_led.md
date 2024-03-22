Turns the LED ON/OFF.

| Value |  Description                                 |
| :---: | :------------------------------------------: |
| 0     | Turns off the LED at the back of the device. |
| 1     | Turns on the LED at the back of the device.  |


{% capture LED %}
**Note** : LED operation according to the device's status (condition).

| Status        | LED Operation   |
|:-------------:|:---------------:|
| Boot-up       | Single blink    |
| Factory Reset | Four blinks     |
| Alarm         | Steady blinking |
| Boot Mode     | Illuminated     |
{% endcapture %}

<div class="notice">{{ LED | markdownify }}</div>
