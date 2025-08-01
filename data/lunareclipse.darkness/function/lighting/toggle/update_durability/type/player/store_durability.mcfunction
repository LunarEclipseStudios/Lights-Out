# List of variables used:
# "tag" - The item's tag.
# "action" - Defines whether the flashlight is gaining or losing durability.

# Store the item's durability in a scoreboard to update it.
$execute if items entity @s weapon.offhand minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] run function lunareclipse.darkness:lighting/toggle/update_durability/get_offhand_durability
$execute if items entity @s weapon.mainhand minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] store result score temp_durability darkness.global_values run data get entity @s SelectedItem.components.minecraft:damage
# Store the max durability for the mainhand.
$execute if items entity @s weapon.mainhand minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] store result score temp_max_durability darkness.global_values run data get entity @s SelectedItem.components.minecraft:max_damage