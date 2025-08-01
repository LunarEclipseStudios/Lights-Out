# Remove the light blocks from that position.
fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace minecraft:light[waterlogged=false]
fill ~1 ~1 ~1 ~-1 ~-1 ~-1 water replace minecraft:light[waterlogged=true]

# Kill the marker.
kill @s