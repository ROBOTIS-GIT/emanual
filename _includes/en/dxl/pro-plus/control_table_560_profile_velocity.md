The Maximum velocity for Profile can be set with this value.  
Profile Velocity(560) can be used in Position Control Mode and Velocity Control Mode.  
Profile Velocity(560) cannot exceed Velocity Limit(44).  
Velocity Control Mode only uses Profile Acceleration(556) and Profile Velocity(560) will be ignored.

|      Unit      |      Value Range       |             Description              |
|:--------------:|:----------------------:|:------------------------------------:|
| 0.01 [rev/min] | 0 ~ Velocity Limit(44) | ‘0’ stands for the infinite velocity |

The Profile is an acceleration/deceleration control technique to reduce vibration, noise and load on the motor by controlling dramatically changing velocity and acceleration.  
It is also called Velocity Profile as it controls acceleration and deceleration based on velocity.  
This device provides the following 3 types of profile.  
Profiles are usually selected by the combination of Profile Velocity(560) and Profile Acceleration(556).  
Trapezoidal Profile is exceptionally chosen with additional factor: travel distance(&Delta;Pos, the distance between desired position and present position).

![](/assets/images/dxl/pro-plus/profile_types.png)

When given Goal Position(564), the device’s profile creates desired velocity trajectory based on present velocity(initial velocity of the Profile).  
When the device receives updated desired position via Goal Position(564) while it is moving toward the previous desired position, velocity will smoothly changed for the new desired velocity trajectory.  
Maintaining velocity continuity while updating the desired velocity trajectory is called "Velocity Override".  
For easier calculation in this example, let’s assume that the initial velocity of the Profile is `0`.

The following explains how Profile processes Goal Position(564).

1. An Instruction is recieved via communication bus, then registered in Goal Position(564).
2. Accelerating time(t<sub>1</sub>) is calculated from Profile Velocity(560) and Profile Acceleration(556).
3. Profile type is decided based on Profile Velocity(560), Profile Acceleration(556) and total travel distance(&Delta;Pos, the distance difference between desired position and present position).
4. Selected Profile type is stored at Moving Status(571).(Refer to the Moving Status(571))
5. The device is driven by the calculated desired trajectory from Profile.
6. The desired velocity trajectory and the desired position trajectory calculated by the Profile are saved at Velocity Trajectory(584) and Position Trajectory(588) respectively.

| Condition                                                     | Types of Profile                       |
|:--------------------------------------------------------------|:---------------------------------------|
| Profile Velocity(560) = 0                                     | Profile not used<br>(Step Instruction) |
| (Profile Velocity(560) ≠ 0) & (Profile Acceleration(556) = 0) | Rectangular Profile                    |
| (Profile Velocity(560) ≠ 0) & (Profile Acceleration(556) ≠ 0) | Trapezoidal Profile                    |

![](/assets/images/dxl/pro-plus/velocity_profile.png)


{% capture group_notice_03 %}
**NOTE** : Velocity Control Mode only uses Profile Acceleration(556).  
Step and Trapezoidal Profiles are supported and Velocity Override is supported as well.  
Acceleration time(t<sub>1</sub>) can be calculated as below equation.

**t<sub>1</sub> = 600 * {Goal Velocity(552) / Profile Acceleration(556)}**
{% endcapture %}

<div class="notice">{{ group_notice_03 | markdownify }}</div>
