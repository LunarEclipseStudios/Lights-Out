# Remove any stray light markers that have no owner.
execute unless entity @a[distance=..7] run function lunareclipse.darkness:lighting/remove_light
# Increment the scoreboard to track how long the light has been active.
scoreboard players add @s darkness.light_tick 1