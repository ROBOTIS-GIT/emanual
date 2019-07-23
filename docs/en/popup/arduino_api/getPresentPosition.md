---
layout: popup
---

# getPresentPosition

## Description

This function gets present position (joint) of DYNAMIXEL.

## Syntax

- getPresentPosition(id, unit)

## Parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **unit** : Types of value. Data type : unsigned int8
  - For encoder value : UNIT_RAW (default)
  - For angle value : UNIT_DEGREE


## Returns

- Position value on success.
- False(0) on failure. Use `getLastErrorCode()` to see if this value indicates an error.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  Serial.print(dxl.getPresentPosition(1)); //use default encoder value
  Serial.print(dxl.getPresentPosition(1, UNIT_DEGREE)); //use angle in degree
```
