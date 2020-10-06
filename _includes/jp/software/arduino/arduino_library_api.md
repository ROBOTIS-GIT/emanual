
## [ライブラリAPI](#ライブラリapi)

Arduino IDEにライブラリを追加する方法は3つあります。

- ライブラリマネージャを使用する  
- .zip ライブラリのインポート  
- マニュアルインストール  

それぞれの方法は [Arduino Official Guide]{: .blank}に詳しく記載されていますので、必要に応じて参考にしてください。  
以下にライブラリマネージャの使用例を示します。 

![](/assets/images/parts/interface/dynamixel_shield/library_manager_01.png)

ライブラリマネージャから`DYNAMIXEL2Arduino`を検索し、ライブラリをインストールします。

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

DYNAMIXEL2Arduinoライブラリが正常にインストールされている場合、DYNAMIXELを制御するために役に立つサンプルプログラムは、DYNAMIXEL2Arduinoカテゴリで見つけることができます。

### [Dynamixel2Arduinoライブラリ](#dynamixel2arduinoライブラリ)

#### [Dynamixel2Arduinoクラス](#dynamixel2arduinoクラス)

- [begin()]{: .popup}
- [getPortBaud()]{: .popup}
- [ping()]{: .popup}
- [scan()]{: .popup}
- [getModelNumber()]{: .popup}
- [setID()]{: .popup}
- [setProtocol()]{: .popup}
- [setBaudrate()]{: .popup}
- [torqueOn()]{: .popup}
- [torqueOff()]{: .popup}
- [ledOn()]{: .popup}
- [ledOff()]{: .popup}
- [setOperatingMode()]{: .popup}
- [setGoalPosition()]{: .popup}
- [getPresentPosition()]{: .popup}
- [setGoalVelocity()]{: .popup}
- [getPresentVelocity()]{: .popup}
- [setGoalPWM()]{: .popup}
- [getPresentPWM()]{: .popup}
- [setGoalCurrent()]{: .popup}
- [getPresentCurrent()]{: .popup}
- [readControlTableItem()]{: .popup}
- [writeControlTableItem()]{: .popup}

#### [マスタークラス](#マスタークラス)

Dynamixel2Arduinoクラスは、マスタークラスから以下のパブリック関数を継承しています。


- [syncRead()]{: .popup}
- [syncWrite()]{: .popup}
- [bulkRead()]{: .popup}
- [bulkWrite()]{: .popup}
- [getLastLibErrCode()]{: .popup}

[Arduino Official Guide]: https://www.arduino.cc/en/Guide/Libraries
[begin()]: /docs/en/popup/arduino_api/begin/
[getPortBaud()]: /docs/en/popup/arduino_api/getPortBaud/
[ping()]: /docs/en/popup/arduino_api/ping/
[scan()]: /docs/en/popup/arduino_api/scan/
[getModelNumber()]: /docs/en/popup/arduino_api/getModelNumber/
[setID()]: /docs/en/popup/arduino_api/setID/
[setProtocol()]: /docs/en/popup/arduino_api/setProtocol/
[setBaudrate()]: /docs/en/popup/arduino_api/setBaudrate/
[torqueOn()]: /docs/en/popup/arduino_api/torqueOn/
[torqueOff()]: /docs/en/popup/arduino_api/torqueOff/
[ledOn()]: /docs/en/popup/arduino_api/ledOn/
[ledOff()]: /docs/en/popup/arduino_api/ledOff/
[setOperatingMode()]: /docs/en/popup/arduino_api/setOperatingMode/
[setGoalPosition()]: /docs/en/popup/arduino_api/setGoalPosition/
[getPresentPosition()]: /docs/en/popup/arduino_api/getPresentPosition/
[setGoalVelocity()]: /docs/en/popup/arduino_api/setGoalVelocity/
[getPresentVelocity()]: /docs/en/popup/arduino_api/getPresentVelocity/
[setGoalPWM()]: /docs/en/popup/arduino_api/setGoalPWM/
[getPresentPWM()]: /docs/en/popup/arduino_api/getPresentPWM/
[setGoalCurrent()]: /docs/en/popup/arduino_api/setGoalCurrent/
[getPresentCurrent()]: /docs/en/popup/arduino_api/getPresentCurrent/
[getTorqueEnableStat()]: /docs/en/popup/arduino_api/getTorqueEnableStat/
[readControlTableItem()]: /docs/en/popup/arduino_api/readControlTableItem/
[writeControlTableItem()]: /docs/en/popup/arduino_api/writeControlTableItem/
[read()]: /docs/en/popup/arduino_api/read/
[write()]: /docs/en/popup/arduino_api/write/
[syncRead()]: /docs/en/popup/arduino_api/syncRead/
[syncWrite()]: /docs/en/popup/arduino_api/syncWrite/
[bulkRead()]: /docs/en/popup/arduino_api/bulkRead/
[bulkWrite()]: /docs/en/popup/arduino_api/bulkWrite/
[getLastLibErrCode()]: /docs/en/popup/arduino_api/getLastLibErrCode/
