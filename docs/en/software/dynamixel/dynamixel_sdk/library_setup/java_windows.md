---
layout: archive
lang: en
ref: java_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/java_windows/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<style>body {counter-reset: h1 4 !important;}</style>
<div style="counter-reset: h2 10"></div>

<!--[dummy Header 1]>
  <h1 id="library-setup"><a href="#library-setup">Library Setup</a></h1>
<![end dummy Header 1]-->

## [Java Windows](#java-windows)

### [Compiler and Builder](#compiler-and-builder)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/eclipse.png)

* [Download the Eclipse IDE for Java (`Windows 32-bit` or `Windows 64-bit`)](http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/neonr)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/library_file/a1.png)

### [Required Packages](#required-packages)

* [Download Java Development Kit (JDK) (`Windows 32-bit` or `Windows 64-bit`)](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/library_file/b1.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/library_file/b2.png)

  OR

* [Download Java Runtime Environment (JRE) (`Windows 32-bit` or `Windows 64-bit`)](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/library_file/b3.png)

### [Java Native Access(JNA)](#java-native-accessjna)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/jna.jpg)

* [Download jnaX.Y.Z.jar](https://github.com/java-native-access/jna)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/library_file/b4.png)

* Move folder to `[DynamixelSDK folder]/java/dynamixel_functions_java/`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/library_file/b5.png)

## [Function Reference](#function-reference)

* The function reference file is located in `[DynamixelSDK folder]/java/dynamixel_functions_java/x86 or x64/Dynamixel.java`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/library_file/2.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/library_file/1.png)

### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The DYNAMIXEL SDK example code for Java uses the library files(.dll for Windows) built in C language.

Each released DYNAMIXEL SDK have latest library files in `[DynamixelSDK folder]/c/build/[winXX]/output/dxl_xYY_c.dll` which were built by its own source code.

#### Make Java Project

* Set workspace

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/1.png)

* Make new project. Click `New - Project...`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/3.png)

* Select `Java Project`, then click `Next`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/4.png)

* Type `Project Name`, then click `Next`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/5.png)

#### Import function reference

* Open `Configure Build Path`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/6.png)

* Click `Link Additional Source to Project`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/7.png)

* Click Browse

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/8.png)

* Select the folder `output` in `c` language folder, then click `ok`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/9.png)

* Click `Finish`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/10.png)


##### Import DynamixelSDK library

* Click `Link Additional Source to Project`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/11.png)

* Click Browse

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/12.png)

* Select the folder `x64` in `java` language folder, then click `ok`  
  (for x86 platform, select `[DynamixelSDK folder]/java/dynamixel_functions_java/x86`)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/13.png)

* Tpye `Folder name` and Click `Finish`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/14.png)

#### Import JNA

* Go to `Libraries` tap and Click `Add External JARs`.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/15.png)

* Choose the `jna-X.Y.Z.jar` downloaded previously.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/16.png)

* Click `Apply and Close`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/17.png)

#### Run example

* Put `ReadWrite.java` source into the folder `src` on the screen

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/18.png)

* Adjust the values surrounded with red circle to proper value as shown in the comment.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/19.png)

* Click `Run` in the Eclipse toolbox above. Console window will show the results

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/java/windows/sample_code/20.png)
