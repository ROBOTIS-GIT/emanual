{% assign present_velocity= "[Present Velocity(548)]" %}
{% assign operating_mode= "[Operating Mode(33)]" %}

The frequency of the Low-Pass Filter used to smooth the generation of [Present Velocity(548)]. This is the setting to define the Present Velocity Filter in the {{ operating_mode }} block diagram. Adjusting this value can lead to improved control performance if there is noise in the calculated velocity value.

| Unit     | Range      |
|:---------|:-----------|
| 0.1[Hz]  | 0 ~ 65,535 |
