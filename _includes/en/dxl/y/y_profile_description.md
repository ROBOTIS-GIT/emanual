A profile is a control method used in motor operation to control rapid changes in speed and acceleration, thereby reducing vibrations, noise, and motor loads through controlled acceleration and deceleration. 
It is also called Velocity Profile as it controls acceleration and deceleration based on velocity.
The device offers three types of profiles. The following are the three available profile types. Generally, the profile selection is determined by the combination of [Profile Velocity(244)] and [Profile Acceleration(240)]. As an exception, the trapezoidal profile is selected by additionally considering the total movement distance (ΔPos, the difference between the target position and the current position). 

![](/assets/images/dxl/y//profile_1.PNG)

When the device's profile is assigned the [Goal Position(532)], it generates a target velocity trajectory based on the current speed (the initial speed of the profile). 
Therefore, even if the target position changes to a new [Goal Position(532)] while the device is in transit, the target speed trajectory is adjusted to ensure smooth speed transition. 
The function responsible for creating a target velocity trajectory to prevent velocity discontinuity like this is called Velocity Override. Here, for simplicity in the formula, the initial speed of the profile is assumed to be '0'.

The following outlines the profile operation process for the [Goal Position(532)] command when the [Operating Mode(33)] is in position control mode.

{% capture profile_vel_ex1 %}
1. The user’s request is registered in the [Goal Position(532)](#goal-position532) through the communication bus.
2. The acceleration time (t1) is determined by the [Profile Velocity(244)](#profile-acceleration240-profile-velocity244) and [Profile Acceleration(240)](#profile-acceleration240-profile-velocity244).
3. The shape of the profile is determined by the [Profile Velocity(244)](#profile-acceleration240-profile-velocity244), [Profile Acceleration(240)](#profile-acceleration240-profile-velocity244), and the total movement distance (ΔPos, the difference between the target position and the current position) as follows.
4. The type of the final selected profile is indicated in the [Moving Status(541)](#moving-status541).
5. The device moves according to the target trajectory calculated by the profile.
6. The target velocity trajectory and target position trajectory by the profile are shown in the [Position Trajectory(560)](#position-trajectory560) and [Velocity Trajectory(564)](#velocity-trajectory564).
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
The acceleration time (t1) in this case is as follows.  

**Velocity-based Profile : t<sub>1</sub> = 64 * {[Profile Velocity(112)](#profile-velocity112) / [Profile Acceleration(108)](#profile-acceleration108)}**  
**Time-based Profile : t<sub>1</sub> = [Profile Acceleration(108)](#profile-acceleration108)**
{% endcapture %}

<div class="notice">
  {{ group_notice_01 | markdownify }}
</div>

[Profile Acceleration Time(248)]: #profile-acceleration-time248-profile-time252 
[Profile Velocity(244)]: #profile-acceleration240-profile-velocity244
[Profile Acceleration(240)]: #profile-acceleration240-profile-velocity244