The map is drawn based on the robot's [odometry](https://en.wikipedia.org/wiki/Odometry), [tf](http://wiki.ros.org/tf) and scan information. 
This map data is drawn in the RViz window as the TurtleBot3 is traveling. 
After creating a complete map of desired area, save the map data to the local drive for later use.

1. Launch the **map_saver** node in the map_server package to create map files.  
  The map file is saved in the directory where the map_saver node is launched.
  Unless a specific file name is provided, `map` will be used as a default file name and the `map.pgm` and `map.yaml` files will be saved.  
  **[Remote PC]**  
```bash
$ rosrun map_server map_saver -f ~/map
```

The `-f` option specifies a folder location and a file name where files are to be saved.  
With the above command, `map.pgm` and `map.yaml` will be saved in the home folder `~/`(/home/${username}).
