---
layout: archive
lang: en
ref: examples
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/dynamixel_api/examples/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-api-Examples">Dynamixel API Examples</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

# [Run Examples](#run-examples)
- The example codes are located in the `dynamixel_sdk/examples/dynamixel_api` directory of the Dynamixel SDK package.
- Be sure to install the SDK in your system before running the examples.
- You can compile and run the examples using the following commands
```bash
$ cd~/DynamixelSDK/build/dynamixel_sdk/examples/dynamixel_api
$ g++ basic_test.cpp -o basic_test -l dxl_x64_cpp
```
- Run the exectuable file
```bash
$ ./basic_test
Dynamixel API Source Test Code
┌─────[Test Process]────┐
│ 1. Ping Test          │
│ 2. Torque ON/OFF Test │
│ 3. Position Test      │
│ 4. Velocity Test      │
│ 5. LED Test           │
│ 6. Reverse Mode Test  │
└───────────────────────┘
Baudrate set to: 57600
Scanning all motors...
┌───────────[Motor List]──────────┐
│ ID: 2, Model: xl430_w250.model  │
└─────────────────────────────────┘
The test is conducted only on the motor with ID 2
Press any key to continue! (or press ESC to quit!)
┌──────[Ping Test]─────┐
│Ping result: 1060     │
└──────────────────────┘
Press any key to continue! (or press ESC to quit!)
┌──[Torque ON/OFF Test]──┐
│Torque ON result: 1     │
│Torque OFF result: 0    │
└────────────────────────┘
Press any key to continue! (or press ESC to quit!)
───────────[Position Control Test]─────────────
Position Control Mode set.
Torque ON.
Target Position:4095.
Target position reached: 4087
Target Position: 0.
Target position reached: 5 
Torque OFF.
───────────────────────────────────────────────
Press any key to continue! (or press ESC to quit!)
───────────[Velocity Control Test]─────────────
Velocity Control Mode set.
Torque ON.
Target Velocity: 265
Target velocity reached.260
Goal velocity set to -265.
Target velocity reached.-260
Torque OFF.
───────────────────────────────────────────────
Press any key to continue! (or press ESC to quit!)
───────────[Direction Test]─────────────
Reverse Direction set.
Set goal velocity :265
Normal Direction set.
Press any key to continue! (or press ESC to quit!)
───────────[LED Test]─────────────
LED ON.
LED ON result: 1
LED OFF.
LED OFF result: 0
```

