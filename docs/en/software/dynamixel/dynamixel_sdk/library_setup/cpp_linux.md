---
layout: archive
lang: en
ref: cpp_linux
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/cpp_linux/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<style>body {counter-reset: h1 4 !important;}</style>
<div style="counter-reset: h2 4"></div>

<!--[dummy Header 1]>
  <h1 id="library-setup"><a href="#library-setup">Library Setup</a></h1>
<![end dummy Header 1]-->

## [CPP Linux](#cpp-linux)

### [Compiler and Builder](#compiler-and-builder)

#### [Compiler](#compiler)

* The DYNAMIXEL SKD requires GNU gcc ver. 5.4.0 20160609 or higher
* To check the version of your gcc compiler:  

  ``` bash
  $ gcc -v 
  ```

* Download the required compiler:  

  ``` bash 
  $ sudo apt-get install gcc
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

* Choose which format (32bit or 64bit) of the library you will be bulding.
  The Makefile is located in the following folder: `[DynamixelSDK folder]/cpp/build/linux32` OR `[DynamixelSDK folder]/cpp/build/linux64` folder for 32/64-bit platforms OR `[DynamixelSDK folder]/cpp/build/linux_sbc` folder for ARM SBCs.  
  Please note that if you intend to use the 32-bit example applications, you must build the 32-bit library.


  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/library_file/cpp6.png)


* Go to the Makefile's directory located in `[DynamixelSDK folder]/cpp/build/linux32` OR `[DynamixelSDK folder]/cpp/build/linux64` OR `[DynamixelSDK folder]/cpp/build/linux_sbc` using $ `cd`.

* To build the library file:  

  ``` bash
  $ make
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/library_file/cpp1.png)

* If there is an error, try rebuilding the package after cleaning any leftover files.

  ``` bash
  $ make clean && make
  ```

* To delete the library file and object files after a successful build:

  ``` bash
  $ make clean
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/library_file/cpp2.png)

##### Copy (Install) the Library to the Root Directory

* To make library file and copy it to the root directory (to handle the serial port):  

  ``` bash
  $ sudo make install
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/library_file/cpp3.png)

* If there is an error, you can retry the installation:

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

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/library_file/cpp4.png)

* To recopy the library file to the root directory:  

  ``` bash
  $ sudo make reinstall
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/library_file/cpp5.png)

* You will see the built library file in `[DynamixelSDK folder]/c/build/[linuxXX]/libdxl_xYY_cpp.so`

### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The DYNAMIXEL SDK sample code for CPP uses a .so (Linux Shared Object) library built in the CPP language.

The previous instructions walk you thorough building the latest library files `[DynamixelSDK folder]/c++/build/[linuxXX]/libdxl_xYY_cpp.so` with its own source code. 

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/sample_code/excp4.png)

* Go to the Makefile's directory using `cd`:  

* To build executable file, type: 

  ```bash
  $ make
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/sample_code/excp1.png)


* If there is an error, `$ make clean` then `$ make` again.

* To delete the executable file, `$ make clean`.

  ```bash
  $ make clean
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/sample_code/excp2.png)

* Access the port you will be using to communicate with DYNAMIXEL: 

  ```bash
  $ sudo chmod a+rw /dev/ttyUSB0
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/sample_code/excp3.png)

* Run the executable code

  ```bash
  $ ./read_write
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/linux/sample_code/excp5.png)
