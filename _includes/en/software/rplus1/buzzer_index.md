
This parameter is used to set the musical note played by the controller's buzzer.
 
##### Characteristics

- Depending on what the "Buzzer Time" is set to, "Buzzer Index" can be set to play a musical note or a melody.  Please refer to the "Buzzer Time" parameter for information on sound modes.
- If the "Buzzer Time" parameter is not set to melody mode, a melody will not be played even if it is selected.
- In musical note mode, the note will be played for the length set as "Buzzer Time."
- In melody mode, when a melody is set, it is played to the end.
- There are 16 melodies (0-15) and 27 musical notes (0-26).
- If the "Buzzer Time" is 0, the parameter is automatically set to 3 and the note is played.
 
##### Corresponding RoboPlus Task Command

- Parameter : [Buzzer Type]
- Constants : Melody, Scale Values.
 
[Buzzer Type]: /docs/en/software/rplus1/task/programming_02/#buzzer-index
