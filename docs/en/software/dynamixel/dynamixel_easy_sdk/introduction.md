---
layout: archive
lang: en
ref: introduction
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/introduction/
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-easy-sdk-introduction">Dynamixel Easy SDK Introduction</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

<style>body {counter-reset: h1 0 !important;}</style>

# [Overview](#overview)
- The **Dynamixel_Easy_SDK** is a library that wraps the low-level Dynamixel SDK in a **motor-object-oriented design**, making it easier for first-time users to work with Dynamixel.
- Its primary goal is to provide a more **intuitive** and **easier-to-use** interface for controlling Dynamixel motors.

# [Features](#features)
**Object-Oriented Design**:  
  - Each Dynamixel motor is managed as a distinct Motor object. By mapping the physical motor to a software object on a 1:1 basis, users can intuitively control a specific motor.

**Intuitive Abstraction**:  
  - The **Dynamixel Easy SDK** provides functions with clear and descriptive names, allowing users to control motors without needing to understand the underlying protocol. For example, calling `motor1.torque_enable()` directly conveys its purpose, making the **Dynamixel Easy SDK** easy to learn and use.

**Automatic Model Recognition**:  
  - The **Dynamixel Easy SDK** can automatically detect the connected Dynamixel model and load its corresponding control table, eliminating the need for manual configuration and simplifying development.

**Error Handling**:  
  - Instead of returning a raw int, the **Dynamixel Easy SDK** now uses a result object that encapsulates both communication errors and Dynamixel-specific errors. This allows developers to handle all error cases in a unified way, making error logging code more concise and improving readability.

# [Supported Environments](#supported-environments)
- **Programming Languages**: `C++ (17 standard or later)`
- **Operating Systems**: `Linux 64-bit`
- **Protocols**: `2.0`
