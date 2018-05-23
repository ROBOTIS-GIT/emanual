The Maximum velocity of Profile can be set with this value.  
Profile Velocity(112) can be used in all control modes except Torque Control Mode and Velocity Control Mode.  
Profile Velocity(112) cannot exceed Velocity Limit(44).  
Velocity Control Mode only uses Profile Acceleration(108) instead of Profile Velocity(112).

|   Unit    |      Value Range       |             Description             |
|:---------:|:----------------------:|:-----------------------------------:|
| 0.229 rpm | 0 ~ Velocity Limit(44) | '0' stands for an infinite velocity |

The Profile is an acceleration/deceleration control method to reduce vibration, noise and load of the motor by controlling dramatically changing velocity and acceleration.  
It is also called Velocity Profile as it controls acceleration and deceleration based on velocity.  
DYNAMIXEL provides 4 different types of Profile.  
The following explains 4 Profiles and how to select them.  
Profiles are usually selected by a combination of Profile Velocity(112) and Profile Acceleration(108).  

![](/assets/images/dxl/x/profile_types.png)


When given Goal Position(116), Dynamixel's profile creates target velocity trajectory based on current velocity(initial velocity of the Profile).  
When Dynamixel receives updated target position from a new Goal Position(116) while it is moving toward the previous Goal Position(116), velocity smoothly varies for the new target velocity trajectory.  
Maintaining velocity continuity while updating target velocity trajectory is called Velocity Override.  
For a simple calculation, let's assume that the initial velocity of the Profile is '0'.  
The following explains how Profile processes Goal Position(116) instruction in Position Control mode, Extended Position Control Mode, Current-based Position Control Mode.

1. An Instruction from the user is transmitted via Dynamixel bus, then registered to Goal Position(116).
2. Acceleration time(t1) is calculated from Profile Velocity(112) and Profile Acceleration(108).
3. Types of Profile is decided based on Profile Velocity(112), Profile Acceleration(108) and total travel distance(ΔPos, the distance difference between target position and current position).
4. Selected Profile type is stored at Moving Status(123).(Refer to the Moving Status(123))
5. Dynamixel is driven by the calculated target trajectory from Profile.
6. Target velocity trajectory and target position trajectory from Profile are stored at Velocity Trajectory(136) and Position Trajectory(140) respectively.

| Condition                                                | Types of Profile                         |
|:---------------------------------------------------------|:-----------------------------------------|
| V<sub>PRFL</sub>(112) = 0                                | Profile not used<br />(Step Instruction) |
| (V<sub>PRFL</sub>(112) ≠ 0) & (A<sub>PRF</sub>(108) = 0) | Rectangular Profile                      |
| (V<sub>PRFL</sub>(112) ≠ 0) & (A<sub>PRF</sub>(108) ≠ 0) | Trapezoidal Profile                      |

![](/assets/images/dxl/x/velocity_profile.png)


{% capture group_notice_03 %}
`Note` Velocity Control Mode only uses Profile Acceleration(108). Step and Trapezoidal Profiles are supported. Velocity Override and Jerk control are supported as well. Acceleration time(t1) can be calculated as below equation.  
t<sub>1</sub> = 64 * {Goal Velocity(104) / Profile Acceleration(108)}
{% endcapture %}

<div class="notice">
  {{ group_notice_03 | markdownify }}
</div>
