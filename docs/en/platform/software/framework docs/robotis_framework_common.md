### 1. Overview
The package contains commonly used Headers for the ROBOTIS Framework.

### 2. Description

#### 2.1. singleton.h

Singleton pattern template

```c++
#ifndef ROBOTIS_FRAMEWORK_COMMON_SINGLETON_H_
#define ROBOTIS_FRAMEWORK_COMMON_SINGLETON_H_

namespace robotis_framework
{

template <class T>
class Singleton
{
private:
  static T *unique_instance_;

protected:
  Singleton() { }
  Singleton(Singleton const&) { }
  Singleton& operator=(Singleton const&) { return *this; }

public:
  static T* getInstance()
  {
    if(unique_instance_ == NULL)
      unique_instance_ = new T;
    return unique_instance_;
  }

  static void destroyInstance()
  {
    if(unique_instance_)
    {
      delete unique_instance_;
      unique_instance_ = NULL;
    }
  }
};

template <class T> T* Singleton<T>::unique_instance_ = NULL;

}

#endif /* ROBOTIS_FRAMEWORK_COMMON_SINGLETON_H_ */
```

#### 2.2. motion_module.h
Please refer to the below link for the instruction of creating the new Motion Module.  
> Reference : [Creating new motion module]

#### 2.3. sensor_module.h
Please refer to the below link for the instruction of creating the new Sensor Module.  
> Reference : [Creating new sensor module]


<br>[&lt;&lt; Back](ROBOTIS_Framework.md)

[Creating new motion module]:Creating_new_motion_module.md
[Creating new sensor module]:Creating_new_sensor_module.md
