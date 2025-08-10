# Make sure the player is exposed to the sky.
execute unless dimension minecraft:overworld run return fail
execute unless predicate lunareclipse.darkness:sky_exposed run return fail

# If the player is in the sun holding a flashlight recharge it by 1.
execute if items entity @s weapon.* minecraft:wooden_pickaxe[minecraft:custom_data={flashlight:1b}] run function lunareclipse.darkness:lighting/toggle/update_durability/start {tag:"flashlight", action: "remove"}
# If the player is in the sun holding a mining helmet recharge it by 1.
execute if items entity @s weapon.* minecraft:wooden_pickaxe[minecraft:custom_data={mining_helmet:1b}] run function lunareclipse.darkness:lighting/toggle/update_durability/start {tag:"mining_helmet", action: "remove"}