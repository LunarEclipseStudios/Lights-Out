# Lighter toggle system.
execute unless items entity @s weapon.* minecraft:wooden_pickaxe[minecraft:custom_data={lighter:1b}] run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"lighter"}
# If it's raining disable the lighter.
execute if predicate lunareclipse.darkness:in_rain run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"lighter"}
# If the player goes in water disable the lighter.
execute if block ~ ~1 ~ water run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"lighter"}
execute if block ~ ~1 ~ light[waterlogged=true] run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"lighter"}
# If the player sprints then disable the lighter.
execute if predicate lunareclipse.darkness:is_sprinting run return run function lunareclipse.darkness:lighting/toggle/bypass_toggle {item:"lighter"}
# Create light accordingly.
execute run function lunareclipse.darkness:lighting/start {light_level: 9, position: "~ ~1 ~"}