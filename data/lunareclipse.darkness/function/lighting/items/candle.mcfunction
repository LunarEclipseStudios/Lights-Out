# Candle toggle system.
execute unless items entity @s weapon.* minecraft:wooden_pickaxe[minecraft:custom_data={candle:1b}] run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"candle"}
# If it's raining disable the candle.
execute if predicate lunareclipse.darkness:in_rain run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"candle"}
# If the player goes in water disable the candle.
execute if block ~ ~1 ~ water run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"candle"}
execute if block ~ ~1 ~ light[waterlogged=true] run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"candle"}
# Create light accordingly.
execute run function lunareclipse.darkness:lighting/start {light_level: 10, position: "~ ~1 ~"}