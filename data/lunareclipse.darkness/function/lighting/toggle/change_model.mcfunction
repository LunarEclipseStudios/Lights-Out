# List of variables used:
# "item" - The item being toggled.

# Update the model.
$execute if score @s darkness.$(item)_enabled matches 1 run function lunareclipse.darkness:lighting/toggle/update_models/start {tag:"$(item)", item: "wooden_pickaxe", model: "lunareclipse.darkness:$(item)/unlit"}
$execute unless score @s darkness.$(item)_enabled matches 1 if items entity @s weapon.mainhand minecraft:wooden_pickaxe[minecraft:custom_data={$(item):1b}] run return run item modify entity @s weapon.mainhand { "function": "minecraft:set_components", "components": { "minecraft:item_model": "lunareclipse.darkness:$(item)/lit" } }
$execute unless score @s darkness.$(item)_enabled matches 1 if items entity @s weapon.offhand minecraft:wooden_pickaxe[minecraft:custom_data={$(item):1b}] run item modify entity @s weapon.offhand { "function": "minecraft:set_components", "components": { "minecraft:item_model": "lunareclipse.darkness:$(item)/lit" } }
