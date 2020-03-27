---
layout: popup
---

# peek

## Description

Read a byte from the file without advancing to the next one. That is, successive calls to peek() will return the same value, as will the next call to read().
Please refer to [Arduino Reference for peek()](https://www.arduino.cc/en/Reference/StreamPeek)

## Syntax

- peek()

## Parameters

- None

## Returns

- The next byte (or character). Data type : int
- -1 if none is available.

## Example

```c++
RobotisRemoteController rc100(Serial1);
Serial.begin(115200);
rc100.begin();

Serial.println(rc100.peek());
```
