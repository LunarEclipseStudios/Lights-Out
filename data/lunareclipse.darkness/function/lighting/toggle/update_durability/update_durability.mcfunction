# List of variables used:
# "durability" - The new durability of the item.
# "slot" - The slot being updated.

# Update the durability.
$item modify entity @s $(slot) { "function": "minecraft:set_components", "components": { "minecraft:damage": $(durability) }, "conditions": []}