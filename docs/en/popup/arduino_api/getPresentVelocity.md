---
layout: popup
---

# getPresentVelocity

## Description

This function gets present velocity(wheel mode speed) of DYNAMIXEL.

## Syntax

- getPresentVelocity(id, unit)

## Parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **unit** : Types of value. Data type : unsigned int8
- For raw value : UNIT_RAW (default)
- For RPM value : UNIT_RPM
- For Percentage value : UNIT_PERCENT


## Returns

- Velocity value on success.
- False(0) on failure. Use `getLastErrorCode()` to see if this value indicates an error.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  Serial.print(dxl.getPresentVelocity(1)); //use default raw value
  Serial.print(dxl.getPresentVelocity(2, UNIT_RPM)); //use RPM
  Serial.print(dxl.getPresentVelocity(3, UNIT_PERCENT)); //use percentage (-100 ~ 100 %)
```
