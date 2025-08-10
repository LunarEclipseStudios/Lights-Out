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
$function lunareclipse.darkness:lighting/toggle/switch_states {item: "$(item)"}

# Change the state of the light enabled scoreboard.
execute if score @s darkness.flashlight_enabled matches 1 run return run scoreboard players set @s darkness.light_enabled 1
execute if score @s darkness.candle_enabled matches 1 run return run scoreboard players set @s darkness.light_enabled 1
execute if score @s darkness.lighter_enabled matches 1 run return run scoreboard players set @s darkness.light_enabled 1
execute if score @s darkness.mining_helmet_enabled matches 1 run return run scoreboard players set @s darkness.light_enabled 1
# If the player has no light enabled, set the scoreboard to 0.
scoreboard players reset @s darkness.light_enabled