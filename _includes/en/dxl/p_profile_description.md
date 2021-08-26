The Profile is an acceleration/deceleration control technique to reduce vibration, noise and load on the motor by controlling dramatically changing velocity and acceleration.  
It is also called Velocity Profile as it controls acceleration and deceleration based on velocity.  
This device provides the following 3 types of profile.  
Profiles are usually selected by the combination of [Profile Velocity(560)] and [Profile Acceleration(556)].  
Trapezoidal Profile is exceptionally chosen with additional factor: travel distance(&Delta;Pos, the distance between desired position and present position).

![](/assets/images/dxl/p/profile_types.png)

When given [Goal Position(564)], the device’s profile creates desired velocity trajectory based on present velocity(initial velocity of the Profile).  
When the device receives updated desired position via [Goal Position(564)] while it is moving toward the previous desired position, velocity will smoothly changed for the new desired velocity trajectory.  
Maintaining velocity continuity while updating the desired velocity trajectory is called "Velocity Override".  
For easier calculation in this example, let’s assume that the initial velocity of the Profile is `0`.

The following explains how Profile processes [Goal Position(564)] when the [Operating Mode(11)] is **Position Control Mode** or **Extended Position Control Mode** .

{% capture profile_vel_ex1 %}
1. An Instruction is recieved via communication bus, then registered in [Goal Position(564)](#goal_position564).
2. Accelerating time(t<sub>1</sub>) is calculated from [Profile Velocity(560)](#profile-velocity560) and [Profile Acceleration(556)](#profile-acceleration556).
3. Profile type is decided based on [Profile Velocity(560)](#profile-velocity560), [Profile Acceleration(556)](#profile-acceleration556) and total travel distance(&Delta;Pos, the distance difference between desired position and present position).
4. Selected Profile type is stored at [Moving Status(571)](#moving-status571).
5. The device is driven by the calculated desired trajectory from Profile.
6. The desired velocity trajectory and the desired position trajectory calculated by the Profile are saved at [Velocity Trajectory(584)](#velocity-trajectory584) and [Position Trajectory(588)](#position-trajectory588) respectively.
{% endcapture %}

<div class="notice--success">{{ profile_vel_ex1 | markdownify }}</div>

| Condition                                                     | Types of Profile                       |
|:--------------------------------------------------------------|:---------------------------------------|
| Profile Velocity(560) = 0                                     | Profile not used<br>(Step Instruction) |
| (Profile Velocity(560) ≠ 0) & (Profile Acceleration(556) = 0) | Rectangular Profile                    |
| (Profile Velocity(560) ≠ 0) & (Profile Acceleration(556) ≠ 0) | Trapezoidal Profile                    |

![](/assets/images/dxl/p/velocity_profile.png)

{% capture group_notice_03 %}
**NOTE** : Velocity Control Mode only uses [Profile Velocity(560)](#profile-velocity560).  
Step and Trapezoidal Profiles are supported and Velocity Override is supported as well.  
Acceleration time(t<sub>1</sub>) can be calculated as below equation.

**Velocity-based Profile**: **t<sub>1</sub> = 600 * {[Profile Velocity(560)](#profile-velocity560) / [Profile Acceleration(556)](#profile-acceleration556)}**  
**Time-based Profile**: **t<sub>1</sub> = Profile Acceleration(556)**
{% endcapture %}

<div class="notice">{{ group_notice_03 | markdownify }}</div>

{% capture group_notice_04 %}
**NOTE** : If Time-based Profile is selected, [Profile Velocity(560)](#profile-velocity560) is used to set the time span of the Profile(t<sub>3</sub>), while [Profile Acceleration(556)](#profile-acceleration556) sets accelerating time(t<sub>1</sub>) in millisecond[ms]. [Profile Acceleration(556)](#profile-acceleration556) will not exceed 50% of [Profile Velocity(560)](#profile-velocity560) value.
{% endcapture %}

<div class="notice">
  {{ group_notice_04 | markdownify }}
</div>

[Profile Acceleration(556)]: #profile-acceleration556
[Profile Velocity(560)]: #profile-velocity560
