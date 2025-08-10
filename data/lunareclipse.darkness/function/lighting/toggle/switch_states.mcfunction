# List of variables used:
# "item" - The item being toggled.

# Toggle the item.
$execute if score @s darkness.$(item)_enabled matches 1 run return run scoreboard players reset @s darkness.$(item)_enabled
$execute unless score @s darkness.$(item)_enabled matches 1 run return run scoreboard players set @s darkness.$(item)_enabled 1