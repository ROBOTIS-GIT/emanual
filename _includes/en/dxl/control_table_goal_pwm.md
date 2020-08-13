When the [Operating Mode(11)] is **PWM Control Mode**, both the PID and Feedforward controllers will be deactivated as the Goal PWM(100) value directly controls a motor via an inverter. But on the other [Operating Mode(11)], the Goal PWM(100) limits PWM value only. Read [Position PID Gain(80, 82, 84), Feedforward 1st/2nd Gains(88, 90)](#position-pid-gain80-82-84) or [Velocity PI Gain(76, 78)](#velocity-pi-gain76-78) for how Goal PWM (100) works with the gains.

|               Range                |               Description                |
|:----------------------------------:|:----------------------------------------:|
| -[PWM Limit(36)] ~ [PWM Limit(36)] | Initial Value of [PWM Limit(36)] : ‘885’ |

 **NOTE**: Goal PWM(100) can not exceed [PWM Limit(36)].
 {: .notice}
