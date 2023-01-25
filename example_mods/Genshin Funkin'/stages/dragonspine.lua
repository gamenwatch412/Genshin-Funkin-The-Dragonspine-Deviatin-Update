function onCreate()

	setProperty('timeBar.color', getColorFromHex('a0e9e5'));
	makeLuaSprite('dragonspine', 'teyvat/dragonspine/dragonspine', -1200,-800);

	if not lowQuality then
		makeLuaSprite('snowfall','snowfall', -1200, -1700);
		setLuaSpriteScrollFactor('snowfall', 0.8, 0.9);
	end

	addLuaSprite('snowfall', true);
	addLuaSprite('dragonspine', false);


end

function onUpdate(elapsed)

	setProperty('snowfall.y',getProperty('snowfall.y') + 1);

	if getProperty('snowfall.y') >= 0 then
		setProperty('snowfall.y', -297);

	end
end