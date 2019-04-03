---
layout: archive
lang: en
ref: robotis_manipulator_libs
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/robotis_manipulator_libs/
sidebar:
  title: robotis manipulator library
  nav: "robotis_manipulator_libs"
---


# [Overview](#overview)
The robotis_manipulator package is a library package for controlling the manipulator. This package provides a manipulator class for setting manipulator parameters, and provides some math functions to configure the manipulator controller and a basic trajectory generators that uses minimum jerk. The user makes a class inheriting RobotisManipulator class, and set up the class by using the provided functions and the vurtual classes. The class provides functions such as creating the trajectory, receiving joint positions from the actuators and sending the target positions to the actuators. The open_manipulator_libs package can be refer as an example.

# [Installation](#installation)

The robotis_manipulator package is supported in ROS and OpenCR environments. User can write own program to control user's manipulators by using the robotis_manipulator package on ROS environment. If you want to use robotis_manipulator in a more simple development environment, you can use OpenCR, one of the powerful embedded systems. Users can easily take robotis_manipulator in arduino IDE environment that supports OpenCR.

## [ROS Package](#ros-package)

**NOTE** : The following instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

### [Install Ubuntu on PC](#install-ubuntu-on-pc)

Download and install `Ubuntu 16.04` on your PC.

- [Download link](https://www.ubuntu.com/download/alternative-downloads)

If you need more help with installing Ubuntu, check out the step-by-step guide from the link below.

- [Install ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

### [Install ROS on PC](#install-ros-on-pc)

![](/assets/images/platform/turtlebot3/logo_ros.png)

The following script will allow you to simplify the ROS installation procedure. Run the following command in a terminal window. The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key to open a terminal is `Ctrl`+`Alt`+`t`. After installing ROS, please reboot PC.

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_kinetic.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}

If you prefer manual installation, please following the link below.

- [Manual installation of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)

### [Install ROS Package](#install-ros-package)
Install the robotis_manipulator package. Run the following command in a terminal window.

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--info}

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git
$ cd ~/catkin_ws && catkin_make
```

If the catkin_make command has been completed without any errors, all the preparations for using the robotis_manipulator package are done.

## [OpenCR](#opencr)

### [Connection](#connection)

Connect PC and OpenCR to micro USB as shown below.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_setup.png" width="500">

**NOTE** : Please refer the detailed description of [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice}

### [Arduino IDE Setup](#arduino-ide-setup)

**NOTE**: This page only explain the setup process of OpenCR of the linux envirnment. If you want to use OpenCR in windows or mac environments, please refer to [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide).
{: .notice--info}

#### Install Arduino IDE(Linux)
Download the latest version of Arduino IDE from the official arduino homepage, and install it. Currently, the OpenCR will be on service in the version 1.6.4 or later.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

Then, extract the downloaded file to the desired folder and execute the installation file from the terminal. In this case, the example shown below makes the folder tools in the user’s top folder (~/). This folder will act as the Arduino IDE folder.

```bash
$ cd ~/tools/arduino-1.6.4
$ ./install.sh
```

Set the file path of installed Arduino IDE as an absolute path named PATH in the bashrc file. Here recommends to use gedit editor. (Use another editor, if necessary.) Finally, source it to apply the changes.

```bash
$ gedit ~/.bashrc
$ export PATH=$PATH:$HOME/tools/arduino-1.6.4
$ source ~/.bashrc
```

#### Run Arduino IDE(Linux)
To run the Arduino IDE on Linux platform, type into the terminal as follows.

```bash
$ arduino
```

![](/assets/images/platform/turtlebot3/preparation/ide0.png)

#### Porting to Arduino IDE(Linux)

##### Preferences
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

![](/assets/images/platform/turtlebot3/preparation/ide1.png)

##### Install the OpenCR package via Boards Manager
Click Tools → Board → Boards Manager.

![](/assets/images/platform/turtlebot3/preparation/ide2.png)

Type OpenCR into the textbox to find the OpenCR by ROBOTIS package. After it finds out, click Install.

![](/assets/images/platform/turtlebot3/preparation/ide3.png)

After the installation, “INSTALLED” will be appeared.

![](/assets/images/platform/turtlebot3/preparation/ide4.png)

See if OpenCR Board is now on the list of Tools → Board. Click this to import the OpenCR Board source.

![](/assets/images/platform/turtlebot3/preparation/ide5.png)

##### Port setting
This step shows the port setting for the program uploads. The OpenCR should be connected to the PC and the OpenCR via the USB ports.

Select Tools → Port → /dev/ttyACM0.

**WARNING** : The last digit value `0` in the string `/dev/ttyACM0` might be different depend on the USB connection environment.
{: .notice--warning}

![](/assets/images/platform/turtlebot3/preparation/ide6.png)

**NOTE**: Please refer to [Arduino IDE for using OpenCR(linux)](/docs/en/parts/controller/opencr10/#install-on-linux) for detailed setting method.
{: .notice--info}


# [API References](#api-references)

**Coming soon**

# [API Usage Tutorials](#api-usage-tutorials)

The robotis_manipulator is ...
In this tutorial, we will make the open_manipulator_libs used to control to OpenManipulator-X RM-X52-TNM as an example.

## [Step1 Make Manipulator Class](#step1.-make-manipulator-class)

```c
#define CUSTOM_TRAJECTORY_SIZE 4

class OpenManipulator : public robotis_manipulator::RobotisManipulator
{
  
private:
  robotis_manipulator::Kinematics *kinematics_;
  robotis_manipulator::JointActuator *actuator_;
  robotis_manipulator::ToolActuator *tool_;
  robotis_manipulator::CustomTaskTrajectory *custom_trajectory_[CUSTOM_TRAJECTORY_SIZE];

public:
  OpenManipulator();
  virtual ~OpenManipulator();

  void initOpenManipulator(bool using_actual_robot_state, STRING usb_port = "/dev/ttyUSB0", STRING baud_rate = "1000000", float control_loop_time = 0.010);
  void processOpenManipulator(double present_time);
};
```
robotis_manipulator class를 상속받은 매니퓰레이터 클래스를 만듭니다.
이 예시에서는 클래스의 public 함수로서 initOpenManipulator와 processOpenManipulator를 만들었습니다.


## [Step2 Initialize Manipulator](##step2.-initialize-manipulator)

InitOpenManipulator 함수에서는 매니퓰레이터의 DH(Denavit–Hartenberg) parameters와 kinematics solver, actuator, trajectory generators를 설정합니다.
아래가 OpenManipulator class의 InitOpenManipulator함수입니다.

```c
void OpenManipulator::initOpenManipulator(bool using_actual_robot_state, STRING usb_port, STRING baud_rate, float control_loop_time)
{
/*****************************************************************************
** Initialize Manipulator Parameter
*****************************************************************************/
  addWorld("world",   // world name
          "joint1"); // child name

  addJoint("joint1",  // my name
          "world",   // parent name
          "joint2",  // child name
          math::vector3(0.012, 0.0, 0.017),                // relative position
          math::convertRPYToRotationMatrix(0.0, 0.0, 0.0), // relative orientation
          Z_AXIS,    // axis of rotation
          11,        // actuator id
          M_PI,      // max joint limit (3.14 rad)
          -M_PI,     // min joint limit (-3.14 rad)
          1.0,       // coefficient
          9.8406837e-02,                                                        // mass
          math::inertiaMatrix(3.4543422e-05, -1.6031095e-08, -3.8375155e-07,
                              3.2689329e-05, 2.8511935e-08,
                              1.8850320e-05),                                   // inertial tensor
          math::vector3(-3.0184870e-04, 5.4043684e-04, 0.018 + 2.9433464e-02)   // COM
          );

  addJoint("joint2",  // my name
          "joint1",  // parent name
          "joint3",  // child name
          math::vector3(0.0, 0.0, 0.0595),                // relative position
          math::convertRPYToRotationMatrix(0.0, 0.0, 0.0), // relative orientation
          Y_AXIS,    // axis of rotation
          12,        // actuator id
          M_PI_2,    // max joint limit (1.67 rad)
          -2.05,     // min joint limit (-2.05 rad)
          1.0,       // coefficient
          1.3850917e-01,                                                        // mass
          math::inertiaMatrix(3.3055381e-04, 9.7940978e-08, -3.8505711e-05,
                              3.4290447e-04, -1.5717516e-06,
                              6.0346498e-05),                                   // inertial tensor
          math::vector3(1.0308393e-02, 3.7743363e-04, 1.0170197e-01)            // COM
          );

  addJoint("joint3",  // my name
          "joint2",  // parent name
          "joint4",  // child name
          math::vector3(0.024, 0.0, 0.128),               // relative position
          math::convertRPYToRotationMatrix(0.0, 0.0, 0.0), // relative orientation
          Y_AXIS,    // axis of rotation
          13,        // actuator id
          1.53,      // max joint limit (1.53 rad)
          -M_PI_2,   // min joint limit (-1.67 rad)
          1.0,       // coefficient
          1.3274562e-01,                                                        // mass
          math::inertiaMatrix(3.0654178e-05, -1.2764155e-06, -2.6874417e-07,
                              2.4230292e-04, 1.1559550e-08,
                              2.5155057e-04),                                   // inertial tensor
          math::vector3(9.0909590e-02, 3.8929816e-04, 2.2413279e-04)            // COM
          );

  addJoint("joint4",  // my name
          "joint3",  // parent name
          "gripper", // child name
          math::vector3(0.124, 0.0, 0.0),                 // relative position
          math::convertRPYToRotationMatrix(0.0, 0.0, 0.0), // relative orientation
          Y_AXIS,    // axis of rotation
          14,        // actuator id
          2.0,       // max joint limit (2.0 rad)
          -1.8,      // min joint limit (-1.8 rad)
          1.0,       // coefficient
          1.4327573e-01,                                                        // mass
          math::inertiaMatrix(8.0870749e-05, 0.0, -1.0157896e-06,
                              7.5980465e-05, 0.0,
                              9.3127351e-05),                                   // inertial tensor
          math::vector3(4.4206755e-02, 3.6839985e-07, 8.9142216e-03)            // COM
          );

  addTool("gripper",  // my name
          "joint4",   // parent name
          math::vector3(0.126, 0.0, 0.0),                 // relative position
          math::convertRPYToRotationMatrix(0.0, 0.0, 0.0), // relative orientation
          15,         // actuator id
          0.010,      // max gripper limit (0.01 m)
          -0.010,     // min gripper limit (-0.01 m)
          -0.015,     // Change unit from `meter` to `radian`
          3.2218127e-02 * 2,                                                    // mass
          math::inertiaMatrix(9.5568826e-06, 2.8424644e-06, -3.2829197e-10,
                              2.2552871e-05, -3.1463634e-10,
                              1.7605306e-05),                                   // inertial tensor
          math::vector3(0.028 + 8.3720668e-03, 0.0246, -4.2836895e-07)          // COM
        );
          
/*****************************************************************************
** Initialize Kinematics 
*****************************************************************************/
  kinematics_ = new kinematics::SolverCustomizedforOMChain();
  addKinematics(kinematics_);

  if(using_actual_robot_state)
  {
    /*****************************************************************************
    ** Initialize Joint Actuator
    *****************************************************************************/
    actuator_ = new dynamixel::JointDynamixel();

    // Set communication arguments
    STRING dxl_comm_arg[2] = {usb_port, baud_rate};
    void *p_dxl_comm_arg = &dxl_comm_arg;

    // Set joint actuator id
    std::vector<uint8_t> jointDxlId;
    jointDxlId.push_back(11);
    jointDxlId.push_back(12);
    jointDxlId.push_back(13);
    jointDxlId.push_back(14);
    addJointActuator(JOINT_DYNAMIXEL, actuator_, jointDxlId, p_dxl_comm_arg);

    // Set joint actuator control mode
    STRING joint_dxl_mode_arg = "position_mode";
    void *p_joint_dxl_mode_arg = &joint_dxl_mode_arg;
    setJointActuatorMode(JOINT_DYNAMIXEL, jointDxlId, p_joint_dxl_mode_arg);


    /*****************************************************************************
    ** Initialize Tool Actuator
    *****************************************************************************/
    tool_ = new dynamixel::GripperDynamixel();

    uint8_t gripperDxlId = 15;
    addToolActuator(TOOL_DYNAMIXEL, tool_, gripperDxlId, p_dxl_comm_arg);

    // Set gripper actuator control mode
    STRING gripper_dxl_mode_arg = "current_based_position_mode";
    void *p_gripper_dxl_mode_arg = &gripper_dxl_mode_arg;
    setToolActuatorMode(TOOL_DYNAMIXEL, p_gripper_dxl_mode_arg);

    // Set gripper actuator parameter
    STRING gripper_dxl_opt_arg[2];
    void *p_gripper_dxl_opt_arg = &gripper_dxl_opt_arg;
    gripper_dxl_opt_arg[0] = "Profile_Acceleration";
    gripper_dxl_opt_arg[1] = "20";
    setToolActuatorMode(TOOL_DYNAMIXEL, p_gripper_dxl_opt_arg);

    gripper_dxl_opt_arg[0] = "Profile_Velocity";
    gripper_dxl_opt_arg[1] = "200";
    setToolActuatorMode(TOOL_DYNAMIXEL, p_gripper_dxl_opt_arg);

    // Enable All Actuators 
    enableAllActuator();

    // Receive current angles from all actuators 
    receiveAllJointActuatorValue();
    receiveAllToolActuatorValue();
  }

  /*****************************************************************************
  ** Initialize Custom Trajectory
  *****************************************************************************/
  custom_trajectory_[0] = new custom_trajectory::Line();
  custom_trajectory_[1] = new custom_trajectory::Circle();
  custom_trajectory_[2] = new custom_trajectory::Rhombus();
  custom_trajectory_[3] = new custom_trajectory::Heart();

  addCustomTrajectory(CUSTOM_TRAJECTORY_LINE, custom_trajectory_[0]);
  addCustomTrajectory(CUSTOM_TRAJECTORY_CIRCLE, custom_trajectory_[1]);
  addCustomTrajectory(CUSTOM_TRAJECTORY_RHOMBUS, custom_trajectory_[2]);
  addCustomTrajectory(CUSTOM_TRAJECTORY_HEART, custom_trajectory_[3]);
}
```
자세한 내용은 아래에서 설명합니다.

### [Set Robot Parameter](#set-robot-parameter)

매니퓰레이터의 DH parameter를 설정하는데는 addWorld, addJoint, addTool, addComponentChild함수를 사용합니다.
robotis_manipulator에서 매니퓰레이터의 가동부는 Component라고 칭하며, Component에는 Joint와 Tool이 있습니다.

#### addWorld
```c
void RobotisManipulator::addWorld(Name world_name,
                                  Name child_name,
                                  Eigen::Vector3d world_position = Eigen::Vector3d::Zero(),
                                  Eigen::Matrix3d world_orientation = Eigen::Matrix3d::Identity());
```
매니퓰레이터가 고정되어 있는 a world를 설정합니다. the world는 매니퓰레이터가 고정되어있는 a base 점을 칭하며, 이 점은 매니퓰레이터의 고정상태에 따라 변할 수 있습니다. the wolrd는 하나의 매니퓰레이터에 하나의 점으로 지정됩니다.

- **world_name**
world의 이름을 지정합니다.
- **child_name**
world와 연결된 다음 component 이름을 설정합니다.
- **world_position**
world의 초기 좌표축의 위치를 지정합니다. 벡터형식이며 디폴트값은 (0.0, 0.0, 0.0)의 원점입니다.
- **world_orientation**
world의 초기 좌표축의 자세를 지정합니다. the rotation matrix 형식이며 디폴트값은 단위행렬입니다.

#### addJoint
```c
void RobotisManipulator::addJoint(Name my_name,
                                  Name parent_name,
                                  Name child_name,
                                  Eigen::Vector3d relative_position,
                                  Eigen::Matrix3d relative_orientation,
                                  Eigen::Vector3d axis_of_rotation = Eigen::Vector3d::Zero(),
                                  int8_t joint_actuator_id = -1, 
                                  double max_position_limit = M_PI, 
                                  double min_position_limit = -M_PI,
                                  double coefficient = 1.0,
                                  double mass = 0.0,
                                  Eigen::Matrix3d inertia_tensor = Eigen::Matrix3d::Identity(),
                                  Eigen::Vector3d center_of_mass = Eigen::Vector3d::Zero());
```
매니퓰레이터의 a joint component를 추가합니다. The Joint component는 매니퓰레이터의 액추에이터의 유무에 관계없이 가동되는 모든 조인트의 component를 칭합니다. 매니퓰레이터의 말단에 위치한 end-effectors는 the joint component에서 제외됩니다. the joint component의 위치와 자세는 구동축(joint)이 위치한 component 좌표축의 위치와 자세를 의미합니다.

- **my_name**
해당 Joint component의 이름을 지정합니다.
- **parent_name**
해당 Joint component가 연결된 a 이전 component 이름을 지정합니다.
- **child_name**
해당 Joint component가 연결된 a 다음 component 이름을 지정합니다.
- **relative_position**
a parent component의 좌표축으로부터의 the joint coordinates의 상대적인 위치를 벡터형식으로 지정합니다.
- **relative_orientation**
a parent component의 좌표축으로부터의 the joint coordinates의 상대적인 자세를 the rotation matrix형식으로 지정합니다.
- **axis_of_rotation**
the joint component의 a joint 회전축을 지정합니다. 회전축은 relative_position와 relative_orientation로 설정된 좌표축에 대한 회전축을 의미합니다.
- **joint_actuator_id**
the joint에 사용된 액추에이터의 id를 지정합니다. id는 0이상의 자연수로 설정할 수 있으며, 여러 조인트에 중복적으로 사용할 수 없습니다. id를 -1로 설정할 경우 the joint는 액추에이터가 부착되지 않은 패시브 조인트로 지정됩니다.
- **max_position_limit**
the joint의 가동범위의 상한을 지정합니다.
- **min_position_limit**
the joint의 가동범위의 하한를 지정합니다.
- **coefficient**
the joint의 구조에 의한 감속비를 지정합니다. 이 값은 the joint의 position값에 대한 the actuator의 position값의 비를 나타냅니다.
- **mass**
the joint component의 질량을 지정합니다. 
- **inertia_tensor**
the joint component의 inertia tensor를 지정합니다. 이 값은 the parent component coordinates에 대해 지정됩니다.
- **center_of_mass**
the joint component의 질량중심을 지정합니다. 이 값은 the parent component coordinates에 대해 지정됩니다.

#### addTool
```c
void RobotisManipulator::addTool(Name my_name,
                                 Name parent_name,
                                 Eigen::Vector3d relative_position,
                                 Eigen::Matrix3d relative_orientation,
                                 int8_t tool_id = -1, 
                                 double max_position_limit =M_PI, 
                                 double min_position_limit = -M_PI,
                                 double coefficient = 1.0,
                                 double mass = 0.0,
                                 Eigen::Matrix3d inertia_tensor = Eigen::Matrix3d::Identity(),
                                 Eigen::Vector3d center_of_mass = Eigen::Vector3d::Zero());
```
매니퓰레이터의 a tool를 추가합니다. the tool은 매니퓰레이터의 end-effectors를 칭하며, 매니퓰레이터의 말단에 장착됩니다. 하나의 매니퓰레이터는 여러개의 tools를 가지도록 설정될 수 있습니다. the tool의 위치와 자세는 구동축의 위치와 자세를 의미합니다.

- **my_name**
해당 tool component의 이름을 지정합니다.
- **parent_name**
해당 tool component가 연결된 a 이전 component 이름을 지정합니다.
- **relative_position**
a parent component의 좌표축으로부터의 the tool coordinates의 상대적인 위치를 벡터형식으로 지정합니다.
- **relative_orientation**
a parent component의 좌표축으로부터의 the tool coordinates의 상대적인 자세를 the rotation matrix형식으로 지정합니다.
- **tool_id**
the tool에 사용된 액추에이터의 id를 지정합니다. id는 0이상의 자연수로 설정할 수 있으며, 여러 components에 중복적으로 사용할 수 없습니다. id를 -1로 설정할 경우 the tool는 액추에이터가 부착되지 않은 패시브 end-effector로 지정됩니다.
- **max_position_limit**
the end-effector의 가동범위의 상한을 지정합니다.
- **min_position_limit**
the end-effector의 가동범위의 하한를 지정합니다.
- **coefficient**
the tool의 구조에 의해 발생하는 the tool의 position값에 대한 the actuator의 position값의 비를 나타냅니다.
- **mass**
the tool component의 질량을 지정합니다. 
- **inertia_tensor**
the tool component의 inertia tensor를 지정합니다. 이 값은 the parent component coordinates에 대해 지정됩니다.
- **center_of_mass**
the tool component의 질량중심을 지정합니다. 이 값은 the parent component coordinates에 대해 지정됩니다.


#### addComponentChild
```c
void RobotisManipulator::addComponentChild(Name my_name, Name child_name);
```
addJoint함수이후에 addComponentChild함수를 이용해서 a 해당 component의 child component를 추가합니다. the world와 the joints가 addWorld, addJoint함수에서 이미 지정한 child_name외의 다른 child components를 가질때 사용됩니다. the tool component는 매니퓰레이터의 말단에 위치하기 때문에 child components를 가지지 않습니다.

- **my_name**
a 해당 world 혹은 joint의 이름을 지정합니다.
- **child_name**
해당 Joint가 연결된 a 다음 component 이름을 지정합니다.


### [Add Kinematics Object](#add-kinematics-object)

```c
/*****************************************************************************
** Initialize Kinematics 
*****************************************************************************/
kinematics_ = new kinematics::SolverCustomizedforOMChain();
addKinematics(kinematics_);
```

```c
class Kinematics
{
public:
  Kinematics() {}
  virtual ~Kinematics() {}

  virtual void setOption(const void *arg) = 0;
  virtual Eigen::MatrixXd jacobian(Manipulator *manipulator, Name tool_name) = 0;
  virtual void solveForwardKinematics(Manipulator *manipulator) = 0;
  virtual bool solveInverseKinematics(Manipulator *manipulator, Name tool_name, Pose target_pose, std::vector<JointValue>* goal_joint_position) = 0;
};
```

```c
/*****************************************************************************
** Kinematics Solver Customized for OpenManipulator Chain
*****************************************************************************/
class SolverCustomizedforOMChain : public robotis_manipulator::Kinematics
{
private:
  void forwardSolverUsingChainRule(Manipulator *manipulator, Name component_name);
  bool chainCustomInverseKinematics(Manipulator *manipulator, Name tool_name, Pose target_pose, std::vector<JointValue>* goal_joint_value);

public:
  SolverCustomizedforOMChain(){}
  virtual ~SolverCustomizedforOMChain(){}

  virtual void setOption(const void *arg);
  virtual MatrixXd jacobian(Manipulator *manipulator, Name tool_name);
  virtual void solveForwardKinematics(Manipulator *manipulator);
  virtual bool solveInverseKinematics(Manipulator *manipulator, Name tool_name, Pose target_pose, std::vector<JointValue>* goal_joint_value);
};
```

### [Add Actuator Object](#add-actuator-object)

```c
if(using_actual_robot_state)
{
  /*****************************************************************************
  ** Initialize Joint Actuator
  *****************************************************************************/
  actuator_ = new dynamixel::JointDynamixel();
  
  // Set communication arguments
  STRING dxl_comm_arg[2] = {usb_port, baud_rate};
  void *p_dxl_comm_arg = &dxl_comm_arg;

  // Set joint actuator id
  std::vector<uint8_t> jointDxlId;
  jointDxlId.push_back(11);
  jointDxlId.push_back(12);
  jointDxlId.push_back(13);
  jointDxlId.push_back(14);
  addJointActuator(JOINT_DYNAMIXEL, actuator_, jointDxlId, p_dxl_comm_arg);

  // Set joint actuator control mode
  STRING joint_dxl_mode_arg = "position_mode";
  void *p_joint_dxl_mode_arg = &joint_dxl_mode_arg;
  setJointActuatorMode(JOINT_DYNAMIXEL, jointDxlId, p_joint_dxl_mode_arg);


  /*****************************************************************************
  ** Initialize Tool Actuator
  *****************************************************************************/
  tool_ = new dynamixel::GripperDynamixel();

  uint8_t gripperDxlId = 15;
  addToolActuator(TOOL_DYNAMIXEL, tool_, gripperDxlId, p_dxl_comm_arg);

  // Set gripper actuator control mode
  STRING gripper_dxl_mode_arg = "current_based_position_mode";
  void *p_gripper_dxl_mode_arg = &gripper_dxl_mode_arg;
  setToolActuatorMode(TOOL_DYNAMIXEL, p_gripper_dxl_mode_arg);

  // Set gripper actuator parameter
  STRING gripper_dxl_opt_arg[2];
  void *p_gripper_dxl_opt_arg = &gripper_dxl_opt_arg;
  gripper_dxl_opt_arg[0] = "Profile_Acceleration";
  gripper_dxl_opt_arg[1] = "20";
  setToolActuatorMode(TOOL_DYNAMIXEL, p_gripper_dxl_opt_arg);

  gripper_dxl_opt_arg[0] = "Profile_Velocity";
  gripper_dxl_opt_arg[1] = "200";
  setToolActuatorMode(TOOL_DYNAMIXEL, p_gripper_dxl_opt_arg);

  // Enable All Actuators 
  enableAllActuator();

  // Receive current angles from all actuators 
  receiveAllJointActuatorValue();
  receiveAllToolActuatorValue();
}
```

```c
class JointActuator
{
public:
  bool enabled_state_;

  JointActuator() : enabled_state_(false) {}
  virtual ~JointActuator() {}

  virtual void init(std::vector<uint8_t> actuator_id, const void *arg) = 0;
  virtual void setMode(std::vector<uint8_t> actuator_id, const void *arg) = 0;
  virtual std::vector<uint8_t> getId() = 0;

  virtual void enable() = 0;
  virtual void disable() = 0;

  virtual bool sendJointActuatorValue(std::vector<uint8_t> actuator_id, std::vector<ActuatorValue> value_vector) = 0;
  virtual std::vector<ActuatorValue> receiveJointActuatorValue(std::vector<uint8_t> actuator_id) = 0;

  bool findId(uint8_t actuator_id);
  bool getEnabledState();
};
```

```c
class JointDynamixel : public robotis_manipulator::JointActuator
{
private:
  DynamixelWorkbench *dynamixel_workbench_;
  Joint dynamixel_;
  std::vector<AccelerationCalculator> acceleration_calculator_;
  std::vector<LowPassFilter> velocity_filter_;
  double previous_time_;

public:
  JointDynamixel();
  virtual ~JointDynamixel(){}


  /*****************************************************************************
  ** Joint Dynamixel Control Functions
  *****************************************************************************/
  virtual void init(std::vector<uint8_t> actuator_id, const void *arg);
  virtual void setMode(std::vector<uint8_t> actuator_id, const void *arg);
  virtual std::vector<uint8_t> getId();

  virtual void enable();
  virtual void disable();

  virtual bool sendJointActuatorValue(std::vector<uint8_t> actuator_id, std::vector<robotis_manipulator::ActuatorValue> value_vector);
  virtual std::vector<robotis_manipulator::ActuatorValue> receiveJointActuatorValue(std::vector<uint8_t> actuator_id);


  /*****************************************************************************
  ** Functions called in Joint Dynamixel Control Functions
  *****************************************************************************/
  bool initialize(std::vector<uint8_t> actuator_id, STRING dxl_device_name, STRING dxl_baud_rate);
  bool setOperatingMode(std::vector<uint8_t> actuator_id, STRING dynamixel_mode = "position_mode");
  bool setSDKHandler(uint8_t actuator_id);
  bool writeProfileValue(std::vector<uint8_t> actuator_id, STRING profile_mode, uint32_t value);
  bool writeGoalPosition(std::vector<uint8_t> actuator_id, std::vector<double> radian_vector);
  std::vector<robotis_manipulator::ActuatorValue> receiveAllDynamixelValue(std::vector<uint8_t> actuator_id);
};
```

```c
class ToolActuator
{
public:
  bool enabled_state_;

  ToolActuator():enabled_state_(false){}
  virtual ~ToolActuator() {}

  virtual void init(uint8_t actuator_id, const void *arg) = 0;
  virtual void setMode(const void *arg) = 0;
  virtual uint8_t getId() = 0;

  virtual void enable() = 0;
  virtual void disable() = 0;

  virtual bool sendToolActuatorValue(ActuatorValue value) = 0;
  virtual ActuatorValue receiveToolActuatorValue() = 0;

  bool findId(uint8_t actuator_id);
  bool getEnabledState();
};
```

```c
class GripperDynamixel : public robotis_manipulator::ToolActuator
{
 private:
  DynamixelWorkbench *dynamixel_workbench_;
  Joint dynamixel_;

 public:
  GripperDynamixel() {}
  virtual ~GripperDynamixel() {}


  /*****************************************************************************
  ** Tool Dynamixel Control Functions
  *****************************************************************************/
  virtual void init(uint8_t actuator_id, const void *arg);
  virtual void setMode(const void *arg);
  virtual uint8_t getId();

  virtual void enable();
  virtual void disable();

  virtual bool sendToolActuatorValue(robotis_manipulator::ActuatorValue value);
  virtual robotis_manipulator::ActuatorValue receiveToolActuatorValue();


  /*****************************************************************************
  ** Functions called in Tool Dynamixel Profile Control Functions
  *****************************************************************************/
  bool initialize(uint8_t actuator_id, STRING dxl_device_name, STRING dxl_baud_rate);
  bool setOperatingMode(STRING dynamixel_mode = "position_mode");
  bool writeProfileValue(STRING profile_mode, uint32_t value);
  bool setSDKHandler();
  bool writeGoalPosition(double radian);
  double receiveDynamixelValue();
};
```

### [Add Custom Trajectory Object](add-custom-trajectory-object)

```c
/*****************************************************************************
** Initialize Custom Trajectory
*****************************************************************************/
custom_trajectory_[0] = new custom_trajectory::Line();
custom_trajectory_[1] = new custom_trajectory::Circle();
custom_trajectory_[2] = new custom_trajectory::Rhombus();
custom_trajectory_[3] = new custom_trajectory::Heart();

addCustomTrajectory(CUSTOM_TRAJECTORY_LINE, custom_trajectory_[0]);
addCustomTrajectory(CUSTOM_TRAJECTORY_CIRCLE, custom_trajectory_[1]);
addCustomTrajectory(CUSTOM_TRAJECTORY_RHOMBUS, custom_trajectory_[2]);
addCustomTrajectory(CUSTOM_TRAJECTORY_HEART, custom_trajectory_[3]);
```

```c
class CustomJointTrajectory
{
public:
  CustomJointTrajectory() {}
  virtual ~CustomJointTrajectory() {}

  virtual void makeJointTrajectory(double move_time, JointWaypoint start, const void *arg) = 0; 
  virtual void setOption(const void *arg) = 0;
  virtual JointWaypoint getJointWaypoint(double tick) = 0;
};

class CustomTaskTrajectory
{
public:
  CustomTaskTrajectory() {}
  virtual ~CustomTaskTrajectory() {}

  virtual void makeTaskTrajectory(double move_time, TaskWaypoint start, const void *arg) = 0; 
  virtual void setOption(const void *arg) = 0;
  virtual TaskWaypoint getTaskWaypoint(double tick) = 0;
};
```

```c
/*****************************************************************************
** Line
*****************************************************************************/
class Line : public robotis_manipulator::CustomTaskTrajectory
{
private:
  TaskWaypoint start_pose_;
  TaskWaypoint goal_pose_;

  double acc_dec_time_;
  double move_time_;
  std::vector<double> vel_max_;

public:
	Line() {}
	virtual ~Line() {}

  void initLine(double move_time, TaskWaypoint start, TaskWaypoint delta);
  TaskWaypoint drawLine(double time_var);

  virtual void setOption(const void *arg);
  virtual void makeTaskTrajectory(double move_time, TaskWaypoint start, const void *arg);
  virtual TaskWaypoint getTaskWaypoint(double tick);
};
```

```c
/*****************************************************************************
** Circle
*****************************************************************************/
class Circle : public robotis_manipulator::CustomTaskTrajectory
{
private:
  robotis_manipulator::MinimumJerk path_generator_;
  VectorXd coefficient_;

  TaskWaypoint start_pose_;
  TaskWaypoint goal_pose_;

  double radius_;
  double start_angular_position_;
  double revolution_;

public:
	Circle() {}
	virtual ~Circle() {}

  void initCircle(double move_time, TaskWaypoint start, double radius, double revolution, double start_angular_position);
  TaskWaypoint drawCircle(double time_var);

  virtual void setOption(const void *arg);
  virtual void makeTaskTrajectory(double move_time, TaskWaypoint start, const void *arg);
  virtual TaskWaypoint getTaskWaypoint(double tick);
};
```

## [Step3 Make Control process Function](##step3.-make-control-process-function)

```c
void OpenManipulator::processOpenManipulator(double present_time)
{
  JointWaypoint goal_joint_value = getJointGoalValueFromTrajectory(present_time);
  JointWaypoint goal_tool_value  = getToolGoalValue();

  receiveAllJointActuatorValue();
  receiveAllToolActuatorValue();
  if(goal_joint_value.size() != 0) sendAllJointActuatorValue(goal_joint_value);
  if(goal_tool_value.size() != 0) sendAllToolActuatorValue(goal_tool_value);
  solveForwardKinematics();
}
```

## [Step4 Use it](#step4.-use-it)

**Coming soon**











<!-- # [Struct List](#struct-list)

## [Value Set](#value-set)

### [Pose](#pose)

- Pose

```c
typedef struct _TaskWaypoint
{
  KinematicPose kinematic;
  DynamicPose dynamic;
} TaskWaypoint, Pose;
```

- Kinematic Pose

```c
typedef struct _KinematicPose
{
  Eigen::Vector3d position;
  Eigen::Matrix3d orientation;
} KinematicPose;
```

- DynamicPose

```c
typedef struct _Dynamicvector
{
  Eigen::Vector3d velocity;
  Eigen::Vector3d acceleration;
} Dynamicvector;

typedef struct _DynamicPose
{
  Dynamicvector linear;
  Dynamicvector angular;
} DynamicPose;
```



### [Value](#value)

- JointValue and ToolValue

```c
typedef struct _Point
{
  double position;
  double velocity;
  double acceleration;
  double effort;
} Point, ActuatorValue, JointValue, ToolValue;
```

## [Trajectory Set](#trajectory-set)

### [JointWaypoint](#jointwaypoint)

- JointWaypoint

```c
typedef struct _Point
{
  double position;
  double velocity;
  double acceleration;
  double effort;
} Point, ActuatorValue, JointValue, ToolValue;

typedef std::vector<JointValue> JointWaypoint;
```

### [TaskWaypoint](#taskwaypoint)

- TaskWaypoint

```c
typedef struct _TaskWaypoint
{
  KinematicPose kinematic;
  DynamicPose dynamic;
} TaskWaypoint, Pose;
```

# [Class List](#class-list)

## [Manipulator Class](#manipulator-class)

### [Add Functions](#add-functions)

```c
  void addWorld(Name world_name,
                Name child_name,
                Eigen::Vector3d world_position = Eigen::Vector3d::Zero(),
                Eigen::Matrix3d world_orientation = Eigen::Matrix3d::Identity());

  void addJoint(Name my_name,
                Name parent_name,
                Name child_name,
                Eigen::Vector3d relative_position,
                Eigen::Matrix3d relative_orientation,
                Eigen::Vector3d axis_of_rotation = Eigen::Vector3d::Zero(),
                int8_t joint_actuator_id = -1, 
                double max_position_limit = M_PI, 
                double min_position_limit = -M_PI,
                double coefficient = 1.0,
                double mass = 0.0,
                Eigen::Matrix3d inertia_tensor = Eigen::Matrix3d::Identity(),
                Eigen::Vector3d center_of_mass = Eigen::Vector3d::Zero());

  void addTool(Name my_name,
               Name parent_name,
               Eigen::Vector3d relative_position,
               Eigen::Matrix3d relative_orientation,
               int8_t tool_id = -1, 
               double max_position_limit = M_PI, 
               double min_position_limit = -M_PI,
               double coefficient = 1.0,
               double mass = 0.0,
               Eigen::Matrix3d inertia_tensor = Eigen::Matrix3d::Identity(),
               Eigen::Vector3d center_of_mass = Eigen::Vector3d::Zero());

  void addComponentChild(Name my_name, Name child_name);
  void printManipulatorSetting();
```

### [Set Functions](#set-functions)

```c
  void setWorldPose(Pose world_pose);
  void setWorldKinematicPose(KinematicPose world_kinematic_pose);
  void setWorldPosition(Eigen::Vector3d world_position);
  void setWorldOrientation(Eigen::Matrix3d world_orientation);
  void setWorldDynamicPose(DynamicPose world_dynamic_pose);
  void setWorldLinearVelocity(Eigen::Vector3d world_linear_velocity);
  void setWorldAngularVelocity(Eigen::Vector3d world_angular_velocity);
  void setWorldLinearAcceleration(Eigen::Vector3d world_linear_acceleration);
  void setWorldAngularAcceleration(Eigen::Vector3d world_angular_acceleration);
  void setComponent(Name component_name, Component component);
  void setComponentActuatorName(Name component_name, Name actuator_name);
  void setComponentPoseFromWorld(Name component_name, Pose pose_to_world);
  void setComponentKinematicPoseFromWorld(Name component_name, KinematicPose pose_to_world);
  void setComponentPositionFromWorld(Name component_name, Eigen::Vector3d position_to_world);
  void setComponentOrientationFromWorld(Name component_name, Eigen::Matrix3d orientation_to_wolrd);
  void setComponentDynamicPoseFromWorld(Name component_name, DynamicPose dynamic_pose);

  void setJointPosition(Name name, double position);
  void setJointVelocity(Name name, double velocity);
  void setJointAcceleration(Name name, double acceleration);
  void setJointEffort(Name name, double effort);
  void setJointValue(Name name, JointValue joint_value);

  void setAllActiveJointPosition(std::vector<double> joint_position_vector);
  void setAllActiveJointValue(std::vector<JointValue> joint_value_vector);
  void setAllJointPosition(std::vector<double> joint_position_vector);
  void setAllJointValue(std::vector<JointValue> joint_value_vector);
  void setAllToolPosition(std::vector<double> tool_position_vector);
  void setAllToolValue(std::vector<JointValue> tool_value_vector);
```

### [Get Functions](#get-functions)

```c
  int8_t getDOF();
  Name getWorldName();
  Name getWorldChildName();
  Pose getWorldPose();
  KinematicPose getWorldKinematicPose();
  Eigen::Vector3d getWorldPosition();
  Eigen::Matrix3d getWorldOrientation();
  DynamicPose getWorldDynamicPose();
  int8_t getComponentSize();
  std::map<Name, Component> getAllComponent();
  std::map<Name, Component>::iterator getIteratorBegin();
  std::map<Name, Component>::iterator getIteratorEnd();
  Component getComponent(Name component_name);
  Name getComponentActuatorName(Name component_name);
  Name getComponentParentName(Name component_name);
  std::vector<Name> getComponentChildName(Name component_name);
  Pose getComponentPoseFromWorld(Name component_name);
  KinematicPose getComponentKinematicPoseFromWorld(Name component_name);
  Eigen::Vector3d getComponentPositionFromWorld(Name component_name);
  Eigen::Matrix3d getComponentOrientationFromWorld(Name component_name);
  DynamicPose getComponentDynamicPoseFromWorld(Name component_name);
  KinematicPose getComponentRelativePoseFromParent(Name component_name);
  Eigen::Vector3d getComponentRelativePositionFromParent(Name component_name);
  Eigen::Matrix3d getComponentRelativeOrientationFromParent(Name component_name);

  int8_t getId(Name component_name);
  double getCoefficient(Name component_name);
  Eigen::Vector3d getAxis(Name component_name);
  double getJointPosition(Name component_name);
  double getJointVelocity(Name component_name);
  double getJointAcceleration(Name component_name);
  double getJointEffort(Name component_name);
  JointValue getJointValue(Name component_name);

  double getComponentMass(Name component_name);
  Eigen::Matrix3d getComponentInertiaTensor(Name component_name);
  Eigen::Vector3d getComponentCenterOfMass(Name component_name);

  std::vector<double> getAllJointPosition();
  std::vector<JointValue> getAllJointValue();
  std::vector<double> getAllActiveJointPosition();
  std::vector<JointValue> getAllActiveJointValue();
  std::vector<double> getAllToolPosition();
  std::vector<JointValue> getAllToolValue();

  std::vector<uint8_t> getAllJointID();
  std::vector<uint8_t> getAllActiveJointID();
  std::vector<Name> getAllToolComponentName();
  std::vector<Name> getAllActiveJointComponentName();
```

### [Check Functions](#check-functions)

```c
  bool checkJointLimit(Name Component_name, double value);
  bool checkComponentType(Name component_name, ComponentType component_type);
```

### [Find Function](#find-functions)

```c
  Name findComponentNameUsingId(int8_t id);
```


## [Trajectory Class](#trajectory-class)

### [Trajectory Time Functions](#trajectory-time-functions)

```c
  void setMoveTime(double move_time);
  void setPresentTime(double present_time);
  void setStartTimeToPresentTime();
  void setStartTime(double start_time);
  double getMoveTime();
  double getTickTime();
```

### [Manipulator Functions](#manipulator-functions)

```c
  void setManipulator(Manipulator manipulator);
  Manipulator* getManipulator();
  void initTrajectoryWaypoint(Manipulator actual_manipulator, Kinematics *kinematics);
```

### [Waypoint Functions](#waypoint-functions)

```c
  void updatePresentWaypoint(Kinematics* kinematics);
  void setPresentJointWaypoint(JointWaypoint joint_value_vector);
  void setPresentTaskWaypoint(Name tool_name, TaskWaypoint tool_position_value_vector);
  JointWaypoint getPresentJointWaypoint();
  TaskWaypoint getPresentTaskWaypoint(Name tool_name);

  JointWaypoint removeWaypointDynamicData(JointWaypoint value);
  TaskWaypoint removeWaypointDynamicData(TaskWaypoint value);
```

### [Get Trajectory Functions](#get-trajectory-functions)

```c
  JointTrajectory getJointTrajectory();
  TaskTrajectory getTaskTrajectory();
  CustomJointTrajectory* getCustomJointTrajectory(Name name);
  CustomTaskTrajectory* getCustomTaskTrajectory(Name name);
```

### [Make Trajectory Functions](#make-trajectory-functions)

```c
  void setTrajectoryType(TrajectoryType trajectory_type);
  bool checkTrajectoryType(TrajectoryType trajectory_type);
  void makeJointTrajectory(JointWaypoint start_way_point, JointWaypoint goal_way_point);
  void makeTaskTrajectory(TaskWaypoint start_way_point, TaskWaypoint goal_way_point);
  void makeCustomTrajectory(Name trajectory_name, JointWaypoint start_way_point, const void *arg);
  void makeCustomTrajectory(Name trajectory_name, TaskWaypoint start_way_point, const void *arg);
```

### [Custom Trajectory setting Functions](#custom-trajectory-setting-functions)

```c
  void addCustomTrajectory(Name trajectory_name, CustomJointTrajectory *custom_trajectory);
  void addCustomTrajectory(Name trajectory_name, CustomTaskTrajectory *custom_trajectory);
  void setCustomTrajectoryOption(Name trajectory_name, const void* arg);
  void setPresentControlToolName(Name present_control_tool_name);
  Name getPresentCustomTrajectoryName();
  Name getPresentControlToolName();
```


### [Tool Functions](#tool-functions)

```c
  void setToolGoalPosition(Name tool_name, double tool_goal_position);
  void setToolGoalValue(Name tool_name, JointValue tool_goal_value);
  double getToolGoalPosition(Name tool_name);
  JointValue getToolGoalValue(Name tool_name);
```



## [(Virtual) Kinematics Class](#virtual-kinematics-class)

```c
class Kinematics
{
public:
  Kinematics() {}
  virtual ~Kinematics() {}

  virtual void setOption(const void *arg) = 0;
  virtual Eigen::MatrixXd jacobian(Manipulator *manipulator, Name tool_name) = 0;
  virtual void solveForwardKinematics(Manipulator *manipulator) = 0;
  virtual bool solveInverseKinematics(Manipulator *manipulator, Name tool_name, Pose target_pose, std::vector<JointValue>* goal_joint_position) = 0;
};

```


## [(Virtual) JointActuator Class](#virtual-jointactuator-class)

```c
class JointActuator
{
public:
  bool enabled_state_;

  JointActuator() : enabled_state_(false) {}
  virtual ~JointActuator() {}

  virtual void init(std::vector<uint8_t> actuator_id, const void *arg) = 0;
  virtual void setMode(std::vector<uint8_t> actuator_id, const void *arg) = 0;
  virtual std::vector<uint8_t> getId() = 0;

  virtual void enable() = 0;
  virtual void disable() = 0;

  virtual bool sendJointActuatorValue(std::vector<uint8_t> actuator_id, std::vector<ActuatorValue> value_vector) = 0;
  virtual std::vector<ActuatorValue> receiveJointActuatorValue(std::vector<uint8_t> actuator_id) = 0;

  bool findId(uint8_t actuator_id);
  bool getEnabledState();
};
```

## [(Virtual) ToolActuator Class](#virtual-toolactuator-class)

```c
class ToolActuator
{
public:
  bool enabled_state_;

  ToolActuator():enabled_state_(false){}
  virtual ~ToolActuator() {}

  virtual void init(uint8_t actuator_id, const void *arg) = 0;
  virtual void setMode(const void *arg) = 0;
  virtual uint8_t getId() = 0;

  virtual void enable() = 0;
  virtual void disable() = 0;

  virtual bool sendToolActuatorValue(ActuatorValue value) = 0;
  virtual ActuatorValue receiveToolActuatorValue() = 0;

  bool findId(uint8_t actuator_id);
  bool getEnabledState();
};

```

## [(Virtual) CustomJointTrajectory Class](#virtual-customjointtrajectory-class)

```c
class CustomJointTrajectory
{
public:
  CustomJointTrajectory() {}
  virtual ~CustomJointTrajectory() {}

  virtual void makeJointTrajectory(double move_time, JointWaypoint start, const void *arg) = 0; 
  virtual void setOption(const void *arg) = 0;
  virtual JointWaypoint getJointWaypoint(double tick) = 0;
};
```

## [(Virtual) CustomTaskTrajectory Class](#virtual-customtasktrajectory-class)

```c
class CustomTaskTrajectory
{
public:
  CustomTaskTrajectory() {}
  virtual ~CustomTaskTrajectory() {}

  virtual void makeTaskTrajectory(double move_time, TaskWaypoint start, const void *arg) = 0; 
  virtual void setOption(const void *arg) = 0;
  virtual TaskWaypoint getTaskWaypoint(double tick) = 0;
};
```


# [API References](#api-references)

## [Private Parameters](#pravate-parameters)

```c
  Manipulator manipulator_;
  Trajectory trajectory_;
  Kinematics *kinematics_;
  std::map<Name, JointActuator *> joint_actuator_;
  std::map<Name, ToolActuator *> tool_actuator_;

  bool trajectory_initialized_state_;
  bool actuator_added_stete_;
  bool moving_state_;
  bool step_moving_state_;
```

## [Initialize Functions](#initializa-functions)

### [addWorld](#addworld)

```c
  void addWorld(Name world_name,
                Name child_name,
                Eigen::Vector3d world_position = Eigen::Vector3d::Zero(),
                Eigen::Matrix3d world_orientation = Eigen::Matrix3d::Identity());
```

### [addJoint](#addjoint)

```c
  void addJoint(Name my_name,
                Name parent_name,
                Name child_name,
                Eigen::Vector3d relative_position,
                Eigen::Matrix3d relative_orientation,
                Eigen::Vector3d axis_of_rotation = Eigen::Vector3d::Zero(),
                int8_t joint_actuator_id = -1, 
                double max_position_limit = M_PI, 
                double min_position_limit = -M_PI,
                double coefficient = 1.0,
                double mass = 0.0,
                Eigen::Matrix3d inertia_tensor = Eigen::Matrix3d::Identity(),
                Eigen::Vector3d center_of_mass = Eigen::Vector3d::Zero());
```

### [addTool](#addtool)

```c
  void addTool(Name my_name,
               Name parent_name,
               Eigen::Vector3d relative_position,
               Eigen::Matrix3d relative_orientation,
               int8_t tool_id = -1, 
               double max_position_limit =M_PI, 
               double min_position_limit = -M_PI,
               double coefficient = 1.0,
               double mass = 0.0,
               Eigen::Matrix3d inertia_tensor = Eigen::Matrix3d::Identity(),
               Eigen::Vector3d center_of_mass = Eigen::Vector3d::Zero());
```

### [addComponentChild](#addcomponentchild)

```c
  void addComponentChild(Name my_name, Name child_name);
```

### [printManipulatorSetting](#printmanipulatorsetting)

```c
  void printManipulatorSetting();
```

### [addKinematics](#addkinematics)

```c
  void addKinematics(Kinematics *kinematics);
```

### [addJointActuator](#addjointactuator)

```c
  void addJointActuator(Name actuator_name, JointActuator *joint_actuator, std::vector<uint8_t> id_array, const void *arg);
```

### [addToolActuator](#addtoolactuator)

```c
  void addToolActuator(Name tool_name, ToolActuator *tool_actuator, uint8_t id, const void *arg);
```

### [addCustomTrajectory](#addcustomtrajectory)

```c
  void addCustomTrajectory(Name trajectory_name, CustomJointTrajectory *custom_trajectory);
  void addCustomTrajectory(Name trajectory_name, CustomTaskTrajectory *custom_trajectory);
```



## [Manipulator data get Functions](#manipulator-data-get-functions)

### [getManipulator](#getmanipulator)

```c
  Manipulator *getManipulator();
```

### [getJointValue](#getjointvalue)

```c
  JointValue getJointValue(Name joint_name);
```

### [getToolValue](#gettoolvalue)

```c
  JointValue getToolValue(Name tool_name);
```

### [getAllActiveJointValue](#getallactivejointvalue)

```c
std::vector<JointValue> getAllActiveJointValue();
```

### [getAllJointValue](#getalljointvalue)

```c
  std::vector<JointValue> getAllJointValue();
```

### [getAllToolPosition](#getalltoolposition)

```c
  std::vector<double> getAllToolPosition();
```

### [getAllToolValue](#getalltoolvalue)

```c
  std::vector<JointValue> getAllToolValue();
```

### [getKinematicPose](#getkinematicpose)

```c
  KinematicPose getKinematicPose(Name component_name);
```

### [getDynamicPose](#getdynamicpose)

```c
  DynamicPose getDynamicPose(Name component_name);
```

### [getPose](#getpose)

```c
  Pose getPose(Name component_name);
```




## [Kinematics Functions](#kinematics-functions)

### [jacobian](#jacobian)

```c
  Eigen::MatrixXd jacobian(Name tool_name);
```

### [solveForwardKinematics](#solveforwardkinematics)

```c
  void solveForwardKinematics();
```

### [solveInverseKinematics](#solveinversekinematics)

```c
  bool solveInverseKinematics(Name tool_name, Pose goal_pose, std::vector<JointValue> *goal_joint_value);
```

### [setKinematicsOption](#setkinematicsoption)

```c
  void setKinematicsOption(const void* arg);
```




## [Actuator Functions](#actuator-functions)

### [setJointActuatorMode](#setjointactuatormode)

```c
  void setJointActuatorMode(Name actuator_name, std::vector<uint8_t> id_array, const void *arg);
```

### [setToolActuatorMode](#settoolactuatormode)

```c
  void setToolActuatorMode(Name actuator_name, const void *arg);
```

### [getJointActuatorId](#getjointactuatorid)

```c
  std::vector<uint8_t> getJointActuatorId(Name actuator_name);
```

### [getToolActuatorId](#gettoolactuatorid)

```c
  uint8_t getToolActuatorId(Name actuator_name);
```

### [enableActuator](#enableactuator)

```c
  void enableActuator(Name actuator_name);
```

### [disableActuator](#disableactuator)

```c
  void disableActuator(Name actuator_name);
```

### [enableAllJointActuator](#enablealljointactuator)

```c
  void enableAllJointActuator();
```

### [disableAllJointActuator](#disablealljointactuator)

```c
  void disableAllJointActuator();
```

### [enableAllToolActuator](#enablealltoolactuator)

```c
  void enableAllToolActuator();
```

### [disableAllToolActuator](#disablealltoolactuator)

```c
  void disableAllToolActuator();
```

### [enableAllActuator](#enableallactuator)

```c
  void enableAllActuator();
```

### [disableAllActuator](#disableallactuator)

```c
  void disableAllActuator();
```

### [getActuatorEnabledState](#getactuatorenabledstate)

```c
  bool getActuatorEnabledState(Name actuator_name);
```

### [sendJointActuatorValue](#sendjointactuatorvalue)

```c
  bool sendJointActuatorValue(Name joint_component_name, JointValue value);
```

### [sendMultipleJointActuatorValue](#sendmultiplejointactuatorvalue)

```c
  bool sendMultipleJointActuatorValue(std::vector<Name> joint_component_name, std::vector<JointValue> value_vector);
```

### [sendAllJointActuatorValue](#sendalljointactuatorvalue)

```c
  bool sendAllJointActuatorValue(std::vector<JointValue> value_vector);
```

### [receiveJointActuatorValue](#receivejointactuatorvalue)

```c
  JointValue receiveJointActuatorValue(Name joint_component_name);
```

### [receiveMultipleJointActuatorValue](#receivemultiplejointactuatorvalue)

```c
  std::vector<JointValue> receiveMultipleJointActuatorValue(std::vector<Name> joint_component_name);
```

### [receiveAllJointActuatorValue](#receivealljointactuatorvalue)

```c
  std::vector<JointValue> receiveAllJointActuatorValue();
```

### [sendToolActuatorValue](#sendtoolactuatorvalue)

```c
  bool sendToolActuatorValue(Name tool_component_name, JointValue value);
```

### [sendMultipleToolActuatorValue](#sendmultipletoolactuatorvalue)

```c
  bool sendMultipleToolActuatorValue(std::vector<Name> tool_component_name, std::vector<JointValue> value_vector);
```

### [sendAllToolActuatorValue](#sendalltoolactuatorvalue)

```c
  bool sendAllToolActuatorValue(std::vector<JointValue> value_vector);
```

### [receiveToolActuatorValue](#receivetoolactuatorvalue)

```c
  JointValue receiveToolActuatorValue(Name tool_component_name);
```

### [receiveMultipleToolActuatorValue](#receivemultipletoolactuatorvalue)

```c
  std::vector<JointValue> receiveMultipleToolActuatorValue(std::vector<Name> tool_component_name);
```

### [receiveAllToolActuatorValue](#receivealltoolactuatorvalue)

```c
  std::vector<JointValue> receiveAllToolActuatorValue();
```




## [Time Functions](#time-functions)

### [getTrajectoryMoveTime](#gettrajectorymovetime)

```c
  double getTrajectoryMoveTime();
```

### [getMovingState](#getmovingstate)

```c
  bool getMovingState();
```




## [Check Joint Limit Functions](#check-joint-limit-functions)

### [checkJointLimit](#checkjointlimit)

```c
  bool checkJointLimit(Name component_name, double position);
  bool checkJointLimit(Name component_name, JointValue value);
  bool checkJointLimit(std::vector<Name> component_name, std::vector<double> position_vector);
  bool checkJointLimit(std::vector<Name> component_name, std::vector<JointValue> value_vector);
```




## [Trajectory Functions](#trajectory-functions)

### [getTrajectory](#gettrajectory)

```c
  Trajectory *getTrajectory();
```

### [makeJointTrajectoryFromPresentPosition](#makejointtrajectoryfrompresentposition)

```c
  void makeJointTrajectoryFromPresentPosition(std::vector<double> delta_goal_joint_position, double move_time, std::vector<JointValue> present_joint_value = {});
```

### [makeJointTrajectory](#makejointtrajectory)

```c
  void makeJointTrajectory(std::vector<double> goal_joint_position, double move_time, std::vector<JointValue> present_joint_value = {});
  void makeJointTrajectory(std::vector<JointValue> goal_joint_value, double move_time, std::vector<JointValue> present_joint_value = {});
  void makeJointTrajectory(Name tool_name, Eigen::Vector3d goal_position, double move_time, std::vector<JointValue> present_joint_value = {});
  void makeJointTrajectory(Name tool_name, Eigen::Matrix3d goal_orientation, double move_time, std::vector<JointValue> present_joint_value = {});
  void makeJointTrajectory(Name tool_name, KinematicPose goal_pose, double move_time, std::vector<JointValue> present_joint_value = {});
```

### [makeTaskTrajectoryFromPresentPose](#maketasktrajectoryfrompresentpose)

```c
  void makeTaskTrajectoryFromPresentPose(Name tool_name, Eigen::Vector3d position_meter, double move_time, std::vector<JointValue> present_joint_value = {});
  void makeTaskTrajectoryFromPresentPose(Name tool_name, Eigen::Matrix3d orientation_meter, double move_time, std::vector<JointValue> present_joint_value = {});
  void makeTaskTrajectoryFromPresentPose(Name tool_name, KinematicPose goal_pose_delta, double move_time, std::vector<JointValue> present_joint_value = {});
```

### [makeTaskTrajectory](#maketasktrajectory)

```c
  void makeTaskTrajectory(Name tool_name, Eigen::Vector3d goal_position, double move_time, std::vector<JointValue> present_joint_value = {});
  void makeTaskTrajectory(Name tool_name, Eigen::Matrix3d goal_orientation, double move_time, std::vector<JointValue> present_joint_value = {});
  void makeTaskTrajectory(Name tool_name, KinematicPose goal_pose, double move_time, std::vector<JointValue> present_joint_value = {});
```

### [setCustomTrajectoryOption](#setcustomtrajectoryoption)

```c
  void setCustomTrajectoryOption(Name trajectory_name, const void* arg);
```

### [makeCustomTrajectory](#makecustomtrajectory)

```c
  void makeCustomTrajectory(Name trajectory_name, Name tool_name, const void *arg, double move_time, std::vector<JointValue> present_joint_value = {});
  void makeCustomTrajectory(Name trajectory_name, const void *arg, double move_time, std::vector<JointValue> present_joint_value = {});  
```

### [sleepTrajectory](#sleeptrajectory)

```c
  void sleepTrajectory(double wait_time, std::vector<JointValue> present_joint_value = {});
```

### [makeToolTrajectory](#maketooltrajectory)

```c
  void makeToolTrajectory(Name tool_name, double tool_goal_position);
```

### [getJointGoalValueFromTrajectory](#getjointgoalvaluefromtrajectory)

```c
  std::vector<JointValue> getJointGoalValueFromTrajectory(double present_time);
```

### [getJointGoalValueFromTrajectoryTickTime](#getjointgoalvaluefromtrajectoryticktime)

```c
  std::vector<JointValue> getJointGoalValueFromTrajectoryTickTime(double tick_time);
```

### [getToolGoalValue](#gettoolgoalvalue)

```c
  std::vector<JointValue> getToolGoalValue();
```



# [Additional Function API](#additional-function-api)

## [math](#math)

### [Make Functions](#make-functions)

```c
Eigen::Vector3d vector3(double v1, double v2, double v3);
Eigen::Matrix3d matrix3(double m11, double m12, double m13,
                        double m21, double m22, double m23,
                        double m31, double m32, double m33);
Eigen::Matrix3d inertiaMatrix(double ixx, double ixy, double ixz , double iyy , double iyz, double izz);
```

### [Convert Functions](#convert-functions)

```c
// Translation Vector
Eigen::Vector3d convertXYZToVector(double x, double y, double z);

// Rotation 
Eigen::Matrix3d convertRollAngleToRotationMatrix(double angle);
Eigen::Matrix3d convertPitchAngleToRotationMatrix(double angle);
Eigen::Matrix3d convertYawAngleToRotationMatrix(double angle);
Eigen::Vector3d convertRotationMatrixToRPYVector(const Eigen::Matrix3d& rotation_matrix);
Eigen::Matrix3d convertRPYToRotationMatrix(double roll, double pitch, double yaw);
Eigen::Quaterniond convertRPYToQuaternion(double roll, double pitch, double yaw);
Eigen::Quaterniond convertRotationMatrixToQuaternion(const Eigen::Matrix3d& rotation_matrix);
Eigen::Vector3d convertQuaternionToRPYVector(const Eigen::Quaterniond& quaternion);
Eigen::Matrix3d convertQuaternionToRotationMatrix(const Eigen::Quaterniond& quaternion);
Eigen::Vector3d convertRotationMatrixToOmega(const Eigen::Matrix3d& rotation_matrix);

// Transformation Matrix
Eigen::Matrix4d convertXYZRPYToTransformationMatrix(double x, double y, double z , double roll, double pitch, double yaw);
Eigen::Matrix4d convertXYZToTransformationMatrix(double x, double y, double z);
Eigen::Matrix4d convertRPYToTransformationMatrix(double roll, double pitch, double yaw);

// Dynamic Value
Eigen::Vector3d convertOmegaToRPYVelocity(Eigen::Vector3d rpy_vector, Eigen::Vector3d omega);
Eigen::Vector3d convertRPYVelocityToOmega(Eigen::Vector3d rpy_vector, Eigen::Vector3d rpy_velocity);
Eigen::Vector3d convertOmegaDotToRPYAcceleration(Eigen::Vector3d rpy_vector, Eigen::Vector3d rpy_velocity, Eigen::Vector3d omega_dot);
Eigen::Vector3d convertRPYAccelerationToOmegaDot(Eigen::Vector3d rpy_vector, Eigen::Vector3d rpy_velocity, Eigen::Vector3d rpy_acceleration);
```

### [Math Functions](#math-functions)

```c
double sign(double value);

Eigen::Matrix4d inverseTransformationMatrix(const Eigen::MatrixXd& transformation_matrix);
Eigen::Vector3d matrixLogarithm(Eigen::Matrix3d rotation_matrix);
Eigen::Matrix3d skewSymmetricMatrix(Eigen::Vector3d v);
Eigen::Matrix3d rodriguesRotationMatrix(Eigen::Vector3d axis, double angle);

Eigen::Vector3d positionDifference(Eigen::Vector3d desired_position, Eigen::Vector3d present_position);
Eigen::Vector3d orientationDifference(Eigen::Matrix3d desired_orientation, Eigen::Matrix3d present_orientation);
Eigen::VectorXd poseDifference(Eigen::Vector3d desired_position, Eigen::Vector3d present_position,
                        Eigen::Matrix3d desired_orientation, Eigen::Matrix3d present_orientation);
```

## [log](#log)

### [print](#print)

```c
  void print(STRING str, STRING color = "DEFAULT");
  void print(STRING str, double data, uint8_t decimal_point = 3, STRING color = "DEFAULT");
  void print(const char* str, STRING color = "DEFAULT");
  void print(const char* str, double data, uint8_t decimal_point = 3, STRING color = "DEFAULT");
```

### [println](#println)

```c
  void println(STRING str, STRING color = "DEFAULT");
  void println(STRING str, double data, uint8_t decimal_point = 3, STRING color = "DEFAULT");
  void println(const char* str, STRING color = "DEFAULT");
  void println(const char* str, double data, uint8_t decimal_point = 3, STRING color = "DEFAULT");

```

### [info](#info)

```c
  void info(STRING str);
  void info(STRING str, double data, uint8_t decimal_point = 3);
  void info(const char* str);
  void info(const char* str, double data, uint8_t decimal_point = 3);
```

### [warn](#warn)

```c
  void warn(STRING str);
  void warn(STRING str, double data, uint8_t decimal_point = 3);
  void warn(const char* str);
  void warn(const char* str, double data, uint8_t decimal_point = 3);
```

### [error](#error)

```c
  void error(STRING str);
  void error(STRING str, double data, uint8_t decimal_point = 3);
  void error(const char* str);
  void error(const char* str, double data, uint8_t decimal_point = 3);
```

### [print vector](#print-vector)

```c
  template <typename T> void print_vector(std::vector<T> &vec, uint8_t decimal_point = 3);
  template <typename vector> void print_vector(vector &vec, uint8_t decimal_point = 3);
```

### [print matrix](#print-matrix)

```c
  template <typename matrix> void print_matrix(matrix &m, uint8_t decimal_point = 3);
``` -->