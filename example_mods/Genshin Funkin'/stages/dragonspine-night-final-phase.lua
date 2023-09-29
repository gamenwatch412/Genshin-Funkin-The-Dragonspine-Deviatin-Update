function onCreate()

	setProperty('timeBar.color', getColorFromHex('a0e9e5'));
	makeLuaSprite('dragonspine', 'teyvat/dragonspine/dragonspine-night', -1900,-1200);
	makeLuaSprite('albedoDEAD', 'teyvat/dragonspine/frozen albedo', 500, 0);

	if not lowQuality then
		makeLuaSprite('snowfall','snowfall', -1200, -1700);
		setLuaSpriteScrollFactor('snowfall', 0.8, 0.9);
	end

	addLuaSprite('snowfall', true);
	addLuaSprite('albedoDEAD', true);
	addLuaSprite('dragonspine', false);
	scaleObject('dragonspine', 1.5, 1.5)

end
