
{% if page.ref=='mx-28' %}
{% assign mx_model="MX-28" %}
{% elsif page.ref=='mx-64'%}
{% assign mx_model="MX-64" %}
{% elsif page.ref=='mx-106' %}
{% assign mx_model="MX-106" %}
{% endif %}

**NOTE** : Compliance has been replaced with PID Gains.
{: .notice}

{% if page.ref=='mx-106' %}
**NOTE** : Although the {{ mx_model }}T (TTL) and {{ mx_model }}R (RS-485) differ in communications protocols both have the same features and perform equally. (TTL uses 3-pin connectors while RS-485 uses 4)
{: .notice}
{% else %}
**NOTE** : Although the {{ mx_model }}AT (TTL) and {{ mx_model }}AR (RS-485) differ in communications protocols both have the same features and perform equally. (TTL uses 3-pin connectors while RS-485 uses 4)
{: .notice}
{% endif %}

**NOTE**: MX(2.0) is a special firmware for the DYNAMIXEL MX series supporting the DYNAMIXEL Protocol 2.0. The MX(2.0) firmware can be upgraded from the Protocol 1.0 by using the [Firmware Recovery](/docs/en/software/dynamixel/dynamixel_wizard2/) in DYNAMIXEL Wizard 2.0 or [R+ Manager](/docs/en/software/rplus2/manager/#firmware-recovery). 
{: .notice}

<iframe width="560" height="315" src="https://www.youtube.com/embed/q_gAewi_dyY" frameborder="0" allowfullscreen></iframe>

**WARNING** : For {{ mx_model }}(2.0) Protocol, please refer to the [{{mx_model}}(2.0) Control Table] as they are different.
{: .notice--warning}
