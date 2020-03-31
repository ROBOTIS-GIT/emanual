---
layout: popup
---

# setGoalPWM

## Description

This function controls PWM of DYNAMIXEL.

## Syntax

- setGoalPWM(id, value, unit)

## Parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **value** : Goal PWM value in raw value(default) or percentage. Data type : float
- **unit** : Types of value. Data type : unsigned int8
  - For raw value : UNIT_RAW (default)
  - For Percentage value : UNIT_PERCENT

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.setGoalPWM(1, 100); //use default raw value
  dxl.setGoalPWM(2, 50.0, UNIT_PERCENT); //use percentage (-100 ~ 100 %)
```
