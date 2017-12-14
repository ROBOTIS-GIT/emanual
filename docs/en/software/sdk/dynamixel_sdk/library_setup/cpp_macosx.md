---
layout: archive
lang: en
ref: dynamixel_sdk_library_setup_cpp_macosx
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/library_setup/cpp_macosx/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 5"></div>
<div style="counter-reset: h1 2"></div>

## [CPP MacOSX](#cpp-macosx)

### [Compiler and Builder](#compiler-and-builder)

#### [Compiler](#compiler)

* GNU gcc ver. 5.4.0 20160609 or higher
* To check the version of your gcc compiler:  

``` bash
$ gcc -v 
```

* Download the required compiler:  

``` bash 
$ sudo apt-get install gcc-5
```

#### [Builder](#builder)

* Build-essential pkg → make
* Download:  

``` bash 
$ sudo apt-get install build-essential
```

#### [Dependent Packages](#dependent-packages) 

* Packages needed for cross-compiling 
* Download:  

``` bash 
$ sudo apt-get install gcc-multilib g++-multilib
```

#### [Build the Library](#build-the-library)

* PC which is being sold recently only comes as 64bit platform. The Makefile is located in the following folder: `[DynamixelSDK folder]/cpp/build/mac` folder for 64-bit platforms.  

Please note that if you will be building the 64-bit example source, you should build the 64-bit library.

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/library_file/cpp6.png)


* Go to the Makefile's directory located in `[DynamixelSDK folder]/cpp/build/mac` using $ `cd`.

* To build the library file:  

``` bash
$ make
```

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/library_file/cpp1.png)


* If there is an error:  

``` bash
$ make clean && make
```

* To delete the library file and object files:  

``` bash
$ make clean
```

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/library_file/cpp2.png)

##### Copy (Install) the Library to the Root Directory

* To make library file and copy it to the root directory (to handle the serial port):  

``` bash
$ sudo make install
```

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/library_file/cpp3.png)

* If there is an error:  

``` bash
$ sudo make uninstall && sudo make install
```
 
OR

``` bash
$ sudo make reinstall
```

* To delete the library file from the root directory:  

``` bash
$ sudo make uninstall
```

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/library_file/cpp4.png)

* To recopy the library file to the root directory:  

``` bash
$ sudo make reinstall
```

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/library_file/cpp5.png)

* You will see the built library file in `[DynamixelSDK folder]/cpp/build/mac/libdxl_mac_cpp.dylib`


### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The Dynamixel SDK sample code for CPP uses the library files(.dylib for Mac) built in CPP language.

You should build library files in `[DynamixelSDK folder]/c++/build/mac/libdxl_mac_cpp.dylib` with its own source code as shown above. 

* The Makefile file for building source is in `[DynamixelSDK folder]/c++/example/protocol1.0/read_write/mac` folder. 

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/sample_code/excp4.png)

* On the terminal, go to the Makefile located folder `/c++/example/protocol1.0/read_write/mac`, for example, using `cd`.

* To build executable file, type: 

[Terminal] `$ make`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/sample_code/excp1.png)

If it shows some error, try `make clean` and `make` it again.

* To delete executable file, type: 

[Terminal] `$ make clean`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/sample_code/excp2.png)

* Make the port available to be used

[Terminal] `$ sudo chmod a+rw /dev/tty.usbserial-xxxx`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/sample_code/excp3.png)

* Run the source code

[Terminal] `$ ./read_write`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/mac/sample_code/excp5.png)