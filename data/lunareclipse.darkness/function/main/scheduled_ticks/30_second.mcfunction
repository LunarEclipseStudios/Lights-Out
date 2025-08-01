# Reschedule the function.
schedule function lunareclipse.darkness:main/scheduled_ticks/30_second 30s

# If the player has a candle enabled in their hand, make it drop one durability.
execute as @a[gamemode=!creative,gamemode=!spectator] if score @s darkness.candle_enabled matches 1 run function lunareclipse.darkness:lighting/toggle/update_durability/start {tag:"candle", action: "add"}
execute as @a[gamemode=!creative,gamemode=!spectator] if score @s darkness.flashlight_enabled matches 1 run function lunareclipse.darkness:lighting/toggle/update_durability/start {tag:"flashlight", action: "add"}