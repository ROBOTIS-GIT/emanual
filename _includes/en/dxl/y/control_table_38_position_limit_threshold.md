{% assign present_position= "[Present Position(552)]" %}
{% assign max_position_limit= "[Max Position Limit(76)]" %}
{% assign min_position_limit= "[Min Position Limit(84)]" %}

The Position Limit Threshold is the threshold for triggering Position Limit Reached Errors. If the value of {{ present_position }} is outside the range of ({{ max_position_limit }} + Position Limit Threshold) ~ ({{ min_position_limit }} -  Position Limit Threshold), a Position Limit Reached Error will be triggered. If this value is ‘0’, Position Limit Reached Errors are disabled.

|   Unit    |    Range   |
|:---------:|:----------:|
| 1 [Pulse] | 0 ~ 32,767 |


