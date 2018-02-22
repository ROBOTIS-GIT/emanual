---
layout: archive
lang: en
ref: common_humanoid_navigation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/common/humanoid_navigation/
sidebar:
  title: Common
  nav: "common"
---

# [Humanoid Navigation](#humanoid-navigation)

> Reference : [http://wiki.ros.org/humanoid_navigation]
> Source : [https://github.com/AravindaDP/humanoid_navigation]

## Prerequisite Packages : map_server, humanoid_nav_msgs, nav_msgs, sbpl, etc
  * Installation packages
```
$ sudo apt-get install ros-kinetic-map-server
$ sudo apt-get install ros-kinetic-humanoid-nav-msgs
$ sudo apt-get install ros-kinetic-nav-msgs
$ sudo apt-get install ros-kinetic-octomap
$ sudo apt-get install ros-kinetic-octomap-msgs
$ sudo apt-get install ros-kinetic-octomap-ros
$ sudo apt-get install ros-kinetic-octomap-server
```
  * Building and Installing from source
    * sbpl  

     > Reference : [https://github.com/sbpl/sbpl]


## footstep_planner  
### Overview  
The footstep planner for humanoids or bipedal robots.  
> Reference : [http://wiki.ros.org/footstep_planner]

### Getting started  
1. RUN
   ```
   $ roslaunch footstep_planner thormang3_footstep_planner.launch
   ```

2. Configurations
 - config/footsteps_thormang3.yaml : Footstep configuration of THORMANG3  
 - config/planning_params_thormang3.yaml  
 - config/planning_params.yaml : Configuration of planner parameters  

## gridmap_2d  
> Reference : [http://wiki.ros.org/gridmap_2d]

## humanoid_localization  
> Reference : [http://wiki.ros.org/humanoid_localization]

[http://wiki.ros.org/humanoid_navigation]: http://wiki.ros.org/humanoid_navigation  
[https://github.com/AravindaDP/humanoid_navigation]: https://github.com/AravindaDP/humanoid_navigation
[https://github.com/sbpl/sbpl]: https://github.com/sbpl/sbpl
[http://wiki.ros.org/footstep_planner]: http://wiki.ros.org/footstep_planner
[http://wiki.ros.org/gridmap_2d]: http://wiki.ros.org/gridmap_2d
[http://wiki.ros.org/humanoid_localization]: http://wiki.ros.org/humanoid_localization
