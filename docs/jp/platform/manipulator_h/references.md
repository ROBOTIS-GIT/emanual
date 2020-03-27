---
layout: archive
lang: en
ref: manipulator_h_references
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/manipulator_h/references/
sidebar:
  title: MANIPULATOR-H
  nav: "manipulator_h"
product_group: manipulator_h
page_number: 5
---

<div style="counter-reset: h1 4"></div>


# [References](#references)

## [AMSDK Define](#armsdk-define)

### Pose3D

- Data Fields
  - double x, y, z
  - double Roll, Pitch, Yaw
- Description
  - Position(x,y,z) and Orientation(Roll, Pitch, Yaw) elements

### timeprofile

- Data Fields
  - double ta, tc, td, totaltime
  - double a0[3], a1[3], a2[3]
  - double distance, distance1
  - int Method
- Description
  - Trapezoidal Velocity Profile’s elements
  - distance1 only used in circular trajectory.

### MotionPose

- Data Fields
  - vecd StartPose, EndPose
  - Pose3D StartPose3D, ViaPose3D, EndPose3D
  - Position3D CenterPosition
  - int Method
- Description
  - Declaration of manipulator step’s StartPose, EndPose and trajectory method
  - ViaPose and CenterPosition for circular trajectory

## [ARMSDK Math](#armsdk-math)

### static matd GetOrientationMatrix(double Roll, double Pitch, double Yaw)

- Parameter
  - double Roll, double Pitch, double Yaw
- Returns
  - 3 x 3 Rotation Matrix
- Description
  - orientation(Roll, Pitch, Yaw) input
  - 3 x 3 orientation matrix output

### static matd GetTransformMatrix(double Roll, double Pitch, double Yaw, double x, double y, double z)

- Parameter
  - double Roll, double Pitch, double Yaw
  - double x, double y, double z
- Returns
  - 4 x 4 Transformation Matrix
- Description
  - orientation(Roll, Pitch, Yaw), Position(X, Y, Z) input
  - 4 x 4 transform Matrix output

### static vecd rot2omega(mat3d Rerr)

- Parameter
  - Rotation Matrix
- Returns
  - angular velocity array
- Description
  - rotation matrix gets input and outputs velocity array

### static vecd ConvertRad2Deg(vecd q)

- Parameter
  - radian Array
- Returns
  - Degree Array
- Description
  - (rad) gets input, change to (value) and return

### static vecd GetEulerRollPitchYaw(matd T)

- Parameter
  - 3 x 3 rotation Matrix or 4 x 4 Transformation Matrix
- Returns
  - 3 x 1 array (Roll, Pitch, Yaw)
- Description
  - vecd rpy(3);
  - rpy(0) = atan2( T(2,1), T(2,2));
  - rpy(1) = atan2(-T(2,0), sqrt(T(2,1)\*T(2,1) + T(2,2)\*T(2,2)) );
  - rpy(2) = atan2( T(1,0), T(0,0));

## [MotionEngine](#motionengine)

### Error.h

#### void ErrorCheck(int Error)
- Parameter
  - int Error
- Return
  - void
- Description
  - No error(ARMSDK_NO_ERROR 0x00)
  - IK solution does not exist(ARMSDK_NO_IK_SOLUTION 0x01)
  - No IK solution and allowable error(ARMSDK_ACCEPTABLE_ERROR 0x02)
  - Joints’ next and previous step large difference in angle(ARMSDK_TOO_MUCH_ANGLE_CHANGE 0x04)
  - Angle or not within JointData’s limit(ARMSDK_OUT_OF_JOINT_RANGE 0x08)
  The 5 types of ERROR

### JointData.h

#### void SetJointID(unsigned int ID)
- Parameter
  - unsigned int ID
- Return
  - void
- Description
  - Assign Joint ID

#### void SetJointAngle(double JointAngle);
- Parameter
  - double JointAngle
- Return
  - void
- Description
  - Set Joint Angle

#### void SetMinAngleInRad(double MinAngleInRad);
- Parameter
  - double MinAngleInRad
- Return
  - void
- Description
  - Set actuator min angle(rad)
  - Value utilized in 6.3 MotionEngine - iii) RobotInfo’s rad2value function

#### void SetMaxAngleInRad(double MaxAngleInRad);
- Parameter
  - double MaxAngleInRad
- Return
  - void
- Description
  - Set actuator max angle(rad)
  - Value utilized in 6.3 MotionEngine - iii) RobotInfo’s rad2value function

#### void SetMinAngleInValue(int Min_AngleValue);
- Parameter
  - int Min_AngleValue
- Return
  - void
- Description
  - Set actuator min value
  - utilized in 6.3 MotionEngine - iii) RobotInfo’s rad2value, value2rad functions

#### void SetMaxAngleInValue(int Max_AngleValue);
- Parameter
  - int Max_AngleValue
- Return
  - void
- Description
  - Set actuator max value
  - Utilized in 6.3 MotionEngine - iii) RobotInfo’s rad2value, value2rad functions

#### void SetMinAngleLimitInRad(double MinAngleLimitInRad);
- Parameter
  - double MinAngleLimitInRad
- Return
  - void
- Description
  - Set joint min angle(rad)
  - Also sets the value

#### void SetMaxAngleLimitInRad(double MaxAngleLimitInRad);
- Parameter
  - double MaxAngleLimitInRad
- Return
  - void
- Description
  - Set joint max angle(rad)
  - Also sets the value

#### unsigned int GetID(void);
- Parameter
  - void
- Return
  - unsigned int (ID)
- Description
  - Returns joint ID (number)

#### void SetJointDataDH(double LinkLength, double LinkTwist, double JointOffset, double JointAngle);
- Parameter
  - double LinkLength, double LinkTwist
  - double JointOffset, double JointAngle
- Return
  - void
- Description
  - Set Manipulator’s joint DH parameters in DH Configuration

#### double GetJointAngle(void);
- Parameter
  - void
- Return
  - double current Angle
- Description
  - Returns joint angle limit(rad)

#### double GetMinAngleInRad(void);
- Parameter
  - void
- Return
  - MinAngle(rad) of Actuator
- Description
  - SetMinAngleInRad returns actuator min angle(rad)

#### double GetMaxAngleInRad(void);
- Parameter
  - void
- Return
  - MaxAngle(rad) of Actuator
- Description
  - SetMaxAngleInRad returns actuator max angle(rad)

#### int GetMinAngleInValue(void);
- Parameter
  - void
- Return
  - MinAngle(value) of Actuator
- Description
  - SetMinAngleInValue returns actuator min angle(value)

#### int GetMaxAngleInValue(void);
- Parameter
  - void
- Return
  - MaxAngle(value) of Actuator
- Description
  - SetMaxAngleInValue returns actuator max angle(value)

#### double GetMinAngleLimitInRad(void);
- Parameter
  - void
- Return
  - MinAngle(rad) of Joint
- Description
  - SetMinAngleLimitInRad returns joint min angle(rad)

#### double GetMaxAngleLimitInRad(void);
- Parameter
  - void
- Return
  - MaxAngle(rad) of Joint
- Description
  - SetMaxAngleLimitInRad returns joint max angle(rad)

#### int GetMinAngleLimitInValue(void);
- Parameter
  - void
- Return
  - MinAngle(value) of Joint
- Description
  - SetMinAngleLimitInRad returns joint min angle(value)

#### int GetMaxAngleLimitInValue(void);
- Parameter
  - void
- Return
  - MaxAngle(value) of Joint
- Description
  - SetMaxAngleLimitInRad returns joint max angle(value)

#### matd GetTransformMatirx(void);
- Parameter
  - void
- Return
  - matd TransformMatrix of each Link
- Description
  - Returns transform matrix for each link

### RobotInfo.h
#### int AddJoint (double LinkLength, double LinkTwist, double JointOffset, double JointAngle, double MaxAngleInRad, double MinAngleInRad, int MaxAngleValue , int MinAngleValue, double MaxAngleLimitInRad, double MinAngleLimitInRad, unsigned int Dynamixel_ID);
- Parameter
  - LinkLength, LinkTwist, JointOffset, JointAngle – DH parameter
  - MaxAngleInRad - Maximum Angle of Actuator(not Joint Limit)
  - MinAngleInRad – Minimum Angle of Actuator(not Joint Limit)
  - MaxAngleInValue – AngleValue corresponding to the Maxangle
  - MinAngleInValue – AngleValie corresponding to the Minangle
  - MaxAngleLimitInRad – Maximum Joint Angle Limit of Actuator
  - MinAngleLimitInRad – Minimum Joint Angle Limit of Actuator
- Return
  - Error Value
- Description
  - Sets joint’s DH-Parameter and Joint-Parameter values
  - Error of 0 is no error and 1 when there is error.
  - Error happens when min value is greater than max value

#### JointData GetJointInfo(int joint_number);
- Parameter
  - int Joint_number
- Return
  - JointData
- Description
  - Returns JointData from AddJoint

#### std::vector<JointData>* GetRobotInfo(void);
- Parameter
  - JointData
- Return
  - address of robotInfo
- Description
  - Returns address values from RobotInfomation

#### void ClearRobotInfo(void);
- Parameter
  - void
- Return
  - void
- Description
  - Clears out RobotInfo

#### veci GetArmIDList(void);
- Parameter
  - void
- Return
  - ID List of Robot Actuators
- Description
  - Returns joint ID in aray form inAddJoint

#### veci Rad2Value(vecd q);
- Parameter
  - double array of Actuators Angle(Rad)
- Return
  - int array of Actuators Angle(Value)
- Description
  - Transforms joint’s rad to value.

#### vecd Value2Rad(veci q);
- Parameter
  - int array of Actuators Angle(Value)
- Return
  - double array of Actuators Angle(Rad)
- Description
  - Transforms joint’s value to rad.

### Kinematics.h

#### void RobotInfoReload(void);
- Parameter
  - void
- Return
  - void
- Description
  - Calls RobotInfo

#### matd Forward(vecd angle);
- Parameter
  - Angle of All Joints(rad)
- Return
  - 4x4 TransformMatrix form
- Description
  - RobotInfoReload calls joints angles runs FK and returns end effector’s transformation matrix

#### matd Forward(vecd angle, Pose3D *pose);
- Parameter
  - Angle of All Joints(rad)
- Return
  - 4x4 EndEffector's TransformMatrix form
- Description
  - RobotInfoReload calls joint angles runs FK and returns end effector’s transformation matrix. It also sets pose pointer (*pose)

#### void SetMaximumNumberOfIterationsForIK(unsigned int max_num);
- Parameter
  - unsigned int max_num for IK
- Return
  - void
- Description
  - Sets IK’s number of iterations for solution

#### void SetConvergenceCondition(double max_error, double max_acceptable_error);
- Parameter
  - double max_error, double max_acceptable_error
- Return
  - void
- Description
  - IK’s amount of telorable error.
  - The first input value is max convergence error. A lesser value than max can allow solution.
  - The second value is max allowable error; acceptable as long as is lower than value entered. When value exceeds then there is no solution..

#### matd Jacobian(void);
- Parameter
  - void
- Return
  - Matrix of Jacobian
- Description
  - Returns jacobian for IK solution

#### vecd CalcError(Pose3D _desired, matd _current);
- Parameter
  - Pose3D goalPose, TransformMatrix of EndEffector
- Return
  - Error between Goal and Currnet Pose
- Description
  - Compares end effector’s goal pose and current pose

#### void ComputeIK(Pose3D _desired , vecd *q_rad, vecd Initangle_rad, int *ErrorStatus);
- Parameter
  - Pose3D goalPose, vecd initangle, int ErrorStatus
- Return
  - void
- Description
  - get jacobian’s Damped Least Square Method for IK solution
  - _desired is end effector’s desired pose
  - \*q_rad sets joints pose after running IK
  - Initangle_rad is joint angles prior to running IK
  - ErrorStatus is pointer for error type
  - ErrorStatus.
    1. No error(ARMSDK_NO_ERROR 0x00)
    2. No solution from IK(ARMSDK_NO_IK_SOLUTION 0x01)
    3. no solution from IK, allowable error(ARMSDK_ACCEPTABLE_ERROR 0x02)
    4. joint angles exceed JointData’s set angles(ARMSDK_OUT_OFF_JOINT_RANGE 0x08)

### TrajectoryGenerator.h

#### void KinematicsInfoReload(void);
- Parameter
  - void
- Return
  - void
- Description
  - Calls Kinematics info

#### void Set_P2P(vecd StartPose, vecd EndPose, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - sets P2P trajectory fromStartPose, EndPose, TotalTime, AccelTime

#### void Set_P2P(Pose3D StartPose, Pose3D EndPose, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets P2P trajectory from StartPose, EndPose, TotalTime, AccelTime

#### void Set_LIN(vecd StartPose, vecd EndPose, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets linear trajectory from StartPose, EndPose, TotalTime, AccelTime

#### void Set_LIN(Pose3D StartPose, Pose3D EndPose, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets linear trajectory from StartPose, EndPose, TotalTime, AccelTime

#### void Set_CIRC(vecd StartPose, vecd ViaPose, vecd EndPose, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd ViaPose / vecd EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets circular trajectory from StartPose, ViaPose, EndPose, TotalTime, AccelTime.

#### void Set_CIRC(Pose3D StartPose, Pose3D ViaPose, Pose3D EndPose, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D EndPose
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets circular trajectory fom StartPose, ViaPose, EndPose, TotalTime, AccelTime

#### void Set_P2PwithHand(vecd StartPose, vecd EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd EndPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets P2P trajectory from StartPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime

#### void Set_P2PwithHand(Pose3D StartPose, Pose3D EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D EndPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets P2P trajectory from StartPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime

#### void Set_LINwithHand(vecd StartPose, vecd EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd EndPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets linear trajectory from StartPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime.

#### void Set_LINwithHand(Pose3D StartPose, Pose3D EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D EndPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets linear trajectory from StartPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime

#### void Set_CIRCwithHand(vecd StartPose, vecd ViaPose, vecd EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - vecd StartPose / vecd EndPose / vecd ViaPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets circular trajectory from StartPose, ViaPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime

#### void Set_CIRCwithHand(Pose3D StartPose, Pose3D ViaPose, Pose3D EndPose, veci Hand1, veci Hand2, double TotalTime, double AccelTime);
- Parameter
  - Pose3D StartPose / Pose3D ViaPose / Pose3D EndPose
  - veci Hand1 / veci Hand2
  - double TotalTime / double AccelTime
- Returns
  - void
- Description
  - Sets circular trajectory from StartPose, ViaPose, EndPose, Start HandPose, End HandPose, TotalTime, AccelTime

#### void ClearMF(void)
- Parameter
  - void
- Returns
  - void
- Description
  - Clears out motion profile

#### double GetMotionTotalTime(void)
- Parameter
  - void
- Returns
  - TotalTime in sec
- Description
  - Returns motion run time

### MotionPlay.h

#### void All_Info_Reload(void);
- Parameter
  - void
- Returns
  - void
- Description
  - Calls motion’s Info(RobotInfo, Kinematics, Trajectory)

#### void initialize(void)
- Parameter
  - void
- Returns
  - void
- Description
  - Initializes motion profile, done time, step, current time

#### void Set_Time_Period(int MilliSecond)
- Parameter
  - int MilliSecond
- Returns
  - void
- Description
  - Provides period time for motion

#### vecd NextStepAtTime(double CurrentTime, int *ErrorStatus)
- Parameter
  - double CurrentTime
  - int \*ErrorStatus
- Returns
  - Joint Angle of next Step
- Description
  - Returns next Goal Joint Angle array
  - ErrorStatus is pointer for error type

#### veci NextStepAtTimeforHand(double CurrentTime)
- Parameter
  - CurrentTime - current time in sec
- Returns
  - Angle Value array of Fingers for next step
- Description
  - Returns following Goal Joint Angle array for hand
  - Assumes hand is attached to arm
-  
#### vecd CalcIK(Pose3D desiredPose, int *ErrorStatus)
- Parameter
  - Pose3D desiredPose / int \*ErrorStatus
- Returns
  - Joint Angle of desiredPose
- Description
  - Returns desired pose of end effector via IK
  - ErrorStatus is pointer for error type
    1. no error(ARMSDK_NO_ERROR 0x00)
    2. No solution from IK(ARMSDK_NO_IK_SOLUTION 0x01)
    3. no solution from IK, allowable error(ARMSDK_ACCEPTABLE_ERROR 0x02)
    4. joint angles exceed JointData’s set angles(ARMSDK_OUT_OFF_JOINT_RANGE 0x08)

#### vecd NextStep(int* ErrorStatus)
- Parameter
  - ErrorStatus
- Returns
  - Angle rad array for next step
- Description
  - Returns next motion’s joint angles
  - ErrorStatus is pointer for error type

#### veci NextStepforHand(void)
- Parameter
  - void
- Returns
  - Angle Value array of Fingers for next step
- Description
  - Returns hand’s next motion position

#### vecd GetCurrentAngle(void);
- Parameter
  - void
- Returns
  - All Joint Angle(rad)
- Description
  - Returns robot’s current pos(rad) array

#### Pose3D GetCurrentEndPose(void);
- Parameter
  - void
- Returns
  - Pose3D of EndEffector
- Description
  - Returns end effector’s current pose

#### double Get_CurrentTime(void);
- Parameter
  - void
- Returns
  - double CurrentTime
- Description
  - Returns current time

## [RobotisLib](#robotislib)

### Pro_Arm_Comm_win.h

#### void DXL_Set_Init_Param(int portnum, int baudnum);
- Parameter
  - int portnum, int baudnum
- Returns
  - void
- Description
  - Sets DYNAMIXEL comms from portnum and baudnum

#### int DXL_Open();
- Parameter
  - void
- Returns
  - void
- Description
  - Opens/access comms to DYNAMIXEL_Set_Init_Param

#### SerialPort* DXL_Get_Port(void);
- Parameter
  - void
- Returns
  - PortNumber
- Description
  - Returns SerialPort pointer address

#### void DXL_Close(void);
- Parameter
  - void
- Returns
  - void
- Description
  - End communications with Dynamixel

#### void Arm_ID_Setup(veci Arm_ID_LIST);
- Parameter
  - array of ID List
- Returns
  - void
- Description
  - Sets arm’s ID list

#### int Arm_Torque_On(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turn torque on every joint
  - COMM_RXSUCCESS return of 1

#### int Arm_Torque_Off(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turns torque off on every joint
  - COMM_RXSUCCESS return of 1

#### int Arm_Set_JointPosition(veci position);
- Parameter
  - joint angle array
- Returns
  - Communication Result
- Description
  - Sets joint angles
  - COMM_RXSUCCESS return of 1

#### int Arm_Set_JointVelocity(veci velocity);
- Parameter
  - int joint velocity array
- Returns
  - Communication Result
- Description
  - Sets joint valocities
  - COMM_RXSUCCESS return of 1

#### int Arm_Set_JointVelocity(int velocity);
- Parameter
  - int joint velocity
- Returns
  - Communication Result
- Description
  - Sets joint velocities
  - COMM_RXSUCCESS return of 1

#### int Arm_Set_JointAcceleration(veci accel);
- Parameter
  - int joint Acceleration array
- Returns
  - Communication Result
- Description
  - Sets joint accelerations
  - COMM_RXSUCCESS return of 1

#### int Arm_Set_JointAcceleration(int accel);
- Parameter
  - int joint Acceleration
- Returns
  - Communication Result
- Description
  - Sets joint accelerations
  - COMM_RXSUCCESS return of 1

#### int Arm_Set_Position_PID_Gain(int P_Gain, int I_Gain, int D_Gain);
- Parameter
  - int joint Position P, I, D gain
- Returns
  - Communication Result
- Description
  - Sets joints’ PID gain values
  - COMM_RXSUCCESS return of 1

#### int Arm_Set_Position_PID_Gain(int id, int P_Gain, int I_Gain, int D_Gain, int* ErrorStatus);
- Parameter
  - int id, int joint Position P, I, D gain
- Returns
  - Communication Result
- Description
  - Sets joints’ PID gain values
  - ErrorStatus is error pointer
  - COMM_RXSUCCESS return of 1

#### int Arm_Get_JointPosition(veci *position);
- Parameter
  - joint position array
- Returns
  - Communication Result
- Description
  - Access position array and gets joint positions
  - COMM_RXSUCCESS return of 1

#### int Arm_Get_JointCurrent(veci *torque);
- Parameter
  - joint current array
- Returns
  - Communication Result
- Description
  - Reads joint’s electrical current flow and saves in (*torque) return pointer
  - COMM_RXSUCCESS return of 1

#### int Arm_LED_On(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turns joints’ LED on
  - COMM_RXSUCCESS return of 1

#### int Arm_LED_Off(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turns joints’ LED off
  - COMM_RXSUCCESS return of 1

#### int Arm_LED_On(int r, int g, int b);
- Parameter
  - int r, int g, int b
- Returns
  - Communication Result
- Description
  - Controls DYNAMIXEL Pro’s RGB LED
  - r, g, b, rage is 0~255 each
  - COMM_RXSUCCESS return of 1

#### int Arm_Red_LED_On(void);
#### int Arm_Green_LED_On(void);
#### int Arm_Blue_LED_On(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - turns joints’ LED on to red(Arm_Red_LED_On)
  - turns joints’ LED on to green(Arm_Green_LED_On)
  - turns joints’ LED on to blue(Arm_Blue_LED_On)
  - COMM_RXSUCCESS return of 1

#### void Gripper_ID_Setup(veci Gripper_ID_List);
- Parameter
  - ID array
- Returns
  - void
- Description
  - Sets ID for gripper.

#### int Gripper_Ping(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Pings comm to gripperGripper
  - COMM_RXSUCCESS return of 1

#### int Gripper_Torque_On(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turns gripper torque on
  - COMM_RXSUCCESS return of 1

#### int Gripper_Torque_Off(void);
- Parameter
  - void
- Returns
  - Communication Result
- Description
  - Turns gripper torque off
  - COMM_RXSUCCESS return of 1

#### int Gripper_Get_Joint_Value(veci *value);
- Parameter
  - Joint value array stored in address
- Returns
  - Communication Result
- Description
  - Access gripper’s angles from stored address
  - COMM_RXSUCCESS return of 1

#### int Gripper_Set_Joint_Value(veci value);
- Parameter
  - Joint value array
- Returns
  - Communication Result
- Description
  - Sets gripper joint value
  - COMM_RXSUCCESS return of 1

## [Timer](#timer)

### MotionTimer.h

time measurement fromQueryPerformanceCounter

#### void Start(void)
- Parameter
  - void
- Returns
  - void
- Description
  - Sets start time

#### void Stop(void)
- Parameter
  - void
- Returns
  - void
- Description
  - Stops time measurement

#### double GetElapsedTime(void)
- Parameter
  - void
- Returns
  - ElapsedTime in milliseconds
- Description
  - Returns time from start to stop

#### void Wait(double millisec)
- Parameter
  - millisecond - waiting time in milliseconds you want
- Returns
  - void
- Description
  - Waits amount of time(msec) for standby
