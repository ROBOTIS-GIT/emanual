---
layout: popup
---

# available

## Description

available() gets the number of bytes available in the stream. This is only for bytes that have already arrived.
Please refer to [Arduino Reference for available()](https://www.arduino.cc/en/Reference/StreamAvailable)

## Syntax

- available()

## Parameters

- None

## Returns

- The number of bytes available to read. Data type : int

## Example

```c++
RobotisRemoteController rc100(Serial1);
Serial.begin(115200);
rc100.begin();

Serial.println(rc100.available());
```
