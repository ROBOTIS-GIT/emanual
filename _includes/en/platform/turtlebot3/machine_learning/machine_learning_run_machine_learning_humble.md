
<iframe width="1280" height="720" src="https://www.youtube.com/embed/5uIZU8PCHT8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The contents in e-Manual are subject to be updated without a prior notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning} 

**Description of the stages**
1. Stage 1 (No Obstacle)
Stage 1 is a 4x4 map with no obstacles.

    ![](/assets/images/platform/turtlebot3/machine_learning/stage_1.jpg)  
<br>

2. Stage 2 (Static Obstacle)
Stage 2 is a 4x4 map with four cylinders of static obstacles.

    ![](/assets/images/platform/turtlebot3/machine_learning/stage_2.jpg)  
<br>

3. Stage 3 (Moving Obstacle)
Stage 3 is a 4x4 map with four cylinders of moving obstacles.

    ![](/assets/images/platform/turtlebot3/machine_learning/stage_3.jpg)  
<br>

4. Stage 4 (Combination Obstacle)
Stage 4 is a 5x5 map with walls and two cylinders of moving obstacles.

    ![](/assets/images/platform/turtlebot3/machine_learning/stage_4.jpg)  

**Run machine learning**  
1. **Bring the stage 1 in Gazebo map.**
``` bash
$ ros2 launch turtlebot3_gazebo turtlebot3_dqn_stage1.launch.py
```  
<br>

2. **Run Gazebo environment node.**  
- This node manages the Gazebo environment. It regenerates the Goal and initializes the TurtleBot's location when an episode starts anew. Enter the number of the stage as the first argument.
```bash
$ ros2 run turtlebot3_dqn dqn_gazebo $stage
```  
<br>

3. **Run DQN environment node.**  
- This node manages the DQN environment. It calculates the state of the TurtleBot and uses it to determine rewards, success, and failure.
```bash
$ ros2 run turtlebot3_dqn dqn_environment
```  
<br>

4. **Run DQN agent node.**  
- This node trains the TurtleBot. It trains TurtleBot with calculated rewards and determines its next behavior. Enter the number of the stage as the first argument.  
**Optional**: As a second argument, enter the maximum number of episodes you want to perform. (default: 1000)
```bash
$ ros2 run turtlebot3_dqn dqn_agent $stage $max_training_episodes
```  
<br>

5. **Test traind model.**  
- To test the trained model, run test node instead of DQN agent node from the beginning. The model trained up to the 600th episode is used. Enter the number of the stage as the first argument.
``` bash
$ ros2 run turtlebot3_dqn dqn_test $stage
```
