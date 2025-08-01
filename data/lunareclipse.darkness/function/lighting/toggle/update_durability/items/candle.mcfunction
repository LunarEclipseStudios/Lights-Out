# Check if the candle is broken.
execute unless score temp_durability darkness.global_values matches 21.. run return fail

# Drop the nuggets.
loot spawn ~ ~ ~ loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:item","name":"minecraft:iron_nugget","weight":1,"quality":1,"functions":[{"function":"minecraft:set_components","components":{}},{"function":"minecraft:set_count","count":{"type":"minecraft:uniform","min":1,"max":3}}]}]}]}

# Remove the item from the player's inventory.
execute if items entity @s weapon.offhand minecraft:wooden_pickaxe[minecraft:custom_data={candle:1b}] unless items entity @s weapon.mainhand minecraft:wooden_pickaxe[minecraft:custom_data={candle:1b}] run item replace entity @s weapon.offhand with air
execute if items entity @s weapon.mainhand minecraft:wooden_pickaxe[minecraft:custom_data={candle:1b}] run item replace entity @s weapon.mainhand with air

# Play a fancy noise.
playsound minecraft:entity.breeze.slide player @s ~ ~ ~ 1 1.5 1