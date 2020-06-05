---
layout: popup
---

# [Export TURTLEBOT3_MODEL](#export-turtlebot3-model)

TurtleBot3 has three models, `burger`,` waffle`, and `waffle_pi`, so you have to set which model to use before using. 

## Ubuntu
To do this on Ubuntu, we specify the model to be used with the `export` command.

```bash
export TURTLEBOT3_MODEL=burger
export TURTLEBOT3_MODEL=waffle
export TURTLEBOT3_MODEL=waffle_pi
```

The Bash `export` command is used to export a variable or function to the environment of all the child processes running in the current shell. 

You can run this `export` command each time in the terminal window. But it is very inconvenient to set it up every time. 

So we recommend that add your settings in `bashrc` file. The following example is an example for the user of TurtleBot3 Burger model. If you use a different model, you just change the value of `TURTLEBOT3_MODEL`.


``` bash
$ gedit ~/.bashrc
```

![](/assets/images/platform/turtlebot3/bringup/bashrc.png)

``` bash
$ source ~/.bashrc
```

## Windows
While TurtleBot3 has three models, only the `burger` and `waffle` are supported with a Windows 10 compatible single board computer. 

On Windows, use the command `setx` to set the property globally, then restart the command window for the setting to take effect.
```bash
setx TURTLEBOT3_MODEL burger
setx TURTLEBOT3_MODEL waffle
```


