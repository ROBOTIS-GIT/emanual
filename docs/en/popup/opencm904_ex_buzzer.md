---
layout: popup
---

# [Buzzer](#buzzer)

Buzzer can be driven using Arduino tone API. Buzzer-enabled pins are available on all I / O pins in OpenCM 9.04.

# Connection

![](/assets/images/parts/controller/opencm904/buzzer_bb.png)


# Arduino code
The following example shows a change to the Buzzer pin in the basic tone example provided by Arduino, which uses the Buzzer to play the melody.

```c++
#include "pitches.h"

int buzzer_pin = A0;

// notes in the melody:
int melody[] = {
  NOTE_C4, NOTE_G3, NOTE_G3, NOTE_A3, NOTE_G3, 0, NOTE_B3, NOTE_C4
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  4, 8, 8, 4, 4, 4, 4, 4
};

void setup() {
  // iterate over the notes of the melody:
  for (int thisNote = 0; thisNote < 8; thisNote++) {

    // to calculate the note duration, take one second
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 1000 / noteDurations[thisNote];
    tone(buzzer_pin, melody[thisNote], noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(buzzer_pin);
  }
}
```
