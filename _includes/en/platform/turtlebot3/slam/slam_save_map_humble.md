
The map is drawn based on the robot's [odometry](https://en.wikipedia.org/wiki/Odometry), [tf](http://wiki.ros.org/tf) and scan information. 
These map data is drawn in the RViz window as the TurtleBot3 was traveling. 
After creating a complete map of desired area, save the map data to the local drive for the later use.


1. Launch the **map_saver_cli** node in the nav2_map_server package to create map files.  
  The map file is saved in the directory where the map_saver_cli node is launched at.  
  Unless a specific file name is provided, `map` will be used as a default file name and create `map.pgm` and `map.yaml`.
```bash
$ ros2 run nav2_map_server map_saver_cli -f ~/map
```

The `-f` option specifies a folder location and a file name where files to be saved.  
With the above command, `map.pgm` and `map.yaml` will be saved in the home folder `~/`(/home/${username}).
