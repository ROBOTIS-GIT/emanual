---
layout: archive
lang: en
ref: api_reference
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/api_reference/
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-easy-sdk-reference">Dynamixel Easy SDK Reference</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

- This section provides a reference for the main classes and methods available in the Dynamixel API.
  - [Connector Class](#connector-class)
  - [Motor Class](#motor-class)
    - [Enum Class](#enum-class)
  - [Group Executor](#group-executor)
  - [Dynamixel Error](#dynamixel-error)
    - [Result Class](#result-class)
    - [DxlError Enum](#dxlerror-enum)

# [Connector Class](#connector-class)

**Connector Class**

| Return Type                         | Method                                                                                   | Description                                                           |
| ----------------------------------- | -----------------------------------------------------------------------------------------| ----------------------------------------------------------------------|
| —                                   | Connector(const std::string & port_name, int baud_rate)          | Initializes the connector.                                            |
| std::unique_ptr<Motor>              | createMotor(uint8_t id)                                                                  | Returns a `Motor` instance for the specified ID.                      |
| std::vector<std::unique_ptr<Motor>> | createAllMotors(int start_id = 0, int end_id = 252)                                      | Returns a vector of all `Motor` instances within the given ID range.  |
| std::unique_ptr<GroupExecutor>      | createGroupExecutor()                                                                    | Closes the communication port.                                        |
| PortHandler *                       | getPortHandler() const                                                                   | Returns the underlying PortHandler instance.                          |
| PacketHandler *                     | getPacketHandler() const                                                                 | Returns the underlying PacketHandler instance.                        |

# [Motor Class](#motor-class)

**Motor Class**

| Return Type                     | Method                                               | Description                                                   |
| :--------------------------     | :----------------------------------------------------| :------------------------------------------------------------ |
| Result<void, DxlError>          | enableTorque()                                       | Enables the motor torque.                                     |
| Result<void, DxlError>          | disableTorque()                                      | Disables the motor torque.                                    |
| Result<void, DxlError>          | setGoalPosition(uint32_t position)                   | Sets the target position for the motor.                       |
| Result<void, DxlError>          | setGoalVelocity(uint32_t velocity)                   | Sets the target velocity for the motor.                       |
| Result<void, DxlError>          | setGoalCurrent(int16_t current)                      | Sets the target current for the motor.                        |
| Result<void, DxlError>          | setGoalPWM(int16_t pwm)                              | Sets the target PWM value for the motor.                      |
| Result<void, DxlError>          | LEDOn()                                              | Turns on the motor LED.                                       |
| Result<void, DxlError>          | LEDOff()                                             | Turns off the motor LED.                                      |
| Result<uint16_t, DxlError>      | ping()                                               | Pings the motor and returns its model number.                 |
| Result<uint8_t, DxlError>       | isTorqueOn()                                         | Returns whether the torque is currently enabled.              |
| Result<uint8_t, DxlError>       | isLEDOn()                                            | Returns whether the LED is currently on.                      |
| Result<int32_t, DxlError>       | getPresentPosition()                                 | Reads the current position of the motor.                      |
| Result<int32_t, DxlError>       | getPresentVelocity()                                 | Reads the current velocity of the motor.                      |
| Result<uint32_t, DxlError>      | getMaxPositionLimit()                                | Reads the maximum position limit from the motor.              |
| Result<uint32_t, DxlError>      | getMinPositionLimit()                                | Reads the minimum position limit from the motor.              |
| Result<uint32_t, DxlError>      | getVelocityLimit()                                   | Reads the velocity limit of the motor.                        |
| Result<uint16_t, DxlError>      | getCurrentLimit()                                    | Reads the current limit of the motor.                         |
| Result<uint16_t, DxlError>      | getPWMLimit()                                        | Reads the PWM limit of the motor.                             |
| Result<void, DxlError>          | changeID(uint8_t new_id)                             | Changes the motor ID to a new value.                          |
| Result<void, DxlError>          | changeBaudRate(int new_baud_rate)                    | Changes the motor communication baud rate.                    |
| Result<void, DxlError>          | setOperatingMode(OperatingMode mode)                 | Sets the motor to the specified operating mode.               |
| Result<void, DxlError>          | setProfileConfiguration(ProfileConfiguration config) | Configures the motor for time-based profile mode.             |
| Result<void, DxlError>          | setDirection(Direction direction)                    | Sets the motor rotation direction to the specified direction. |
| Result<void, DxlError>          | setPositionPGain(uint16_t p_gain)                    | Sets the proportional gain for position control.              |
| Result<void, DxlError>          | setPositionIGain(uint16_t i_gain)                    | Sets the integral gain for position control.                  |
| Result<void, DxlError>          | setPositionDGain(uint16_t d_gain)                    | Sets the derivative gain for position control.                |
| Result<void, DxlError>          | setVelocityPGain(uint16_t p_gain)                    | Sets the proportional gain for velocity control.              |
| Result<void, DxlError>          | setVelocityIGain(uint16_t i_gain)                    | Sets the integral gain for velocity control.                  |
| Result<void, DxlError>          | setHomingOffset(int32_t offset)                      | Sets the homing offset for the motor.                         |
| Result<void, DxlError>          | setMaxPositionLimit(uint32_t limit)                  | Sets the maximum position limit for the motor.                |
| Result<void, DxlError>          | setMinPositionLimit(uint32_t limit)                  | Sets the minimum position limit for the motor.                |
| Result<void, DxlError>          | setVelocityLimit(uint32_t limit)                     | Sets the velocity limit for the motor.                        |
| Result<void, DxlError>          | setCurrentLimit(uint16_t limit)                      | Sets the current limit for the motor.                         |
| Result<void, DxlError>          | setPWMLimit(uint16_t limit)                          | Sets the PWM limit for the motor.                             |
| Result<void, DxlError>          | reboot()                                             | Reboots the motor.                                            |
| Result<void, DxlError>          | factoryResetAll()                                    | Resets the motor to factory defaults (all settings).          |
| Result<void, DxlError>          | factoryResetExceptID()                               | Resets all settings except the motor ID.                      |
| Result<void, DxlError>          | factoryResetExceptIDAndBaudRate()                    | Resets all settings except ID and baud rate.                  |
| Result<StagedCommand, DxlError> | stageEnableTorque()                                  | Stages a command to enable torque for group execution.        |
| Result<StagedCommand, DxlError> | stageDisableTorque()                                 | Stages a command to disable torque for group execution.       |
| Result<StagedCommand, DxlError> | stageSetGoalPosition(uint32_t position)              | Stages a command to set the goal position for group execution.|
| Result<StagedCommand, DxlError> | stageSetGoalVelocity(uint32_t velocity)              | Stages a command to set the goal velocity for group execution.|
| Result<StagedCommand, DxlError> | stageLEDOn()                                         | Stages a command to turn on the LED for group execution.      |
| Result<StagedCommand, DxlError> | stageLEDOff()                                        | Stages a command to turn off the LED for group execution.     |
| Result<StagedCommand, DxlError> | stageIsTorqueOn()                                    | Stages a command to read the torque status for group execution.|
| Result<StagedCommand, DxlError> | stageIsLEDOn()                                       | Stages a command to read the LED status for group execution.  |
| Result<StagedCommand, DxlError> | stageGetPresentPosition()                            | Stages a command to read the present position for group execution.|
| Result<StagedCommand, DxlError> | stageGetPresentVelocity()                            | Stages a command to read the present velocity for group execution.|
| uint8_t                         | getID() const                                        | Returns the motor ID.                                         |
| uint16_t                        | getModelNumber() const                               | Returns the motor model number.                               |
| std::string                     | getModelName() const                                 | Returns the motor model name.                                 |

## [Enum Class](#enum-class)

**Motor::OperatingMode**

|Operating Mode|value|
|:-------------|:----|
|Position      |  3  |
|Velocity      |  1  |
|Current       |  0  |

**Motor::ProfileConfiguration**

|Profile Configuration|value|
|:--------------------|:----|
|Time-based           |  1  |
|Velocity-based       |  0  |

**Motor::Direction**

|Direction|value|
|:--------|:----|
|NORMAL   |  0  |
|REVERSE  |  1  |

# [Group Executor](#group-executor)

**GroupExecutor Class**

| Return Type                | Method                                         | Description                                      |
| :--------------------------| :----------------------------------------------| :----------------------------------------------- |
| void                       | addCmd(StagedCommand cmd)                      | Adds a command to the group excutor.             |
| void                       | addCmd(Result<StagedCommand, DxlError> result) | Adds a command to the group excutor.             |
| Result<void, DxlError>     | executeWrite()                                 | Executes the write operations staged in the list. It automatically determines whether to use Bulk or Sync Write based on the command list and sends the corresponding packet.|
| Result<std::vector<Result<int32_t, DxlError>, DxlError>> | executeRead()    | Executes the read operations staged in the list. It automatically determines whether to use Bulk or Sync Read based on the command list and sends the corresponding packet.|
| void                       | clearStagedWriteCommands()                     | Clears all staged write commands.                 |
| void                       | clearStagedReadCommands()                      | Clears all staged read commands.                  |
| std::vector<StagedCommand> | getStagedWriteCommands()                       | Returns the list of staged write commands.        |
| std::vector<StagedCommand> | getStagedReadCommands()                        | Returns the list of staged read commands.         |

# [Dynamixel Error](#dynamixel-error)

## [Result Class](#result-class)

**Result Class**

| Return Type                | Function                                   | Description                                      |
| :--------------------------| :------------------------------------------| :----------------------------------------------- |
| T                         | value() const                               | Returns the contained value.                     |
| E                         | error() const                               | Returns the contained error.                     |
| bool                      | isSuccess() const                           | Returns true if the result is Success, false if Failure.|

## [DxlError Enum](#dxlerror-enum)

**DxlError Enum**

| DxlError                   | Value |Description                                      |
| :------------------------- | :---- |:----------------------------------------------- |
| SDK_COMM_SUCCESS           | 0     |tx or rx packet communication success            |
| SDK_COMM_PORT_BUSY         | -1000 |Port is busy (in use)                            |
| SDK_COMM_TX_FAIL           | -1001 |Failed transmit instruction packet               |
| SDK_COMM_RX_FAIL           | -1002 |Failed get status packet                         |
| SDK_COMM_TX_ERROR          | -2000 |Incorrect instruction packet                     |
| SDK_COMM_RX_WAITING        | -3000 |Now receiving status packet                      |
| SDK_COMM_RX_TIMEOUT        | -3001 |There is no status packet                        |
| SDK_COMM_RX_CORRUPT        | -3002 |Incorrect status packet                          |
| SDK_COMM_NOT_AVAILABLE     | -9000 |                                                 |
| SDK_ERRNUM_RESULT_FAIL     | 1     |Failed to process the instruction packet         |
| SDK_ERRNUM_INSTRUCTION     | 2     |Invalid instruction                              |
| SDK_ERRNUM_CRC             | 3     |CRC error                                        |
| SDK_ERRNUM_DATA_RANGE      | 4     |Data out of range                                |
| SDK_ERRNUM_DATA_LENGTH     | 5     |Invalid data length                              |
| SDK_ERRNUM_DATA_LIMIT      | 6     |Data limit exceeded                              |
| SDK_ERRNUM_ACCESS          | 7     |Access denied                                    |
| API_FUNCTION_NOT_SUPPORTED | 11    |The Dynamixel API does not support this motor model|
| EASY_SDK_MOTOR_TORQUE_OFF  | 12    |Motor torque is off                              |
| EASY_SDK_OPERATING_MODE_MISMATCH | 13 |Operating mode is mismatched                     |
| API_ADD_PARAM_FAIL         | 21    |Failed to add parameter                          |
| API_COMMAND_IS_EMPTY       | 22    |Command list is empty                            |
| API_DUPLICATE_ID           | 23    |Duplicate ID in staged commands                  |
| API_FAIL_TO_GET_DATA       | 24    |Failed to get data from motor                    |

**Global Function**

| Return Type                | Function                                    | Description                                      |
| :--------------------------| :-------------------------------------------| :----------------------------------------------- |
| std::string                | getErrorMessage(DxlError error)         | Returns DxlError as a human-readable string.     |
