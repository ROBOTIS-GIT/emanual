
The goal of DQN Agent is to get the TurtleBot3 to the goal avoiding obstacles. When TurtleBot3 gets closer to the goal, it gets a positive reward, and when it gets farther it gets a negative reward.
The episode ends when the TurtleBot3 crashes on an obstacle or after a certain period of time. During the episode, TurtleBot3 gets a big positive reward when it gets to the goal, and TurtleBot3 gets a big negative reward when it crashes on an obstacle.

<iframe width="1236" height="695" src="https://www.youtube.com/embed/807_cByUBSI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The contents in e-Manual are subject to be updated without a prior notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

### [Set state](#set-state)

State is an observation of environment and describes the current situation. Here, `state_size` is 26 and has 24 LDS values, distance to goal, and angle to goal.

Turtlebot3's LDS default is set to 360. You can modify sample of LDS at `turtlebot3/turtlebot3_description/urdf/turtlebot3_burger.gazebo.xacro`.

```bash
<xacro:arg name="laser_visual" default="false"/>   # Visualization of LDS. If you want to see LDS, set to `true`
```

```bash
<scan>
  <horizontal>
    <samples>360</samples>            # The number of sample. Modify it to 24
    <resolution>1</resolution>
    <min_angle>0.0</min_angle>
    <max_angle>6.28319</max_angle>
  </horizontal>
</scan>
```

| ![](/assets/images/platform/turtlebot3/machine_learning/sample_360.png) | ![](/assets/images/platform/turtlebot3/machine_learning/sample_24.png) |
|:-----------------------------------------------------------------------:|:----------------------------------------------------------------------:|
|                            **sample = 360**                             |                            **sample = 24**                             |

### [Set action](#set-action)

Action is what an agent can do in each state. Here, turtlebot3 has always 0.15 m/s of linear velocity. angular velocity is determined by action.

| Action | Angular velocity(rad/s) |
|:------:|:-----------------------:|
|   0    |          -1.5           |
|   1    |          -0.75          |
|   2    |            0            |
|   3    |          0.75           |
|   4    |           1.5           |

### [Set reward](#set-reward)

When turtlebot3 takes an action in a state, it receives a reward. The reward design is very important for learning. A reward can be positive or negative. When turtlebot3 gets to the goal, it gets big positive reward. When turtlebot3
collides with an obstacle, it gets big negative reward. If you want to apply your reward design, modify `setReward` function at `/turtlebot3_machine_learning/turtlebot3_dqn/src/turtlebot3_dqn/environment_stage_#.py`.

### [Set hyper parameters](#set-hyper-parameters)

This tutorial has been learned using DQN. DQN is a reinforcement learning method that selects a deep neural network by approximating the action-value function(Q-value). Agent has follow hyper parameters at `/turtlebot3_machine_learning/turtlebot3_dqn/nodes/turtlebot3_dqn_stage_#`.

| Hyper parameter | default |                                                      description                                                       |
|:---------------:|:-------:|:----------------------------------------------------------------------------------------------------------------------:|
|  episode_step   |  6000   |                                             The time step of one episode.                                              |
|  target_update  |  2000   |                                             Update rate of target network.                                             |
| discount_factor |  0.99   |                     Represents how much future events lose their value according to how far away.                      |
|  learning_rate  | 0.00025 | Learning speed. If the value is too large, learning does not work well, and if it is too small, learning time is long. |
|     epsilon     |   1.0   |                                      The probability of choosing a random action.                                      |
|  epsilon_decay  |  0.99   |                         Reduction rate of epsilon. When one episode ends, the epsilon reduce.                          |
|   epsilon_min   |  0.05   |                                                The minimum of epsilon.                                                 |
|   batch_size    |   64    |                                          Size of a group of training samples.                                          |
|   train_start   |   64    |                              Start training if the replay memory size is greater than 64.                              |
|     memory      | 1000000 |                                               The size of replay memory.                                               |
