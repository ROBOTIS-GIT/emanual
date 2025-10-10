---
layout: archive
lang: en
ref: single_motor_tutorial_step1
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/dynamixel_api/single_motor_tutorial_step1/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-api-tutorials-step1">Step 1: Moving Dynamixel</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

- This tutorial shows you how to move a single Dynamixel using the Dynamixel API.  

**NOTE**: It assumes that you have already installed and built the SDK.
{:.notice--warning}

# [Make cpp file](#make-cpp-file)
- Open a code editor and create a new C++ source file. In this example, we use visual studio code.
```bash
$ code dxl_api_tutorial.cpp
```

# [Source Code Description](#source-code-description)

```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"

int main(){

  // Create Connector and Motor Object
  dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);

  // Set Operating Mode to Position Control Mode
  motor1->disableTorque();
  motor1->setOperatingMode(dynamixel::OperatingMode::POSITION);
  motor1->enableTorque();

  // Move Motor to Goal Position
  int target_position = 500;
  motor1->setGoalPosition(target_position);
}
```

## [Add Header Files](#add-header-files)
- Add `dynamixel_sdk/dynamixel_api.hpp` to the top of your CPP file. This class is included in the Dynamixel SDK package.
```cpp
  #include "dynamixel_sdk/dynamixel_api.hpp"
```

## [Create Connector and Motor Object](#create-connector-and-motor-object)
- Create a `Connector` object to manage the communication port and protocol version. (Only protocol 2.0 is supported)
- Create a `Motor` object for each Dynamixel servo you want to control, using the `createMotor` method of the `Connector` class.
- This method takes the motor ID as an argument and returns a unique pointer to a `Motor` instance. (shared_ptr is also available)
- This process throws a `DxlRuntimeError` if the object creation fails.
```cpp
  int main(){
    dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
    std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
```

## [Set Operating Mode to Position Control Mode](#set-operating-mode-to-position-control-mode)
- Use the methods provided by the `Motor` class to control the Dynamixel servo.
- Each method returns a `Result<void,DxlError>` object that encapsulates errors.
- This is an example for position control.
  - Set the operating mode to position control mode.
  ```cpp
      motor1->disableTorque();
      motor1->setOperatingMode(dynamixel::OperatingMode::POSITION);
      motor1->enableTorque();
  ```

## [Move Motor to Goal Position](#move-motor-to-goal-position)
  - Move the motor to the goal position that you want.
  ```cpp
      int target_position = 500;
      motor1->setGoalPosition(target_position);
  ```

## [Read Example](#read-example)
- Each method returns a `Result<T,DxlError>` object that encapsulates errors. **T** is the type of the value read from the motor.
- You need to use a different Result object depending on the type of the value read from Result<T, Error>.
- This is an example for reading the current position.
```cpp
    while (true) {
      auto result_uint32_t = motor1->getPresentPosition(); // result_uint32_t type is Result<uint32_t, Error>
      uint32_t present_position = result_uint32_t.value();
      if (abs(target_position - present_position) < 10){
        break;
      }
    }
```

# [Error Handling](#error-handling)
- You can check for communication errors and device(dynamixel) errors using the `Result` object.
``` cpp
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }
```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ dxl_api_tutorial.cpp -o dxl_api_tutorial -l dxl_x64_cpp
$ ./dxl_api_tutorial
```

# [Full Source Code](#full-source-code)
```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"

int main(){
  dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
  std::unique_ptr<dynamixel::Motor> motor1 = connector.getMotor(1);
  int target_position = 500;

  //Disble torque to change operating mode
  auto result_void = motor1->disableTorque(); // result_void type is Result<void, Error>
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  //Set operating mode to position control mode
  result_void = motor1->setPositionControlMode();
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  //Enable torque to operate motor
  result_void = motor1->enableTorque();
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  //Set goal position
  result_void = motor1->setGoalPosition(target_position);
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  //Wait until the motor reaches the goal position
  while (true) {
    auto result_uint32_t = motor1->getPresentPosition(); // result_uint32_t type is Result<uint32_t, Error>
    if (!result_uint32_t.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_uint32_t.error()) << std::endl;
      return 1;
    }
    uint32_t present_position = result_uint32_t.value();
    if (abs(target_position - present_position) < 10){
      break;
    }
  }
}
```
