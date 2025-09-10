---
layout: archive
lang: en
ref: tutorials
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/dynamixel_api/tutorials/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-api-tutorials">Dynamixel API Tutorials</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

# [Make cpp file](#make-cpp-file)
**NOTE**: This tutorial explains how to write code using the Dynamixel API. It assumes that you have already installed the SDK.
{:.notice--warning}

- Open a code editor and create a new C++ source file. In this example, we use visual studio code.
```bash
$ code dxl_api_tutorial.cpp
```

# [Source Code Description](#source-code-description)

## [Add Header Files](#add-header-files)
- Add `dynamixel_sdk/dynamixel_api.hpp` to the top of your CPP file. This class is included in the Dynamixel SDK package.
```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"
```

## [Initialize Objects](#make-objects)
- Create a `Connector` object to manage the communication port and protocol version. (Only protocol 2.0 is supported)
- Create a `Motor` object for each Dynamixel servo you want to control, using the `getMotor` method of the `Connector` class. This method takes the motor ID as an argument and returns a unique pointer to a `Motor` instance. (shared_ptr is also available)
- This process throws a `DxlRuntimeError` if the object creation fails.
```cpp
  int main(){
    dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
    std::unique_ptr<dynamixel::Motor> motor1 = connector.getMotor(1);
```

## [Torque Control](#torque-control)
- Use the methods provided by the `Motor` class to control the Dynamixel servo.
- Each method returns a `Result` object that encapsulates both read information and errors.
- Disable torque.
```cpp
    auto result_void = motor1->disableTorque(); // result_void type is Result<void, Error>
```
- Checking if torque is on. You need to use a different Result object depending on the type of the value read from Result<T, Error>.
```cpp
    auto result_uint8_t = motor1->isTorqueOn(); // result_uint8_t type is Result<uint8_t, Error>
    std::cout << "Torque ON result: " << static_cast<int>(result_uint8_t.value()) << std::endl;
```

## [Position Control](#set-position-control-mode)
- Set the control mode to position control.
```cpp
    result_void = motor1->setPositionControlMode(); // result_void type is Result<void, Error>
```
- Enable torque.
```cpp
    result_void = motor1->enableTorque(); // result_void type is Result<void, Error>
```
- Get motor position limits.
```cpp
    auto result_uint32_t = motor1->getMinPositionLimit(); // result_uint32_t type is Result<uint32_t, Error>
    uint32_t min_position = result_uint32_t.value();

    result_uint32_t = motor1->getMaxPositionLimit(); // result_uint32_t type is Result<uint32_t, Error>
    uint32_t max_position = result_uint32_t.value();
```
- Get user input for target position.
```cpp
    while (true) {
      int goal_position;
      std::cout << "Enter goal position" << "(" << min_position << "~" << max_position << "): ";
      std::cin >> goal_position;

      if (goal_position < min_position || goal_position > max_position) {
        std::cerr << "Invalid goal position. Please enter a value within the limits." << std::endl;
        continue;
      }
```
- Set the target position.
```cpp
      result_void = motor1->setGoalPosition(goal_position); // result_void type is Result<void, Error>
```
- Example of reading present position.
```cpp
      int32_t present_position;
      do {
        auto result_int32_t = motor1->getPresentPosition(); // result_int32_t type is Result<int32_t, Error>
        present_position = result_int32_t.value();
        std::cout << "\rTarget position reached: " << present_position<< "    " << std::flush;
      } while (abs(static_cast<int>(target_position - present_position)) > 10);
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
  std::unique_ptr<dynamixel::Motor> motor1 = connector.getMotor(2);
  auto result_void = motor1->disableTorque(); // result_void type is Result<void, Error>
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }
  auto result_uint8_t = motor1->isTorqueOn(); // result_uint8_t type is Result<uint8_t, Error>
  if (!result_uint8_t.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_uint8_t.error()) << std::endl;
    return 1;
  }
  std::cout << "Torque ON result: " << static_cast<int>(result_uint8_t.value()) << std::endl;
  result_void = motor1->setPositionControlMode(); // result_void type is Result<void, Error>
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }
  result_void = motor1->enableTorque(); // result_void type is Result<void, Error>
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }
  auto result_uint32_t = motor1->getMinPositionLimit(); // result_uint32_t type is Result<uint32_t, Error>
  if (!result_uint32_t.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_uint32_t.error()) << std::endl;
    return 1;
  }
  uint32_t min_position = result_uint32_t.value();

  result_uint32_t = motor1->getMaxPositionLimit(); // result_uint32_t type is Result<uint32_t, Error>
  if (!result_uint32_t.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_uint32_t.error()) << std::endl;
    return 1;
  }
  uint32_t max_position = result_uint32_t.value();
  while (true) {
    int goal_position;
    std::cout << "Enter goal position" << "(" << min_position << "~" << max_position << "): ";
    std::cin >> goal_position;

    if (goal_position < min_position || goal_position > max_position) {
      std::cerr << "Invalid goal position. Please enter a value within the limits." << std::endl;
      continue;
    }
    result_void = motor1->setGoalPosition(goal_position); // result_void type is Result<void, Error>
    if (!result_void.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
      return 1;
    }
    int32_t present_position;
    do {
      auto result_int32_t = motor1->getPresentPosition(); // result_int32_t type is Result<int32_t, Error>
      if (!result_int32_t.isSuccess()) {
        std::cerr << dynamixel::getErrorMessage(result_int32_t.error()) << std::endl;
        return 1;
      }
      present_position = result_int32_t.value();
      std::cout << "\rTarget position reached: " << present_position<< "    " << std::flush;
    } while (abs(static_cast<int>(goal_position - present_position)) > 10);
  }
}
```
