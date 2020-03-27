---
layout: popup
---

# [Button](#button)

It is a built-in BUTTON test on the OpenCM9.04 board.

# Test
There is one Push switche in OpenCM9.04. The pin number is defined as below, so you can see the status of the current button when you input the data of that pin.

```
#define BOARD_BUTTON_PIN        23  
```

It is a code that outputs the button input status in serial. In order to use the built-in buttons, you need to set the port to pull-down.

```c++
void setup(){
  Serial.begin(115200);

  pinMode(BOARD_BUTTON_PIN, INPUT_PULLDOWN);
}

void loop(){
  int push_state;

  push_state  = digitalRead(BOARD_BUTTON_PIN)&lt;&lt;0;

  Serial.print("push_state = ");
  Serial.println(push_state, BIN);

  delay(100);
}
```
