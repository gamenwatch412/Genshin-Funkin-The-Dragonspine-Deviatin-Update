function onCreate()

	makeLuaSprite('gateway', 'teyvat/gateway/gateway-night', -700,-230)
	addLuaSprite('gateway', false)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end