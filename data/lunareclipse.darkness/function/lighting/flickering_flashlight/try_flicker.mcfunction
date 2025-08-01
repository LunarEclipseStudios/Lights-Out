# Make sure Herobrine is at least 30 blocks away.
execute unless entity @e[type=#lunareclipse.watching:herobrine,tag=watching.herobrine,distance=..30] run return fail

# The closer the player gets to Herobrine the more the light should flicker.
execute if entity @e[type=#lunareclipse.watching:herobrine,tag=watching.herobrine,distance=..10] if predicate { "condition": "minecraft:random_chance", "chance": 0.07} run return run scoreboard players set @s darkness.flicker 1
execute if entity @e[type=#lunareclipse.watching:herobrine,tag=watching.herobrine,distance=..20] if predicate { "condition": "minecraft:random_chance", "chance": 0.05} run return run scoreboard players set @s darkness.flicker 1
execute if entity @e[type=#lunareclipse.watching:herobrine,tag=watching.herobrine,distance=..30] if predicate { "condition": "minecraft:random_chance", "chance": 0.02} run return run scoreboard players set @s darkness.flicker 1