---
layout: popup
---

# [LED](#led)

It is a built-in LED test on the OpenCM9.04 board.

## Test
There are 1 LED available in OpenCM9.04, The LED connected to base 14 of Arduino.  
When the built-in LED pin is output as High / Low, the LED turns on / off.

```
#define BOARD_LED_PIN        14
```

It is a code that sequentially turns on and off all the LEDs.

```c++
int led_pin = 14;

void setup() {
  // Set up the built-in LED pin as an output:
  pinMode(led_pin, OUTPUT);

  Serial.begin(115200);
}

void loop() {
  int i;

  digitalWrite(led_pin, HIGH);  // set to as HIGH LED is turn-off
  Serial.println("led_off");
  delay(100);                   // Wait for 0.1 second
  digitalWrite(led_pin, LOW);   // set to as LOW LED is turn-on
  Serial.println("led_on");
  delay(100);                   // Wait for 0.1 second
}
```
