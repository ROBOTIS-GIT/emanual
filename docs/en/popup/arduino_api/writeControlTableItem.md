---
layout: popup
---

# writeControlTableItem

## Description

Initialization function gets data from DYNAMIXEL control table item.

## Syntax

- writeControlTableItem(item_idex, id, data, timeout)

## Parameters

- **item_index** : DYNAMIXEL control table item index. Data type : unsigned int8

  ```c++
  enum ControlTableItem{
    MODEL_NUMBER = 0,
    MODEL_INFORMATION,
    FIRMWARE_VERSION,
    PROTOCOL_VERSION,
    ID,
    SECONDARY_ID,
    BAUD_RATE,
    DRIVE_MODE,
    CONTROL_MODE,
    OPERATING_MODE,
    CW_ANGLE_LIMIT,
    CCW_ANGLE_LIMIT,
    TEMPERATURE_LIMIT,
    MIN_VOLTAGE_LIMIT,
    MAX_VOLTAGE_LIMIT,
    PWM_LIMIT,
    CURRENT_LIMIT,
    VELOCITY_LIMIT,
    MAX_POSITION_LIMIT,
    MIN_POSITION_LIMIT,
    ACCELERATION_LIMIT,
    MAX_TORQUE,
    HOMING_OFFSET,
    MOVING_THRESHOLD,
    MULTI_TURN_OFFSET,
    RESOLUTION_DIVIDER,
    EXTERNAL_PORT_MODE_1,
    EXTERNAL_PORT_MODE_2,
    EXTERNAL_PORT_MODE_3,
    EXTERNAL_PORT_MODE_4,
    STATUS_RETURN_LEVEL,
    RETURN_DELAY_TIME,
    ALARM_LED,
    SHUTDOWN,

    TORQUE_ENABLE,
    LED,
    LED_RED,
    LED_GREEN,
    LED_BLUE,
    REGISTERED_INSTRUCTION,
    HARDWARE_ERROR_STATUS,
    VELOCITY_P_GAIN,
    VELOCITY_I_GAIN,
    POSITION_P_GAIN,
    POSITION_I_GAIN,
    POSITION_D_GAIN,
    FEEDFORWARD_1ST_GAIN,
    FEEDFORWARD_2ND_GAIN,
    P_GAIN,
    I_GAIN,
    D_GAIN,
    CW_COMPLIANCE_MARGIN,
    CCW_COMPLIANCE_MARGIN,
    CW_COMPLIANCE_SLOPE,
    CCW_COMPLIANCE_SLOPE,
    GOAL_PWM,
    GOAL_TORQUE,
    GOAL_CURRENT,
    GOAL_POSITION,
    GOAL_VELOCITY,
    GOAL_ACCELERATION,
    MOVING_SPEED,
    PRESENT_PWM,
    PRESENT_LOAD,
    PRESENT_SPEED,
    PRESENT_CURRENT,
    PRESENT_POSITION,
    PRESENT_VELOCITY,
    PRESENT_VOLTAGE,
    PRESENT_TEMPERATURE,
    TORQUE_LIMIT,
    REGISTERED,
    MOVING,
    LOCK,
    PUNCH,
    CURRENT,
    SENSED_CURRENT,
    REALTIME_TICK,
    TORQUE_CTRL_MODE_ENABLE,
    BUS_WATCHDOG,
    PROFILE_ACCELERATION,
    PROFILE_VELOCITY,
    MOVING_STATUS,
    VELOCITY_TRAJECTORY,
    POSITION_TRAJECTORY,
    PRESENT_INPUT_VOLTAGE,
    EXTERNAL_PORT_DATA_1,
    EXTERNAL_PORT_DATA_2,
    EXTERNAL_PORT_DATA_3,
    EXTERNAL_PORT_DATA_4,

    LAST_DUMMY_ITEM = 0xFF
  };
  ```
- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **data** : Data to write on the DYNAMIXEL control table. Data type : unsigned int32
- **timeout** : Timeout for a response to a data transfer. (default : 100ms) Data type : unsigned int32

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.writeControlTableItem(TORQUE_ENABLE, 1, 1);
```
