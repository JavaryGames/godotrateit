# godot-rateit

[![Platform](https://img.shields.io/badge/Platform-Android-green.svg?longCache=true&style=flat-square)](https://github.com/xsellier/godotrateit)
[![Godot Engine](https://img.shields.io/badge/GodotEngine-3.0-orange.svg?longCache=true&style=flat-square)](https://github.com/godotengine/godot)
[![LICENCE](https://img.shields.io/badge/License-MIT-green.svg?longCache=true&style=flat-square)](https://github.com/xsellier/godotrateit/blob/master/LICENSE)

Allows you to open the google play store on your application in order to rate it.

# Usage


## Loading the module

Edit `engine.cfg` and add an `android` part as following:

```ini
[android]
modules="org/godotengine/godot/GodotRateIt"
```

## Initializing the module using GDScript

Here is an example

```gdscript
extends Node

# Rate module
var godot_rateit

func _ready():
  if(Engine.has_singleton("GodotRateIt")):
    godot_rateit = Engine.get_singleton('GodotRateIt')

func rate_it():
  if OS.get_name() == 'Android' and godot_rateit != null:
    print('Debug, rating the app %s' % [ godot_rateit.get_version()])
    godot_rateit.ask_and_rate('Rate?', 'Yes', 'No')
```

# License

[See LICENSE file](./LICENSE)
