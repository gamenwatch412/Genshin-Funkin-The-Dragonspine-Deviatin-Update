function onCreate()
	-- background shit
	makeLuaSprite('bluegradient', 'BlueGradient', -200, -250);
	setObjectCamera('bluegradient', 'other');
	setScrollFactor('bluegradient', 0, 0);
	scaleObject('bluegradient', 1.4, 1.4)
        setProperty('bluegradient.visible', false);
	addLuaSprite('bluegradient', true);

end
function onUpdate()
    health = getProperty('health')
    if health <= 2.0 then
	   setProperty('bluegradient', 0.0);
	end
	if health <= 1.8 then
	   setProperty('bluegradient', 0.1);
	end
	if health <= 1.6 then
	   setProperty('bluegradient', 0.2);
	end
	if health <= 1.4 then
	   setProperty('bluegradient', 0.3);
	end
	if health <= 1.2 then
	   setProperty('bluegradient', 0.4);
	end
	if health <= 1.0 then
	   setProperty('bluegradient', 0.5);
	end
	if health <= 0.8 then
	   setProperty('bluegradient', 0.6);
	end
	if health <= 0.6 then
	   setProperty('bluegradient', 0.7);
	end
	if health <= 0.4 then
	   setProperty('bluegradient', 0.8);
	end
	if health <= 0.2 then
	   setProperty('bluegradient', 0.9);
	end
	if health <= 0.05 then
	   setProperty('bluegradient', 1.0);
	end
end