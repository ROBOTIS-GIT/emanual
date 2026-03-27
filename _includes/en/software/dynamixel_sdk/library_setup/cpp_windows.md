{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="library-setup-cpp-windows">Library Setup &lt;C++ Windows&gt;</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

This section provides instructions on building the SDK.

# [Install requirements](#install-requirements)
- In this section, we used visual studio as the IDE for building the SDK.

  [Download Visual Studio Community for Windows Desktop](https://www.visualstudio.com/en-us/products/visual-studio-express-vs.aspx)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/visualstudio.png)

# [Build the SDK](#build-the-SDK)
**NOTE**: This instruction assumes a 64-bit Windows system. If you are using 32-bit Windows, simply follow the same steps using the 32-bit version instead.
{: .notice}
- Open the project solution file (`dxl_x64_cpp.sln`) located in the `[DynamixelSDK folder]/c++/build/win64` directory.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/visualstudio1.png)

- If below dialog appears, select `OK`. This will adjust the toolset settings depending on your version of Visual Studio and Windows.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/upgradetoolset.png)


- In the Solution Explorer on the right side, right-click the dxl_x64_cpp solution and select Build.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/buildprocess.png)

<br>

- **The SDK build is complete.**
- **If the build was successful, the compiled library file will be saved at :** `[DynamixelSDK folder]/c++/build/[win64]/output/dxl_x64_cpp.dll`
  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/buildoutput.png)

<details>
<summary>
![](/assets/images/icon_unfold.png) **Check Build Properties**
</summary>

- You can check or change the build properties through right-clicking on the project in the Solution Explorer and selecting Properties.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/buildproperties1.png)

- Build properties is shown as below

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/buildproperties2.png)
  - Output Directory: `$(SolutionDir)output\`
  - Intermediate Directory: `$(Configuration)\`
  - Platform Toolset: `Visual Studio 20XX (v000)`
  - Configuration Type: `Dynamic Library (.dll)`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/buildproperties3.png)
  - Additional Include Directories: `..\..\..\include\dynamixel_sdk`
</details>

{% capture notice_01 %}
**WARNING**:
If the library file needs to be built in a lower or higher version of Visual Studio, change the `Platform Toolset` into the needed value. (ex: To use the DynamixelSDK c ver. library file in the MATLAB 2010 or LabVIEW 2010, the `Platform Toolset` should be changed to `Visual Studio 2009` lower.)
{% endcapture %}
<div class="notice--warning">{{ notice_01 | markdownify }}</div>

# [CMake Build](#cmake-build)
- Latest DYNAMIXEL SDK supports CMake build. 

## Build System Update

The existing OS-specific `make` build system has been unified into a single `CMake`-based build system.

| Category               | Legacy (`sln`)         | New (`cmake`)                     |
|------------------------|-------------------------|-----------------------------------|
| Build file             | OS-dependent            | Unified across platforms          |
| Generated Files        | `libdxl_{sys_env}_cpp.dll`| `libdxl_cpp.dll`                |
| Install Include Paths  |                         | `C:\Program Files (x86)\dynamixel_sdk\include\dynamixel_sdk\` |

## Build with CMake

Install cmake from [cmake download](https://cmake.org/download/).  
Download the msi file and install it.

![cmake_install](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/cmake_build/cmake_install.png)  

Install Visual Studio build tools from [Visual Studio download](https://visualstudio.microsoft.com/downloads/).  
Start Visual Studio Installer and install the build tools.  

![vs_build_tool_install](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/cmake_build/vs_build_tool_install.png)

After installation, open the `x64 Native Tools Command Prompt for VS` as **administrator** and navigate to the DynamixelSDK/c directory.  
Build the SDK. `--target install` option makes the library files installed to the system.  
You can skip installing the library files by omitting the --target install option.  
``` bash
$ cd DynamixelSDK/c++
$ cmake -B cmake_build
$ cmake --build cmake_build --target install
$ cmake --build cmake_build --target uninstall # Uninstall the library files from the system
```

Build result can be found in the `cmake_build` folder and the library files are installed to the system(C:\Program Files (x86)\dynamixel_sdk_c\).

## Build the Example Code with CMake
The example code also supports unified CMake build.  
The executable file can be found in the `build/Debug` folder.

``` bash
$ cd DynamixelSDK/c++/example/protocol2.0
$ cmake -B build
$ cmake --build build
$ cd build/Debug
$ set PATH=C:\Program Files (x86)\dynamixel_sdk\bin;%PATH%
$ broadcast_ping.exe
```
