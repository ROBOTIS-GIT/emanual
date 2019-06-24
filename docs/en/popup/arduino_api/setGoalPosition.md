---
layout: popup
---

# setGoalPosition

## Description

This function controls position(joint) of DYNAMIXEL.

## Syntax

- setGoalPosition(id, value, unit)

## Parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **value** : Goal Position value in encoder value(default) or angle in degree. Data type : float
- **unit** : Types of value. Data type : unsigned int8
  - For encoder value : UNIT_RAW (default)
  - For angle value : UNIT_DEGREE


## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.setGoalPosition(1, 512); //use default encoder value
  dxl.setGoalPosition(2, 45.0, UNIT_DEGREE); //use angle in degree
```
