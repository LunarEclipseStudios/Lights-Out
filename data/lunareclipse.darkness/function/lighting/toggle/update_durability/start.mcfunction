# List of variables used:
# "tag" - The item's tag.
# "action" - Defines whether the flashlight is gaining or losing durability.

# Store the item's durability in a scoreboard to update it.
$execute if entity @s[type=player] run function lunareclipse.darkness:lighting/toggle/update_durability/type/player/store_durability {tag: "$(tag)", action: "$(action)"}
$execute if entity @s[type=#lunareclipse.darkness:item_frame] run function lunareclipse.darkness:lighting/toggle/update_durability/type/frame/store_durability {tag: "$(tag)", action: "$(action)"}
# Add 2 to the max durability. - This is done to help us be able to disable the flashlight.
scoreboard players add temp_max_durability darkness.global_values 1

# Increment the scoreboard by 1.
$scoreboard players $(action) temp_durability darkness.global_values 1

# Store the new durability in a data variable.
execute store result storage lunareclipse.darkness:global_values temp.durability.durability int 1 run scoreboard players get temp_durability darkness.global_values
# Store the slot in a variable.
$execute if entity @s[type=player] if items entity @s weapon.offhand minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] run data modify storage lunareclipse.darkness:global_values temp.durability.slot set value "weapon.offhand"
$execute if entity @s[type=player] if items entity @s weapon.mainhand minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] run data modify storage lunareclipse.darkness:global_values temp.durability.slot set value "weapon.mainhand"
$execute if entity @s[type=player] if items entity @s armor.head minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] run data modify storage lunareclipse.darkness:global_values temp.durability.slot set value "armor.head"
$execute if entity @s[type=#lunareclipse.darkness:item_frame] if items entity @s container.0 minecraft:wooden_pickaxe[minecraft:custom_data={$(tag):1b}] run data modify storage lunareclipse.darkness:global_values temp.durability.slot set value "container.0"

# Check if the action is set to add and if it is and the max durability has been met then stop it from progressing further.
$execute if score temp_durability darkness.global_values >= temp_max_durability darkness.global_values run function lunareclipse.utils:value_check/start {base:"add",dynamic:"$(action)",command:"scoreboard players set item_lock darkness.global_values 1"}

# Update the durability.
execute unless score item_lock darkness.global_values matches 1.. unless score temp_durability darkness.global_values matches ..-1 run function lunareclipse.darkness:lighting/toggle/update_durability/update_durability with storage lunareclipse.darkness:global_values temp.durability

# Clear the data variable.
data remove storage lunareclipse.darkness:global_values temp.durability
# Reset the item lock variable.
scoreboard players reset item_lock darkness.global_values

# Run the item based function.
$execute if entity @s[type=player] run function lunareclipse.darkness:lighting/toggle/update_durability/items/$(tag)

# Reset the other scoreboard variables.
scoreboard players reset temp_max_durability darkness.global_values
scoreboard players reset temp_durability darkness.global_values