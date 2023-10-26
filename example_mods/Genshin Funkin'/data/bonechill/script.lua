local allowCountdown = false;
local playDialogue = false;
local xx = 320;
local yy = 100;
local xx2 = 820;
local yy2 = 500;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	setProperty('timeBar.color', getColorFromHex('a0e9e5'));
end

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('dragonspinedeviatincutscene2');
		allowCountdown = true;
		playDialogue = true;
		return Function_Stop;
	elseif playDialogue then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		playDialogue = false;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' and difficulty ~= 0 then -- Timer completed, play dialogue
        startDialogue('dialogue', '');
        playMusic('Abiding-Chills', 1);
    elseif tag == 'startDialogue' and difficulty == 0 then
        startDialogue('dialogue-easy', '');
        playMusic('Abiding-Chills', 1);
    end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onBeatHit()
     if not mustHitSection then
          setProperty('defaultCamZoom', 0.59);
		cameraSetTarget('dad')
     else
          setProperty('defaultCamZoom', 0.5);
     end
end

function onUpdate()

  if curStep >= 0 then

    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/80)

    doTweenY(dadTweenY, 'dad', -100-110*math.sin((currentBeat*0.25)*math.pi),0.001)

  end

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
    
end

function onStepHit()
	if curStep == 1616 then
		doTweenAlpha('hudfade', 'camHUD', 0, 1, 'circIn');
		doTweenAlpha('sidehudfade1', 'highcombo', 0, 1, 'circIn');
		doTweenAlpha('sidehudfade2', 'combo', 0, 1, 'circIn');
		doTweenAlpha('sidehudfade3', 'sick', 0, 1, 'circIn');
		doTweenAlpha('sidehudfade4', 'good', 0, 1, 'circIn');
		doTweenAlpha('sidehudfade5', 'bad', 0, 1, 'circIn');
		doTweenAlpha('sidehudfade6', 'shit', 0, 1, 'circIn');
		doTweenAlpha('sidehudfade7', 'miss', 0, 1, 'circIn');
	end
   	if curStep == 1667 then
		doTweenAlpha('hudfade', 'camHUD', 1, 1, 'circIn');
		doTweenAlpha('sidehudfade1', 'highcombo', 1, 1, 'circIn');
		doTweenAlpha('sidehudfade2', 'combo', 1, 1, 'circIn');
		doTweenAlpha('sidehudfade3', 'sick', 1, 1, 'circIn');
		doTweenAlpha('sidehudfade4', 'good', 1, 1, 'circIn');
		doTweenAlpha('sidehudfade5', 'bad', 1, 1, 'circIn');
		doTweenAlpha('sidehudfade6', 'shit', 1, 1, 'circIn');
		doTweenAlpha('sidehudfade7', 'miss', 1, 1, 'circIn');
	end
end
