---
layout: archive
lang: en
ref: dynamixel_sdk_library_setup_cpp_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/library_setup/cpp_windows
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 3"></div>
<div style="counter-reset: h1 2"></div>

## [CPP Windows](#cpp-windows)

### [Compiler and Builder](#compiler-and-builder)

* [Download Visual Express for Windows Desktop](https://www.visualstudio.com/en-us/products/visual-studio-express-vs.aspx)

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/tree/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/Windows/new/vs.png)

### [Building the Library](#building-the-library)

* Run the project solution file (.sln) located in the `[DynamixelSDK folder]/c++/build/win32` directory (or `[DynamixelSDK folder]/c++/build/win64` directory)

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/Windows/cpp/1.png)

* Under Solution Explorer, right click on the project and select Properties.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/Windows/cpp/2.png)

* Under General Configuration Properties, confirm that the paths and file extensions are set as follows:

 * Output Directory: `$(SolutionDir)output\`
 * Intermediate Directory: `$(Configuration)\`
 * Target Extension: `.dll`
 * Configuration Type: `Dynamic Library (.dll)`

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/Windows/cpp/3.png)

* Confirm that the Additional Include Directories path under the General C/C++ Configuration Properties tree is as follows:

 `..\..\..\include`

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/Windows/cpp/4.png)

* Right click on the project and select Build to build the library.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/Windows/cpp/5.png)

* The built library file is located in `[DynamixelSDK folder]/c++/build/[winXX]/output/dxl_xYY_cpp.dll`
