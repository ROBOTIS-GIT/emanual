---
layout: popup
---

# getLastLibErrCode

## Description

This function collects the library error code that occurred most recently.

## Syntax

- getLastLibErrCode()

## Parameters

- None

## Returns

- Returns library error code. Data type : Enumeration

| Code | Description                         |
|:----:|:------------------------------------|
|  0   | DXL_LIB_OK                          |
|  1   | DXL_LIB_PROCEEDING                  |
|  2   | DXL_LIB_ERROR_NOT_SUPPORTED         |
|  3   | DXL_LIB_ERROR_TIMEOUT               |
|  4   | DXL_LIB_ERROR_INVAILD_ID            |
|  5   | DXL_LIB_ERROR_NOT_SUPPORT_BROADCAST |
|  6   | DXL_LIB_ERROR_NULLPTR               |
|  7   | DXL_LIB_ERROR_LENGTH                |
|  8   | DXL_LIB_ERROR_INVAILD_ADDR          |
|  9   | DXL_LIB_ERROR_ADDR_LENGTH           |
|  10  | DXL_LIB_ERROR_BUFFER_OVERFLOW       |
|  11  | DXL_LIB_ERROR_PORT_NOT_OPEN         |
|  12  | DXL_LIB_ERROR_WRONG_PACKET          |
|  13  | DXL_LIB_ERROR_CHECK_SUM             |
|  14  | DXL_LIB_ERROR_CRC                   |

## Example

```c++
const int DXL_DIR_PIN = 2;
Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
Serial.print(dxl.getLastLibErrCode());
```
