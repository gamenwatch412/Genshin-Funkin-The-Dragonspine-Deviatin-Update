local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('youcantruncutscene2');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onBeatHit()
	--Knux
	if curBeat == 324 then
		noteTweenY('BoatWhy1', 5, defaultPlayerStrumY2 + 25, 0.3, 'circInOut')
	end
	if curBeat == 325 then
		noteTweenY('BoatWhy2', 5, defaultPlayerStrumY2, 0.3, 'circInOut')
		noteTweenY('BoatWhy3', 6, defaultPlayerStrumY2 + 25, 0.3, 'circInOut')
	end
	if curBeat == 326 then
		noteTweenY('BoatWhy4', 6, defaultPlayerStrumY2, 0.3, 'circInOut')
		noteTweenY('BoatWhy5', 7, defaultPlayerStrumY2 + 25, 0.3, 'circInOut')
	end
	if curBeat == 327 then
		noteTweenY('BoatWhy6', 7, defaultPlayerStrumY2, 0.3, 'circInOut')
		noteTweenY('BoatWhy7', 8, defaultPlayerStrumY2 + 25, 0.3, 'circInOut')
	end
	if curBeat == 328 then
		noteTweenY('BoatWhy8', 8, defaultPlayerStrumY2, 0.3, 'circInOut')
		noteTweenY('BoatWhy9', 9, defaultPlayerStrumY2 + 25, 0.3, 'circInOut')
	end
	if curBeat == 329 then
		noteTweenY('BoatWhy80', 9, defaultPlayerStrumY2, 0.3, 'circInOut')
		noteTweenY('BoatWhy90', 0, defaultPlayerStrumY2 + 25, 0.3, 'circInOut')
	end
	if curBeat == 330 then
		noteTweenY('BoatWhy81', 0, defaultPlayerStrumY2, 0.3, 'circInOut')
		noteTweenY('BoatWhy91', 1, defaultPlayerStrumY2 + 25, 0.3, 'circInOut')
	end
	if curBeat == 331 then
		noteTweenY('BoatWhy82', 1, defaultPlayerStrumY2, 0.3, 'circInOut')
		noteTweenY('BoatWhy92', 3, defaultPlayerStrumY2 + 25, 0.3, 'circInOut')
	end
	if curBeat == 332 then
		noteTweenY('BoatWhy83', 3, defaultPlayerStrumY2, 0.3, 'circInOut')
		noteTweenY('BoatWhy93', 4, defaultPlayerStrumY2 + 25, 0.3, 'circInOut')
	end
	if curBeat == 333 then
		noteTweenY('BoatWhy84', 4, defaultPlayerStrumY2, 0.3, 'circInOut')
	end
	--Eggman + chad + based + proud to be himself + confident + swag
	if curBeat >= 804 and curBeat < 836 then
	if curBeat % 2 == 0 then
		noteTweenAngle('ZO', 0, 15, 0.2, 'circOut')
		noteTweenAngle('ZI', 1, 15, 0.2, 'circOut')
		noteTweenAngle('ZU', 2, 15, 0.2, 'circOut')
		noteTweenAngle('ZY', 3, 15, 0.2, 'circOut')
		noteTweenAngle('ZT', 4, 15, 0.2, 'circOut')
		noteTweenAngle('ZR', 5, 15, 0.2, 'circOut')
		noteTweenAngle('ZE', 6, 15, 0.2, 'circOut')
		noteTweenAngle('ZW', 7, 15, 0.2, 'circOut')
		noteTweenAngle('ZQ', 8, 15, 0.2, 'circOut')
		noteTweenAngle('Z', 9, 15, 0.2, 'circOut')
	else
		noteTweenAngle('WE', 0, -15, 0.2, 'circOut')
		noteTweenAngle('WA', 1, -15, 0.2, 'circOut')
		noteTweenAngle('W', 2, -15, 0.2, 'circOut')
		noteTweenAngle('YS', 3, -15, 0.2, 'circOut')
		noteTweenAngle('YJ', 4, -15, 0.2, 'circOut')
		noteTweenAngle('YH', 5, -15, 0.2, 'circOut')
		noteTweenAngle('YV', 6, -15, 0.2, 'circOut')
		noteTweenAngle('YX1', 7, -15, 0.2, 'circOut')
		noteTweenAngle('YY', 8, -15, 0.2, 'circOut')
		noteTweenAngle('YX', 9, -15, 0.2, 'circOut')
	end
	end
	if curBeat == 836 then
		noteTweenAngle('UU', 0, 0, 0.2, 'circOut')
		noteTweenAngle('TT', 1, 0, 0.2, 'circOut')
		noteTweenAngle('RR', 2, 0, 0.2, 'circOut')
		noteTweenAngle('EE', 3, 0, 0.2, 'circOut')
		noteTweenAngle('WW', 4, 0, 0.2, 'circOut')
		noteTweenAngle('QQ', 5, 0, 0.2, 'circOut')
		noteTweenAngle('MM', 6, 0, 0.2, 'circOut')
		noteTweenAngle('NN', 7, 0, 0.2, 'circOut')
		noteTweenAngle('BB', 8, 0, 0.2, 'circOut')
		noteTweenAngle('VV', 9, 0, 0.2, 'circOut')
	end
	--Virgin Sonic + fixed + ratio + no hoes + he is a emo kid
	if curBeat == 1030 then
		noteTweenY('NoteY1', 7, defaultPlayerStrumY2 -100, 0.6, 'circOut')
		noteTweenAlpha('NoteA1', 7, 0, 0.6, 'circOut')
		noteTweenX('NotX2', 5, defaultPlayerStrumX1 - 50, 0.6, 'circOut')
		noteTweenX('WoteX3', 6, defaultPlayerStrumX2 - 50, 0.6, 'circOut')
		noteTweenX('IoGX4', 8, defaultPlayerStrumX3 - 50, 0.6, 'circOut')
		noteTweenX('GoyX5', 9, defaultPlayerStrumX4 - 50, 0.6, 'circOut')
	end
end