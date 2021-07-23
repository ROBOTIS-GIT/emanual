
For beginners, it is strongly recommended to install ROS with the script provided in the below command.


```bash
$ sudo apt update && sudo apt upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh
$ chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

<details>
<summary>
![](/assets/images/icon_unfold.png) **Click to expand : Manual ROS Installation**
</summary>
Please be aware that this manual installation takes a lot more time than installing with the script, but allows flexible choice of package installation. **This instruction is not recommended for the beginners.**  
Below instruction is based on [the official ROS Kinetic installation guide](http://wiki.ros.org/kinetic/Installation/Ubuntu).

1. Setup the sources.list
```bash
$ sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
```

2. Set up the keys
```bash
$ sudo apt install curl
$ curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
```

3. Install ROS
```bash
$ sudo apt-get update
$ sudo apt-get install ros-kinetic-desktop-full
```

4. Dependencies for building packages
```bash
$ sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
```

5. Initialize rosdep
```bash
$ sudo apt install python-rosdep
$ sudo rosdep init
$ rosdep update
```

6. ROS Environment setup  
Please do **NOT** enter below commands if you have installed ROS with the script file.  
The `install_ros_kinetic.sh` script file automatically configures the basic ROS environment.
```bash
$ sudo apt-get install git
$ mkdir -p ~/catkin_ws/src
$ catkin_init_workspace
$ cd ~/catkin_ws && catkin_make
$ echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
$ echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
$ echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
$ echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc"
$ source ~/.bashrc
```
</details>
