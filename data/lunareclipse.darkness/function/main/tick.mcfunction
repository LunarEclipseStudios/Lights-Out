# Make the flashlight shine.
execute as @a at @s run function lunareclipse.darkness:main/entity_ticks/player/tick
# Check for ownerless markers.
execute as @e[type=marker,tag=darkness.marker] at @s run function lunareclipse.darkness:main/entity_ticks/light_marker