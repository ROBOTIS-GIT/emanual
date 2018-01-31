
Internally the controller sets a counter; this is the parameter for the high resolution timer.
This timer is set for every 1ms, useful for more accurate timing.
 
##### Characteristics

- The timer can be set and the actual time can be checked.
- Timer value is between 0 and 65535. Timers shows 1 unit for every 1ms
- When the timer is set, it will start to count every 0.001 seconds, and you will be able to see how much time is left.
 
##### Corresponding RoboPlus Task Command

- Parameter : [HR Timer]
- Constants : Timer Values

[HR Timer]: /docs/en/software/rplus1/task/programming_02/#hr-timer
