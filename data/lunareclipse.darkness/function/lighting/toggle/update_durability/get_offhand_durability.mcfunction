# Store the player's inventory in a temporary storage variable.
data modify storage lunareclipse.darkness:global_values temp.offhand.inventory set from entity @s Inventory
# Start a forloop, to find the offhand slot.
function lunareclipse.utils:forloop/start {target:"lunareclipse.darkness:global_values",path:"temp.offhand.inventory",command:"lunareclipse.darkness:lighting/toggle/update_durability/check_slot"}

# Return the values.
execute store result score temp_durability darkness.global_values run data get storage lunareclipse.darkness:global_values temp.offhand.durability
execute store result score temp_max_durability darkness.global_values run data get storage lunareclipse.darkness:global_values temp.offhand.max_durability

# Clear the storage variable.
data remove storage lunareclipse.darkness:global_values temp.offhand