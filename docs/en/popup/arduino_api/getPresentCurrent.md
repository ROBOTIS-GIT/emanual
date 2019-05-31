---
layout: popup
---

# getPresentCurrent

## Description

This function gets present current of DYNAMIXEL.

## Syntax

- getPresentCurrent(id, value, unit)

## parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **value** : Present Current value in raw value(default) or milli amphere or percentage. Data type : float
- **unit** : Types of value. Data type : unsigned int8
  - For raw value : UNIT_RAW (default)
  - For milli amphere(mA) : UNIT_MILLI_AMPERE
  - For Percentage value : UNIT_PERCENT

## Returns

- Present Current value on success.
- False(0) on failure. Use `getLastErrorCode()` to see if this value indicates an error.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  Serial.print(dxl.getPresentCurrent(1)); //use default raw value
  Serial.print(dxl.getPresentCurrent(2, UNIT_MILLI_MAPERE)); //use mA
  Serial.print(dxl.getPresentCurrent(3, UNIT_PERCENT)); //use percentage (-100 ~ 100 %)
```
