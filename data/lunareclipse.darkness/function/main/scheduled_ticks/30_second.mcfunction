# Reschedule the function.
schedule function lunareclipse.darkness:main/scheduled_ticks/30_second 30s

# Run the 30 second player tick.
execute as @a[gamemode=!creative,gamemode=!spectator] at @s run function lunareclipse.darkness:main/entity_ticks/player/30_second