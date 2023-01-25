function onCreate()

	setProperty('timeBar.color', getColorFromHex('72e2c3'));
	makeLuaSprite('mondstadt', 'teyvat/mondstadt/mondstadt', -250,-50)
	addLuaSprite('mondstadt', false)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end