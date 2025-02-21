The map uses a two-dimensional **Occupancy Grid Map (OGM)**, which is commonly used in ROS. 
The saved map will look like the figure below, where the **white** area is collision free area while the **black** area is occupied and inaccessible, and the **gray** area represents the unknown. 
This map is used for [Navigation][navigation].

![](/assets/images/platform/turtlebot3/slam/map.png)

The figure below shows the result of creating a large map using TurtleBot3. It took about an hour to create a map with a travel distance of about 350 meters.
