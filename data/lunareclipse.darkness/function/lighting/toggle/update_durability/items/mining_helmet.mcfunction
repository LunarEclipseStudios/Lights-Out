# Check if the mining helmet is dead
execute unless score temp_durability darkness.global_values matches 15.. run return fail

# Toggle the mining helmet off.
function lunareclipse.darkness:lighting/toggle/toggle {item:"mining_helmet"}

# Play a fancy noise.
playsound minecraft:block.redstone_torch.burnout player @s ~ ~ ~ 0.5 2 0.5