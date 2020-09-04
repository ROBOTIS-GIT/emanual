---
layout: popup
---

# getTorqueEnableStat

## Description

getTorqueEnableStat() returns whether the torque of specific DYNAMIXEL is turned on or off.

## Syntax

- getTorqueEnableStat(id)

## Parameters

- id : ID of a specific DYNAMIXEL. Data type : unsigned int8

## Returns

- True(1) when the torque is turned on.
- False(0) when the torque is turned off.

## Example

```c++
Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
dxl.getTorqueEnableStat(1);
```
