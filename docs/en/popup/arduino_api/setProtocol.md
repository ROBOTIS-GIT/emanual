---
layout: popup
---

# setProtocol

## Description

This function changes protocol version of DYNAMIXEL.

## Syntax

- setProtocol(id, version)

## Parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **version** : Protocol version to use. Data type : float

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.setProtocol(1, 1.0);
```
