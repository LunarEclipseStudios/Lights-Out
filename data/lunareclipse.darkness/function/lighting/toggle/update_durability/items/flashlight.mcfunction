# Check if the flashlight is dead
execute unless score temp_durability darkness.global_values matches 10.. run return fail

# Toggle the flashlight off.
function lunareclipse.darkness:lighting/toggle/toggle {item:"flashlight"}

# Play a fancy noise.
playsound minecraft:block.redstone_torch.burnout player @s ~ ~ ~ 0.5 2 0.5