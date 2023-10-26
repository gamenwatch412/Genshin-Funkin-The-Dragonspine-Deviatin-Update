function onCreate()

	setProperty('timeBar.color', getColorFromHex('a0e9e5'));
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfChristmas-finalPhase');
	makeLuaSprite('dragonspine', 'teyvat/dragonspine/dragonspine-final-phase', -1900,-1800);
	makeAnimatedLuaSprite('albedo', 'characters/albedo-final-phase', 900, 0);

	if not lowQuality then
		makeAnimatedLuaSprite('snowfall','teyvat/dragonspine/snowfall', -1500, -6900);
		setLuaSpriteScrollFactor('snowfall', 0.8, 0.9);
		scaleObject('snowfall', 2.5, 2.5);
	end

	addAnimationByPrefix('albedo', 'idle', 'albedo idle final phase', 24, false);
	setProperty('albedo.flipX', true);
	addLuaSprite('snowfall', true);
	addAnimationByPrefix('snowfall', 'fall', 'fall', 60, true);
	scaleObject('dragonspine', 1.5, 1.5)
	addLuaSprite('dragonspine', false);
	addLuaSprite('albedo', false);

end


function onBeatHit()
	if curBeat % 2 == 0 then
	objectPlayAnimation('albedo', 'idle', true);
	end
end
