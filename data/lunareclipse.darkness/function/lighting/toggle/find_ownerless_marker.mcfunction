# List of variables used:
# "Owner" - The UUID of the player that owns the marker.

# Check if the owner exists.
$execute unless entity @a[nbt={UUID:$(Owner)}] run function lunareclipse.darkness:lighting/remove_light