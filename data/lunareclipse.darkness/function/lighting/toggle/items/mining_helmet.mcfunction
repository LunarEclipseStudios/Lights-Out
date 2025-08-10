# Play a fancy buzz sound.
execute if score @s darkness.mining_helmet_enabled matches 1 if block ~ ~1 ~ water run playsound minecraft:entity.bee.hurt master @s ~ ~ ~ 0.5 2 0.5
# Play the fancy sound.
execute unless entity @s[tag=darkness.cooldown] run playsound minecraft:ui.button.click player @s ~ ~ ~ 0.5 1.4 0.5
# Toggle the item.
function lunareclipse.darkness:lighting/toggle/toggle {item:"mining_helmet"}