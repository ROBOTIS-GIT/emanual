## [Horn and Gear Replacement](#horn-and-gear-replacement)

The horn is installed on the front wheel gear serration of the DYNAMIXEL whereas the bearing set is installed on the back.

### Installing the Horn

When installing horn, carefully match the align markings on the horn and the wheel gear serration.

{% if page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' %}

![](/assets/images/dxl/x/xw/xw540_marking.png)

Once alignment is properly done, gently push the center of the horn toward the actuator.

{% else %}

![](/assets/images/dxl/x/x430_marking.png)

Once alignment is properly done, gently push the center of the horn toward the actuator.

### [Gear Replacement](#gear-replacement)

When gears inside DYNAMIXEL are damaged or worn out, replace the gears in DYNAMIXEL to maintain the good condition.

See the following video on how to replace the gears properly.

<iframe width="560" height="315" src="https://www.youtube.com/embed/wKxcZNMrrCQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [DYNAMIXEL Calibration](#dynamixel-calibration)

Calibrate the DYNAMIXEL after the gear replacement to arrange the gears in the right position.

See the following video on how to calibrate the DYNAMIXEL properly using software.

<iframe width="560" height="315" src="https://www.youtube.com/embed/uK--PBy88Mo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

{% capture dynamixel_calibration %}
**NOTE**: 
- As the USB2Dynamixel has been discontinued, a [U2D2](https://emanual.robotis.com/docs/en/parts/interface/u2d2/) is required to comunicate with DYNAMIXEL via PC using the software in the video.
- Alternatively, you can calibrate the DYNAMIXEL (X / MX only) using the [DYNAMIXEL Wizard 2.0](https://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_wizard2/#calibration) instead of using the R+ Manager 2.0 used in the video.
{% endcapture %}

<div class="notice">{{ dynamixel_calibration | markdownify }}</div>

{% endif %}
