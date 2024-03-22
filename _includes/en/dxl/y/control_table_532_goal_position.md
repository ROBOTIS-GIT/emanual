The goal position can be set using Goal Position (532). In position control mode, you can input from the [Min Position limit(84)] to the [Max position limit(76)]. By changing the value from the [Min Position limit(84)] to the [Max position limit(76)], it can be used from -2,147,483,648 to 2,147,483,647. 


| Unit                                 | Range                                           |  Control Mode                                               | Description           |
|:------------------------------------:|:-----------------------------------------------:| :-----------------------------------------------------------|:----------------------|
| 1[pulse]<br />(Approx. 0.006866 deg) | Min Position limit(84) ~ Max position limit(76) | Current control<br />Velocity control<br />Position control | Unused<br />16,000 = Move to position 16,000 [pulse]

**Note** : If the electronic gear ratio, expressed as [Gear Ratio Num(96)/Den(100)] value is not 1, the Goal Velocity(528) value will be multiplied by this ratio and applied to the controller.
{: .notice}

