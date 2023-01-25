function onCreate()

	makeLuaSprite('mondstadt-night', 'teyvat/mondstadt/mondstadt-night', -700,-620)
	addLuaSprite('mondstadt-night', false)
	scaleObject('mondstadt-night', 1.5, 1.5)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end