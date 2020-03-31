---
layout: popup
---

# read

## Description

read() reads characters from an incoming stream to the buffer.
Please refer to [Arduino Reference for read()](https://www.arduino.cc/en/Reference/StreamRead)

## Syntax

- read()

## Parameters

- None

## Returns

- The first byte of incoming data available. Data type : int
- -1 if no data is available.

## Example

```c++
RobotisRemoteController rc100(Serial1);
Serial.begin(115200);
rc100.begin();

if(rc100.available() > 0) {
  Serial.println(rc100.read());
}
```
