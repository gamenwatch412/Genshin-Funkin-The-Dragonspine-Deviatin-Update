function onCreate()

	makeLuaSprite('mondstadt-night', 'teyvat/mondstadt/mondstadt-night', -1200,-600)
	addLuaSprite('mondstadt-night', false)
	--scaleObject('bf', 0.8, 0.8)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end