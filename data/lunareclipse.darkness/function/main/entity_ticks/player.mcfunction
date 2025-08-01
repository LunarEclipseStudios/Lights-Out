# Randomly select whether or not the flashlight will flicker if Herobrine is nearby.
execute if data storage lunareclipse.watching:config_options {options:{flickering_flashlight:"true"}} if score @s darkness.flashlight_enabled matches 1 run function lunareclipse.darkness:lighting/flickering_flashlight/try_flicker

# Flashlight toggle system.
execute if score @s darkness.flashlight_enabled matches 1 unless items entity @s weapon.* minecraft:wooden_pickaxe[minecraft:custom_data={flashlight:1b}] run function lunareclipse.darkness:lighting/toggle/items/flashlight
# Check if the flashlight's durability is at nothing and disable the flashlight if it is.
execute if score @s darkness.flashlight_enabled matches 1 if items entity @s weapon.* minecraft:wooden_pickaxe[minecraft:damage=11] run function lunareclipse.darkness:lighting/toggle/items/flashlight
# If the player goes in water disable the flashlight.
execute if score @s darkness.flashlight_enabled matches 1 if block ~ ~1 ~ water run function lunareclipse.darkness:lighting/toggle/items/flashlight
# Create and remove light accordingly.
execute unless score @s darkness.flicker matches 1 if score @s darkness.flashlight_enabled matches 1 run return run function lunareclipse.darkness:lighting/start {light_level: 12, position: "^ ^ ^2.5"}
execute unless score @s darkness.flashlight_enabled matches 1 run function lunareclipse.darkness:lighting/remove_old_markers with entity @s
# Reset flicker on tick.
execute if score @s darkness.flicker matches 1 run function lunareclipse.darkness:lighting/flickering_flashlight/flicker

# Candle toggle system.
execute if score @s darkness.candle_enabled matches 1 unless items entity @s weapon.* minecraft:wooden_pickaxe[minecraft:custom_data={candle:1b}] run function lunareclipse.darkness:lighting/toggle/items/candle
# If it's raining disable the candle.
execute if score @s darkness.candle_enabled matches 1 if predicate [{"condition":"minecraft:weather_check","raining":true},{"condition":"minecraft:entity_properties","entity":"this","predicate":{"location":{"can_see_sky":true}}}] run function lunareclipse.darkness:lighting/toggle/items/candle
# If the player goes in water disable the candle.
execute if score @s darkness.candle_enabled matches 1 if block ~ ~1 ~ water run function lunareclipse.darkness:lighting/toggle/items/candle

# Create and remove light accordingly.
execute if score @s darkness.candle_enabled matches 1 run return run function lunareclipse.darkness:lighting/start {light_level: 10, position: "~ ~1 ~"}
execute unless score @s darkness.candle_enabled matches 1 run function lunareclipse.darkness:lighting/remove_old_markers with entity @s