This is a desired velocity trajectory created by Profile. Operating method can be changed based on control mode. For more details, please refer to the Profile Velocity(112).
1. **Velocity Control Mode** : When Profile reaches to the endpoint, Velocity Trajectory(136) becomes equal to Goal Velocity(104).
2. **Position Control Mode, Extended Position Control Mode, Current-based Position Control Mode** : Velocity Trajectory is used to create Position Trajectory(140). When Profile reaches to an endpoint, Velocity Trajectory(136) is cleared to '0'.
