# Reschedule the function.
schedule function lunareclipse.darkness:main/scheduled_ticks/15_second 15s

# If an item frame is in the sun holding a flashlight recharge it by 1.
execute as @e[type=#lunareclipse.darkness:item_frame] at @s run function lunareclipse.darkness:main/entity_ticks/item_frame/15_second
# If the player is in the sun holding a flashlight recharge it by 1.
execute as @a[gamemode=!creative,gamemode=!spectator] at @s run function lunareclipse.darkness:main/entity_ticks/player/15_second