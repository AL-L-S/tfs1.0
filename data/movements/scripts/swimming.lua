local outfit = {lookType = 267, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
local conditions = {CONDITION_FIRE, CONDITION_CURSED, CONDITION_DAZZLED, CONDITION_DROWN, CONDITION_DRUNK, CONDITION_ENERGY, CONDITION_FREEZING,
	CONDITION_POISON, CONDITION_BLEEDING, CONDITION_PARALYZE}

function onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return false
	end

	player:removeCondition(CONDITION_OUTFIT)
	return true
end

function onStepOut(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then
		return false
	end

	doSendMagicEffect(fromPosition, CONST_ME_POFF)
	doSendMagicEffect(toPosition, CONST_ME_WATERSPLASH)
	for _, id in pairs(conditions) do
		player:removeCondition(id)
	end
	doSetCreatureOutfit(creature, outfit, -1)
	return true
end
