---
layout: popup
---

# flush

## Description

flush() clears the buffer once all outgoing characters have been sent.
Please refer to [Arduino Reference for flush()](https://www.arduino.cc/en/Reference/StreamFlush)

## Syntax

- flush()

## Parameters

- None

## Returns

- True(1) on success.
- False(0) on failure.
-
## Example

```c++
RobotisRemoteController rc100(Serial1);
Serial.begin(115200);
rc100.begin();

rc100.flush();
```
