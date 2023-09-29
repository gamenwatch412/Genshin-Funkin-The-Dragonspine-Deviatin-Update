
local xx = 520;
local yy = 500;
local xx2 = 820;
local yy2 = 500;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	setProperty('timeBar.color', getColorFromHex('e3b342'));

		makeAnimatedLuaSprite('secondDad','characters/zhongli',-900, -300)
		addAnimationByPrefix('secondDad','idle','zhongli idle',24,false);
		addAnimationByPrefix('secondDad','singLEFT','zhongli left',24,false);
		addAnimationByPrefix('secondDad','singRIGHT','zhongli right',24,false);
		addAnimationByPrefix('secondDad','singUP','zhongli up',24,false);
		addAnimationByPrefix('secondDad','singDOWN','zhongli down',24,false);
		scaleObject('secondDad', 0.9, 0.9);
		addLuaSprite('secondDad',false)
end


function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
	for i = 0, getProperty('notes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('notes', i, 'noteType') == 'Second Dad Sing' then

			if getPropertyFromGroup('notes', i, 'mustPress') then
				if getPropertyFromGroup('notes', i, 'strumTime') <= getSongPosition() then --Doesn't let Dad/Opponent notes get ignored
					nd = getPropertyFromGroup('notes', i, 'noteData')
					triggerEvent('dad2sing',nd,'')
					--objectPlayAnimation('secondDad',nd,true)
				end
			end
		end
	end

end

local  u = 0

function onBeatHit()
if mustHitSection then
		objectPlayAnimation('secondDad','idle',true)

                setProperty('secondDad.offset.x',64.5)
                setProperty('secondDad.offset.y',64.5)
	else

		if getProperty('secondDad.animation.curAnim.name') == 'idle' then
			objectPlayAnimation('secondDad','idle',true)

	        setProperty('secondDad.offset.x',65)
	        setProperty('secondDad.offset.y',65)
		end

	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

	followchars = true
	if noteType == 'Both Dads Sing' or noteType == 'Second Dad Sing' then
		followchars = true
		triggerEvent('dad2sing',noteData,'')

	end
end

function onTimerCompleted(t,l,ll)
	if t == 'dadhold' .. u then
			objectPlayAnimation('secondDad','idle',true)

                setProperty('secondDad.offset.x',65)
                setProperty('secondDad.offset.y',65)
	end
end

function onEvent( name, value1,value2)
	if name == "dad2sing" then

		cancelTimer('dadhold' .. u, 0.3, 1)
		u = u + 1
		runTimer('dadhold' .. u, 0.3, 1)

		if value1 == '0' then
			objectPlayAnimation('secondDad','singLEFT',true)
                setProperty('secondDad.offset.x',-75)
                setProperty('secondDad.offset.y',-102)
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
		end
		if value1 == '1' then
			objectPlayAnimation('secondDad','singDOWN',true)
                setProperty('secondDad.offset.x',-167)
                setProperty('secondDad.offset.y',-154)
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
		end
		if value1 == '2' then
			objectPlayAnimation('secondDad','singUP',true)
                setProperty('secondDad.offset.x',-171)
                setProperty('secondDad.offset.y',-24)
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
		end
		if value1 == '3' then
			objectPlayAnimation('secondDad','singRIGHT',true)
                setProperty('secondDad.offset.x',-227)
                setProperty('secondDad.offset.y',-107)
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
		end
	end
end