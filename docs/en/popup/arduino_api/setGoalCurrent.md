---
layout: popup
---

# setGoalCurrent

## Description

This function controls current of DYNAMIXEL.

## Syntax

- setGoalCurrent(id, value, unit)

## parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **value** : Goal Current value in raw value(default) or milli amphere or percentage. Data type : float
- **unit** : Types of value. Data type : unsigned int8
  - For raw value : UNIT_RAW (default)
  - For milli amphere(mA) : UNIT_MILLI_AMPERE
  - For Percentage value : UNIT_PERCENT

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.setGoalCurrent(1, 100); //use default raw value
  dxl.setGoalCurrent(2, 1000.0, UNIT_MILLI_MAPERE); //use mA
  dxl.setGoalCurrent(3, 50.0, UNIT_PERCENT); //use percentage (-100 ~ 100 %)
```
