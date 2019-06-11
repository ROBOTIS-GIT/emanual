---
layout: popup
---

# getPresentPWM

## Description

This function gets present PWM value of DYNAMIXEL.

## Syntax

- getPresentPWM(id, unit)

## Parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **unit** : Types of value. Data type : unsigned int8
- For raw value : UNIT_RAW (default)
- For Percentage value : UNIT_PERCENT


## Returns

- Present PWM value on success.
- False(0) on failure. Use `getLastErrorCode()` to see if this value indicates an error.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  Serial.print(dxl.getPresentPWM(1)); //use default raw value
  Serial.print(dxl.getPresentPWM(2, UNIT_PERCENT)); //use percentage (-100 ~ 100 %)
```
