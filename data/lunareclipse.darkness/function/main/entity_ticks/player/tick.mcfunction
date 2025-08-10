# Randomly select whether or not the flashlight will flicker if Herobrine is nearby.
execute if data storage lunareclipse.watching:config_options {options:{flickering_flashlight:"true"}} if score @s darkness.flashlight_enabled matches 1 run function lunareclipse.darkness:lighting/flickering_flashlight/try_flicker
execute if data storage lunareclipse.watching:config_options {options:{flickering_flashlight:"true"}} if score @s darkness.mining_helmet_enabled matches 1 run function lunareclipse.darkness:lighting/flickering_flashlight/try_flicker

# If the player puts on the mining helmet, toggle it on.
execute unless score @s darkness.mining_helmet_enabled matches 1 if items entity @s armor.head minecraft:wooden_pickaxe[minecraft:custom_data={mining_helmet:1b}] unless items entity @s armor.head minecraft:wooden_pickaxe[minecraft:damage=15] unless block ~ ~1 ~ water run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"mining_helmet"}

# Change which of these systems run based on what item is enabled.
execute if score @s darkness.flashlight_enabled matches 1 run function lunareclipse.darkness:lighting/items/flashlight
execute if score @s darkness.candle_enabled matches 1 run function lunareclipse.darkness:lighting/items/candle
execute if score @s darkness.lighter_enabled matches 1 run function lunareclipse.darkness:lighting/items/lighter
execute if score @s darkness.mining_helmet_enabled matches 1 run function lunareclipse.darkness:lighting/items/mining_helmet

# If no light is enabled, remove the light.
execute unless score @s darkness.light_enabled matches 1 run function lunareclipse.darkness:lighting/remove_old_markers
# Reset flicker on tick.
execute if score @s darkness.flicker matches 1 run function lunareclipse.darkness:lighting/flickering_flashlight/flicker