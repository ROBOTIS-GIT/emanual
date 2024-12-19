The Profile is a generated movement trajectory intended to reduce vibration, noise and load of the motor by dynamically changing velocity and acceleration during movements.
DYNAMIXEL servos provide 3 different types of Profile:  
![](/assets/images/dxl/x/profile_types.png)  

Profiles are usually selected according to the combination of [Profile Velocity(112)] and [Profile Acceleration(108)].  


When given a new [Goal Position(116)], the DYNAMIXEL's profile settings creates a desired velocity trajectory based on present movement velocity.
When a DYNAMIXEL receives an updated [Goal Position(116)] while it is moving toward the previous [Goal Position(116)], velocity is adjusted smoothly to match the new desired velocity trajectory.  
The following explains how the Profile processes [Goal Position(116)] instructions in {% if page.product_group!='dxl_xl430' %}Current-based Position Control Mode,{% else %}{% endif %} Position Control mode, and Extended Position Control Mode.

1. An Instruction from the user is transmitted via the DYNAMIXEL bus, then registered to [Goal Position(116)] (If Velocity-based Profile is selected).
2. Acceleration time(t1) is calculated based on [Profile Velocity(112)] and [Profile Acceleration(108)].
3. The type of Profile is decided based on [Profile Velocity(112)], [Profile Acceleration(108)] and total travel distance(ΔPos, the distance difference between desired position and present position).
4. The selected Profile type is stored at [Moving Status(123)].
5. The DYNAMIXEL is driven by the calculated desired trajectory from the Profile.
6. The desired velocity trajectory and desired position trajectory from the Profile are stored at [Velocity Trajectory(136)] and [Position Trajectory(140)] respectively.

| Condition                                                | Types of Profile                         |
|:---------------------------------------------------------|:-----------------------------------------|
| V<sub>PRFL</sub>(112) = 0                                | Profile not used<br />(Step Instruction) |
| (V<sub>PRFL</sub>(112) ≠ 0) & (A<sub>PRF</sub>(108) = 0) | Rectangular Profile                      |
| (V<sub>PRFL</sub>(112) ≠ 0) & (A<sub>PRF</sub>(108) ≠ 0) | Trapezoidal Profile                      |

![](/assets/images/dxl/x/velocity_profile.png)

{% capture group_notice_03 %}
**NOTE** : Velocity Control Mode only uses [Profile Acceleration(108)](#profile-acceleration108). Step and Trapezoidal Profiles are supported. Acceleration time(t1) can be calculated according to the equation below.  

**Velocity-based Profile** : t<sub>1</sub> = 64 * {[Profile Velocity(112)](#profile-velocity112) / [Profile Acceleration(108)](#profile-acceleration108)}  
**Time-based Profile** : t<sub>1</sub> = [Profile Acceleration(108)](#profile-acceleration108)
{% endcapture %}

<div class="notice">
  {{ group_notice_03 | markdownify }}
</div>

{% capture group_notice_04 %}
**NOTE** : If Time-based Profile is selected, [Profile Velocity(112)](#profile-velocity112) is used to set the time span of the Profile(t<sub>3</sub>), while [Profile Acceleration(108)](#profile-acceleration108) sets allowed accelerating time(t<sub>1</sub>) in millisecond[ms]. [Profile Acceleration(108)](#profile-acceleration108) will not exceed 50% of the configured [Profile Velocity(112)](#profile-velocity112) value.
{% endcapture %}

<div class="notice">
  {{ group_notice_04 | markdownify }}
</div>

[Moving Status(123)]: #moving-status123
