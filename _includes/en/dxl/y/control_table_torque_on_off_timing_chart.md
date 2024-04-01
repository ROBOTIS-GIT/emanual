Timing Chart for the Safe Stop(104) ~ Overexcitation Time(112) features.

![](/assets/images/dxl/y/torque_on-off_timing_chart.PNG)

**Note** : When the value of [Controller State(152)] is '4' Process Torque On, '6' Process Torque Off, writing values to [Torque Enable(512)], [Goal PWM(524)], [Goal Current(526)], [Goal Velocity(528)], [Goal Position(532)] will result in sending a Status Packet with a Result Fail through the Error field.
{: .notice}