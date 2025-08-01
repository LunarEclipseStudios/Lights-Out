# List of variables used:
# "UUID" - The id of the player using the flashlight.

# Remove any existing light markers tied to the player.
$execute as @e[type=minecraft:marker,tag=darkness.marker,nbt={Tags:["$(UUID)"]}] at @s run function lunareclipse.darkness:lighting/remove_light