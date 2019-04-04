---
layout: archive
lang: en
ref: robotis_manipulator_libs
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/robotis_manipulator_libs/
sidebar:
  title: Robotis Manipulator Library
  nav: "robotis_manipulator_libs"
---


# [Overview](#overview)
The robotis_manipulator package is a library package for controlling the manipulator. This package provides a manipulator class for setting manipulator parameters, and provides some math functions to configure the manipulator controller and a basic trajectory generators that uses minimum jerk. The user makes a class inheriting RobotisManipulator class, and set up the class by using the provided functions and the vurtual classes. The class provides functions such as creating the trajectory, receiving joint positions from the actuators and sending the target positions to the actuators. The open_manipulator_libs package can be refer as an example.


# [Installation](#installation)

## [ROS Package](#ros-package)

## [OpenCR](#opencr)


# [Struct List](#struct-list)

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
```

# [API Usage Tutorials](#api-usage-tutorials)

** Coming soon **

## [Step1 Make Manipulator Class](#step1.-make-manipulator-class)

** Coming soon **

## [Step2 Initialize Manipulator](##step2.-initialize-manipulator)

** Coming soon **

### [Set Robot Parameter](#set-robot-parameter)

** Coming soon **

### [Add Kinematics Object](#add-kinematics-object)

** Coming soon **

### [Add Actuator Object](#add-actuator-object)

** Coming soon **

### [Add Custom Trajectory Object](add-custom-trajectory-object)

** Coming soon **

## [Step3 Make Control process Function](##step3.-make-control-process-function)

** Coming soon **

## [Step4 Use it](#step4.-use-it)

** Coming soon **
