---
layout: popup
---

# [PWM](#pwm)

This is the PWM output test from the pin of the OpenCM9.04 board.

# Test

The analogueWrite is used to output the PWM duty ratio to the corresponding ports. The resolution is 8 bits, from 0 to 255, and the frequency is 10 KHz.  
OpenCM 9.04 has 13 PWM pins in total. This is an example of PWM output on the six pins.

```c++
/*
 * PWM Pins : 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
 */

int pwm_pins[6] = { 2, 3, 4, 5, 6, 7 };

void setup() {
  // put your setup code here, to run once:
}

void loop() {
  // put your main code here, to run repeatedly:
  int i;
  static uint8_t pwm_out = 0;

  for( i=0; i<6; i++ )
  {
    analogWrite(pwm_pins[i], pwm_out++);
  }
  delay(100);
}
```
