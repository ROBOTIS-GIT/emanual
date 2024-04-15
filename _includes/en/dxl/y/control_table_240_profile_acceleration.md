{% assign drive_mode= "[Drive Mode(32)]" %}

If a velocity-acceleration-based profile is selected as the {{ drive_mode }}, the Profile Acceleration and Profile Velocity will be used to generate and limit movement trajectories.

|              item              | Unit           |   Control Mode                     |          Description                                                           |
|:------------------------------:|:--------------:| :----------------------------------|:-------------------------------------------------------------------------------|
| Profile Acceleration(248)      | 10 [rev/min²]  | Velocity control, Position control |  Profile acceleration/deceleration time                                        |
| Profile Velocity(252)                   | 0.01 [RPM]     | Position control                   |  Maximum movement speed of profile.<br>If the value is 0, profiles are deactivated.  |
