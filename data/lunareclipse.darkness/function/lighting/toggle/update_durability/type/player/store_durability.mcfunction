# List of variables used:
# "tag" - The item's tag.
# "action" - Defines whether the flashlight is gaining or losing durability.

# Store the item's durability in a scoreboard to update it.
$execute if items entity @s armor.head minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] store result score temp_durability darkness.global_values run data get entity @s Inventory[{Slot:103b}].components.minecraft:damage
$execute if items entity @s weapon.offhand minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] store result score temp_durability darkness.global_values run data get entity @s Inventory[{Slot:-106b}].components.minecraft:damage
$execute if items entity @s weapon.mainhand minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] store result score temp_durability darkness.global_values run data get entity @s SelectedItem.components.minecraft:damage
# Store the max durability.
$execute if items entity @s armor.head minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] store result score temp_max_durability darkness.global_values run data get entity @s Inventory[{Slot:103b}].components.minecraft:max_damage
$execute if items entity @s weapon.offhand minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] store result score temp_max_durability darkness.global_values run data get entity @s Inventory[{Slot:-106b}].components.minecraft:max_damage
$execute if items entity @s weapon.mainhand minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] store result score temp_max_durability darkness.global_values run data get entity @s SelectedItem.components.minecraft:max_damage