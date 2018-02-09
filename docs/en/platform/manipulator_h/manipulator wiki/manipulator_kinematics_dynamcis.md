###1. Overview

manipulator_kinematics_dynamics provides joint & link information and basic robotics function.

###2. Getting started

To use this library, it is necessary to set the `CMakeList.txt` and `package.xml` of each module 

In `CMakeList.txt`,
```
find_package( manipulator_kinematics_dynamics )   
target_link_libraries( manipulator_kinematics_dynamics )   
```

In `package.xml`,
```
<build_depend>manipulator_kinematics_dynamics</build_depend>   
```

###3. Functions

####3.1. LinkData.cpp

`name` : Joint name   
`parent` : Parent joint ID   
`sibling` : Sibling joint ID   
`child` : Child joint ID   
`mass` : Mass   
`relative_position` : Joint relative position (relative to parent)   
`joint_axis` : Joint axis vector (relative to parent)   
`center_of_mass` : Center of mass (Link Local)   
`inertia` : Moment of Inertia (Link Local)   
`joint_limit_max` : Joint upper limit   
`joint_limit_min` : Joint lower limit    
`joint_angle` : Joint angle   
`joint_velocity` : Joint velocity   
`joint_acceleration` : Joint acceleration      
`position`: Link position   
`orientation` : Link orienataion   
`transformation` : Link transformation matrix   

####3.2. ManipulatorKinematicsDynamics.cpp

```cpp
ManipulatorKinematicsDynamics(TREE_SELECT tree)
```
> * description : ROBOTIS MANIPULATOR joint & link information

```cpp
std::vector<int> findRoute( int to )
```
> * description : find kinematics tree
> * arguments : start joint id
> * return value : vector ( n x 1 )

```cpp
std::vector<int> findRoute( int from , int to )
```
> * description : find kinematics tree
> * arguments : start joint id and end joint id
> * return value : vector ( n x 1 )

```cpp
double TotalMass( int joint_ID )
```
> * description : calculate total mass
> * arguments : start joint id
> * return value : total mass

```cpp
Eigen::MatrixXd CalcMC( int joint_ID )
Eigen::MatrixXd CalcCOM( Eigen::MatrixXd MC )
```
> * description : calculate center of mass
> * arguments : start joint id
> * return value : 3 x 1 matrix

```cpp
void ForwardKinematics( int joint_ID )
```
> * description : calculate forward kinematics
> * arguments : start joint id

```cpp
Eigen::MatrixXd CalcJacobian( std::vector<int> idx )
```
> * description : calculate forward kinematics
> * arguments : vector ( n x 1 )
> * return value : 6 x n matrix

```cpp
bool InverseKinematics
( int to, 
  Eigen::MatrixXd tar_position, Eigen::MatrixXd tar_orientation, 
  int max_iter,                 double ik_err )
```
> * description : calculate inverse kinematics
> * arguments : end joint id, target position, target orientation, max iteration, calculation error
> * return value : true or false

```cpp
bool InverseKinematics
( int from,                     int to, 
  Eigen::MatrixXd tar_position, Eigen::MatrixXd tar_orientation, 
  int max_iter,                 double ik_err )
```
> * description : calculate inverse kinematics
> * arguments : start joint id, end joint id, target position, target orientation, max iteration, calculation error
> * return value : true or false

<br>
[&lt;&lt; Back](ROBOTIS MANIPULATOR Module)