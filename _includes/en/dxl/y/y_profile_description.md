Profiles are control methods used in motor operation to reduce rapid changes in speed and acceleration, thereby reducing vibrations, noise, and motor loads through controlled acceleration and deceleration. 
These profiles are often called Velocity Profiles as they directly control acceleration and deceleration based on target velocities.
The device offers three types of profiles. Generally, the profile selection is determined by the combined settings of [Profile Velocity(244)] and [Profile Acceleration(240)]. The trapezoidal profile specifically is additionally considers the total planned movement distance (ΔPos, the difference between the target position and the current position). 

![](/assets/images/dxl/y//profile_1.PNG)

When the device's controller receives an updated [Goal Position(532)], it generates a target velocity trajectory based on the actuator's current movement speed. 
Even if the target position changes to a new [Goal Position(532)] while the device is in transit, the speed trajectory is adjusted to ensure smooth speed transition. 
The function responsible for creating a target velocity trajectory to prevent velocity discontinuity like this is called Velocity Override. Here, for simplicity in the formula, the initial speed of the profile is assumed to be '0'.

The following outlines the profile generation process for the [Goal Position(532)] command when the [Operating Mode(33)] is position control mode.

{% capture profile_vel_ex1 %}
1. The user’s request is registered as the new [Goal Position(532)](#goal-position532) through the communication bus.
2. The acceleration time (t1) is determined by the [Profile Velocity(244)](#profile-acceleration240-profile-velocity244) and [Profile Acceleration(240)](#profile-acceleration240-profile-velocity244).
3. The shape of the profile is determined by the [Profile Velocity(244)](#profile-acceleration240-profile-velocity244), [Profile Acceleration(240)](#profile-acceleration240-profile-velocity244), and the total movement distance (ΔPos, the difference between the target position and the current position) as shown in the following table.
4. The final selected profile is written to the [Moving Status(541)](#moving-status541) register.
5. The device moves according to the target trajectory calculated by the profile.
6. The target velocity trajectory and target position trajectory of the chosen profile are written to the [Position Trajectory(560)](#position-trajectory560) and [Velocity Trajectory(564)](#velocity-trajectory564) registers.
{% endcapture %}

<div class="notice--success">{{ profile_vel_ex1 | markdownify }}</div>

| Condition                                                          | Types of Profile                  |
|:------------------------------------------------------------------:|:----------------------------------|
| [Profile Velocity(244)] = 0                                        | Profile unused (Step instruction) |
| ([Profile Velocity(244)] ≠ 0) & ([Profile Acceleration(240)] = 0)  | Rectangular profile               |
| ([Profile Velocity(244)] ≠ 0) & ([Profile Acceleration(240)] ≠ 0)  | Trapezoidal profile               |

![](/assets/images/dxl/y//profile_2.PNG)

{% capture group_notice_01 %}
**Note** : In velocity control mode, only [Profile Acceleration(240)] is used and the two available profile shapes are Step and Trapezoidal.  
The Velocity Override function operates in a similar manner.  
The acceleration time (t1) in this case is calculated as follows.  

**Velocity-based Profile : t<sub>1</sub> = 64 * {[Profile Velocity(112)](#profile-velocity112) / [Profile Acceleration(108)](#profile-acceleration108)}**  
**Time-based Profile : t<sub>1</sub> = [Profile Acceleration(108)](#profile-acceleration108)**
{% endcapture %}

<div class="notice">
  {{ group_notice_01 | markdownify }}
</div>

[Profile Acceleration Time(248)]: #profile-acceleration-time248-profile-time252 
[Profile Velocity(244)]: #profile-acceleration240-profile-velocity244
[Profile Acceleration(240)]: #profile-acceleration240-profile-velocity244
