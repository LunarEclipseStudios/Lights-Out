# Manually clear the advancement, this fixes a bug.
advancement revoke @s only lunareclipse.darkness:toggle_candle
# Make sure the player isn't in water or rain.
execute unless score @s darkness.candle_enabled matches 1 if block ~ ~1 ~ water run return fail
execute unless score @s darkness.candle_enabled matches 1 if predicate [{"condition":"minecraft:weather_check","raining":true},{"condition":"minecraft:entity_properties","entity":"this","predicate":{"location":{"can_see_sky":true}}}] run return fail
# Play the fancy sound.
execute unless entity @s[tag=darkness.cooldown] unless score @s darkness.candle_enabled matches 1 run playsound minecraft:item.flintandsteel.use player @s ~ ~ ~ 1 1.25 1
execute unless entity @s[tag=darkness.cooldown] if score @s darkness.candle_enabled matches 1 run playsound minecraft:block.fire.extinguish player @s ~ ~ ~ 0.5 2 0.5
# Toggle the item.
function lunareclipse.darkness:lighting/toggle/toggle {item:"candle"}