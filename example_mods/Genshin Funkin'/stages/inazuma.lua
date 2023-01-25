function onCreate()
	
	setProperty('timeBar.color', getColorFromHex('a757cb'))
	makeLuaSprite('floor', 'teyvat/inazuma/floor', -800, -400)
	makeLuaSprite('inazuma', 'teyvat/inazuma/inazuma', -800,-400)
	addLuaSprite('inazuma', false)
	addLuaSprite('floor', false)
	scaleObject('floor', 1.5, 1.5)
	setLuaSpriteScrollFactor('inazuma', 0.8, 0.9)
	scaleObject('inazuma', 1.5, 1.5)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end