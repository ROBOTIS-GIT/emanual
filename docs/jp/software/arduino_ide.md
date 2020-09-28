---
layout: archive
lang: jp
ref: arduino_ide
read_time: true
share: true
author_profile: false
permalink: /docs/jp/software/arduino_ide/
sidebar:
  title: Arduino IDE
  nav: "arduino_ide"
---

# [イントロダクション](#イントロダクション)

Arduino IDEは、[OpenCR]および[OpenCM9.04]に互換性がある開発ツールです。
[OpenCM IDE]は、ArduinoIDEに置き換えることができますが、可能であればArduino IDEを使用することを推奨します。  
Arduino IDEを使用すると、ユーザーはスケッチを作成するときに[DYNAMIXEL SDK]と[DYNMAIXEL Workbench]を適用できます。  

# [ソフトウェアのインストール](#ソフトウェアのインストレール)

- `ダウンロード` [Arduino IDE]

## [Linuxにインストール](#linuxにインストール)

### [USBポート設定](#usbポート設定)

#### OpenCR
OpenCRのUSBポートがルート権限なしでArduino IDEのプログラムをアップロードできるようにします。  

```bash
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/99-opencr-cdc.rules
$ sudo cp ./99-opencr-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

![](/assets/images/platform/turtlebot3/preparation/7_1_1_usb_port_setting.png)

#### OpenCM9.04
OpenCM9.04のUSBポートがルート権限無しでArduino IDEのプログラムをアップロードできるようにします。

```
wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/99-opencm-cdc.rules
sudo cp ./99-opencm-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
```

### [コンパイラ設定](#コンパイラ設定)
OpenCR / OpenCM9.04ライブラリは、32ビットプラットフォーム用に構築されているため、64ビットPCの場合はArduino IDEに関連する32ビット関連のコンパイラが必要です。

```bash
$ sudo apt-get install libncurses5-dev:i386
```

![](/assets/images/platform/turtlebot3/preparation/7_1_2_compiler_settings.png)

### [Arduino IDEのインストール(Linux)](#arduino-ideのインストール-linux)
arduinoの公式ホームページからArduino IDEの最新バージョンをダウンロードしインストールします。 現在、OpenCRおよびOpenCM9.04はバージョン1.6.4以降と互換性があります。  

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

次に、ダウンロードしたファイルを目的のフォルダに解凍し、ターミナルからインストールファイルを実行します。 この場合、以下に示す例では、ユーザーの最上位フォルダー(~/)にフォルダツールを作成します。 このフォルダは、Arduino IDEフォルダとして機能します。  

```bash
$ cd ~/tools/arduino-1.8.3
$ ./install.sh
```

インストールされているArduino IDEのファイルパスを、PATHと呼ばれる絶対パスとしてbashrcファイルに設定します。 ここでは、geditエディターの使用をお勧めします。  (必要に応じて、別のエディターを使用してください。)最後に、変更を適用します。

```bash
$ gedit ~/.bashrc
$ export PATH=$PATH:$HOME/tools/arduino-1.8.3
$ source ~/.bashrc
```

### [Arduino IDEの実行(Linux)](#arduino-ideの実行-linux)
LinuxプラットフォームでArduino IDEを実行するには、次のようにターミナルに入力します。

```bash
$ arduino
```

![](/assets/images/platform/turtlebot3/preparation/ide0.png)

### [Arduino IDEへのポーティング(Linux)](#arduino-ideへのポーティング)

#### 環境設定
Arduino IDEを実行した後、IDEのトップメニューでファイル → 設定をクリックします。 設定ウィンドウが表示されたら、次のリンクをコピーして追加のボードマネージャーのURLをテキストボックスに貼り付けます。
ボードに基づいて適切なファイルURLを選択してください。

##### OpenCR

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

![](/assets/images/platform/turtlebot3/preparation/ide1.png)

##### OpenCM9.04

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json
```

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_1.png)

#### Boards Managerからボードパッケージをインストールする
ツール → ボード → ボードマネージャー をクリックします。 ネットワークの状態によっては、この手順に20分以上かかる場合があります。

![](/assets/images/platform/turtlebot3/preparation/ide2.png)

##### OpenCR

テキストボックスにOpenCRと入力しOpenCR by ROBOTISパッケージを見つけます。 見つけたらインストールをクリックします。

![](/assets/images/platform/turtlebot3/preparation/ide3.png)

インストール後、"INSTALLED"と表示されます。

![](/assets/images/platform/turtlebot3/preparation/ide4.png)

OpenCR Boardがツール → ボードのリストにあるかどうかを確認します。 これをクリックしOpenCRボードのソースをインポートします。

![](/assets/images/platform/turtlebot3/preparation/ide5.png)

##### OpenCM9.04

テキストボックスにOpenCM9.04と入力し、OpenCM9.04 by ROBOTISパッケージをみつけます。 見つけたらインストールをクリックします。

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_3.png)

インストール後、"INSTALLED"と表示されます。

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_4.png)

OpenCM9.04がツール → ボードのリストにあるか確認します。 これをクリックして、OpenCM9.04ボードのソースをインポートします。

![](/assets/images/parts/controller/opencm904/opencm9.04_linux_5.png)

#### ポート設定
このステップでは、プログラムアップロードのポート設定を示しています。 OpenCR/OpenCM9.04は、マイクロUSBポートを介してPCに接続する必要があります。  

ツール → ポート → /dev/ttyACM0 を選択します。

**警告**：文字列 **/dev/ttyACM0** の最後の桁の値 **0** は、接続されているPC環境によって値が異なる場合があります。
{: .notice--warning}

![](/assets/images/platform/turtlebot3/preparation/ide6.png)

### [Modemmanagerの削除](#modemmanagerの削除)

**OpenCR**のみがこの手順を必要とします。 OpenCM9.04を使用している場合は、この章をスキップしてください。
{: .notice--warning}

Arduino IDEでプログラミングし、プログラムをOpenCRにアップロードした後、OpenCRが再起動 → 再接続されます。
同時に、Linuxのモデム関連パッケージは、デバイスを管理するためにATコマンドを送信します。
このコマンドはOpenCRの接続エラーを示しているため、この手順を事前に実行する必要があります。

```bash
$ sudo apt-get purge modemmanager
```


## [Macにインストール](#macにインストール)

### [Arduino IDEのインストール(Mac)](#arduino-ideのインストール-mac)

arduinoの公式ホームページからArduino IDEの最新バージョンをダウンロードしインストールします。 現在、OpenCRおよびOpenCM9.04はバージョン1.6.4以降と互換性があります。  

- `ダウンロード` [Arduino IDE]

### [Arduino IDEの実行(Mac)](#arduino-ideの実行-mac)

MacプラットフォームでArduino IDEを実行するには、次のようにArduino IDEアイコンをクリックします。

![](/assets/images/parts/controller/opencr10/arduino_mac_01.png)

![](/assets/images/parts/controller/opencr10/arduino_mac_02.png)

### [Arduino IDEのポーティング(Mac)](#arduino-ideのポーティング-mac)

#### 環境設定
Arduino IDEを実行した後、IDEのトップメニューでファイル → 設定をクリックします。 設定ウィンドウが表示されたら、次のリンクをコピーして追加のボードマネージャーのURLをテキストボックスに貼り付けます。
ボードに基づいて適切なファイルURLを選択してください。

##### OpenCR

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

![](/assets/images/parts/controller/opencr10/arduino_mac_03.png)

##### OpenCM9.04

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json
```

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_1.png)

#### Boards Managerからボードパッケージをインストールする
ツール → ボード → ボードマネージャー をクリックします。 ネットワークの状態によっては、この手順に20分以上かかる場合があります。

![](/assets/images/parts/controller/opencr10/arduino_mac_04.png)

##### OpenCR

テキストボックスにOpenCRと入力しOpenCR by ROBOTISパッケージを見つけます。 見つけたらインストールをクリックします。  
インストール後、"INSTALLED"と表示されます。  
OpenCR Boardがツール → ボードのリストにあるかどうかを確認します。 これをクリックしOpenCRボードのソースをインポートします。  

![](/assets/images/parts/controller/opencr10/arduino_mac_05.png)

##### OpenCM9.04

テキストボックスにOpenCM9.04と入力し、OpenCM9.04 by ROBOTISパッケージをみつけます。 見つけたらインストールをクリックします。

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_3.png)

インストール後、"INSTALLED"と表示されます。

![](/assets/images/parts/controller/opencm904/opencm9.04_mac_4.png)

OpenCM9.04がツール → ボードのリストにあるか確認します。 これをクリックして、OpenCM9.04ボードのソースをインポートします。

#### ポート設定
このステップでは、プログラムアップロードのポート設定を示しています。 OpenCR/OpenCM9.04は、マイクロUSBポートを介してPCに接続する必要があります。  
ツール → ポート → /dev/cu.usbmodem1411 を選択します。

**警告**：接続されているPC環境によっては、 **/dev/cu.usbmodem1411** の値が異なる場合があります。
{: .notice--warning}

![](/assets/images/parts/controller/opencr10/arduino_mac_06.png)

## [Windowsにインストール](#windowsにインストール)

### [ドライバーのインストール](#ドライバーのインストール)
WindowsでOpenCRおよびOpenCM9.04マイクロUSBポートをシリアルポートとして使用するには、USB CDCドライバーが必要です。 ST社が提供するUSBドライバをインストールできます。

[http://www.st.com/en/development-tools/stsw-stm32102.html](http://www.st.com/en/development-tools/stsw-stm32102.html)

### [Arduino IDEのインストール(Windows)](#arduino-ideのインストール-windows)
arduinoの公式ホームページからArduino IDEの最新バージョンをダウンロードしインストールします。 現在、OpenCRおよびOpenCM9.04はバージョン1.6.4以降と互換性があります。  

- `ダウンロード` [Arduino IDE]

Arduino IDE for Windowsにはインストール版と圧縮版がありますので、好みの方法でインストールしてください。

### [Arduino IDEへのポーティング(Windows)](#arduino-ideへのポーティング)

#### Preferences
Arduino IDEを起動したら、IDEのトップメニューにある ファイル → 環境設定 をクリックします。環境設定ウィンドウが表示されたら、以下のリンクをコピーして、Additional Boards Manager URLsのテキストボックスに貼り付けます。(この作業には約20分かかります。)

##### OpenCR

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

##### OpenCM9.04

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json
```

####  Boards Managerからボードパッケージをインストールする
ネットワークの状態によっては、この手順に20分以上かかる場合があります。

##### OpenCR

ツール → ボード → ボードマネージャー をクリックします。

![](/assets/images/parts/controller/opencm904/opencm904_win_2.png)

テキストボックスにOpenCRと入力しOpenCR by ROBOTISパッケージを見つけます。 見つけたらインストールをクリックします。

![](/assets/images/parts/controller/opencr10/arduino_win_01.png)

インストール後、"INSTALLED"と表示されます。

![](/assets/images/parts/controller/opencr10/arduino_win_02.png)

OpenCR Boardがツール → ボードのリストにあるかどうかを確認します。 これをクリックしOpenCRボードのソースをインポートします。  


##### OpenCM9.04

テキストボックスにOpenCM9.04と入力し、OpenCM9.04 by ROBOTISパッケージをみつけます。 見つけたらインストールをクリックします。

![](/assets/images/parts/controller/opencm904/opencm904_win_3.png)

インストール後、"INSTALLED"と表示されます。

![](/assets/images/parts/controller/opencm904/opencm904_win_4.png)

テキストボックスにOpenCM9.04と入力し、OpenCM9.04 by ROBOTISパッケージをみつけます。 見つけたらインストールをクリックします。

![](/assets/images/parts/controller/opencm904/opencm904_win_5.png)

#### ポート設定
このステップでは、プログラムアップロード時のポート設定を行います。パソコンとOpenCRをUSBポートで接続する必要があります。
ツール → ポート → COM1を選択します。

**注意** : **COM1** の値は、PCに接続されている環境によって異なる場合があり 。
{: .notice--warning}

{% include en/software/arduino/arduino_library_api.md %}

# [例](#例)

## [OpenCM9.04 例](#opencm904-例)

1. [LED]{: .popup}
2. [Button]{: .popup}
3. [Buzzer]{: .popup}
4. [PWM]{: .popup}
5. [EEPROM]{: .popup}
6. [DYNAMIXEL Workbench]{: .popup}
7. [Servo]{: .popup}
8. [SD Card]{: .popup}
9. [MS5540S]{: .popup}
10. [MPU6050 DMP]{: .popup}
11. [0.96" OLED LCD]{: .popup}

# [アドバンスドユーザー](#アドバンスドユーザー)

## [ブートローダの書き込み(OpenCR)](#ブートローダの書き込み-OpenCR)

**注意**：OpenCRブートローダーが更新された場合にのみ、ブートローダーの更新を実行してください。 製品にはすでにデフォルトのブートローダーがインストールされています。
{: .notice--warning}

OpenCRボードのメインMCUに使用されるSTM32F7xxは、DFU(Device Firmware Upgrade)をサポートしています。 これにより、主にブートローダーの初期化、リカバリーモード、ブートローダーの更新をUSBで行うことで、MCUの内蔵ブートローダー単体でDFUプロトコルで起動させることができるようになります。 USBでブートローダーを使用しても、他のJTAG機器を使用せずにブートローダーを使用できることが最大の利点です。 STLinkなどの書き込み/デバッグ機器を使用せずに、MCUに内蔵されたDFUモードを使用してファームウェアを書き込みます。

### プログラマの設定
ツール → DFU-UTIL を選択

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

### Run DFU mode.
`ブートボタン`が押されている間に`リセットボタン`を押してください。これによりDFUモードが起動します。  

#### Linux
DFUモードに正常に入り、端末に*lsusb*を入力すると、`STMicroelectronicsSTM Device in DFU Mode`と表示されます。

![](/assets/images/platform/turtlebot3/preparation/ide10.png)

#### Windows
DFUモードに正常に入り、デバイスマネージャーの**Universal Serial Bus devices**の下に`STM32 BOOTLOADER`と表示されます。

![](/assets/images/parts/controller/opencr10/dfu_mode_win.png)

### Burn Bootloader

`ツール` >`ブートローダーの書き込み`をクリックして、ブートローダーを書き込みます。

![](/assets/images/platopencmform/turtlebot3/preparation/ide9.png)



[Arduino IDE]: https://www.arduino.cc/en/Main/Software
[OpenCR]: /docs/jp/parts/controller/opencr10/
[OpenCM9.04]: /docs/jp/parts/controller/opencm904/
[OpenCM IDE]: /docs/en/software/opencm_ide/getting_started/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[DYNMAIXEL Workbench]: /docs/jp/software/dynamixel/dynamixel_workbench/

[LED]: /docs/en/popup/opencm904_ex_led/
[Button]: /docs/en/popup/opencm904_ex_button/
[Buzzer]: /docs/en/popup/opencm904_ex_buzzer/
[PWM]: /docs/en/popup/opencm904_ex_pwm/
[EEPROM]: /docs/en/popup/opencm904_ex_eeprom/
[DYNAMIXEL Workbench]: /docs/en/popup/opencm904_ex_dynamixelworkbench/
[Servo]: /docs/en/popup/opencm904_ex_servo/
[SD Card]: /docs/en/popup/opencm904_ex_sdcard/
[MS5540S]: /docs/en/popup/opencm904_ex_ms5540s/
[MPU6050 DMP]: /docs/en/popup/opencm904_ex_mpu6050dmp/
[0.96" OLED LCD]: /docs/en/popup/opencm904_ex_oled/
