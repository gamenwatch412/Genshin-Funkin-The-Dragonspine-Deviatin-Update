function onCreate()
	if not lowQuality then
		makeAnimatedLuaSprite('rain', 'rain', -500, -200);
		setScrollFactor('rain', 0.3, 0.3);
		scaleObject('rain', 2, 2);

		makeAnimatedLuaSprite('splash', 'splash', -500, 50);
		scaleObject('splash', 1.3, 1.3);
	end
	addLuaSprite('splash', false);
	addAnimationByPrefix('splash', 'loop', 'splash loop', 15, true);
	addLuaSprite('rain', true);
	addAnimationByPrefix('rain', 'loop', 'rain loop', 15, true);
end