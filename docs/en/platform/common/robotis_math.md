---
layout: archive
lang: en
ref: common_robotis_math
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/common/robotis_math/
sidebar:
  title: Common
  nav: "common"
---

# [ROBOTIS MATH](#robotis-math)

## Overview

The robotis_math library provides basic calculation related to transformation and trajectory functions.    

## Getting started

`CMakeList.txt` and `package.xml` for each module should be configured in order to use the math library.

Append below code to the `CMakeList.txt`   
```
find_package( robotis_math )   
target_link_libraries( robotis_math )   
```

Append below code to the `package.xml`
```
<build_depend>robotis_math</build_depend>   
```

## Functions

### RobotisLinearAlgebra.cpp

```
Eigen::MatrixXd transitionXYZ
( double position_x, double position_y, double position_z )
```  
> * description : calculate transformation matrix from position <math> x, y, z </math>   
> * arguments : position <math> x, y, z </math>   
> * return value : 3 x 1 matrix   

```
Eigen::MatrixXd transformationXYZRPY
( double position_x, double position_y, double position_z,
  double roll,       double pitch,      double yaw )
```
> * description : calculate transformation matrix from position <math> x, y, z </math> and orientation <math> roll, pitch, yaw </math>
> * arguments : position x, y, z and orientation roll, pitch, yaw </math>   
> * return value : 4 x 4 matrix   

```
Eigen::MatrixXd InverseTransformation( Eigen::MatrixXd transform )
```
> * description : calculate inverse matrix
> * arguments : 4 x 4 matrix   
> * return value : 4 x 4 matrix   

```
Eigen::MatrixXd inertiaXYZ
( double ixx, double ixy, double ixz ,
  double iyy, double iyz,
  double izz )
```
> * description : calculate inertia matrix   
> * arguments : Elements of inertia <math> I<sub>xx</sub>, I<sub>xy</sub>, I<sub>xz</sub>, I<sub>yy</sub>, I<sub>yz</sub>, I<sub>zz</sub></math>   
> * return value : 3 x 3 inertia matrix   

```
Eigen::MatrixXd rotationX( double angle )
```
> * description : calculate rotation matrix of x-axis   
> * arguments : joint angle    
> * return value : 3 x 3 matrix   

```
Eigen::MatrixXd rotationY( double angle )
```
> * description : calculate rotation matrix of y-axis   
> * arguments : joint angle    
> * return value : 3 x 3 matrix   

```
Eigen::MatrixXd rotationZ( double angle )
```
> * description : calculate rotation matrix of x-axis   
> * arguments : joint angle   
> * return value : 3 x 3 matrix   

```
Eigen::MatrixXd rotation2rpy( Eigen::MatrixXd rotation )
```
> * description : transformation rotation matrix from roll, pitch, yaw values   
> * arguments : 3 x 3 rotation matrix   
> * return value : 3 x 1 matrix (roll, pitch, yaw)   

```
Eigen::MatrixXd rpy2rotation( double roll, double pitch, double yaw )
```
> * description : transform roll, pitch, yaw values from rotation matrix   
> * arguments : roll, pitch, yaw values   
> * return value :  3 x 3 rotation matrix   

```
Eigen::Quaterniond rpy2quaternion( double roll, double pitch, double yaw )
```
> * description : transform roll, pitch, yaw values from Quaternion  
> * arguments : roll, pitch, yaw values      
> * return value : Quaternion (x, y, z, w)       

```
Eigen::Quaterniond rotation2quaternion( Eigen::MatrixXd rotation )
```
> * description : transform rotation matrix from Quaternion    
> * arguments : 3 x 3 rotation matrix   
> * return value : Quaternion (x, y, z, w)     

```
Eigen::MatrixXd quaternion2rpy( Eigen::Quaterniond quaternion )
```
> * description : transform Quaternion from roll, pitch, yaw values          
> * arguments : Quaternion (x, y, z, w)   
> * return value : 3 x 1 matrix (roll, pitch, yaw)     

```
Eigen::MatrixXd quaternion2rotation( Eigen::Quaterniond quaternion )
```
> * description : transform Quaternion from rotation matrix  
> * arguments : Quaternion (x, y, z, w)     
> * return value : 3 x 3 rotation matrix     

```
Eigen::MatrixXd rotation4d( double roll, double pitch, double yaw )
```
> * description : transform roll, pitch, yaw values from rotation matrix    
> * arguments : roll, pitch, yaw values        
> * return value : 4 x 4 rotation matrix       

```
Eigen::MatrixXd hatto( Eigen::MatrixXd matrix3d )
```
> * description : transform 3 x 1 matrix from 3 x 3 matrix to calculate cross product   
> * arguments : 3 x 1 matrix      
> * return value : 3 x 3 matrix   

```
Eigen::MatrixXd Rodrigues( Eigen::MatrixXd hat_matrix, double angle )
```
> * description : calculate Rodrigues equation  
> * arguments : 3 x 3 matrix and joint angle  
> * return value : 3 x 3 matrix   

```
Eigen::MatrixXd rot2omega( Eigen::MatrixXd rotation )
```
> * description : calculate matrix logarithm   
> * arguments : 3 x 3 matrix
> * return value : 3 x 1 matrix

```
Eigen::MatrixXd cross( Eigen::MatrixXd vector3d_a, Eigen::MatrixXd vector3d_b )
```
> * description : calculate cross product   
> * arguments : 3 x 1 matrix and 3 x 1 matrix   
> * return value : 3 x 1 matrix

```
double dot( Eigen::MatrixXd vector3d_a, Eigen::MatrixXd vector3d_b )
```
> * description : calculate inner product     
> * arguments : 3 x 1 matrix and 3 x 1 matrix  
> * return value : 3 x 1 matrix

#### RobotisTrajectoryCalculator.cpp

```
Eigen::MatrixXd minimum_jerk_tra
( double pos_start , double vel_start , double accel_start,
  double pos_end ,   double vel_end ,   double accel_end,
  double smp_time ,  double mov_time )
```
> * description : calculate minimum jerk trajectory    
> * arguments : position, velocity, accleration values at start and end states, movement time and sampling time    
> * return value : n x 1 matrix ( n is all time steps; movement time / sampling time + 1 )   

```
Eigen::MatrixXd minimum_jerk_tra_via_n_qdqddq
( int via_num,
  double pos_start,         double vel_start,         double accel_start ,
  Eigen::MatrixXd pos_via,  Eigen::MatrixXd vel_via,  Eigen::MatrixXd accel_via,
  double pos_end,           double vel_end,           double accel_end,
  double smp_time,          Eigen::MatrixXd via_time, double mov_time )
```
> * description : calculate minimum jerk trajectory with via-points   
> * arguments : position, velocity, accleration values at start, end and via-points states, movement time and sampling time, time passing through via-points   
> * return value : n x 1 matrix ( n is all time steps; movement time / sampling time + 1 )   

```
Eigen::MatrixXd arc3d_tra
( double smp_time,              double mov_time,
  Eigen::MatrixXd center_point, Eigen::MatrixXd normal_vector,
  Eigen::MatrixXd start_point,
  double rotation_angle,        double cross_ratio )
```
> * description : calculate circle trajectory   
> * arguments : sampling time, movement time, center point, normal vector, start poin, rotation angle and cross ratio    
> * return value : n x 1 matrix ( n is all time steps; movement time / sampling time + 1 )   
