# Flashlight toggle system.
execute unless items entity @s weapon.* minecraft:wooden_pickaxe[minecraft:custom_data={flashlight:1b}] run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"flashlight"}
# Check if the flashlight's durability is at nothing and disable the flashlight if it is.
execute if items entity @s weapon.* minecraft:wooden_pickaxe[minecraft:damage=11] run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"flashlight"}
# If the player goes in water disable the flashlight.
execute if block ~ ~1 ~ water run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"flashlight"}
execute if block ~ ~1 ~ light[waterlogged=true] run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"flashlight"}
# Make the light flicker.
execute if score @s darkness.flicker matches 1 run return run function lunareclipse.darkness:lighting/remove_old_markers
# Create light accordingly.
function lunareclipse.darkness:lighting/start {light_level: 12, position: "^ ^ ^2.5"}