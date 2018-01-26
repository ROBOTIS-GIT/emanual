
It is also possible to know how many sounds have been counted by the controller's microphone so far.
 
##### Characteristics

- The maximum number of sounds counted is 255.
- The parameter value is increased in real-time whenever a sound is detected.
- If a new sound is not detected for a certain period, the value of the "Current Sound Count" parameter is passed to the "Sound Count" parameter, and the "Current Sound Count" parameter is reset to 0.
 
##### Corresponding RoboPlus Task Command

- Parameter : [Current Sound]

[Current Sound]: /docs/en/software/rplus1/task/programming_02/#current-sound-count
