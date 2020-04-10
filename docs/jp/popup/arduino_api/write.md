---
layout: popup
---

# write

## Description

Writes binary data to the serial port. This data is sent as a byte or series of bytes
Please refer to [Arduino Reference for write()](https://www.arduino.cc/reference/en/language/functions/communication/serial/write/)

## Syntax

- write(data)

## Parameters

- **data** : byte to write on the communication serial port. Data type : unsigned int8

## Returns

- The number of bytes written, though reading that number is optional. Data type : size_t

## Example

```c++
RobotisRemoteController rc100(Serial1);
Serial.begin(115200);
rc100.begin();

rc100.write(0x01);
```
