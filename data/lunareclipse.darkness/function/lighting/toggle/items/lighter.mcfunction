# Manually clear the advancement, this fixes a bug.
advancement revoke @s only lunareclipse.darkness:toggle_lighter
# Play the fancy sound.
execute unless entity @s[tag=darkness.cooldown] unless score @s darkness.lighter_enabled matches 1 run playsound minecraft:item.flintandsteel.use player @s ~ ~ ~ 1 1.25 1
execute unless entity @s[tag=darkness.cooldown] if score @s darkness.lighter_enabled matches 1 run playsound minecraft:block.fire.extinguish player @s ~ ~ ~ 0.5 2 0.5
# Toggle the item.
function lunareclipse.darkness:lighting/toggle/toggle {item:"lighter"}