
The parameter is used to set or read the ID of the ZigBee communication module that communicates with the robot's Zigbee module.
 
##### Characteristics

- This parameter is meaningful only when ZigBee module is connected.
- The ID is a number between 0 and 65535.
- When the opponent's ID is set to 65535, data is sent to all ZigBee modules, regardless of ID.  
- For 1:1 communication, the ID's of both ZigBee modules must be correct.
 
##### Corresponding RoboPlus Task Command

- Parameter : [Remocon ID]
- Constant : Number
  
[Remocon ID]: /docs/en/software/rplus1/task/programming_02/#remocon-id
