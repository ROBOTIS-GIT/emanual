
{% capture notice_01 %}
**NOTE**:

- This instructions were tested on `Ubuntu 20.04` and `ROS1 Noetic Ninjemys`.
- For more informationn, see [OpenMANIPULATOR e-Manual](/docs/en/platform/openmanipulator/) and [[ROS 1] Turtlebot3 Manipulation](/docs/en/platform/turtlebot3/manipulation)
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/turtlebot3/home_service_challenge/hsc_stadium_2.png)

> Home Service Challenge Stadium and Objects

<iframe width="560" height="315" src="https://www.youtube.com/embed/3aZXpVsEi0c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [What you need to Join the Home Service Challenge](#what-you-need-to-join-the-home-service-challenge)

`TurtleBot3 Waffle Pi`

- It is the basic model to use Home Service Challenge packages for mobile manipulation.
- Provided source codes, Home Service Challenge Packages, are made based on TurtleBot3 Waffle Pi.

`OpenMANIPULATOR-X`

- OpenMANIPULATOR-X is an official robot platform to use mobile manipulation feature with Turtlebot3 in the Home Service Challenge.

`Remote PC`

- It communicates with an single board computer (SBC) on Turtlebot3.
- Laptop, desktop, or other devices with ROS 1.

### [Getting Started](#getting-started)

{% capture HSC_Note %}
**NOTE**: Be sure to complete the following instructions before installing Home Service Challenge packages in the pc.

- [TurtleBot3 PC Set up](/docs/en/platform/turtlebot3/pc_setup)
- [TurtleBot3 SBC Set up](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/#raspberry-pi-3-setup)
- [OpenMANIPULATOR-X](/docs/en/platform/openmanipulator_x/ros_setup/#install-ros-packages) packages
{% endcapture %}
<div class="notice">{{ HSC_Note | markdownify }}</div>

### [Simulation](#simulation)

Simulate TurtleBot3 with OpenMANIPULATOR-X in Gazebo.

1. **[Remote PC]** Run Gazebo.
```bash
$ roslaunch turtlebot3_home_service_challenge_simulation competition.launch
```

   ![gazebo](/assets/images/platform/turtlebot3/home_service_challenge/noetic/simulation_gazebo.png)

2. **[Remote PC]** Run a simulation demo for Gazebo.
```bash
$ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_home_service_challenge_demo_simulation.launch
```

   ![simulation_rviz](/assets/images/platform/turtlebot3/home_service_challenge/noetic/simulation_rviz.png)

3. **[Remote PC]** Run Home Service Manager.
```bash
$ roslaunch turtlebot3_home_service_challenge_manager manager.launch
```

4. Use the Home Service Challenge commands, See [Commands](#commands)
