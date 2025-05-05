
The goal of DQN Agent is to get the TurtleBot3 to the goal avoiding obstacles. When TurtleBot3 gets closer to the goal, it gets a positive reward, and when it gets farther it gets a negative reward.
The episode ends when the TurtleBot3 crashes on an obstacle or after a certain period of time. During the episode, TurtleBot3 gets a big positive reward when it gets to the goal, and TurtleBot3 gets a big negative reward when it crashes on an obstacle.

<iframe width="1236" height="695" src="https://www.youtube.com/embed/807_cByUBSI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [Set state](#set-state)

State is an observation of environment and describes the current situation. Here, `state_size` is 26 and has 24 LDS values, distance to goal, and angle to goal.

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
    <samples>360</samples>    # The number of sample. Modify it to 24
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

1. **Distance reward**  
- Distance rewards use the difference between the previous distance to the goal and the present distance to the goal. And the distance to the goal in the present step becomes the distance to the goal in the next step.
```python
distance_reward = self.prev_goal_distance - self.goal_distance
self.prev_goal_distance = self.goal_distance
```  
<br>

1. **Yaw reward**  
- Yaw reward uses a square root based reward function. This has the following advantages over a linear function.
  ```python
  yaw_reward = (1 - 2 * math.sqrt(math.fabs(self.goal_angle / math.pi)))
  ```  
  - The smaller the angular error, the faster the compensation increases, making the rotation more sensitive to fine alignment and thus more accurate.
  - Rewards decrease modestly when errors are large, encouraging exploration without penalizing too much early on in learning.
  - Good balance between initial stability and final alignment accuracy.  
![yaw_reward_graph](/assets/images/platform/turtlebot3/machine_learning/yaw_reward.png)

1. **Obstacle reward**  
- Obstacle reward will negatively reward when TurtleBot get closer than 0.5 meters to an obstacle.
```python
obstacle_reward = 0.0
if self.min_obstacle_distance < 0.50:
    obstacle_reward = -1.0
```  
<br>

1. **Total reward**  
- Total reward uses the sum of the three rewards above. You can weight each reward to adjust the balance.
```bash
reward = (distance_reward * 10) + (yaw_reward / 5) + obstacle_reward
```  
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
