# List of variables used:
# "position" - The position of the light.
# "light_level" - The level of light that's being emitted.

# Store the information for later use.
$data modify storage lunareclipse.darkness:global_values lighting.temp.light_level set value $(light_level)

# Remove any existing light markers tied to the player.
function lunareclipse.darkness:lighting/remove_old_markers

# Spawn the light. - Both in the position and on the player.
$execute positioned as @s anchored eyes positioned $(position) run function lunareclipse.darkness:lighting/place_light with storage lunareclipse.darkness:global_values lighting.temp
# If the light position isn't the same at the player position then spawn a light marker at the player position.
$function lunareclipse.utils:value_check/start {base:"~ ~1 ~",dynamic:"$(position)",command:"scoreboard players set position_overlap darkness.global_values 1"}
execute unless score position_overlap darkness.global_values matches 1 positioned as @s anchored eyes positioned ~ ~1 ~ run function lunareclipse.darkness:lighting/place_light with storage lunareclipse.darkness:global_values lighting.temp
# Clear the position overlap score.
scoreboard players reset position_overlap darkness.global_values