---
layout: archive
lang: en
ref: dynamixel_sdk_library_setup_cpp_linux
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/library_setup/cpp_linux
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 4"></div>
<div style="counter-reset: h1 2"></div>

## [CPP Linux](#cpp-linux)

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


* Choose which format (32bit or 64bit) do you want to build in. The Makefile is located in the following folder: `[DynamixelSDK folder]/cpp/build/linux32` OR `[DynamixelSDK folder]/cpp/build/linux64` folder for 64-bit platforms OR `[DynamixelSDK folder]/cpp/build/linux_sbc` folder for SBCs.  

  Please note that if you will be building the 32-bit example source, you should build the 32-bit library.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/CPP/cpp6.png)


* Go to the Makefile's directory located in `[DynamixelSDK folder]/cpp/build/linux32` OR `[DynamixelSDK folder]/cpp/build/linux64` OR `[DynamixelSDK folder]/cpp/build/linux_sbc` using $ `cd`.

* To build the library file:  

``` bash
$ make
```

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/CPP/cpp1.png)


* If there is an error:  

``` bash
$ make clean && make
```

* To delete the library file and object files:  

``` bash
$ make clean
```

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/CPP/cpp2.png)

##### Copy (Install) the Library to the Root Directory

* To make library file and copy it to the root directory (to handle the serial port):  

``` bash
$ sudo make install
```

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/CPP/cpp3.png)

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

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/CPP/cpp4.png)

* To recopy the library file to the root directory:  

``` bash
$ sudo make reinstall
```

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/CPP/cpp5.png)

* You will see the built library file in `[DynamixelSDK folder]/c/build/[linuxXX]/libdxl_xYY_cpp.so`