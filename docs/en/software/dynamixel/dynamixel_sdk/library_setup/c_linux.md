---
layout: archive
lang: en
ref: dynamixel_sdk_library_setup_c_linux
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/c_linux/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h1 2"></div>

# [Library Setup](#library-setup)

## [C Linux](#c-linux)

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

* Choose which format (32bit or 64bit) do you want to build in.  
  The Makefile is located in the following folder: `[DynamixelSDK folder]/c/build/linux32` OR `[DynamixelSDK folder]/c/build/linux64` folder for 64-bit platforms OR `[DynamixelSDK folder]/c/build/linux_sbc` folder for SBCs.  
  Please note that if you will be building the 32-bit example source, you should build the 32-bit library.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/library_file/c6.png)

* Go to the Makefile's directory located in `[DynamixelSDK folder]/c/build/linux32` OR `[DynamixelSDK folder]/c/build/linux64` OR `[DynamixelSDK folder]/c/build/linux_sbc` using $ `cd`.


* To build the library file:  

  ``` bash
  $ make
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/library_file/c1.png)


* If there is an error:  

  ``` bash
  $ make clean && make
  ```

* To delete the library file and object files:  

  ``` bash
  $ make clean
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/library_file/c2.png)

##### Copy (Install) the Library to the Root Directory

* To make library file and copy it to the root directory (to handle the serial port):  

  ``` bash
  $ sudo make install
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/library_file/c3.png)

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

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/library_file/c4.png)

* To recopy the library file to the root directory:  

  ``` bash
  $ sudo make reinstall
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/library_file/c5.png)

* You will see the built library file in `[DynamixelSDK folder]/c/build/[linuxXX]/libdxl_xYY_c.so`

### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The Dynamixel SDK example code for C uses a .so (Linux) library built in C.  
By doing above, each released Dynamixel SDK have latest library files in `[DynamixelSDK folder]/c/build/[linuxXX]/libdxl_xYY_c.so` which were built by its own source code. 

* Go to the Makefile's directory using `cd`:  

  ``` bash
  $ cd [DynamixelSDK folder]/c/example/protocol1.0/read_write/linux32
  ```

  OR

  ``` bash 
  $ cd [DynamixelSDK folder]/c/example/protocol1.0/read_write/linux64
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/sample_code/exc4.png)

* Build the executable file: 

  ``` bash
  $ make
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/sample_code/exc1.png)

* If there is an error, `$ make clean` then `$ make` again.

* To delete the executable file, `$ make clean`.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/sample_code/exc2.png)

* Access the port you will be using to communicate with Dynamixel: 

  ``` bash
  $ sudo chmod a+rw /dev/ttyUSB0
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/sample_code/exc3.png)

* Run the executable file: 

  ``` bash
  $ ./read_write
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/sample_code/exc5.png)
