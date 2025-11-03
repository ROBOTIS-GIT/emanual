---
layout: archive
lang: en
ref: single_motor_tutorial_step3
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/single_motor_tutorial_step3/
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-easy-sdk-tutorial-step3">Step 3: Leader and Follower Example</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

![](/assets/images/sw/dynamixel_easy_sdk/tutorials/dxl_step3.gif)
- This tutorial shows you how to read data from one Dynamixel and write the read value to another Dynamixel using the Dynamixel Easy SDK.  

**NOTE**: It assumes that you have already installed and built the SDK.
{:.notice--warning}

# [Make cpp file](#make-cpp-file)
- Create a new C++ source file Open it with your editor.
```bash
$ touch tutorial_step3.cpp
```

# [Check the Port Names](#check-the-port-names)
- Before running the code, check the port name of the connected Dynamixel.
- For General
  - OpenRB-150: `ttyACM0: USB ACM device`
  - U2D2: `FTDI USB Serial Device converter now attached to ttyUSB0`
```bash
$ sudo dmesg | grep tty
```

# [Source Code Description](#source-code-description)

```cpp
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main(){

  dynamixel::Connector connector("/dev/ttyACM0", 57600);
  std::unique_ptr<dynamixel::Motor> leader_motor = connector.createMotor(1);
  std::unique_ptr<dynamixel::Motor> follower_motor = connector.createMotor(2);
  int min_position = leader_motor->getMinPositionLimit().value() + 100;
  int max_position = leader_motor->getMaxPositionLimit().value() - 100;

  leader_motor->disableTorque();
  follower_motor->disableTorque();
  follower_motor->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
  follower_motor->enableTorque();

  while (true) {
    int present_position = leader_motor->getPresentPosition().value();
    std::cout << "Leader Motor Present Position: " << present_position << std::endl;

    if (present_position < min_position) {
      leader_motor->enableTorque();
      leader_motor->setGoalPosition(min_position);
      while(true){
        present_position = leader_motor->getPresentPosition().value();
        if(present_position >= min_position) break;
      }
      leader_motor->disableTorque();
    } else if (present_position > max_position) {
      leader_motor->enableTorque();
      leader_motor->setGoalPosition(max_position);
      while(true){
        present_position = leader_motor->getPresentPosition().value();
        if(present_position <= max_position) break;
      }
      leader_motor->disableTorque();
    }
    follower_motor->setGoalPosition(present_position);
  }
}
```

## [Add Header Files](#add-header-files)
- Add `dynamixel_easy_sdk/dynamixel_easy_sdk.hpp` to the top of your CPP file. This class is included in the Dynamixel SDK package.
```cpp
  #include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"
```

## [Create Connector and Motor Object](#create-connector-and-motor-object)
- Create a `Connector` object with port name, baud rate, and protocol version to manage the communication.(Only protocol 2.0 is supported)
```cpp
  int main(){
    dynamixel::Connector connector("/dev/ttyACM0", 57600);
```
- Create a `Motor` object for each Dynamixel servo you want to control, using the `createMotor` method of the `Connector` class.
- This method takes the motor ID as an argument and returns a unique pointer to a `Motor` instance. (shared_ptr is also available)
- Create motor objects while carefully distinguishing between the leader and follower IDs.
```cpp
    std::unique_ptr<dynamixel::Motor> leader_motor = connector.createMotor(1);
    std::unique_ptr<dynamixel::Motor> follower_motor = connector.createMotor(2);
```
- This process throws a `DxlRuntimeError` if the object creation fails.

## [Set Position Limits](#set-position-limits)
- Get the position limits of the leader motor using the `getMinPositionLimit` and `getMaxPositionLimit` methods.
```cpp
    int min_position = leader_motor->getMinPositionLimit().value() + 100;
    int max_position = leader_motor->getMaxPositionLimit().value() - 100;
```

## [Set Operating Mode to Position Control Mode](#set-operating-mode-to-position-control-mode)
- Use the methods provided by the `Motor` class to control the Dynamixel servo.
- Set the operating mode of follower motor to position control mode.
```cpp
    leader_motor->disableTorque();
    follower_motor->disableTorque();
    follower_motor->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
    follower_motor->enableTorque();
```

## [Leader and Follower Control Loop](#leader-and-follower-control-loop)
- In a loop, read the present position of the leader motor using the `getPresentPosition` method.
```cpp
    while (true) {
      int present_position = leader_motor->getPresentPosition().value();
      std::cout << "Leader Motor Present Position: " << present_position << std::endl;
```
- If the leader motor's position exceeds the defined range, move it back within the range.
```cpp
      if (present_position < min_position) {
        leader_motor->enableTorque();
        leader_motor->setGoalPosition(min_position);
        while(true){
          present_position = leader_motor->getPresentPosition().value();
          if(present_position >= min_position) break;
        }
        leader_motor->disableTorque();
      } else if (present_position > max_position) {
        leader_motor->enableTorque();
        leader_motor->setGoalPosition(max_position);
        while(true){
          present_position = leader_motor->getPresentPosition().value();
          if(present_position <= max_position) break;
        }
        leader_motor->disableTorque();
      }
```
- Set the goal position of the follower motor to the present position of the leader motor.
```cpp
      follower_motor->setGoalPosition(present_position);
    }
  }
```

# [Error Handling](#error-handling)
- To ensure your code is robust, every method that sends a command to the motor returns a **Result** object that encapsulates values and errors.
- This object lets you safely check for any communication or device errors before proceeding.
- You can check for communication errors and device(dynamixel) errors using the **Result** object.
- If you use `value()` when error occurred without checking for errors, it may throw an exception.

  **Example**
  ``` cpp
    auto result_uint32 = leader_motor->getMinPositionLimit();
    if (!result_uint32.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_uint32.error()) << std::endl;
      return 1;
    }
    int min_position = result_uint32.value();
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ tutorial_step3.cpp -o tutorial_step3 -l dxl_x64_cpp
$ ./tutorial_step3
```
