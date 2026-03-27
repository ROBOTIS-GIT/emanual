{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="library-setup-cpp-linux">Library Setup &lt;C++ Linux&gt;</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

This section provides instructions on building the SDK.

# [Install requirements](#install-requirements)

- The DYNAMIXEL SDK requires GNU gcc ver. 5.4.0 20160609 or higher
- To check the version of your gcc compiler
``` bash
$ gcc -v
```

- Download the requirements
``` bash
$ sudo apt-get install gcc
$ sudo apt-get install build-essential
$ sudo apt-get install gcc-multilib g++-multilib # For cross-compiling
```

# [Build the SDK](#build-the-SDK)
- Check your system architecture
``` bash
$ uname -m
```

- Enter the appropriate build folder depending on your system and build the SDK
``` bash
$ cd DynamixelSDK/c++/build/linux64 # for 64-bit systems
$ sudo make install
```
- make sure to enter the correct folder according to your system architecture.
  - `linux64` for 64-bit systems
  - `linux32` for 32-bit systems
  - `linux_sbc` for ARM-based SBCs like Raspberry Pi

- If the build completes successfully, you should see the .so file generated inside the build folder.
``` bash
$ ls
libdxl_x86_cpp.so Makefile
```

- Grant permission to access the port
```bash
$ sudo chmod 666 /dev/ttyUSB0
```

<br>
- Common `make` commands for building the SDK
``` bash
$ make              # Compile the source code and generate binaries
$ make install      # Install the library files to the system
$ make clean        # Remove all build files and reset the build environment
$ make uninstall    # Remove files installed by 'make install' from the system
$ make reinstall    # Reinstall by cleaning, rebuilding, and installing again
```
{: .notice--success}


# [CMake Build](#cmake-build)
- Latest DYNAMIXEL SDK supports CMake build.  

## Build System Update

The existing OS-specific `make` build system has been unified into a single `CMake`-based build system.

| Category               | Legacy (`make`)         | New (`cmake`)                     |
|------------------------|-------------------------|-----------------------------------|
| Build file           | OS-dependent            | Unified across platforms          |
| Generated Files        | `libdxl_{sys_env}_cpp.so` | `libdxl_cpp.so` |
| Install Include Paths  | `/usr/local/include/dynamixel_sdk/` | `/usr/local/include/dynamixel_sdk/` |

## Build with CMake

Install build-essential, and cmake.
``` bash
$ sudo apt-get install build-essential
$ sudo apt-get install cmake
```

Build the SDK. `--target install` option makes the library files installed to the system.  
You can skip installing the library files by omitting the --target install option.
``` bash
$ cd DynamixelSDK/c++
$ sudo cmake -B cmake_build
$ sudo cmake --build cmake_build --target install
$ sudo cmake --build cmake_build --target uninstall # Uninstall the library files from the system
```

Build result can be found in the `cmake_build` folder and the library files are installed to the system(`/usr/local/lib/libdxl_c.so`, `/usr/local/include/dynamixel_sdk_c/`).

## Build the Example Code with CMake
The example code also supports unified CMake build.  
The executable file can be found in the `build` folder.

``` bash
$ cd DynamixelSDK/c++/example/protocol2.0
$ sudo cmake -B build
$ sudo cmake --build build
$ cd build
$ ./broadcast_ping
```
