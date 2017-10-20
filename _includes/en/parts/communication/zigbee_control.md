## [ZIGBee Wireless Control](#zigbee-wireless-control)

### ZIGBee
![Zig-100/110](/assets/images/parts/communication/zig_100_110.png)

[ZIG-100/110] uses ZIGBee for wireless communication. ZIGBee, like Bluetooth, is the communication technology commonly used in Personal Area Network (PAN). The communication quality of ZIGBee is better than that of IR, so it allows many users to control their robots without interferences.

`Caution` Please note that not all products include a zigbee module and may need to be purchased separately.
{: .notice--warning}

### Controller & ZIGBee

OLLO and Bioloid both use the RC-100, which uses IR communication method. To upgrade to the Zigbee communication method, you must purchase the  ZIG-110 set separately. The ZIG-110 set includes one Zig-100 module, which is attached to the [RC-100], and one Zig-110 module which is attached to the [Controller].

`Note` The modules in a single Zigbee set have been preconfigured to communicate with each other. Therefore, a module from one set may not work with a module from another set. Please be careful not to mix them up.
{: .notice}

|ZIG-100 installed in RC-100|ZIG-110 installed in CM-100|
|:---:|:---:|
|![Zig-100_RC-100][Zig-100_RC-100]|![Zig-110_CM-100][Zig-110_CM-100]|

|ZIG-110 installed in CM-510|ZIG-100 installed in CM-5|
|:---:|:---:|
|![Zig-110_CM-510][Zig-110_CM-510]|![Zig-100_CM-5][Zig-100_CM-5]|

[ZIG-100/110]: /docs/en/parts/communication/zig-110/
[RC-100]: /docs/en/parts/communication/rc-100/
[Controller]: /docs/en/parts/controller/compatibility/

[Zig-100_RC-100]: /assets/images/parts/communication/rc-100_zig_100.jpg
[Zig-110_CM-100]: /assets/images/parts/communication/cm_100_zig_110.jpg
[Zig-110_CM-510]: /assets/images/parts/communication/cm_510_zig_110.png
[Zig-100_CM-5]: /assets/images/parts/communication/cm_5_zig_100.png
