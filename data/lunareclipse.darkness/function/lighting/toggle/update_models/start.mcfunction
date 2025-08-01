# List of variables used:
# "tag" - The tag of the item.
# "item" - The name of the item.
# "model" - The model that all the items are being switched to.

# Store the information in the forloop.
$data modify storage lunareclipse:utils temp_values.forloop_int."lunareclipse.darkness:lighting/toggle/update_models/inventory".tag set value "$(tag)"
$data modify storage lunareclipse:utils temp_values.forloop_int."lunareclipse.darkness:lighting/toggle/update_models/inventory".item set value "$(item)"
$data modify storage lunareclipse:utils temp_values.forloop_int."lunareclipse.darkness:lighting/toggle/update_models/inventory".model set value "$(model)"
# Update the models of all the items in the player's inventory.
function lunareclipse.utils:forloop_int/start {int:26,command:"lunareclipse.darkness:lighting/toggle/update_models/inventory"}

# Store the information in the forloop.
$data modify storage lunareclipse:utils temp_values.forloop_int."lunareclipse.darkness:lighting/toggle/update_models/hotbar".tag set value "$(tag)"
$data modify storage lunareclipse:utils temp_values.forloop_int."lunareclipse.darkness:lighting/toggle/update_models/hotbar".item set value "$(item)"
$data modify storage lunareclipse:utils temp_values.forloop_int."lunareclipse.darkness:lighting/toggle/update_models/hotbar".model set value "$(model)"
# Update the models of all the items in the player's inventory.
function lunareclipse.utils:forloop_int/start {int:8,command:"lunareclipse.darkness:lighting/toggle/update_models/hotbar"}

# Check the offhand.
$execute if items entity @s weapon.offhand minecraft:$(item)[minecraft:custom_data={$(tag):1b}] run item modify entity @s weapon.offhand { "function": "minecraft:set_components", "components": { "minecraft:item_model": "$(model)" } }