The Profile is an acceleration/deceleration control method to reduce vibration, noise and load of the motor by controlling dramatically changing velocity and acceleration.  
It is also called Velocity Profile as it controls acceleration and deceleration based on velocity.  
DYNAMIXEL provides 3 different types of Profile. The following explains 3 Profiles.  
Profiles are usually selected by the combination of [Profile Velocity(112)] and [Profile Acceleration(108)].  

![](/assets/images/dxl/x/profile_types.png)

When given [Goal Position(116)], DYNAMIXEL's profile creates desired velocity trajectory based on present velocity(initial velocity of the Profile).  
When DYNAMIXEL receives updated desired position from a new [Goal Position(116)] while it is moving toward the previous [Goal Position(116)], velocity smoothly varies for the new desired velocity trajectory.  
Maintaining velocity continuity while updating desired velocity trajectory is called Velocity Override.  
For a simple calculation, let's assume that the initial velocity of the Profile is '0'.  
The following explains how Profile processes [Goal Position(116)] instruction in Position Control mode, Extended Position Control Mode{% if page.product_group!='dxl_xl430' %}, Current-based Position Control Mode{% else %}{% endif %}.

1. An Instruction from the user is transmitted via DYNAMIXEL bus, then registered to [Goal Position(116)] (If Velocity-based Profile is selected).
2. Acceleration time(t1) is calculated from [Profile Velocity(112)] and [Profile Acceleration(108)].
3. Types of Profile is decided based on [Profile Velocity(112)], [Profile Acceleration(108)] and total travel distance(ΔPos, the distance difference between desired position and present position).
4. Selected Profile type is stored at [Moving Status(123)].
5. DYNAMIXEL is driven by the calculated desired trajectory from Profile.
6. desired velocity trajectory and desired position trajectory from Profile are stored at [Velocity Trajectory(136)] and [Position Trajectory(140)] respectively.

| Condition                                                | Types of Profile                         |
|:---------------------------------------------------------|:-----------------------------------------|
| V<sub>PRFL</sub>(112) = 0                                | Profile not used<br />(Step Instruction) |
| (V<sub>PRFL</sub>(112) ≠ 0) & (A<sub>PRF</sub>(108) = 0) | Rectangular Profile                      |
| (V<sub>PRFL</sub>(112) ≠ 0) & (A<sub>PRF</sub>(108) ≠ 0) | Trapezoidal Profile                      |

![](/assets/images/dxl/x/velocity_profile.png)

{% capture group_notice_03 %}
**NOTE** : Velocity Control Mode only uses [Profile Acceleration(108)](#profile-acceleration108). Step and Trapezoidal Profiles are supported. Velocity Override are supported as well. Acceleration time(t1) can be calculated as below equation.  

**Velocity-based Profile** : t<sub>1</sub> = 64 * {[Goal Velocity(104)](#goal-velocity104) / [Profile Acceleration(108)](#profile-acceleration108)}  
**Time-based Profile** : t<sub>1</sub> = [Profile Acceleration(108)](#profile-acceleration108)
{% endcapture %}

<div class="notice">
  {{ group_notice_03 | markdownify }}
</div>

{% capture group_notice_04 %}
**NOTE** : If Time-based Profile is selected, [Profile Velocity(112)] is used to set the time span of the Profile(t<sub>3</sub>), while [Profile Acceleration(108)](#profile-acceleration108) sets accelerating time(t<sub>1</sub>) in millisecond[ms]. [Profile Acceleration(108)](#profile-acceleration108) will not exceed 50% of [Profile Velocity(112)] value.
{% endcapture %}

<div class="notice">
  {{ group_notice_04 | markdownify }}
</div>

[Moving Status(123)]: #moving-status123
