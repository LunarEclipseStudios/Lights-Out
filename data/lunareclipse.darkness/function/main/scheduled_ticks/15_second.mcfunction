# Reschedule the function.
schedule function lunareclipse.darkness:main/scheduled_ticks/15_second 15s

# If an item frame is in the sun holding a flashlight recharge it by 1.
execute as @e[type=#lunareclipse.darkness:item_frame] at @s if dimension minecraft:overworld if predicate [{"condition":"minecraft:entity_properties","entity":"this","predicate":{"location":{"can_see_sky":true}}},{"condition":"minecraft:time_check","value":{"min":0,"max":13000},"period":24000}] run function lunareclipse.darkness:lighting/toggle/update_durability/start {tag:"flashlight", action: "remove"}
# If the player is in the sun holding a flashlight recharge it by 1.
execute as @a[gamemode=!creative,gamemode=!spectator] at @s if dimension minecraft:overworld if predicate [{"condition":"minecraft:entity_properties","entity":"this","predicate":{"location":{"can_see_sky":true}}},{"condition":"minecraft:time_check","value":{"min":0,"max":13000},"period":24000}] run function lunareclipse.darkness:lighting/toggle/update_durability/start {tag:"flashlight", action: "remove"}