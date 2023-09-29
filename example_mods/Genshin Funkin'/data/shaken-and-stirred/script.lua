function onCreate()
setProperty('timeBar.color', getColorFromHex('72e2c3'))
setObjectOrder('cups',6)
setObjectOrder('gfGroup',5)
setObjectOrder('barset',4)
setObjectOrder('object',3)
setObjectOrder('dadGroup',2)
setObjectOrder('boyfriendGroup',1)
setProperty('iconP2.alpha', 0)
setProperty('dad.alpha', 0)
setCharacterY('gf', 1500)
setCharacterX('gf', 200)

end

function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end

    noteTweenX('oppo0', 0, -1000, 1.5, 'quartInOut')
    noteTweenX('oppo1', 1, -1000, 1.5, 'quartInOut')
    noteTweenX('oppo2', 2, -1000, 1.5, 'quartInOut')
    noteTweenX('oppo3', 3, -1000, 1.5, 'quartInOut')
    noteTweenX('play0', 4, 415, 1, 'quartInOut')
    noteTweenX('play1', 5, 525, 1, 'quartInOut')
    noteTweenX('play2', 6, 635, 1, 'quartInOut')
    noteTweenX('play3', 7, 745, 1, 'quartInOut')
end

function onStepHit()
if curStep == 220 then
    noteTweenX('NoteMove1', 4, 580, 0.2, 'quartInOut')
    noteTweenX('NoteMove2', 5, 580, 0.2, 'quartInOut')
    noteTweenX('NoteMove3', 6, 580, 0.2, 'quartInOut')
    noteTweenX('NoteMove4', 7, 580, 0.2, 'quartInOut')
    doTweenY('moveCharY', 'gf', 0, 0.2, 'linear')
    doTweenY('moveCupsY', 'cups', 0, 0.2, 'linear')
  end
if curStep == 350 then
    noteTweenX('play0', 4, 415, 0.2, 'quartInOut')
    noteTweenX('play1', 5, 525, 0.2, 'quartInOut')
    noteTweenX('play2', 6, 635, 0.2, 'quartInOut')
    noteTweenX('play3', 7, 745, 0.2, 'quartInOut')
    doTweenY('moveCharY', 'gf', 1500, 0.2, 'linear')
    doTweenY('moveCupsY', 'cups', 1500, 0.2, 'linear')
  end
if curStep == 604 then
    noteTweenX('NoteMove1', 4, 580, 0.2, 'quartInOut')
    noteTweenX('NoteMove2', 5, 580, 0.2, 'quartInOut')
    noteTweenX('NoteMove3', 6, 580, 0.2, 'quartInOut')
    noteTweenX('NoteMove4', 7, 580, 0.2, 'quartInOut')
    doTweenY('moveCharY', 'gf', 0, 0.2, 'linear')
    doTweenY('moveCupsY', 'cups', 0, 0.2, 'linear')
  end
if curStep == 734 then
    noteTweenX('play0', 4, 415, 0.2, 'quartInOut')
    noteTweenX('play1', 5, 525, 0.2, 'quartInOut')
    noteTweenX('play2', 6, 635, 0.2, 'quartInOut')
    noteTweenX('play3', 7, 745, 0.2, 'quartInOut')
    doTweenY('moveCharY', 'gf', 1500, 0.2, 'linear')
    doTweenY('moveCupsY', 'cups', 1500, 0.2, 'linear')
  end
if curStep == 989 then
    noteTweenX('NoteMove1', 4, 580, 0.2, 'quartInOut')
    noteTweenX('NoteMove2', 5, 580, 0.2, 'quartInOut')
    noteTweenX('NoteMove3', 6, 580, 0.2, 'quartInOut')
    noteTweenX('NoteMove4', 7, 580, 0.2, 'quartInOut')
    doTweenY('moveCharY', 'gf', 0, 0.2, 'linear')
    doTweenY('moveCupsY', 'cups', 0, 0.2, 'linear')
  end
if curStep == 1118 then
    noteTweenX('play0', 4, 415, 0.2, 'quartInOut')
    noteTweenX('play1', 5, 525, 0.2, 'quartInOut')
    noteTweenX('play2', 6, 635, 0.2, 'quartInOut')
    noteTweenX('play3', 7, 745, 0.2, 'quartInOut')
    doTweenY('moveCharY', 'gf', 1500, 0.2, 'linear')
    doTweenY('moveCupsY', 'cups', 1500, 0.2, 'linear')
  end
end

function onBeatHit()
	if curBeat % 1 == 0 then
	objectPlayAnimation('cups', 'cups bounce', true)
	end
end