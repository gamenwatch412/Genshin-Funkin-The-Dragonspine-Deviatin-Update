-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Fade in everything' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
			setProperty('bf.alpha', targetAlpha);
			setProperty('iconP1.alpha', targetAlpha);
			setProperty('dad.alpha', targetAlpha);
			setProperty('iconP2.alpha', targetAlpha);
			setProperty('dad.alpha', targetAlpha);
			setProperty('gf.alpha', targetAlpha);
		else
			doTweenAlpha('hudfade', 'camHUD', 1, duration, 'circIn');
			doTweenAlpha('sidehudfade1', 'highcombo', 1, duration, 'circIn');
			doTweenAlpha('sidehudfade2', 'combo', 1, duration, 'circIn');
			doTweenAlpha('sidehudfade3', 'sick', 1, duration, 'circIn');
			doTweenAlpha('sidehudfade4', 'good', 1, duration, 'circIn');
			doTweenAlpha('sidehudfade5', 'bad', 1, duration, 'circIn');
			doTweenAlpha('sidehudfade6', 'shit', 1, duration, 'circIn');
			doTweenAlpha('sidehudfade7', 'miss', 1, duration, 'circIn');
		end
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end