# Remove the light blocks from that position.
fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace minecraft:light[waterlogged=false]
fill ~1 ~1 ~1 ~-1 ~-1 ~-1 water replace minecraft:light[waterlogged=true]

# Reset the light tick score.
scoreboard players reset @s darkness.light_tick

# Kill the marker.
kill @s