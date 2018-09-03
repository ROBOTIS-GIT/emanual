This is a desired velocity trajectory created by Profile. Operating method can be differ by control mode. For more details, please refer to the Profile Velocity(560).

1. **Velocity Control Mode** : When Profile reaches to the endpoint, Velocity Trajectory(136) becomes equal to Goal Velocity(104).
2. **Position Control Mode, Extended Position Control Mode** : The desired Velocity Trajectory is used to create Position Trajectory(588). When Profile reaches to an endpoint, Velocity Trajectory(584) is set to ‘0’.
