{% assign goal_position= "[Goal Position(532)]" %}

In Position Control mode, the Position Limits serves as a limit for target positions within the servo's 32-bit range of motion (-2,147,483,647 ~ 2,147,483,647). In Position Control mode, the {{ goal_position }} cannot exceed this value. If a value greater than this limit is set, the returned status packet will include a Data Limit Error in the Error field.

|   Unit    |            Range               |
|:---------:|:------------------------------:|
| 1 [pulse] | -2,147,483,648 ~ 2,147,483,647 |


