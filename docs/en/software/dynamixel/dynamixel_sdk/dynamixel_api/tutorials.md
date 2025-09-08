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

# [Getting Started](#getting-started)
**NOTE**: This tutorial explains how to write code using the Dynamixel API. It assumes that you have already installed the SDK.
{:.notice--warning}

- Include the Dynamixel API header in your C++ project. This class is included in the Dynamixel SDK package.
```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"
```

# [Making Objects](#making-objects)
- Create a `Connector` object to manage the communication port and protocol version. (Only protocol 2.0 is supported)
- Create a `Motor` object for each Dynamixel servo you want to control, using the `getMotor` method of the `Connector` class. This method takes the motor ID as an argument and returns a unique pointer to a `Motor` instance. (shared_ptr is also available)
- This process throws a `DxlRuntimeError` if the object creation fails.
```cpp
  try {
    dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
    std::unique_ptr<dynamixel::Motor> motor1 = connector.getMotor(1);
  } catch (const dynamixel::DxlRuntimeError& e) {
    std::cerr << "Dynamixel Error: " << e.what() << std::endl;
    return 1;
  }
```

# [Function Usage](#function-usage)
- Use the methods provided by the `Motor` class to control the Dynamixel servo.
- Each method returns a `Result` object that encapsulates both read information and errors.
- Check the `Result` object for success or failure, and handle errors appropriately.

<br>

- Example of enabling torque.
```cpp
  auto result_void = motor1->enableTorque(); // result_void type is Result<void, Error>
```
- Example of checking if torque is on.
```cpp
  auto result_uint8_t = motor1->isTorqueOn(); // result_uint8_t type is Result<uint8_t, Error>
  std::cout << "Torque ON result: " << static_cast<int>(result_uint8_t.value()) << std::endl;
```
- Example of setting goal position.
```cpp
  result_void = motor1->setGoalPosition(512); // result_void type is Result<void, Error>
```
- Example of reading present position.
```cpp
  auto result_uint32_t = motor1->getPresentPosition(); // result_uint32_t type is Result<uint32_t, Error>
  std::cout << "Present Position: " << result_uint32_t.value() << std::endl;
```

# [Error Handling](#error-handling)
- You can check for communication errors and device errors using the `Result` object.
``` cpp
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }
```
