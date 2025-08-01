# List of variables used:
# "item" - The item being toggled.

# Remove the advancement.
$advancement revoke @s only lunareclipse.darkness:toggle_$(item)

# Schedule a cooldown.
schedule function lunareclipse.darkness:lighting/toggle/remove_cooldown 5t replace

# Stop the player if they're on cooldown.
execute if entity @s[tag=darkness.cooldown] run return fail

# Place the player on a cooldown.
tag @s add darkness.cooldown

# Update the models.
$function lunareclipse.darkness:lighting/toggle/change_model {item: "$(item)"}

# Toggle the item.
$execute if score @s darkness.$(item)_enabled matches 1 run return run scoreboard players reset @s darkness.$(item)_enabled
$execute unless score @s darkness.$(item)_enabled matches 1 run return run scoreboard players set @s darkness.$(item)_enabled 1