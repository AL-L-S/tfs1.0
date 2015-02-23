function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local partyTrumpet = Item(item.uid)
	partyTrumpet:transform(13578)
	partyTrumpet:decay()
	player:say("TOOOOOOT!", TALKTYPE_ORANGE_1)
	fromPosition:sendMagicEffect(CONST_ME_SOUND_BLUE)
	return true
end
