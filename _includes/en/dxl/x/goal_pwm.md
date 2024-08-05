When the [Operating Mode(11)] is set to **PWM Control Mode**, both the internal PID and Feedforward controllers will be deactivated and Goal PWM(100) is used to directly control the supplied output voltage to the servo's motor. When set to a different [Operating Mode(11)], Goal PWM(100) is used as a final limiter on the output PWM value only. Read [Position PID Gain(80, 82, 84), Feedforward 1st/2nd Gains(88, 90)](#position-pid-gain80-82-84) or [Velocity PI Gain(76, 78)](#velocity-pi-gain76-78) for more information on how Goal PWM (100) works with configurable gain settings.

|      Unit       |               Range                |
|:---------------:|:----------------------------------:|
| about 0.113 [%] | -[PWM Limit(36)] ~ [PWM Limit(36)] |

 **NOTE**: Goal PWM(100) can not exceed the configured [PWM Limit(36)].
 {: .notice}
