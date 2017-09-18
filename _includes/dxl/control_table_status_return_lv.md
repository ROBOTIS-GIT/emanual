It decides how to return Status Packet. There are three ways like the below table.

| Value | Return of Status Packet     |
| :-------------: | :------------- |
|0| No return against all commands (Except PING Command)|
|1|Return only for the READ command|
|2|Return for all commands|

`Note` When Instruction Packet is Broadcast ID, Status Packet is not returned regardless of Status Return Level.
{: .notice}
