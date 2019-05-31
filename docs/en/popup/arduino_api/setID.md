---
layout: popup
---

# setID

## Description

This function changes ID of DYNAMIXEL.

## Syntax

- setID(id, new_id)

## parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **new_id** : A new ID to assign to the DYNAMIXEL. Data type : unsigned int8

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.setID(1, 2);
```
