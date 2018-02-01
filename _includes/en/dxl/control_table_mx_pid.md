MX series will use the PID controller as a main control method.  
- `P gain` : value of proportional band.
- `I gain` : value of integral action.
- `D Gain` : value of derivative action.
Gains values are in between 0 ~ 254.

![](/assets/images/dxl/mx/mx-12_pid_control.png)

- `K<sub>p</sub>` = P Gain / 8
- `K<sub>i</sub>` = I Gain * 1,000 / 2,048
- `K<sub>d</sub>` = D Gain * 4 / 1,000

**The relationship between Compliance Slop and PID**

|Slope|P Gain|
| :---: | :---: |
|8|128|
|16|64|
|32|32|
|64|16|
|128|8|

The less the P gain, The larger the back lash, and the weaker the amount of output near goal position.  
At some extent, it is like a combined concept of margine and slope.  
It does not exactly match the previous concept of compliance. So it is obvious if you see the difference in terms of motion.  
**Explanation for PID required.**  
For the brief explanation about general PID, please refer to the website(link) below.  
[http://en.wikipedia.org/wiki/PID_controller](http://en.wikipedia.org/wiki/PID_controller)  
FYI, PID control theory is not only limited to the control of motor(actuator) but is a generic theory that can be applied to all kinds of control.
