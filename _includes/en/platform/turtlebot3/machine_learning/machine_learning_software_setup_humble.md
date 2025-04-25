<!-- ## [Software Setup](#software-setup) -->

**Note**: This package was built on Ubuntu 22.04 and ROS2 Humble, Python 3.10.
{: .notice}  

1. **Install Requirements**  
``` bash
$ pip install --upgrade "numpy==1.26.4" "scipy==1.10.1" "tensorflow==2.19.0" "keras==3.9.2"
```  
<br>

1. **Machine Learning packages**

    **WARNING**: Be sure to install [turtlebot3](https://github.com/ROBOTIS-GIT/turtlebot3), [turtlebot3_msgs](https://github.com/ROBOTIS-GIT/turtlebot3_msgs) and [turtlebot3_simulations](https://github.com/ROBOTIS-GIT/turtlebot3_simulations) package before installation of machine learning packages.
    {: .notice--warning}

    ``` bash
    $ cd ~/turtlebot3_ws/src/
    $ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_machine_learning.git
    $ cd ~/turtlebot3_ws && colcon build --symlink-install
    ```
