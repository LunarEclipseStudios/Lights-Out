# Define the needed scoreboard objectives.
scoreboard objectives add darkness.global_values dummy
scoreboard objectives add darkness.flashlight_enabled dummy
scoreboard objectives add darkness.candle_enabled dummy
scoreboard objectives add darkness.flicker dummy

# Schedule our 30 second tick.
schedule function lunareclipse.darkness:main/scheduled_ticks/30_second 30s
# Schedule our 15 second tick.
schedule function lunareclipse.darkness:main/scheduled_ticks/15_second 15s