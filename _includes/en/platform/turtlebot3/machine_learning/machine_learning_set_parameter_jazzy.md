
The goal of DQN Agent is to get the TurtleBot3 to the goal avoiding obstacles. When TurtleBot3 gets closer to the goal, it gets a positive reward, and when it gets farther it gets a negative reward.
The episode ends when the TurtleBot3 crashes on an obstacle or after a certain period of time. During the episode, TurtleBot3 gets a big positive reward when it gets to the goal, and TurtleBot3 gets a big negative reward when it crashes on an obstacle.

### [Set state](#set-state)

State is an observation of environment and describes the current situation. Here, `state_size` is 26 and has 24 LDS values, distance to goal, and angle to goal.  
LDS values use a forward 180-degree range, so you need 48 values in a 360-degree range.

Turtlebot3's LDS default is set to 360. You can modify sample of LDS at `/turtlebot3_simulations/turtlebot3_gazebo/models/turtlebot3_burger/model.sdf`.

```bash
gedit ~/turtlebot3_ws/src/turtlebot3_simulations/turtlebot3_gazebo/models/turtlebot3_burger/model.sdf
```

```bash
<sensor name="hls_lfcd_lds" type="ray">    # Find the "hls_lfcd_lds"
  <visualize>true</visualize>    # Visualization of LDS. If you don't want to see LDS, set to `false`
```

```bash
<scan>
  <horizontal>
    <samples>360</samples>    # The number of sample. Modify it to 48
    <resolution>1.000000</resolution>
    <min_angle>0.000000</min_angle>
    <max_angle>6.280000</max_angle>
  </horizontal>
</scan>
```  

**Note**  
More lidar points can be used, but they require more computing resources. To use a different number of lidar points, replace `state_size` in **Hyper parameter**.
{: .notice}

| ![](/assets/images/platform/turtlebot3/machine_learning/sample_360.png) | ![](/assets/images/platform/turtlebot3/machine_learning/sample_24.png) |
|:-----------------------------------------------------------------------:|:----------------------------------------------------------------------:|
|                            **sample = 360**                             |                            **sample = 24**                             |

<br>

**Set action**  
- Action is what an agent can do in each state. Here, turtlebot3 has always 0.15 m/s of linear velocity. angular velocity is determined by action.  

| Action | Angular velocity(rad/s) |
|:------:|:-----------------------:|
|   0    |           1.5           |
|   1    |          0.75           |
|   2    |            0            |
|   3    |         -0.75           |
|   4    |          -1.5           |

<br>

**Set reward**  
- When turtlebot3 takes an action in a state, it receives a reward. The reward design is very important for learning. A reward can be positive or negative. When turtlebot3 gets to the goal, it gets big positive reward. When turtlebot3
collides with an obstacle, it gets big negative reward. If you want to apply your reward design, modify `calculate_reward` function at `turtlebot3_machine_learning/turtlebot3_dqn/turtlebot3_dqn/dqn_environment.py`.  
<br>

1. **Calculate reward**  
At each step, it determines whether it succeeded or failed, and calculates a reward for TurtleBot3's behavior.  
```python
def calculate_reward(self):
  yaw_reward = 1 - (2 * abs(self.goal_angle) / math.pi)
  obstacle_reward = self.compute_weighted_obstacle_reward()
  reward = yaw_reward + obstacle_reward
  if self.succeed:
        reward = 100.0
  elif self.fail:
        reward = -50.0
  return reward
```
<br>

1. **Yaw reward**  
Yaw reward uses a square root based reward function. This has the following advantages over a linear function.
```python
yaw_reward = 1 - (2 * abs(self.goal_angle) / math.pi)
```  
<img src="/assets/images/platform/turtlebot3/machine_learning/yaw_reward.png" width="700">

1. **Obstacle reward**  
Obstacle reward is a function that calculates a penalty based on the distance and angle of obstacles within 0.5 meters in front of the robot, quantitatively assessing the degree of risk.  


- `compute_directional_weights()` : Calculate the importance of each obstacle angle.  
```python
def compute_directional_weights(self, relative_angles, max_weight=10.0):
    power = 6
    raw_weights = (numpy.cos(relative_angles))**power + 0.1
    scaled_weights = raw_weights * (max_weight / numpy.max(raw_weights))
    normalized_weights = scaled_weights / numpy.sum(scaled_weights)
    return normalized_weights
```
  - The closer to the front, the higher the weight, and the higher the `power`, the stronger this weight. After that, we scale and normalize by max_weight.  
<br>

- `compute_weighted_obstacle_reward()` : Apply the weights to calculate the obastcle reward.  
  ```python
  def compute_weighted_obstacle_reward(self):
      if not self.front_ranges or not self.front_angles:
          return 0.0

      front_ranges = numpy.array(self.front_ranges)
      front_angles = numpy.array(self.front_angles)
      valid_mask = front_ranges <= 0.5
      if not numpy.any(valid_mask):
          return 0.0

      front_ranges = front_ranges[valid_mask]
      front_angles = front_angles[valid_mask]

      relative_angles = numpy.unwrap(front_angles)
      relative_angles[relative_angles > numpy.pi] -= 2 * numpy.pi

      weights = self.compute_directional_weights(relative_angles, max_weight=10.0)
      safe_dists = numpy.clip(front_ranges - 0.25, 1e-2, 3.5)
      decay = numpy.exp(-3.0 * safe_dists)
      weighted_decay = numpy.dot(weights, decay)

      reward = - (1.0 + 4.0 * weighted_decay)
      return reward
  ```
  - Select only obstacles located within 0.5 meters and penalize obstacles in range proportional to their distance. Closer obstacles are weighted more heavily to encourage TurtleBot3 to avoid them when they are in front of it.
<br>

**Set hyper parameters**  
- This tutorial has been learned using DQN. DQN is a reinforcement learning method that selects a deep neural network by approximating the action-value function(Q-value). Agent has follow hyper parameters at `/turtlebot3_machine_learning/turtlebot3_dqn/turtlebot3_dqn/dqn_agent.py`.

|     Hyper parameter    | default |                                                          description                                                            |
|:----------------------:|:-------:|:-------------------------------------------------------------------------------------------------------------------------------:|
|   update_target_after  |  5000   |                                                 Update rate of target network.                                                  |
|     discount_factor    |  0.99   |                          Represents how much future events lose their value according to how far away.                          |
|      learning_rate     | 0.0007  |      Learning speed. If the value is too large, learning does not work well, and if it is too small, learning time is long.     |
|         epsilon        |   1.0   |                                           The probability of choosing a random action.                                          |
|       epsilon_min      |  0.05   |                                                    The minimum of epsilon.                                                      |
|       batch_size       |   128   |                                              Size of a group of training samples.                                               |
| min_replay_memory_size |  5000   |                                  Start training if the replay memory size is greater than 5000.                                 |
|      replay_memory     | 500000  |                                                   The size of replay memory.                                                    |
|       state_size       |   26    |  The number of information features an agent can observe at a point in time. LDS values, distance to goal, and angle to goal.   |
