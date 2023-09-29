function onCreate()

	makeLuaSprite('wall', 'teyvat/angels-share/wall', -130, -210)
	makeLuaSprite('barset', 'teyvat/angels-share/bar_set', -300, 660)
	makeAnimatedLuaSprite('cups', 'teyvat/angels-share/cups_table_view', 200, 1500)
	addAnimationByPrefix('cups', 'cups bounce', 'cups bounce', 24, false)
	scaleObject('wall', 1.15, 1.15)
	scaleObject('barset', 1.70, 1.70)
	addLuaSprite('wall', false)
	addLuaSprite('barset', true)
	addLuaSprite('cups', true)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onBeatHit()
	if curBeat % 1 == 0 then
	objectPlayAnimation('cups', 'cups bounce', true)
	end
end