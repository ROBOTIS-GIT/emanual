<!-- ## [Software Setup](#software-setup) -->

Install Tensorflow and Keras on PC (Requirement: Ubuntu 22.04 and ROS2 Humble, Python 3.10)

1. **Tensorflow**
``` bash
$ pip3 install tensorflow==2.19.0
```  
<br>

2. **Keras**  
[Keras](https://keras.io/) is a high-level neural networks API, written in Python and capable of running on top of TensorFlow.  
``` bash
$ pip3 install keras==3.9.2
```  
<br>

3. **Machine Learning packages**

    **WARNING**: Be sure to install [turtlebot3](https://github.com/ROBOTIS-GIT/turtlebot3), [turtlebot3_msgs](https://github.com/ROBOTIS-GIT/turtlebot3_msgs) and [turtlebot3_simulations](https://github.com/ROBOTIS-GIT/turtlebot3_simulations) package before installation of machine learning packages.
    {: .notice--warning}

    ``` bash
    $ cd ~/turtlebot3_ws/src/
    $ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_machine_learning.git
    $ cd ~/turtlebot3_ws && colcon build --symlink-install
    ```
