# List of variables used:
# "target" - The storage variable's location.
# "path" - The path to the storage variable.
# "command" - The command that is meant to run on each item in the loop.
# "index" - The position in the array we are in.
# "value" - The value from the array position we're in.

# Store the information from the current slot in a storage variable.
$data modify storage lunareclipse.darkness:global_values temp.offhand.current set from storage lunareclipse.darkness:global_values temp.offhand.inventory[$(index)]

# Check if it is the offhand slot and if it is then store the durability and the max durability.
execute unless data storage lunareclipse.darkness:global_values {temp:{offhand:{current:{Slot:-106b}}}} run return fail

# Store the durability in a scoreboard to be compared.
data modify storage lunareclipse.darkness:global_values temp.offhand.durability set from storage lunareclipse.darkness:global_values temp.offhand.current.components.minecraft:damage

# Store the max durability in the scoreboard to be compared, this is done to help us prevent the flashlight's durability from going too low.
data modify storage lunareclipse.darkness:global_values temp.offhand.max_durability set from storage lunareclipse.darkness:global_values temp.offhand.current.components.minecraft:max_damage