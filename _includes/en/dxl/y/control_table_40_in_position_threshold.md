{% assign moving_status= "[Moving Status(541)]" %}
{% assign goal_position= "[Goal Position(532)]" %}
{% assign present_position= "[Present Position(552)]" %}
The threshold for determining the In-Position Bit of {{ moving_status }}. If the difference between the {{ goal_position }} and {{ present_position }} is smaller than this value, the In-Position Bit of the {{ moving_status }} register will be set to '1'. 

|   Unit    |      Range        |
|:---------:|:-----------------:|
| 1 [Pulse] | 0 ~ 2,147,483,647 |
