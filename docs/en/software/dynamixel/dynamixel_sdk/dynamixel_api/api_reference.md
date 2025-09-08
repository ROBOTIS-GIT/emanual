---
layout: archive
lang: en
ref: api_reference
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/dynamixel_api/api_reference/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-api-reference">Dynamixel API Reference</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

# [Connector Class](#connector-class)

| Return Type                           | Method               | Parameters                                                             | Description                                                           |
| ------------------------------------- | -------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------|
| —                                     | **`Connector`**      | `const std::string & port_name, float protocol_version, int baud_rate` | Initializes the connector.                                            |
| `std::unique_ptr<Motor>`              | **`getMotor`**       | `uint8_t id`                                                           | Returns a `Motor` instance for the specified ID.                      |
| `std::vector<std::unique_ptr<Motor>>` | **`getAllMotors`**   | `int start_id = 0, int end_id = 252`                                   | Returns a vector of all `Motor` instances within the given ID range.  |


# [Motor Class](#motor-class)

| Return Type                  | Method                                                                | Description                                                                           |
| :----------------------------| :-------------------------------------------------------------------- | :------------------------------------------------------------------------------------ |
| `Result<void, DxlError>`     | **`enableTorque()`**                                                  | Enables the motor torque.                                                             |
| `Result<void, DxlError>`     | **`disableTorque()`**                                                 | Disables the motor torque.                                                            |
| `Result<void, DxlError>`     | **`setGoalPosition(uint32_t position)`**                              | Sets the target position for the motor.                                               |
| `Result<void, DxlError>`     | **`setGoalVelocity(uint32_t velocity)`**                              | Sets the target velocity for the motor.                                               |
| `Result<void, DxlError>`     | **`LEDOn()`**                                                         | Turns on the motor LED.                                                               |
| `Result<void, DxlError>`     | **`LEDOff()`**                                                        | Turns off the motor LED.                                                              |
| `Result<uint16_t, DxlError>` | **`ping()`**                                                          | Pings the motor and returns its model number.                                         |
| `Result<uint8_t, DxlError>`  | **`isTorqueOn()`**                                                    | Returns whether the torque is currently enabled.                                      |
| `Result<uint8_t, DxlError>`  | **`isLEDOn()`**                                                       | Returns whether the LED is currently on.                                              |
| `Result<int32_t, DxlError>`  | **`getPresentPosition()`**                                            | Reads the current position of the motor.                                              |
| `Result<int32_t, DxlError>`  | **`getPresentVelocity()`**                                            | Reads the current velocity of the motor.                                              |
| `Result<uint32_t, DxlError>` | **`getMaxPositionLimit()`**                                           | Reads the maximum position limit from the motor.                                      |
| `Result<uint32_t, DxlError>` | **`getMinPositionLimit()`**                                           | Reads the minimum position limit from the motor.                                      |
| `Result<uint32_t, DxlError>` | **`getVelocityLimit()`**                                              | Reads the velocity limit of the motor.                                                |
| `Result<void, DxlError>`     | **`changeID(uint8_t new_id)`**                                        | Changes the motor ID to a new value.                                                  |
| `Result<void, DxlError>`     | **`changeBaudRate(int new_baud_rate)`**                               | Changes the motor communication baud rate.                                            |
| `Result<void, DxlError>`     | **`setPositionControlMode()`**                                        | Sets the motor to position control mode.                                              |
| `Result<void, DxlError>`     | **`setVelocityControlMode()`**                                        | Sets the motor to velocity control mode.                                              |
| `Result<void, DxlError>`     | **`setCurrentControlMode()`**                                         | Sets the motor to current control mode.                                               |
| `Result<void, DxlError>`     | **`setTimeBasedProfile()`**                                           | Configures the motor for time-based profile mode.                                     |
| `Result<void, DxlError>`     | **`setVelocityBasedProfile()`**                                       | Configures the motor for velocity-based profile mode.                                 |
| `Result<void, DxlError>`     | **`setNormalDirection()`**                                            | Sets the motor rotation direction to normal.                                          |
| `Result<void, DxlError>`     | **`setReverseDirection()`**                                           | Sets the motor rotation direction to reverse.                                         |
| `Result<void, DxlError>`     | **`reboot()`**                                                        | Reboots the motor.                                                                    |
| `Result<void, DxlError>`     | **`factoryResetAll()`**                                               | Resets the motor to factory defaults (all settings).                                  |
| `Result<void, DxlError>`     | **`factoryResetExceptID()`**                                          | Resets all settings except the motor ID.                                              |
| `Result<void, DxlError>`     | **`factoryResetExceptIDAndBaudRate()`**                               | Resets all settings except ID and baud rate.                                          |
| `uint8_t`                    | **`getID() const`**                                                   | Returns the motor ID.                                                                 |
| `uint16_t`                   | **`getModelNumber() const`**                                          | Returns the motor model number.                                                       |
| `std::string`                | **`getModelName() const`**                                            | Returns the motor model name.                                                         |

