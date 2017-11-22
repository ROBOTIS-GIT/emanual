External ports that can be used for various purposes are provided.  
The property of each port is configured by the External Port Mode and data of external port is controlled by the External Port Data(152~157).  
For more details, please refer to External Port Data(152~157).  

|External Port Mode|Mode|Description|
| :---: | :---: | :---: |
|0|AI(Analogue Input)|Converts External Port signal to 12[bit] digital value|
|1|DO_PP(Digital Output Push-Pull)|Use External Port as a digital output port(3.3V level)|
|2|DI_PU(Digital Input Pull-Up)|Use External Port as a digital input port<br />Floating connection will be considered as '1'|
|3(default)|DI_PD(Digital Input Pull-Down)|Use External Port as a digital input port<br />Floating connection will be considered as '0'|
