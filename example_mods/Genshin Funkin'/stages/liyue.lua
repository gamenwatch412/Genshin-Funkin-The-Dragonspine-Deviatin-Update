function onCreate()

	setProperty('timeBar.color', getColorFromHex('e3b342'))
	makeLuaSprite('liyue', 'teyvat/liyue/liyue', -610,-230)
	addLuaSprite('liyue', false)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end