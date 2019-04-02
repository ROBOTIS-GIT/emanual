---
layout: archive
lang: en
ref: robotis_manipulator_library
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/robotis_manipulator_library/
sidebar:
  title: Robotis Manipulator Library
  nav: "robotis_manipulator_library"
---


# [Overview](#overview)
The robotis_manipulator package is a library package for controlling the manipulator. This package provides a manipulator class for setting manipulator parameters, and provides some math functions to configure the manipulator controller and a basic trajectory generators that uses minimum jerk. The user makes a class inheriting RobotisManipulator class, and set up the class by using the provided functions and the vurtual classes. The class provides functions such as creating the trajectory, receiving joint positions from the actuators and sending the target positions to the actuators. The open_manipulator_libs package can be refer as an example.

# [Namespaces](#namespaces)

## [robotis_manipulator](#robotis_manipulator)

`robotis_manipulator` is the main namespace for the ROBOTIS Manipulator library.

### [Class Lists](#class-lists)

| Type   | Name                  |
|:-------|:----------------------|
| struct | ChainingName          |
| struct | Component             |
| class  | CustomJointTrajectory |
| class  | CustomTaskTrajectory  |
| struct | DynamicPose           |
| struct | Dynamicvector         |
| struct | Inertia               |
| class  | JointActuator         |
| struct | JointConstant         |
| class  | JointTrajectory       |
| struct | KinematicPose         |
| class  | Kinematics            |
| struct | Limit                 |
| class  | Manipulator           |
| class  | MinimumJerk           |
| struct | Point                 |
| struct | Pose                  |
| struct | Relative              |
| class  | RobotisManipulator    |
| class  | TaskTrajectory        |
| struct | Time                  |
| class  | ToolActuator          |
| class  | Trajectory            |
| struct | World                 |

### [Typedef Lists](#typedef-lists)

| Type                                              | Name           |
|:--------------------------------------------------|:---------------|
| typedef STRING                                    | Name           |
| typedef struct robotis_manipulator::KinematicPose | KinematicPose  |
| typedef struct robotis_manipulator::Dynamicvector | Dynamicvector  |
| typedef struct robotis_manipulator::DynamicPose   | DynamicPose    |
| typedef struct robotis_manipulator::Inertia       | Inertia        |
| typedef struct robotis_manipulator::Limit         | Limit          |
| typedef struct robotis_manipulator::Time          | Time           |
| typedef enum robotis_manipulator::TrajectoryType  | TrajectoryType |
| typedef struct robotis_manipulator::Point         | Point          |
| typedef struct robotis_manipulator::Point         | ActuatorValue  |
| typedef struct robotis_manipulator::Point         | JointValue     |
| typedef struct robotis_manipulator::Point         | ToolValue      |
| typedef std::vector< JointValue >                 | JointWaypoint  |
| typedef struct robotis_manipulator::Pose          | TaskWaypoint   |
| typedef struct robotis_manipulator::Pose          | Pose           |
| typedef enum robotis_manipulator::ComponentType   | ComponentType  |
| typedef struct robotis_manipulator::ChainingName  | ChainingName   |
| typedef struct robotis_manipulator::Relative      | Relative       |
| typedef struct robotis_manipulator::JointConstant | JointConstant  |
| typedef struct robotis_manipulator::World         | World          |
| typedef struct robotis_manipulator::Component     | Component      |

### [Enumeration Lists](#enumeration-lists)

| Type | Name                                                                                                            |
|:-----|:----------------------------------------------------------------------------------------------------------------|
| enum | TrajectoryType { NONE = 0, JOINT_TRAJECTORY, TASK_TRAJECTORY, CUSTOM_JOINT_TRAJECTORY, CUSTOM_TASK_TRAJECTORY } |
| enum | ComponentType { PASSIVE_JOINT_COMPONENT = 0, ACTIVE_JOINT_COMPONENT, TOOL_COMPONENT }                           |

## [robotis_manipulator::log](#robotis_manipulatorlog)

### [log Functions](#log-functions)

| Type                              | Function Name                                                                           |
|:----------------------------------|:----------------------------------------------------------------------------------------|
| void                              | print (STRING str, STRING color="DEFAULT")                                              |
| void                              | print (STRING str, double data, uint8_t decimal_point=3, STRING color="DEFAULT")        |
| void                              | print (const char *str, STRING color="DEFAULT")                                         |
| void                              | print (const char *str, double data, uint8_t decimal_point=3, STRING color="DEFAULT")   |
| void                              | println (STRING str, STRING color="DEFAULT")                                            |
| void                              | println (STRING str, double data, uint8_t decimal_point=3, STRING color="DEFAULT")      |
| void                              | println (const char *str, STRING color="DEFAULT")                                       |
| void                              | println (const char *str, double data, uint8_t decimal_point=3, STRING color="DEFAULT") |
| void                              | info (STRING str)                                                                       |
| void                              | info (STRING str, double data, uint8_t decimal_point=3)                                 |
| void                              | info (const char *str)                                                                  |
| void                              | info (const char *str, double data, uint8_t decimal_point=3)                            |
| void                              | warn (STRING str)                                                                       |
| void                              | warn (STRING str, double data, uint8_t decimal_point=3)                                 |
| void                              | warn (const char *str)                                                                  |
| void                              | warn (const char *str, double data, uint8_t decimal_point=3)                            |
| void                              | error (STRING str)                                                                      |
| void                              | error (STRING str, double data, uint8_t decimal_point=3)                                |
| void                              | error (const char *str)                                                                 |
| void                              | error (const char *str, double data, uint8_t decimal_point=3)                           |
| template \<typename T\> void      | print_vector (std::vector< T > &vec, uint8_t decimal_point=3)                           |
| template \<typename vector\> void | print_vector (vector &vec, uint8_t decimal_point=3)                                     |
| template \<typename matrix\> void | print_matrix (matrix &m, uint8_t decimal_point=3)                                       |

## [robotis_manipulator::math](#robotis_manipulatormath)

### [math Functions](#math-functions)

| Type               | Function Name                                                                                                                                                 |
|:-------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| double             | sign (double value)                                                                                                                                           |
| Eigen::Matrix3d    | matrix3 (double m11, double m12, double m13, double m21, double m22, double m23, double m31, double m32, double m33)                                          |
| Eigen::Matrix3d    | inertiaMatrix (double ixx, double ixy, double ixz, double iyy, double iyz, double izz)                                                                        |
| Eigen::Matrix3d    | convertRollAngleToRotationMatrix (double angle)                                                                                                               |
| Eigen::Matrix3d    | convertPitchAngleToRotationMatrix (double angle)                                                                                                              |
| Eigen::Matrix3d    | convertYawAngleToRotationMatrix (double angle)                                                                                                                |
| Eigen::Matrix3d    | convertRPYToRotationMatrix (double roll, double pitch, double yaw)                                                                                            |
| Eigen::Matrix3d    | convertQuaternionToRotationMatrix (const Eigen::Quaterniond &quaternion)                                                                                      |
| Eigen::Matrix3d    | skewSymmetricMatrix (Eigen::Vector3d v)                                                                                                                       |
| Eigen::Matrix3d    | rodriguesRotationMatrix (Eigen::Vector3d axis, double angle)                                                                                                  |
| Eigen::Matrix4d    | convertXYZRPYToTransformationMatrix (double x, double y, double z, double roll, double pitch, double yaw)                                                     |
| Eigen::Matrix4d    | convertXYZToTransformationMatrix (double x, double y, double z)                                                                                               |
| Eigen::Matrix4d    | convertRPYToTransformationMatrix (double roll, double pitch, double yaw)                                                                                      |
| Eigen::Matrix4d    | inverseTransformationMatrix (const Eigen::MatrixXd &transformation_matrix)                                                                                    |
| Eigen::Quaterniond | convertRPYToQuaternion (double roll, double pitch, double yaw)                                                                                                |
| Eigen::Quaterniond | convertRotationMatrixToQuaternion (const Eigen::Matrix3d &rotation_matrix)                                                                                    |
| Eigen::Vector3d    | vector3 (double v1, double v2, double v3)                                                                                                                     |
| Eigen::Vector3d    | convertXYZToVector (double x, double y, double z)                                                                                                             |
| Eigen::Vector3d    | convertRotationMatrixToRPYVector (const Eigen::Matrix3d &rotation_matrix)                                                                                     |
| Eigen::Vector3d    | convertQuaternionToRPYVector (const Eigen::Quaterniond &quaternion)                                                                                           |
| Eigen::Vector3d    | convertRotationMatrixToOmega (const Eigen::Matrix3d &rotation_matrix)                                                                                         |
| Eigen::Vector3d    | convertOmegaToRPYVelocity (Eigen::Vector3d rpy_vector, Eigen::Vector3d omega)                                                                                 |
| Eigen::Vector3d    | convertRPYVelocityToOmega (Eigen::Vector3d rpy_vector, Eigen::Vector3d rpy_velocity)                                                                          |
| Eigen::Vector3d    | convertOmegaDotToRPYAcceleration (Eigen::Vector3d rpy_vector, Eigen::Vector3d rpy_velocity, Eigen::Vector3d omega_dot)                                        |
| Eigen::Vector3d    | convertRPYAccelerationToOmegaDot (Eigen::Vector3d rpy_vector, Eigen::Vector3d rpy_velocity, Eigen::Vector3d rpy_acceleration)                                 |
| Eigen::Vector3d    | matrixLogarithm (Eigen::Matrix3d rotation_matrix)                                                                                                             |
| Eigen::Vector3d    | positionDifference (Eigen::Vector3d desired_position, Eigen::Vector3d present_position)                                                                       |
| Eigen::Vector3d    | orientationDifference (Eigen::Matrix3d desired_orientation, Eigen::Matrix3d present_orientation)                                                              |
| Eigen::VectorXd    | poseDifference (Eigen::Vector3d desired_position, Eigen::Vector3d present_position, Eigen::Matrix3d desired_orientation, Eigen::Matrix3d present_orientation) |

## [Member Lists](#member-lists)

Here is a list of all namespace members with links to the namespace documentation for each member.
- A
  - ACTIVE_JOINT_COMPONENT : robotis_manipulator
  - ActuatorValue : robotis_manipulator
- C
  - ChainingName : robotis_manipulator
  - Component : robotis_manipulator
  - ComponentType : robotis_manipulator
  - convertOmegaDotToRPYAcceleration() : robotis_manipulator::math
  - convertOmegaToRPYVelocity() : robotis_manipulator::math
  - convertPitchAngleToRotationMatrix() : robotis_manipulator::math
  - convertQuaternionToRotationMatrix() : robotis_manipulator::math
  - convertQuaternionToRPYVector() : robotis_manipulator::math
  - convertRollAngleToRotationMatrix() : robotis_manipulator::math
  - convertRotationMatrixToOmega() : robotis_manipulator::math
  - convertRotationMatrixToQuaternion() : robotis_manipulator::math
  - convertRotationMatrixToRPYVector() : robotis_manipulator::math
  - convertRPYAccelerationToOmegaDot() : robotis_manipulator::math
  - convertRPYToQuaternion() : robotis_manipulator::math
  - convertRPYToRotationMatrix() : robotis_manipulator::math
  - convertRPYToTransformationMatrix() : robotis_manipulator::math
  - convertRPYVelocityToOmega() : robotis_manipulator::math
  - convertXYZRPYToTransformationMatrix() : robotis_manipulator::math
  - convertXYZToTransformationMatrix() : robotis_manipulator::math
  - convertXYZToVector() : robotis_manipulator::math
  - convertYawAngleToRotationMatrix() : robotis_manipulator::math
  - CUSTOM_JOINT_TRAJECTORY : robotis_manipulator
  - CUSTOM_TASK_TRAJECTORY : robotis_manipulator
- D
  - DynamicPose : robotis_manipulator
  - Dynamicvector : robotis_manipulator
- E
  - error() : robotis_manipulator::log
- I
  - Inertia : robotis_manipulator
  - inertiaMatrix() : robotis_manipulator::math
  - info() : robotis_manipulator::log
  - inverseTransformationMatrix() : robotis_manipulator::math
- J
  - JOINT_TRAJECTORY : robotis_manipulator
  - JointConstant : robotis_manipulator
  - JointValue : robotis_manipulator
  - JointWaypoint : robotis_manipulator
- K
  - KinematicPose : robotis_manipulator
- L
  - Limit : robotis_manipulator
- M
  - matrix3() : robotis_manipulator::math
  - matrixLogarithm() : robotis_manipulator::math
- N
  - Name : robotis_manipulator
  - NONE : robotis_manipulator
- O
  - orientationDifference() : robotis_manipulator::math
- P
  - PASSIVE_JOINT_COMPONENT : robotis_manipulator
  - Point : robotis_manipulator
  - Pose : robotis_manipulator
  - poseDifference() : robotis_manipulator::math
  - positionDifference() : robotis_manipulator::math
  - print() : robotis_manipulator::log
  - print_matrix() : robotis_manipulator::log
  - print_vector() : robotis_manipulator::log
  - println() : robotis_manipulator::log
- R
  - Relative : robotis_manipulator
  - rodriguesRotationMatrix() : robotis_manipulator::math
- S
  - sign() : robotis_manipulator::math
  - skewSymmetricMatrix() : robotis_manipulator::math
- T
  - TASK_TRAJECTORY : robotis_manipulator
  - TaskWaypoint : robotis_manipulator
  - Time : robotis_manipulator
  - TOOL_COMPONENT : robotis_manipulator
  - ToolValue : robotis_manipulator
  - TrajectoryType : robotis_manipulator
- V
  - vector3() : robotis_manipulator::math
- W
  - warn() : robotis_manipulator::log
  - World : robotis_manipulator

# [Classes](#classes)

## [ChainingName](#chainingname)

### robotis_manipulator::ChainingName Struct Reference

```
#include <robotis_manipulator_common.h>
```
> Definition at line 133 of file robotis_manipulator_common.h

![](/assets/images/sw/api_references/chaining_name__coll__graph.png)
> Collaboration diagram for robotis_manipulator::ChainingName

#### Public Attributes

|                Type | Name   |
|--------------------:|:-------|
|                Name | parent |
| std::vector< Name > | child  |

#### Member Data

- std::vector\< Name \> robotis_manipulator::ChainingName::child
  > Definition at line 136 of file robotis_manipulator_common.h
- Name robotis_manipulator::ChainingName::parent
  > Definition at line 135 of file robotis_manipulator_common.h


## [Component](#component)
## [CustomJointTrajectory](#customjointtrajectory)
## [CustomTaskTrajectory](#customtasktrajectory)
## [DynamicPose](#dynamicpose)
## [Dynamicvector](#dynamicvector)
## [Inertia](#inertia)
## [JointActuator](#jointactuator)
## [JointConstant](#jointconstant)
## [JointTrajectory](#jointtrajectory)
## [KinematicPose](#kinematicpose)
## [Kinematics](#kinematics)
## [Limit](#limit)
## [Manipulator](#manipulator)
## [MinimumJerk](#minimumjerk)
## [Point](#point)
## [Pose](#pose)
## [Relative](#relative)
## [RobotisManipulator](#robotismanipulator)
## [TaskTrajectory](#tasktrajectory)
## [Time](#time)
## [ToolActuator](#toolactuator)
## [Trajectory](#trajectory)
## [World](#world)
