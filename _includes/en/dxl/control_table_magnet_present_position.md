It is the present position value of DYNAMIXEL.
The range of the value is 0~4095 (0xFFF), and the unit is 0.088 [&deg;].

![](/assets/images/dxl/mx/mx_position.png)  

- The picture above is the front view of DYNAMIXEL.

In multi-turn mode, the range is from -28,672 to 28,672 with unit values dependent on Resolution Divider (0.088 * Resolution Divider)

**NOTE** : In multi-turn mode, Present position depends on resolution divider and multi-turn offset For more information turn to the section on Multi Turn offset and Resolution Divider.
{: .notice}

**NOTE** : In multi-turn mode, Two’s complement is applied for the negative value. For more information, please refer to [Two’s complement](https://en.wikipedia.org/wiki/Two%27s_complement) from Wikipedia.
{: .notice}
