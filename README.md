# godot-rateit

[![Platform](https://img.shields.io/badge/Platform-Android-green.svg?longCache=true&style=flat-square)](https://github.com/xsellier/godotrateit)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg?longCache=true&style=flat-square)](https://github.com/jahd2602/godotrateit)
[![Godot Engine](https://img.shields.io/badge/GodotEngine-3.0-orange.svg?longCache=true&style=flat-square)](https://github.com/godotengine/godot)
[![LICENSE](https://img.shields.io/badge/License-MIT-green.svg?longCache=true&style=flat-square)](https://github.com/xsellier/godotrateit/blob/master/LICENSE)

Allows you to open the google play or app store on your application in order to rate it.

# Usage


## Loading the module for Android (iOS auto-loads it)

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
  if godot_rateit != null:
    godot_rateit.ask_and_rate('Rate?', 'Yes', 'No', '' if OS.get_name() == 'Android' else '1234567890')
```

# License

[See LICENSE file](./LICENSE)
