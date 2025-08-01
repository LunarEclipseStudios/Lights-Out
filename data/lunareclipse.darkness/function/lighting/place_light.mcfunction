# List of variables used:
# "UUID" - The id of the player using the flashlight.
# "light_level" - The brightness of the light.

# Replace any air with light.
$fill ~1 ~1 ~1 ~-1 ~-1 ~-1 minecraft:light[level=$(light_level)] replace #minecraft:air
$fill ~1 ~1 ~1 ~-1 ~-1 ~-1 minecraft:light[level=$(light_level),waterlogged=true] replace minecraft:water[level=0]

# Create a marker to mark the position of the light.
$summon minecraft:marker ~ ~ ~ {Tags:["darkness.marker","$(UUID)"],data:{Owner:$(UUID)}}