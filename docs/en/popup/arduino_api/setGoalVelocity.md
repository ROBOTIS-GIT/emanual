---
layout: popup
---

# setGoalVelocity

## Description

This function controls velocity(wheel mode speed) of DYNAMIXEL.

## Syntax

- setGoalVelocity(id, value, unit)

## Parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **value** : Goal Velocity value in raw value(default) or RPM or percentage. Data type : float
- **unit** : Types of value. Data type : unsigned int8
  - For raw value : UNIT_RAW (default)
  - For RPM value : UNIT_RPM
  - For Percentage value : UNIT_PERCENT

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.setGoalVelocity(1, 100); //use default raw value
  dxl.setGoalVelocity(2, 10.5, UNIT_RPM); //use RPM
  dxl.setGoalVelocity(3, 15.0, UNIT_PERCENT); //use percentage (-100 ~ 100 %)
```
