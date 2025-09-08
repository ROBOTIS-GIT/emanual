---
layout: archive
lang: en
ref: introduction
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/dynamixel_api/introduction/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-api-introduction">Dynamixel API Introduction</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

<style>body {counter-reset: h1 0 !important;}</style>

# [Overview](#overview)
The dynamixel_api is a high-level, object-oriented C++ library designed to wrap the standard low-level Dynamixel SDK. Its primary goal is to provide a more intuitive, safer, and easier-to-use interface for controlling Dynamixel servos, allowing developers to focus on their robotics application instead of low-level communication protocols.

# [Features](#features)
- **Object-Oriented Design**: Each Dynamixel servo is managed as a distinct Motor object. By mapping the physical motor to a software object on a 1:1 basis, users can intuitively control a specific motor.
- **Intuitive Abstraction**: The dynamixel_api provides functions with clear and descriptive names, allowing users to control motors without needing to understand the underlying protocol. For example, calling `motor1.torque_enable()` directly conveys its purpose, making the API easy to learn and use.
- **Automatic Model Recognition**: The API can automatically detect the connected Dynamixel model and load its corresponding control table, eliminating the need for manual configuration and simplifying development.
- **Error Handling**: Instead of returning a raw int, the API now uses a result object that encapsulates both communication errors and Dynamixel-specific errors. This allows developers to handle all error cases in a unified way, making error logging code more concise and improving readability.

# Supported Environments
- **Programming Languages**: `C++ (17 standard or later)`
- **Operating Systems**: `Linux 64-bit`
- **Protocols**: `2.0`
