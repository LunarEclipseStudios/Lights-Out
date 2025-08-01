# List of variables used:
# "int" - The amount of times it will loop.
# "command" - The command that is meant to run on each item in the loop.
# "index" - The position in the array we are in.
# "tag" - The tag of the item. - Added just for this function.
# "item" - The name of the item. - Added just for this function.
# "model" - The model that all the items are being switched to. - Added just for this function.

# Update the inventory slot if the item matches.
$execute if items entity @s inventory.$(index) minecraft:$(item)[minecraft:custom_data={$(tag):1b}] run item modify entity @s inventory.$(index) { "function": "minecraft:set_components", "components": { "minecraft:item_model": "$(model)" } }