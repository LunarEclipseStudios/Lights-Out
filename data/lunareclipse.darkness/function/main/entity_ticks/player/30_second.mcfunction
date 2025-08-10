# If the player has an item enabled in their hand, make it drop one durability.
execute if score @s darkness.candle_enabled matches 1 run function lunareclipse.darkness:lighting/toggle/update_durability/start {tag:"candle", action: "add"}
execute if score @s darkness.flashlight_enabled matches 1 run function lunareclipse.darkness:lighting/toggle/update_durability/start {tag:"flashlight", action: "add"}
execute if score @s darkness.lighter_enabled matches 1 run function lunareclipse.darkness:lighting/toggle/update_durability/start {tag:"lighter", action: "add"}
execute if score @s darkness.mining_helmet_enabled matches 1 run function lunareclipse.darkness:lighting/toggle/update_durability/start {tag:"mining_helmet", action: "add"}