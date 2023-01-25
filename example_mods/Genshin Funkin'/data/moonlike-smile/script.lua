local allowCountdown = false
local xx = 520;
local yy = 500;
local xx2 = 820;
local yy2 = 500;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	setProperty('timeBar.color', getColorFromHex('a0e9e5'));
end

function onCreatePost()
      if difficulty == 1 then
            addLuaScript('scripts/sheercold')
      end
end

function onBeatHit()
   	if curBeat == 36 then
      setProperty('defaultCamZoom', 1.0);
   end
	if curBeat == 48 then
      setProperty('defaultCamZoom', 0.73);
   end
	if curBeat == 432 then
      setProperty('defaultCamZoom', 1.0);
   end
	if curBeat == 448 then
      setProperty('defaultCamZoom', 0.73);
   end
end

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', '');
		playMusic('Chattering-Snowflakes', 1);
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	speak(count+1)
end

function onSkipDialogue(count)
	stopSound('sound')
	stopSound('sound1')
	stopSound('sound2')
	stopSound('sound3')
	stopSound('sound4')
end

function speak(shit)
	stopSound('sound')
	stopSound('sound1')
	stopSound('sound2')
	stopSound('sound3')
	stopSound('sound4')
	playSound('Albedo_Hello' ..shit,1,'sound')
	playSound('Albedo_Hello' .. shit,1,'sound1')
	playSound('Albedo_Hello' .. shit,1,'sound2')
	playSound('Albedo_Hello' .. shit,1,'sound4')
	playSound('Albedo_Hello' .. shit,1,'sound3')--just to make this shit loud i don't feel like audio editing
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
                triggerEvent('Camera Follow Pos',xx-ofs,yy);
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy);
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs);
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs);
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy);
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy);
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs);
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs);
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy);
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy);
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2);
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2);
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs);
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs);
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2);
            end
        end
    else
        triggerEvent('Camera Follow Pos','','');
    end
    
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('dragonspinedeviatincutscene1');
        seenCutscene = true;
        return Function_Stop;
    end
    return Function_Continue;
end
