---
layout: archive
lang: en
ref: api_reference_motor
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/api_reference_motor/
tabs: "Languages"
tab_title1: Python
tab_title2: C++
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="motor-reference">Motor Class Reference</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

- Motor class represents a DYNAMIXEL motor and provides methods to control and monitor its state, including setting goals, reading status, and configuring parameters.

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

**Motor Class**

| Method                                                 | Return Type          | Description                                      |
| -------------------------------------------------------| ---------------------| -------------------------------------------------|
| Motor(motor_id: int, model_number: int, connector)     | -                    | Initializes the Motor instance.                  |
| enableTorque()                                         | -                    | Enables the motor torque.                        |
| disableTorque()                                        | -                    | Disables the motor torque.                       |
| setGoalPosition(position: int)                         | -                    | Sets the motor position.                         |
| setGoalVelocity(velocity: int)                         | -                    | Sets the motor velocity.                         |
| setGoalCurrent(current: int)                           | -                    | Sets the motor current.                          |
| setGoalPWM(pwm: int)                                   | -                    | Sets the motor PWM.                              |
| LEDOn()                                                | -                    | Turns the motor LED on.                          |
| LEDOff()                                               | -                    | Turns the motor LED off.                         |
| ping()                                                 | -                    | Pings the motor.                                 |
| isTorqueOn()                                           | Int                  | Checks if the motor torque is enabled.           |
| isLEDOn()                                              | Int                  | Checks if the motor LED is enabled.              |
| getPresentPosition()                                   | Int                  | Gets the current motor position.                 |
| getPresentVelocity()                                   | Int                  | Gets the current motor velocity.                 |
| getPresentCurrent()                                    | Int                  | Gets the current motor current.                  |
| getPresentPWM()                                        | Int                  | Gets the current motor PWM.                      |
| getMaxPositionLimit()                                  | Int                  | Gets the maximum position limit of the motor.    |
| getMinPositionLimit()                                  | Int                  | Gets the minimum position limit of the motor.    |
| getVelocityLimit()                                     | Int                  | Gets the velocity limit of the motor.            |
| getCurrentLimit()                                      | Int                  | Gets the current limit of the motor.             |
| getPWMLimit()                                          | Int                  | Gets the PWM limit of the motor.                 |
| getOperatingMode()                                     | OperatingMode        | Gets the operating mode of the motor.            |
| changeID(new_id: int)                                  | -                    | Changes the ID of the motor.                     |
| setOperatingMode(mode: OperatingMode)                  | -                    | Sets the operating mode of the motor.            |
| setProfileConfiguration(config: ProfileConfiguration)  | -                    | Sets the profile configuration of the motor.     |
| setDirection(drection: Direction)                      | -                    | Sets the direction of the motor.                 |
| setPositionPGain(value: int)                           | -                    | Sets the position P gain of the motor.           |
| setPositionIGain(value: int)                           | -                    | Sets the position I gain of the motor.           |
| setPositionDGain(value: int)                           | -                    | Sets the position D gain of the motor.           |
| setVelocityPGain(value: int)                           | -                    | Sets the velocity P gain of the motor.           |
| setVelocityIGain(value: int)                           | -                    | Sets the velocity I gain of the motor.           |
| setHomingOffset(offset: int)                           | -                    | Sets the homing offset of the motor.             |
| setMaxPositionLimit(limit: int)                        | -                    | Sets the maximum position limit of the motor.    |
| setMinPositionLimit(limit: int)                        | -                    | Sets the minimum position limit of the motor.    |
| setVelocityLimit(limit: int)                           | -                    | Sets the velocity limit of the motor.            |
| setCurrentLimit(limit: int)                            | -                    | Sets the current limit of the motor.             |
| setPWMLimit(limit: int)                                | -                    | Sets the PWM limit of the motor.                 |
| reboot()                                               | -                    | Reboots the motor.                               |
| factoryResetAll()                                      | -                    | Performs factory reset on the motor.             |
| factoryResetExceptID()                                 | -                    | Performs factory reset on the motor except ID.   |
| factoryResetExceptIDAndBaudRate()                      | -                    | Performs factory reset on the motor except ID and baud rate. |
| stageEnableTorque()                                    | StagedCommand        | Stages enabling the motor torque.                |
| stageDisableTorque()                                   | StagedCommand        | Stages disabling the motor torque.               |
| stageSetGoalPosition(position: int)                    | StagedCommand        | Stages setting the motor position.               |
| stageSetGoalVelocity(velocity: int)                    | StagedCommand        | Stages setting the motor velocity.               |
| stageSetGoalCurrent(current: int)                      | StagedCommand        | Stages setting the motor current.                |
| stageSetGoalPWM(pwm: int)                              | StagedCommand        | Stages setting the motor PWM.                    |
| stageLEDOn()                                           | StagedCommand        | Stages turning the motor LED on.                 |
| stageLEDOff()                                          | StagedCommand        | Stages turning the motor LED off.                |
| stageIsTorqueOn()                                      | StagedCommand        | Stages checking if the motor torque is enabled.  |
| stageIsLEDOn()                                         | StagedCommand        | Stages checking if the motor LED is enabled.     |
| stageGetPresentPosition()                              | StagedCommand        | Stages getting the current motor position.       |
| stageGetPresentVelocity()                              | StagedCommand        | Stages getting the current motor velocity.       |
| stageGetPresentCurrent()                               | StagedCommand        | Stages getting the current motor current.        |
| stageGetPresentPWM()                                   | StagedCommand        | Stages getting the current motor PWM.            |

**Variables**

| Variable               | Type                | Attribute | Description                                   |
| ---------------------- | --------------------|-----------|-----------------------------------------------|
| id                     | Int                 | instance  | Specified Motor id.                           |
| model_number           | Int                 | instance  | Model number of the motor.                    |
| model_name             | String              | instance  | Model name of the motor.                      |
| connector              | Connector           | instance  | Connector instance.                           |
| control_table          | ControlTable        | instance  | Control table instance.                       |
| torque_status          | Int                 | instance  | Torque status cache of the motor.             |
| operating_mode_status  | OperatingMode       | instance  | Operating mode status cache of the motor.     |

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

**Motor Class**

| Method                                                              | Return Type          | Description                                      |
| ------------------------------------------------------------------- | ---------------------| -------------------------------------------------|
| Motor(uint8_t id, uint16_t model_number, Connector * connector)     | -                    | Initializes the Motor instance.                  |
| enableTorque()                                          | Result<void, DxlError>           | Enables the motor torque.                        |
| disableTorque()                                         | Result<void, DxlError>           | Disables the motor torque.                       |
| setGoalPosition(uint32_t position)                      | Result<void, DxlError>           | Sets the motor position.                         |
| setGoalVelocity(uint32_t velocity)                      | Result<void, DxlError>           | Sets the motor velocity.                         |
| setGoalCurrent(uint16_t current)                        | Result<void, DxlError>           | Sets the motor current.                          |
| setGoalPWM(uint16_t pwm)                                | Result<void, DxlError>           | Sets the motor PWM.                              |
| LEDOn()                                                 | Result<void, DxlError>           | Turns the motor LED on.                          |
| LEDOff()                                                | Result<void, DxlError>           | Turns the motor LED off.                         |
| ping()                                                  | Result<uint16_t, DxlError>       | Pings the motor.                                 |
| isTorqueOn()                                            | Result<uint8_t, DxlError>        | Checks if the motor torque is enabled.           |
| isLEDOn()                                               | Result<uint8_t, DxlError>        | Checks if the motor LED is enabled.              |
| getPresentPosition()                                    | Result<uint32_t, DxlError>       | Gets the current motor position.                 |
| getPresentVelocity()                                    | Result<uint32_t, DxlError>       | Gets the current motor velocity.                 |
| getPresentCurrent()                                     | Result<uint16_t, DxlError>       | Gets the current motor current.                  |
| getPresentPWM()                                         | Result<uint16_t, DxlError>       | Gets the current motor PWM.                      |
| getMaxPositionLimit()                                   | Result<uint32_t, DxlError>       | Gets the maximum position limit of the motor.    |
| getMinPositionLimit()                                   | Result<uint32_t, DxlError>       | Gets the minimum position limit of the motor.    |
| getVelocityLimit()                                      | Result<uint32_t, DxlError>       | Gets the velocity limit of the motor.            |
| getCurrentLimit()                                       | Result<uint16_t, DxlError>       | Gets the current limit of the motor.             |
| getPWMLimit()                                           | Result<uint16_t, DxlError>       | Gets the PWM limit of the motor.                 |
| getOperatingMode()                                      | Result<OperatingMode, DxlError>  | Gets the operating mode of the motor.            |
| changeID(uint32_t new_id)                               | Result<void, DxlError>           | Changes the ID of the motor.                     |
| setOperatingMode(OperatingMode mode)                    | Result<void, DxlError>           | Sets the operating mode of the motor.            |
| setProfileConfiguration(ProfileConfiguration config)    | Result<void, DxlError>           | Sets the profile configuration of the motor.     |
| setDirection(Direction direction)                       | Result<void, DxlError>           | Sets the direction of the motor.                 |
| setPositionPGain(uint16_t value)                        | Result<void, DxlError>           | Sets the position P gain of the motor.           |
| setPositionIGain(uint16_t value)                        | Result<void, DxlError>           | Sets the position I gain of the motor.           |
| setPositionDGain(uint16_t value)                        | Result<void, DxlError>           | Sets the position D gain of the motor.           |
| setVelocityPGain(uint16_t value)                        | Result<void, DxlError>           | Sets the velocity P gain of the motor.           |
| setVelocityIGain(uint16_t value)                        | Result<void, DxlError>           | Sets the velocity I gain of the motor.           |
| setHomingOffset(uint32_t offset)                        | Result<void, DxlError>           | Sets the homing offset of the motor.             |
| setMaxPositionLimit(uint32_t limit)                     | Result<void, DxlError>           | Sets the maximum position limit of the motor.    |
| setMinPositionLimit(uint32_t limit)                     | Result<void, DxlError>           | Sets the minimum position limit of the motor.    |
| setVelocityLimit(uint32_t limit)                        | Result<void, DxlError>           | Sets the velocity limit of the motor.            |
| setCurrentLimit(uint16_t limit)                         | Result<void, DxlError>           | Sets the current limit of the motor.             |
| setPWMLimit(uint16_t limit)                             | Result<void, DxlError>           | Sets the PWM limit of the motor.                 |
| reboot()                                                | Result<void, DxlError>           | Reboots the motor.                               |
| factoryResetAll()                                       | Result<void, DxlError>           | Performs factory reset on the motor.             |
| factoryResetExceptID()                                  | Result<void, DxlError>           | Performs factory reset on the motor except ID.   |
| factoryResetExceptIDAndBaudRate()                       | Result<void, DxlError>           | Performs factory reset on the motor except ID and baud rate. |
| stageEnableTorque()                                     | Result<StagedCommand, DxlError>  | Stages enabling the motor torque.                |
| stageDisableTorque()                                    | Result<StagedCommand, DxlError>  | Stages disabling the motor torque.               |
| stageSetGoalPosition(uint32_t position)                 | Result<StagedCommand, DxlError>  | Stages setting the motor position.               |
| stageSetGoalVelocity(uint32_t velocity)                 | Result<StagedCommand, DxlError>  | Stages setting the motor velocity.               |
| stageSetGoalCurrent(uint16_t current)                   | Result<StagedCommand, DxlError>  | Stages setting the motor current.                |
| stageSetGoalPWM(uint16_t pwm)                           | Result<StagedCommand, DxlError>  | Stages setting the motor PWM.                    |
| stageLEDOn()                                            | Result<StagedCommand, DxlError>  | Stages turning the motor LED on.                 |
| stageLEDOff()                                           | Result<StagedCommand, DxlError>  | Stages turning the motor LED off.                |
| stageIsTorqueOn()                                       | Result<StagedCommand, DxlError>  | Stages checking if the motor torque is enabled.  |
| stageIsLEDOn()                                          | Result<StagedCommand, DxlError>  | Stages checking if the motor LED is enabled.     |
| stageGetPresentPosition()                               | Result<StagedCommand, DxlError>  | Stages getting the current motor position.       |
| stageGetPresentVelocity()                               | Result<StagedCommand, DxlError>  | Stages getting the current motor velocity.       |
| stageGetPresentCurrent()                                | Result<StagedCommand, DxlError>  | Stages getting the current motor current.        |
| stageGetPresentPWM()                                    | Result<StagedCommand, DxlError>  | Stages getting the current motor PWM.            |
| getID() const                                           | uint8_t                          | Returns the motor ID.                            |
| getModelNumber() const                                  | uint16_t                         | Returns the motor model number.                  |
| getModelName() const                                    | std::string                      | Returns the motor model name.                    |
| getTorqueStatus() const                                 | uint8_t                          | Returns the cached torque status.                |
| getOperatingModeStatus() const                          | OperatingMode                    | Returns the cached operating mode status.        |
| setTorqueStatus(uint8_t status)                         | void                             | Sets the cached torque status.                   |
| setOperatingModeStatus(OperatingMode mode)              | void                             | Sets the cached operating mode status.           |

**Variables**

| Variable               | Type                | Attribute | Description                                   |
| ---------------------- | --------------------|-----------|-----------------------------------------------|
| id_                    | Int                 | Private   | Specified Motor id.                           |
| model_number_          | Int                 | Private   | Model number of the motor.                    |
| model_name_            | String              | Private   | Model name of the motor.                      |
| connector_             | Connector           | Private   | Connector instance.                           |
| control_table_         | ControlTable        | Private   | Control table instance.                       |
| torque_status_         | Int                 | Private   | Torque status cache of the motor.             |
| operating_mode_status_ | OperatingMode       | Private   | Operating mode status cache of the motor.     |

</section>

