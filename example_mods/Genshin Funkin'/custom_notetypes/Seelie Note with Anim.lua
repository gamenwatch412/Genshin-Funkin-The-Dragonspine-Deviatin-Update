function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Seelie Note with Anim' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'seelienotes'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.1'); --Default value is: 0.023, health gained on hit
			if botplay or getProperty('cpuControlled') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', false);
				setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			else
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', false);
				setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			end
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', false);
			end
		end
	end

	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Seelie Note' then
		-- put something here if you want
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Seelie Note' then
		-- put something here if you want
	end
end