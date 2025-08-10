# Mining Helmet toggle system.
execute unless items entity @s armor.head minecraft:wooden_pickaxe[minecraft:custom_data={mining_helmet:1b}] run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"mining_helmet"}
# Check if the Mining Helmet's durability is at nothing and disable the Mining Helmet if it is.
execute if items entity @s armor.head minecraft:wooden_pickaxe[minecraft:damage=15] run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"mining_helmet"}
# If the player goes in water disable the Mining Helmet.
execute if block ~ ~1 ~ water run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"mining_helmet"}
execute if block ~ ~1 ~ light[waterlogged=true] run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"mining_helmet"}
# Make the light flicker.
execute if score @s darkness.flicker matches 1 run return run function lunareclipse.darkness:lighting/remove_old_markers
# Create light accordingly.
function lunareclipse.darkness:lighting/start {light_level: 10, position: "^ ^ ^2.5"}