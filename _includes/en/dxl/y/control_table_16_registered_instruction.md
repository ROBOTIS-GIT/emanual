The Registered Instruction control table item indicates if there is a received [Registered Write] command ready to be executed.

| Value |                  Description                    |
|:-----:|:-----------------------------------------------:|
|  0    |    No registered command from REG_WRITE         |
|  1    |    Registered command from REG_WRITE            |

**Note**: When the registered command is executed, the Registered Instruction value is reset to '0'.
{: .notice}

[Registered Write]: /docs/en/dxl/protocol2/#reg-write-0x04
