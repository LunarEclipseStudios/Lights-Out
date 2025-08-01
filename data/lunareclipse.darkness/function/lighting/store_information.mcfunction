# List of variables used:
# "UUID" - The ID of the player.
# "light_level" - The level of light that's being emitted.

# Store the info.
$data modify storage lunareclipse.darkness:global_values lighting."$(UUID)".light_level set value $(light_level)
$data modify storage lunareclipse.darkness:global_values lighting."$(UUID)".UUID set from entity @s UUID