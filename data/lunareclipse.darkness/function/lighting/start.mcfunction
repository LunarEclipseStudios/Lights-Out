# List of variables used:
# "position" - The position of the light.
# "light_level" - The level of light that's being emitted.

# Store the information for later use.
$data modify storage lunareclipse.darkness:global_values lighting.temp.light_level set value $(light_level)
data modify storage lunareclipse.darkness:global_values lighting.temp.UUID set from entity @s UUID

# Store the light info in the user's values.
function lunareclipse.darkness:lighting/store_information with storage lunareclipse.darkness:global_values lighting.temp

# Remove any existing light markers tied to the player.
function lunareclipse.darkness:lighting/remove_old_markers with entity @s

# Spawn the light. - Both in the position and on the player.
$execute positioned as @s anchored eyes positioned $(position) run function lunareclipse.darkness:lighting/transition with entity @s
execute positioned as @s anchored eyes positioned ~ ~ ~ run function lunareclipse.darkness:lighting/transition with entity @s