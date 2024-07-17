{% assign present_position= "[Present Position(552)]" %}

Used to adjust the zero position of the servo. This value is added to the actual position reported by the contactless encoder to produce the {{ present_position }} value.  
{{ present_position }} = Actual Position + Homing Offset


|   Unit    |       Range                    |
|:---------:|:------------------------------:|
| 1 [Pulse] | -2,147,483,648 ~ 2,147,483,647 |
