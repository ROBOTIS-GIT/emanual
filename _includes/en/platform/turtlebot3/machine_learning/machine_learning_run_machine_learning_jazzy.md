The contents in e-Manual are subject to be updated without a prior notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}  
<br>

**Description of the stages**
1. **Stage 1 (No Obstacle)**  
Stage 1 is a 4x4 map with no obstacles.

    ![](/assets/images/platform/turtlebot3/machine_learning/stage_1.jpg)  
<br>

2. **Stage 2 (Static Obstacle)**  
Stage 2 is a 4x4 map with four cylinders of static obstacles.

    ![](/assets/images/platform/turtlebot3/machine_learning/stage_2.jpg)  
<br>

3. **Stage 3 (Moving Obstacle)**  
Stage 3 is a 4x4 map with four cylinders of moving obstacles.

    ![](/assets/images/platform/turtlebot3/machine_learning/stage_3.jpg)  
<br>

4. **Stage 4 (Combination Obstacle)**  
Stage 4 is a 5x5 map with walls and two cylinders of moving obstacles.

    ![](/assets/images/platform/turtlebot3/machine_learning/stage_4.jpg)  
<br>

**Understanding the Machine Learning simulation**
1. **Reset environment**  
Before the start of an episode, reset the position of the goal and regenerate the goal.  
<br>

2. **Select an action**  
The behavior is determined by epsilon value, which decreases as training progresses.  
<br>
    - **What is Q-value?**
        - Q-value is a key concept in reinforcement learning, meaning the expected cumulative reward for performing an action in a state.
        - The agent tries to maximize its reward by choosing the action with the highest Q-value.
    - **What is epsilon?**
        - Epsilon is the probability of an agent doing an 'Exploration'.
        - Exploration means trying out different behaviors because you don't know much about the environment, so the Q value isn't accurate yet.
        - If the epsilon value is high, random behaviors (exploration) are more likely to be selected. If the epsilon value is low, behaviors with high Q-values (exploitation) are more likely to be selected.  
<br>

3. **Training model**  
After the robot performs an action, it receives a reward or penalty for its behavior and checks to see if it reached its goal.  
<br>

**Run machine learning**  
1. **Bring the stage in Gazebo map.**
``` bash
$ ros2 launch turtlebot3_gazebo turtlebot3_dqn_{$stage_num}.launch.py
```  
**argument**  
- `stage_num`
- default: 1
- description: The integer value of stage you want to run. This package has stations numbered 1 through 4, as described above.  
<br>

2. **Run Gazebo environment node.**  
This node manages the Gazebo environment. It regenerates the Goal and initializes the TurtleBot's location when an episode starts anew.
```bash
$ ros2 run turtlebot3_dqn dqn_gazebo {$stage_num}
```  
<br>

3. **Run DQN environment node.**  
This node manages the DQN environment. It calculates the state of the TurtleBot and uses it to determine rewards, success, and failure.
```bash
$ ros2 run turtlebot3_dqn dqn_environment
```  
<br>

4. **Run DQN agent node.**  
This node trains the TurtleBot. It trains TurtleBot with calculated rewards and determines its next behavior.
```bash
$ ros2 run turtlebot3_dqn dqn_agent --ros-args -p epsilon_decay:=6000 -p max_training_episodes:=1000 -p use_gpu:=true -p model_file:=model1.h5 -p verbose:=true
```  
**argument**  
- `epsilon_decay`
- default: 6000
- description: The integer value of epsilon decay. This value is used to determine the probability of an agent doing an `Exploration`. A larger `epsilon_decay` results in more `Exploration` over time  
- `max_training_episodes`
- default: 1000
- description: The integer value of max training episodes. This value is used to determine the maximum number of episodes to train the model.  
- `use_gpu`
- default: true
- description: The boolean value of use gpu.  
- `model_file`
- default: None
- description: Name of the model file located in the `saved_model` directory. If provided, the specified pretrained model will be loaded. If empty, the model will be trained from scratch.
- `verbose`
- default: true
- description: The boolean value of verbose. If true, the training process will be printed to the terminal.
<br>

5. **Test traind model.**  
After training, to test the trained model, run test node instead of DQN agent node.
``` bash
$ ros2 run turtlebot3_dqn dqn_test --ros-args -p model_file:=model1.h5 -p use_gpu:=true -p verbose:=true
```  
**argument**  
- `use_gpu`
- default: true
- description: The boolean value of use gpu.  

`model_file`
- default: None
- description: Name of the model file located in the `saved_model` directory. It is used to test the pretrained model.
- `verbose`
- default: true
- description: The boolean value of verbose. If true, the test process will be printed to the terminal.
<br>

**Run machine learning graph**
1. **Action graph**  
The Action graph shows the present TurtleBot's action and their rewards, and the total rewards in an episode.
```bash
$ ros2 run turtlebot3_dqn action_graph
```  
    ![action_graph](/assets/images/platform/turtlebot3/machine_learning/action_graph.png)  
<br>

1. **Result graph**  
The Result graph is a linear plot of the average of the maximum values of Q-Value and the total reward as each episode progresses.
```bash
$ ros2 run turtlebot3_dqn result_graph
```  
    **NOTE**: The graph is recorded from the time you run the node. For full recording, turn it on before you start learning.
    {: .notice}
    ![result_graph](/assets/images/platform/turtlebot3/machine_learning/result_graph.png)  
<br>

**TensorBoard graph**  
Using TensorBoard, you can visualize the rewards per episode for each learning. The file is saved in `~/turtlebot3_dqn_logs/gradient_tape`.
1. **Run TensorBoard**  
```bash
tensorboard --logdir=~/turtlebot3_dqn_logs/gradient_tape
```  
<br>

2. **Access the TensorBoard in a browser**  
[http://localhost:6006](http://localhost:6006)  
    ![](/assets/images/platform/turtlebot3/machine_learning/tensorboard.png)
