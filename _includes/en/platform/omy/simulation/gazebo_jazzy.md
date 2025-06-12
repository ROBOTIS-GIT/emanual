### Installation Gazebo Harmonic
  ```bash
$ sudo apt-get update
$ sudo apt-get install curl lsb-release gnupg
$ sudo curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
$ sudo apt-get update
$ sudo apt-get install gz-harmonic
  ```

### Launch Gazebo
1. Close all terminals, then open new terminals and enter the commands below to load OMY on the Gazebo simulator.
``` bash
$ ros2 launch open_manipulator_bringup gazebo.launch.py
```
![](/assets/images/platform/omy/OMY_Gazebo.png)
2. Run [Operation](/docs/en/platform/omy/ros2_operation) in Gazebo simulation
